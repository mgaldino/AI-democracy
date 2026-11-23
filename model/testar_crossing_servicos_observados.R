# Na raiz do projeto, use env LC_ALL=en_US.UTF-8 Rscript model/testar_crossing_servicos_observados.R.
# A unidade é uma indústria por ano. As elasticidades de Hubmer são as mesmas
# entre anos. Comparar anos mostra sensibilidade da proxy sindical e dos pesos.

entrada <- "data/crossing_servicos/pares.csv"
destino <- "quality_reports/2026-11-23_crossing_servicos_empirico"
argumentos <- commandArgs(trailingOnly = TRUE)
preciso <- identical(argumentos, "--precisao-replicacao")
if (length(argumentos) && !preciso) stop("A opção aceita é --precisao-replicacao.")
dados <- read.csv(entrada, stringsAsFactors = FALSE, fileEncoding = "UTF-8",
                  na.strings = c("", "NA"))
if (preciso) {
  arquivo_preciso <- "data/crossing_servicos/parametros_precisos.csv"
  parametros <- read.csv(arquivo_preciso, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
  colunas <- c("elasticidade", "peso_gasto", "peso_cex")
  stopifnot(all(c("setor", colunas) %in% names(parametros)), !anyDuplicated(parametros$setor),
            setequal(parametros$setor, dados$setor), all(vapply(parametros[colunas], is.numeric, logical(1))),
            all(is.finite(as.matrix(parametros[colunas]))))
  dados[colunas] <- parametros[match(dados$setor, parametros$setor), colunas, drop = FALSE]
  destino <- file.path(destino, "replicacao_precisa")
}
obrigatorias <- c("setor", "nome", "ano", "elasticidade", "emprego", "filiados",
                  "cobertos", "servico")
stopifnot(all(obrigatorias %in% names(dados)), nrow(dados) > 0L)
anuais <- c("emprego", "filiados", "cobertos")
pesos_gasto <- intersect(c("peso_gasto", "peso_cex"), names(dados))
stopifnot(all(vapply(dados[c("ano", "elasticidade", anuais, "servico", pesos_gasto)],
                     is.numeric, logical(1))),
          !anyNA(dados[c("setor", "nome", "ano", "servico", anuais)]),
          all(nzchar(dados$setor)), all(nzchar(dados$nome)),
          !anyDuplicated(dados[c("ano", "setor")]),
          all(dados$ano == as.integer(dados$ano)), all(dados$servico %in% 0:1),
          all(is.finite(as.matrix(dados[anuais]))), all(dados$emprego > 0),
          all(dados$filiados >= 0), all(dados$cobertos >= dados$filiados),
          all(dados$cobertos <= dados$emprego),
          all(is.na(dados$elasticidade) | is.finite(dados$elasticidade)))
for (p in pesos_gasto) {
  stopifnot(all(is.na(dados[[p]]) | (is.finite(dados[[p]]) & dados[[p]] >= 0)))
}
dados$filiacao <- dados$filiados / dados$emprego
dados$cobertura <- dados$cobertos / dados$emprego
anos <- sort(unique(dados$ano))
ano_principal <- if (2012 %in% anos) 2012 else anos[1]
referencias <- intersect(c("manufatura", "financas_seguros"), dados$setor)
stopifnot("manufatura" %in% referencias)
for (ano in anos) {
  stopifnot(all(referencias %in% dados$setor[dados$ano == ano]))
}
medidas <- c("filiacao", "cobertura")
amostras <- list(servicos = unique(dados$setor[dados$servico == 1]))
if ("utilidades" %in% dados$setor && !"utilidades" %in% amostras$servicos) {
  amostras$com_utilidades <- c(amostras$servicos, "utilidades")
}
servicos <- dados[dados$servico == 1 & is.finite(dados$elasticidade), ]
stopifnot(nrow(servicos) > 0, all(anos %in% servicos$ano))

# As correlações ponderadas usam os níveis. Na correlação de postos cada ramo
# recebe um voto. O cálculo marginal usa a identidade Cov_w(xi,u)/E_w(xi).
cor_ponderada <- function(x, y, w) {
  xc <- x - weighted.mean(x, w)
  yc <- y - weighted.mean(y, w)
  denom <- sqrt(sum(w * xc^2) * sum(w * yc^2))
  if (denom == 0) return(NA_real_)
  sum(w * xc * yc) / denom
}

associacao <- function(base, medida, peso) {
  w <- if (peso == "iguais") rep(1, nrow(base)) else base[[peso]]
  usar <- is.finite(base$elasticidade) & !is.na(w) & w > 0
  x <- base$elasticidade[usar]
  u <- base[[medida]][usar]
  w <- w[usar]
  setores <- base$setor[usar]
  calcular <- function(indices) {
    if (length(indices) < 2 || length(unique(x[indices])) < 2 ||
        length(unique(u[indices])) < 2) return(NA_real_)
    if (peso == "iguais") return(cor(x[indices], u[indices], method = "spearman"))
    cor_ponderada(x[indices], u[indices], w[indices])
  }
  n <- length(x)
  excluir <- vapply(seq_len(n), function(i) calcular(seq_len(n)[-i]), numeric(1))
  extremos <- function(escolher) {
    if (!any(is.finite(excluir))) return(NA_integer_)
    escolher(excluir)
  }
  imin <- extremos(which.min)
  imax <- extremos(which.max)
  margem <- NA_real_
  if (n && all(x >= 0) && sum(w * x) > 0) {
    margem <- 100 * (weighted.mean(u, w * x) - weighted.mean(u, w))
  }
  data.frame(medida, peso, setores = n, emprego_pareado = sum(base$emprego[usar]),
             soma_peso = sum(w), correlacao = calcular(seq_len(n)),
             loo_min = excluir[imin], sem_min = setores[imin],
             loo_max = excluir[imax], sem_max = setores[imax],
             diferenca_marginal_pp = margem)
}

linhas_associacao <- list()
for (ano in anos) {
  for (amostra in names(amostras)) {
    base <- dados[dados$ano == ano & dados$setor %in% amostras[[amostra]], ]
    for (medida in medidas) {
      for (peso in c("iguais", "emprego", pesos_gasto)) {
        item <- associacao(base, medida, peso)
        linhas_associacao[[length(linhas_associacao) + 1L]] <- cbind(ano, amostra, item)
      }
    }
  }
}
associacoes <- do.call(rbind, linhas_associacao)

# Bloco político do esboço. b_A(0) = 1 normaliza a unidade de capacidade.
s0 <- 0.25
sigma <- 0.60
r <- 1 - sigma
rho <- 0.50
a <- 0.36
tau <- 20 / 9
b_esboco <- 6
s_h <- s0 / (s0 + (1 - s0) * (1 - a)^r)
tau_relativo <- tau / (1 - s0 + s0 * b_esboco)
tol <- 1e-10
compativel <- function(xi, fracao = s0, subst = sigma) {
  xi > subst & xi < subst + (1 - subst) / fracao
}
eta_de_xi <- function(xi, fracao = s0, subst = sigma) {
  (xi - subst) * (1 - fracao) / (1 - subst - fracao * (xi - subst))
}
parcela <- function(eta, fracao = s0, subst = sigma, choque = a) {
  # Ambos os extremos estão abaixo de 1. Logs evitam exponenciar 1/eta.
  limite <- 1 - (1 - fracao) * (1 - choque)^(1 - subst)
  residuo <- function(s) {
    eta * (log1p(-s) - log1p(-fracao) - (1 - subst) * log1p(-choque)) - log(s / fracao)
  }
  uniroot(residuo, c(fracao, limite), tol = 1e-13)$root
}
regime <- function(m0, mh, mn, corte) {
  if (m0 < corte - tol) return("Sem dissuasão inicial")
  if (abs(m0 - corte) <= tol) return("Empate inicial")
  if (abs(mh - corte) <= tol || abs(mn - corte) <= tol) return("Empate após choque")
  if (mh < corte && mn > corte) return("H restringe, N preserva")
  if (mn < corte && mh > corte) return("H preserva, N restringe")
  if (mh > corte) return("Ambos preservam")
  "Ambos restringem"
}

# Os extremos dão (rho baixo, rho alto) intersecado com [0,1). A convenção de
# extremidades abertas é válida aqui: s'_H e s'_N são positivos e b>1 se
# qualquer inversão de inclinações for possível em rho não negativo.
cenario <- function(xi, b, fracao = s0, subst = sigma, choque = a) {
  stopifnot(compativel(xi, fracao, subst), is.finite(b), b >= 0)
  eta <- eta_de_xi(xi, fracao, subst)
  sn <- parcela(eta, fracao, subst, choque)
  sh <- fracao / (fracao + (1 - fracao) * (1 - choque)^(1 - subst))
  ba <- (1 - rho * choque)^2
  m0 <- (1 - fracao) + fracao * b
  mh <- (1 - sh) * ba + sh * b
  mn <- (1 - sn) * ba + sn * b
  sprime_h <- fracao * (1 - fracao) * (1 - subst)
  sprime_n <- fracao * (1 - fracao) * (xi - subst)
  dh <- (b - 1) * sprime_h - 2 * rho * (1 - fracao)
  dn <- (b - 1) * sprime_n - 2 * rho * (1 - fracao)
  local <- if (dh < -tol && dn > tol) "Direto" else
    if (dn < -tol && dh > tol) "Inverso" else "Ausente"
  rh <- (b - 1) * sprime_h / (2 * (1 - fracao))
  rn <- (b - 1) * sprime_n / (2 * (1 - fracao))
  rlo <- max(0, min(rh, rn))
  rhi <- min(1, max(rh, rn))
  direcao_rho <- if (rhi <= rlo + tol) "Ausente" else
    if (rn > rh) "Direto" else "Inverso"
  if (direcao_rho == "Ausente") rlo <- rhi <- NA_real_
  fim_direto <- min(m0, mn)
  fim_inverso <- min(m0, mh)
  largura_direta <- max(0, fim_direto - mh)
  largura_inversa <- max(0, fim_inverso - mn)
  # Para um tau fixo, qual intervalo de b deixa M0>tau e MH<tau<MN?
  bmin <- max(1 + (tau - 1) / fracao, ba + (tau - ba) / sn)
  bmax <- ba + (tau - ba) / sh
  stopifnot(abs((mn - mh) - (sn - sh) * (b - ba)) < 1e-10,
            abs(xi - subst - (1 - subst) * eta / (1 - fracao + fracao * eta)) < 1e-10)
  data.frame(eta, s_h = sh, s_n = sn, b_s = b, m0, m_h = mh, m_n = mn,
             rota_luxo_organizado = xi > 1 + tol && b > ba + tol,
             tau_fixo = tau, regime_fixo = regime(m0, mh, mn, tau),
             tau_mesma_margem = tau_relativo * m0,
             regime_mesma_margem = regime(m0, mh, mn, tau_relativo * m0),
             tau_direto_inf = if (largura_direta > tol) mh else NA_real_,
             tau_direto_sup = if (largura_direta > tol) fim_direto else NA_real_,
             largura_direta, largura_direta_pct_m0 = 100 * largura_direta / m0,
             tau_inverso_inf = if (largura_inversa > tol) mn else NA_real_,
             tau_inverso_sup = if (largura_inversa > tol) fim_inverso else NA_real_,
             largura_inversa, largura_inversa_pct_m0 = 100 * largura_inversa / m0,
             dm_h = dh, dm_n = dn, inversao_local = local,
             rho_para_inversao = direcao_rho, rho_inf = rlo, rho_sup = rhi,
             b_fixo_direto_inf = if (bmax > bmin + tol) bmin else NA_real_,
             b_fixo_direto_sup = if (bmax > bmin + tol) bmax else NA_real_)
}

linhas_cenario <- list()
for (i in seq_len(nrow(servicos))) {
  s <- servicos[i, ]
  if (!compativel(s$elasticidade)) next
  chaves <- s[c("ano", "setor", "nome", "elasticidade")]
  adicionar <- function(referencia, medida, potencia, razao, b) {
    cbind(chaves, referencia, medida, potencia, razao_u = razao,
          cenario(s$elasticidade, b), row.names = NULL)
  }
  linhas_cenario[[length(linhas_cenario) + 1L]] <-
    adicionar("esboco", "ilustrativa", NA_real_, NA_real_, b_esboco)
  for (referencia in referencias) {
    if (s$setor == referencia) next
    ref <- dados[dados$ano == s$ano & dados$setor == referencia, ]
    for (medida in medidas) {
      stopifnot(nrow(ref) == 1L, ref[[medida]] > 0)
      razao <- s[[medida]] / ref[[medida]]
      for (potencia in 1:2) {
        linhas_cenario[[length(linhas_cenario) + 1L]] <-
          adicionar(referencia, medida, potencia, razao, razao^potencia)
      }
    }
  }
}
stopifnot(length(linhas_cenario) > 0L)
cenarios <- do.call(rbind, linhas_cenario)

# Verificação independente de parcelas via orçamento, das inclinações por
# diferenças numéricas e dos intervalos abertos nos parâmetros.
for (xi in unique(cenarios$elasticidade)) {
  eta <- eta_de_xi(xi)
  raiz_orcamento <- function(choque) {
    # Em v = log(C^r), E^r = (1-s0)(1-a)^r exp(v) + s0 exp(eta*v).
    residuo <- function(v) (1 - s0) * (1 - choque)^r * exp(v) + s0 * exp(eta * v) - 1
    uniroot(residuo, c(0, min(-log1p(-s0) - r * log1p(-choque),
                               -log(s0) / eta)), tol = 1e-15)$root
  }
  fracao <- function(x) s0 * exp(eta * raiz_orcamento(x))
  passo <- 1e-5
  inclinacao <- (-3 * s0 + 4 * fracao(passo) - fracao(2 * passo)) / (2 * passo)
  stopifnot(abs(fracao(a) - parcela(eta)) < 1e-10,
            abs(inclinacao - s0 * (1 - s0) * (xi - sigma)) < 1e-6)
}
verif_base <- cenario(sigma + r * 6 / (1 - s0 + 6 * s0), b_esboco)
stopifnot(abs(parcela(1) - s_h) < 1e-10, abs(verif_base$dm_h + 0.375) < 1e-10,
          abs(verif_base$dm_n - 0.25) < 1e-10,
          verif_base$regime_fixo == "H restringe, N preserva")
direto <- with(cenarios, !is.na(tau_direto_inf) & tau_direto_inf + tol < tau &
                 tau < tau_direto_sup - tol)
stopifnot(all((cenarios$regime_fixo == "H restringe, N preserva") == direto))
inverso <- with(cenarios, !is.na(tau_inverso_inf) & tau_inverso_inf + tol < tau &
                  tau < tau_inverso_sup - tol)
stopifnot(all((cenarios$regime_fixo == "H preserva, N restringe") == inverso))
via_b <- with(cenarios, !is.na(b_fixo_direto_inf) &
                b_fixo_direto_inf + tol < b_s & b_s < b_fixo_direto_sup - tol)
stopifnot(all(via_b == direto))
via_rho <- with(cenarios, rho_para_inversao != "Ausente" &
                  rho_inf + tol < rho & rho < rho_sup - tol)
stopifnot(all(via_rho == (cenarios$inversao_local != "Ausente")))

# Comparação literal S versus A. Ao longo de uma expansão da despesa total,
# d log(E_S + E_A) / d log E = s0 * gamma_S + (1-s0) * gamma_A.
# A razão recupera a elasticidade de E_S no suborçamento dos dois ramos.
# Emprego fornece a parcela no modelo de fator único e salário comum. A
# composição PCE fornece, separadamente, a parcela observada na cesta de gasto.
colunas_modelo <- names(verif_base)
diades_lista <- list()
for (i in seq_len(nrow(servicos))) {
  s <- servicos[i, ]
  for (referencia in referencias) {
    if (s$setor == referencia) next
    ref <- dados[dados$ano == s$ano & dados$setor == referencia, ]
    stopifnot(nrow(ref) == 1)
    alternativas_s0 <- c(emprego = s$emprego / (s$emprego + ref$emprego))
    if ("peso_gasto" %in% pesos_gasto) {
      total <- s$peso_gasto + ref$peso_gasto
      s0_gasto <- if (is.finite(total) && total > 0) s$peso_gasto / total else NA_real_
      alternativas_s0 <- c(alternativas_s0, gasto_pce = s0_gasto)
    }
    hipoteses <- s[rep(1, 5), c("ano", "setor", "nome"), drop = FALSE]
    hipoteses$referencia <- referencia
    hipoteses$medida <- c("ilustrativa", rep(medidas, each = 2))
    hipoteses$potencia <- c(NA_real_, 1, 2, 1, 2)
    hipoteses$razao_u <- c(NA_real_, rep(s$filiacao / ref$filiacao, 2),
                           rep(s$cobertura / ref$cobertura, 2))
    valores_b <- c(b_esboco, hipoteses$razao_u[-1]^hipoteses$potencia[-1])
    for (tipo in names(alternativas_s0)) {
      p0 <- unname(alternativas_s0[tipo])
      valido <- is.finite(p0) && p0 > 0 && p0 < 1 &&
        is.finite(ref$elasticidade) && ref$elasticidade > 0 && s$elasticidade > 0
      media_gamma <- if (valido) p0 * s$elasticidade + (1 - p0) * ref$elasticidade else NA_real_
      xi_par <- s$elasticidade / media_gamma
      if (valido) {
        stopifnot(abs(p0 * xi_par + (1 - p0) * ref$elasticidade / media_gamma - 1) < tol,
                  sign(xi_par - 1) == sign(s$elasticidade - ref$elasticidade))
      }
      for (subst in c(sigma, 0.2)) {
        for (choque in c(a, 1 - 1 / 1.15)) {
          ok <- valido && compativel(xi_par, p0, subst)
          calculo <- if (ok) {
            do.call(rbind, lapply(valores_b, function(b) cenario(xi_par, b, p0, subst, choque)))
          } else {
            vazias <- verif_base[rep(1, length(valores_b)), colunas_modelo, drop = FALSE]
            vazias[] <- NA
            vazias$b_s <- valores_b
            vazias
          }
          registro <- cbind(hipoteses, base_s0 = tipo, s0 = p0, sigma = subst, choque,
                            gamma_s = s$elasticidade, gamma_a = ref$elasticidade,
                            xi_par, transferivel = ok, calculo, row.names = NULL)
          diades_lista[[length(diades_lista) + 1L]] <- registro
        }
      }
    }
  }
}
diades <- do.call(rbind, diades_lista)
stopifnot(nrow(diades) > 0, any(diades$transferivel),
          !anyDuplicated(diades[c("ano", "setor", "referencia", "medida", "potencia",
                                  "base_s0", "sigma", "choque")]))
# Qual elasticidade da capacidade à sindicalização, b = (uS/uA)^q,
# satisfaria exatamente as desigualdades políticas com o tau do esboço?
diades$q_direto_inf <- diades$q_direto_sup <- NA_real_
calcular_q <- with(diades, transferivel & !is.na(b_fixo_direto_inf) &
                     is.finite(razao_u) & razao_u > 0 & abs(razao_u - 1) > tol)
ln_ratio <- log(diades$razao_u[calcular_q])
q1 <- log(diades$b_fixo_direto_inf[calcular_q]) / ln_ratio
q2 <- log(diades$b_fixo_direto_sup[calcular_q]) / ln_ratio
diades$q_direto_inf[calcular_q] <- pmin(q1, q2)
diades$q_direto_sup[calcular_q] <- pmax(q1, q2)
diades$q_entre_um_e_dois <- with(diades, calcular_q &
                                    pmax(1, q_direto_inf) + tol < pmin(2, q_direto_sup))
diades$u_direto_inf <- with(diades, b_fixo_direto_inf^(1 / potencia))
diades$u_direto_sup <- with(diades, b_fixo_direto_sup^(1 / potencia))
diades$margem_inicial_pct <- with(diades, 100 * (m0 - tau) / m0)
diades_ok <- diades[diades$transferivel, ]
classificacao_direta <- with(diades_ok, tau < m0 - tol & m_h < tau - tol & tau < m_n - tol)
classificacao_inversa <- with(diades_ok, tau < m0 - tol & m_n < tau - tol & tau < m_h - tol)
stopifnot(all(classificacao_direta == (diades_ok$regime_fixo == "H restringe, N preserva")),
          all(classificacao_inversa == (diades_ok$regime_fixo == "H preserva, N restringe")))
com_q <- diades_ok[is.finite(diades_ok$q_direto_inf), ]
via_q <- with(com_q, potencia > q_direto_inf + tol & potencia < q_direto_sup - tol)
stopifnot(all(via_q == (com_q$regime_fixo == "H restringe, N preserva")))
fixos_observados <- diades_ok[is.finite(diades_ok$potencia) &
                                diades_ok$regime_fixo %in% c("H restringe, N preserva",
                                                            "H preserva, N restringe"), ]
fixos_diretos <- fixos_observados[fixos_observados$regime_fixo == "H restringe, N preserva", ]
pares_diretos <- unique(fixos_diretos[c("ano", "setor", "referencia")])
chaves_diades <- c("ano", "referencia", "base_s0", "sigma", "choque", "medida", "potencia")
grupos_diades <- diades[chaves_diades]
grupos_diades$potencia[is.na(grupos_diades$potencia)] <- 0
por_desenho <- split(diades, interaction(grupos_diades, drop = TRUE))
resumo_diades <- do.call(rbind, lapply(por_desenho, function(base) {
  z <- base[base$transferivel, ]
  cbind(base[1, chaves_diades, drop = FALSE],
        data.frame(pares = nrow(base), compativeis = nrow(z),
                   xi_maior_um = sum(z$xi_par > 1 + tol),
                   inicio_estrito = sum(z$m0 > tau + tol),
                   direto_fixo = sum(z$regime_fixo == "H restringe, N preserva"),
                   direto_fixo_luxo = sum(z$regime_fixo == "H restringe, N preserva" &
                                            z$rota_luxo_organizado),
                   inverso_fixo = sum(z$regime_fixo == "H preserva, N restringe"),
                   direto_mesma_margem = sum(z$regime_mesma_margem == "H restringe, N preserva"),
                   direto_mesma_margem_luxo = sum(z$regime_mesma_margem == "H restringe, N preserva" &
                                                   z$rota_luxo_organizado),
                   inverso_mesma_margem = sum(z$regime_mesma_margem == "H preserva, N restringe"),
                   direto_algum_tau = sum(z$largura_direta > tol),
                   direto_algum_tau_luxo = sum(z$largura_direta > tol & z$rota_luxo_organizado),
                   inverso_algum_tau = sum(z$largura_inversa > tol),
                   pct_m0_max_direto = if (nrow(z)) max(z$largura_direta_pct_m0) else NA_real_,
                   local_direto = sum(z$inversao_local == "Direto"),
                   local_inverso = sum(z$inversao_local == "Inverso")))
}))
resumo_diades <- resumo_diades[order(resumo_diades$ano, resumo_diades$referencia,
                                      resumo_diades$base_s0, -resumo_diades$sigma,
                                      -resumo_diades$choque, resumo_diades$medida,
                                      resumo_diades$potencia), ]

fmt <- function(x, n = 3) {
  ifelse(is.na(x), "—", formatC(x, digits = n, format = "f", decimal.mark = ","))
}
intervalo <- function(inf, sup) {
  ifelse(is.na(inf) | is.na(sup), "—", paste0("(", fmt(inf), " a ", fmt(sup), ")"))
}
linha <- function(...) paste0("| ", paste(c(...), collapse = " | "), " |")
tabela <- function(titulo, cabecalho, itens) {
  c(titulo, "", linha(cabecalho), linha(rep("---", length(cabecalho))), itens, "")
}
rotulo_peso <- c(iguais = "Por postos", emprego = "Emprego", peso_gasto = "Gasto PCE",
                 peso_cex = "Gasto CEX")
rotulo_medida <- c(filiacao = "Filiação", cobertura = "Cobertura",
                   ilustrativa = "b de S igual a 6")
rotulo_ref <- c(esboco = "Esboço", manufatura = "Manufatura",
                financas_seguros = "Finanças e seguros")
anos_texto <- paste(anos, collapse = ", ")
principal <- dados[dados$ano == ano_principal &
                     (dados$servico == 1 | dados$setor %in% referencias), ]
principal <- principal[order(principal$servico, -principal$elasticidade), ]
linhas_principal <- vapply(seq_len(nrow(principal)), function(i) {
  z <- principal[i, ]
  papel <- if (z$servico == 1) "Serviço" else "Referência"
  linha(z$nome, papel, fmt(z$elasticidade),
        fmt(z$emprego, 1), fmt(100 * z$filiacao, 2), fmt(100 * z$cobertura, 2))
}, character(1))
linhas_assoc <- vapply(seq_len(nrow(associacoes)), function(i) {
  z <- associacoes[i, ]
  linha(z$ano, z$amostra, rotulo_medida[z$medida], rotulo_peso[z$peso],
        z$setores, fmt(z$correlacao), intervalo(z$loo_min, z$loo_max),
        fmt(z$diferenca_marginal_pp, 2))
}, character(1))
chaves_resumo <- c("ano", "referencia", "medida", "potencia")
# A potência não se aplica à hipótese b=6. Etiqueta de agrupamento mantém as
# linhas sem criar uma potência fictícia na base de cenários.
grupos <- interaction(cenarios$ano, cenarios$referencia, cenarios$medida,
                      ifelse(is.na(cenarios$potencia), "fixo", cenarios$potencia),
                      drop = TRUE)
resumo <- do.call(rbind, lapply(split(cenarios, grupos), function(z) {
  cbind(z[1, chaves_resumo, drop = FALSE],
        data.frame(n = nrow(z), inicio_estrito = sum(z$m0 > tau + tol),
                   inicio_sem_dissuasao = sum(z$m0 < tau - tol),
                   inicio_empate = sum(abs(z$m0 - tau) <= tol),
                   direto_fixo = sum(z$regime_fixo == "H restringe, N preserva"),
                   direto_fixo_luxo = sum(z$regime_fixo == "H restringe, N preserva" &
                                            z$rota_luxo_organizado),
                   inverso_fixo = sum(z$regime_fixo == "H preserva, N restringe"),
                   direto_mesma_margem = sum(z$regime_mesma_margem == "H restringe, N preserva"),
                   direto_mesma_margem_luxo = sum(z$regime_mesma_margem == "H restringe, N preserva" &
                                                   z$rota_luxo_organizado),
                   inverso_mesma_margem = sum(z$regime_mesma_margem == "H preserva, N restringe"),
                   direto_algum_tau = sum(z$largura_direta > tol),
                   direto_algum_tau_luxo = sum(z$largura_direta > tol & z$rota_luxo_organizado),
                   inverso_algum_tau = sum(z$largura_inversa > tol),
                   pct_m0_max_direto = max(z$largura_direta_pct_m0),
                   local_direto = sum(z$inversao_local == "Direto"),
                   local_inverso = sum(z$inversao_local == "Inverso")))
}))
resumo <- resumo[order(resumo$ano, match(resumo$referencia, names(rotulo_ref)),
                       resumo$medida, resumo$potencia), ]
linhas_resumo <- vapply(seq_len(nrow(resumo)), function(i) {
  z <- resumo[i, ]
  linha(z$ano, rotulo_ref[z$referencia], rotulo_medida[z$medida],
        fmt(z$potencia, 0), z$n, z$inicio_estrito, z$direto_fixo, z$inverso_fixo,
        z$direto_mesma_margem, z$direto_algum_tau, fmt(z$pct_m0_max_direto, 2),
        z$local_direto, z$local_inverso)
}, character(1))
principal_quadratica <- cenarios[cenarios$ano == ano_principal &
                                  cenarios$medida == "filiacao" &
                                  !is.na(cenarios$potencia) & cenarios$potencia == 2, ]
principal_quadratica <- principal_quadratica[order(
  match(principal_quadratica$referencia, names(rotulo_ref)),
  -principal_quadratica$elasticidade), ]
linhas_quadraticas <- vapply(seq_len(nrow(principal_quadratica)), function(i) {
  z <- principal_quadratica[i, ]
  linha(rotulo_ref[z$referencia], z$nome, fmt(z$elasticidade), fmt(z$b_s),
        z$regime_fixo, intervalo(z$tau_direto_inf, z$tau_direto_sup),
        fmt(z$largura_direta_pct_m0, 2), z$rho_para_inversao,
        intervalo(z$rho_inf, z$rho_sup))
}, character(1))
economia <- cenarios[cenarios$ano == ano_principal & cenarios$referencia == "esboco", ]
economia <- economia[order(-economia$elasticidade), ]
linhas_economia <- vapply(seq_len(nrow(economia)), function(i) {
  z <- economia[i, ]
  linha(z$nome, fmt(z$elasticidade), fmt(z$eta), fmt(100 * z$s_n, 2), fmt(z$m_n),
        z$regime_fixo, z$inversao_local,
        intervalo(z$b_fixo_direto_inf, z$b_fixo_direto_sup))
}, character(1))
sem_elasticidade <- unique(dados$nome[dados$servico == 1 & is.na(dados$elasticidade)])
fora_dominio <- unique(servicos$nome[!compativel(servicos$elasticidade)])
lista_ou_nenhum <- function(x) if (length(x)) paste(x, collapse = ", ") else "nenhum"
dia_principal <- resumo_diades[resumo_diades$ano == ano_principal &
                                resumo_diades$medida == "filiacao" &
                                !is.na(resumo_diades$potencia) & resumo_diades$potencia == 2, ]
linhas_diadicas <- vapply(seq_len(nrow(dia_principal)), function(i) {
  z <- dia_principal[i, ]
  linha(rotulo_ref[z$referencia], z$base_s0, fmt(z$sigma, 2), fmt(z$choque, 3),
        z$pares, z$compativeis, z$xi_maior_um, z$inicio_estrito, z$direto_fixo,
        z$inverso_fixo, z$direto_mesma_margem_luxo, z$direto_algum_tau_luxo, z$local_direto)
}, character(1))
casos_diades <- diades_ok[diades_ok$ano == ano_principal &
                            diades_ok$base_s0 == "emprego" & diades_ok$medida == "filiacao" &
                            !is.na(diades_ok$potencia) & diades_ok$potencia == 2 &
                            diades_ok$regime_fixo %in% c("H restringe, N preserva",
                                                        "H preserva, N restringe"), ]
linhas_casos <- vapply(seq_len(nrow(casos_diades)), function(i) {
  z <- casos_diades[i, ]
  linha(rotulo_ref[z$referencia], z$nome, fmt(z$s0), fmt(z$gamma_s), fmt(z$gamma_a),
        fmt(z$xi_par), fmt(z$sigma, 2), fmt(z$choque, 3), fmt(z$b_s),
        fmt(z$m0), fmt(z$m_h), fmt(z$m_n), z$regime_fixo)
}, character(1))
if (!nrow(casos_diades)) linhas_casos <- linha("Nenhum", rep("—", 12))

escola_fabrica <- diades_ok[diades_ok$ano == ano_principal & diades_ok$setor == "educacao" &
                              diades_ok$referencia == "manufatura" & diades_ok$medida == "filiacao" &
                              diades_ok$potencia == 1, ]
linhas_educacao <- vapply(seq_len(nrow(escola_fabrica)), function(i) {
  z <- escola_fabrica[i, ]
  linha(z$base_s0, fmt(z$s0), fmt(z$sigma, 2), fmt(z$choque), fmt(z$xi_par),
        fmt(z$razao_u), intervalo(z$b_fixo_direto_inf, z$b_fixo_direto_sup),
        intervalo(z$q_direto_inf, z$q_direto_sup),
        if (z$q_entre_um_e_dois) "Sim" else "Não")
}, character(1))
if (!nrow(escola_fabrica)) linhas_educacao <- linha("Ausente", rep("—", 8))
linhas_todos_fixos <- vapply(anos, function(ano) {
  z <- diades_ok[is.finite(diades_ok$potencia) & diades_ok$ano == ano, ]
  d <- z$regime_fixo == "H restringe, N preserva"
  inv <- z$regime_fixo == "H preserva, N restringe"
  pares <- if (any(d)) unique(paste(z$setor[d], z$referencia[d], sep = "/")) else character()
  linha(ano, nrow(z), sum(z$m0 > tau + tol), sum(d), sum(d & z$rota_luxo_organizado),
        sum(inv), length(pares), lista_ou_nenhum(pares))
}, character(1))
linhas_fixos_diretos <- vapply(seq_len(nrow(fixos_diretos)), function(i) {
  z <- fixos_diretos[i, ]
  linha(z$ano, paste(z$setor, z$referencia, sep = "/"), z$base_s0,
        paste(rotulo_medida[z$medida], fmt(z$potencia, 0)), fmt(z$sigma, 2), fmt(z$choque),
        fmt(z$s0), fmt(z$xi_par), fmt(z$razao_u), fmt(z$u_direto_inf), fmt(z$b_s),
        fmt(z$m0), fmt(z$m_h), fmt(z$m_n), fmt(z$margem_inicial_pct, 2))
}, character(1))
if (!nrow(fixos_diretos)) linhas_fixos_diretos <- linha("Nenhum", rep("—", 14))
# Sensibilidade um fator por vez em torno de cada cruzamento direto. Mantemos
# o mesmo par, o mesmo ano e o mesmo choque; a comparação é sempre compatível.
controles <- list()
for (i in seq_len(nrow(fixos_diretos))) {
  d <- fixos_diretos[i, ]
  z <- diades_ok[diades_ok$ano == d$ano & diades_ok$setor == d$setor &
                   diades_ok$referencia == d$referencia & diades_ok$choque == d$choque &
                   is.finite(diades_ok$potencia), ]
  mudancas <- (z$base_s0 != d$base_s0) + (z$sigma != d$sigma) +
    (z$medida != d$medida) + (z$potencia != d$potencia)
  controles[[i]] <- z[mudancas == 1, ]
}
adjacentes <- if (length(controles)) unique(do.call(rbind, controles)) else fixos_diretos
linhas_adjacentes <- vapply(seq_len(nrow(adjacentes)), function(i) {
  z <- adjacentes[i, ]
  linha(z$ano, paste(z$setor, z$referencia, sep = "/"), z$base_s0,
        paste(rotulo_medida[z$medida], fmt(z$potencia, 0)), fmt(z$sigma, 2), fmt(z$choque),
        fmt(z$xi_par), fmt(z$b_s), fmt(z$m0), fmt(z$m_h), fmt(z$m_n), z$regime_fixo)
}, character(1))
if (!nrow(adjacentes)) linhas_adjacentes <- linha("Nenhum", rep("—", 11))
# Peso publicado da educação e seu arredondamento. A alternativa 0,0256
# também é publicada como 0,026 a três casas e serve para testar a folga.
sens_peso <- list()
caso_peso <- diades_ok[diades_ok$ano == 2015 & diades_ok$setor == "educacao" &
                         diades_ok$referencia == "manufatura" & diades_ok$medida == "cobertura" &
                         diades_ok$potencia == 2 & diades_ok$base_s0 == "gasto_pce" &
                         diades_ok$sigma == sigma, ]
for (i in seq_len(nrow(caso_peso))) {
  z <- caso_peso[i, ]
  wa <- dados$peso_gasto[dados$ano == z$ano & dados$setor == z$referencia]
  ws_dados <- dados$peso_gasto[dados$ano == z$ano & dados$setor == z$setor]
  stopifnot(z$b_s > tau, length(wa) == 1, length(ws_dados) == 1)
  s_min <- (tau - 1) / (z$b_s - 1)
  w_min <- wa * s_min / (1 - s_min)
  for (ws in unique(c(ws_dados, 0.0256))) {
    p0 <- ws / (ws + wa)
    xi_par <- z$gamma_s / ((1 - p0) * z$gamma_a + p0 * z$gamma_s)
    novo <- cenario(xi_par, z$b_s, p0, z$sigma, z$choque)
    sens_peso[[length(sens_peso) + 1L]] <-
      cbind(peso_educacao = ws, peso_manufatura = wa, s0 = p0, xi_par,
            s0_min_inicial = s_min, peso_edu_min_inicial = w_min, choque = z$choque, novo)
  }
}
sens_peso <- if (length(sens_peso)) do.call(rbind, sens_peso) else data.frame()
linhas_peso <- vapply(seq_len(nrow(sens_peso)), function(i) {
  z <- sens_peso[i, ]
  linha(fmt(z$peso_educacao, 5), fmt(z$peso_manufatura, 3), fmt(z$s0, 6),
        fmt(z$s0_min_inicial, 6), fmt(z$peso_edu_min_inicial, 6),
        fmt(z$choque), fmt(z$m0), fmt(z$m_h), fmt(z$m_n), z$regime_fixo)
}, character(1))
if (!nrow(sens_peso)) linhas_peso <- linha("Ausente", rep("—", 9))
# Educação em 2015: mantemos a cobertura média de todo o estoque s0 e
# atribuímos somente aos postos adicionais a taxa da educação privada, 15,8%.
# BLS, Union members—2015, tabela 3 (720 mil representados/4,551 milhões).
bls <- read.csv("data/crossing_servicos/raw/bls_tabela3_privado_excerto.csv",
                stringsAsFactors = FALSE, fileEncoding = "UTF-8")
bls_educacao <- bls[bls$ano == 2015 & bls$industria == "Educational services", ]
stopifnot(nrow(bls_educacao) == 1L, bls_educacao$pct_cobertos == 15.8,
          bls_educacao$cobertos_mil == 720, bls_educacao$emprego_mil == 4551)
u_privada <- bls_educacao$pct_cobertos / 100
base_mista <- diades_ok[diades_ok$ano == 2015 & diades_ok$setor == "educacao" &
                          diades_ok$referencia == "manufatura" & diades_ok$medida == "cobertura" &
                          diades_ok$potencia == 2 & diades_ok$sigma == sigma, ]
entrantes <- lapply(seq_len(nrow(base_mista)), function(i) {
  z <- base_mista[i, ]
  u_a <- dados$cobertura[dados$ano == z$ano & dados$setor == z$referencia]
  u_s <- dados$cobertura[dados$ano == z$ano & dados$setor == z$setor]
  ba <- (1 - rho * z$choque)^2
  b_estoque <- (u_s / u_a)^2
  b_marginal <- (u_privada / u_a)^2
  m_misto <- function(s) (1 - s) * ba + z$s0 * b_estoque + (s - z$s0) * b_marginal
  b_critico <- function(s) (tau - (1 - s) * ba - z$s0 * b_estoque) / (s - z$s0)
  mh <- m_misto(z$s_h)
  mn <- m_misto(z$s_n)
  bcrit_n <- b_critico(z$s_n)
  bcrit_h <- b_critico(z$s_h)
  u_n_min <- u_a * sqrt(max(0, bcrit_n))
  u_h_max <- if (bcrit_h >= 0) u_a * sqrt(bcrit_h) else NA_real_
  stopifnot(z$s_h > z$s0, z$s_n > z$s0, abs(z$b_s - b_estoque) < tol,
            abs(mh - (z$m_h + (z$s_h - z$s0) * (b_marginal - b_estoque))) < tol,
            abs(mn - (z$m_n + (z$s_n - z$s0) * (b_marginal - b_estoque))) < tol,
            (mn > tau) == (b_marginal > bcrit_n), (mh < tau) == (b_marginal < bcrit_h))
  data.frame(base_s0 = z$base_s0, s0 = z$s0, sigma = z$sigma, choque = z$choque,
             s_h = z$s_h, s_n = z$s_n, cobertura_estoque = u_s, cobertura_manufatura = u_a,
             cobertura_entrante = u_privada, b_estoque, b_marginal, m0 = z$m0,
             mh_estoque_uniforme = z$m_h, mn_estoque_uniforme = z$m_n, mh_misto = mh,
             mn_misto = mn, regime_misto = regime(z$m0, mh, mn, tau), bcrit_n, bcrit_h,
             razao_entrante_min_n = u_n_min / u_a, cobertura_entrante_min_n = u_n_min,
             cobertura_entrante_max_h = u_h_max)
})
entrantes <- if (length(entrantes)) do.call(rbind, entrantes) else data.frame()
linhas_entrantes <- vapply(seq_len(nrow(entrantes)), function(i) {
  z <- entrantes[i, ]
  linha(z$base_s0, fmt(z$choque), fmt(100 * z$cobertura_estoque, 2),
        fmt(100 * z$cobertura_manufatura, 2), fmt(100 * z$cobertura_entrante, 1),
        fmt(z$b_marginal), fmt(z$m0), fmt(z$mh_misto), fmt(z$mn_misto),
        fmt(100 * z$cobertura_entrante_min_n, 2), z$regime_misto)
}, character(1))
if (!nrow(entrantes)) linhas_entrantes <- linha("Ausente", rep("—", 10))
ass_principal <- associacoes[associacoes$ano == ano_principal &
                               associacoes$amostra == "servicos" & associacoes$medida == "filiacao", ]
taxa_por_peso <- setNames(ass_principal$correlacao, ass_principal$peso)

relatorio <- c(
  "# Elasticidade da demanda, sindicalização e defesa da competição eleitoral",
  "",
  paste0("Em ", ano_principal, " a filiação sindical e a elasticidade de gasto têm correlação de postos ",
         fmt(taxa_por_peso["iguais"]), ". Com pesos de emprego, a correlação de Pearson vale ",
         fmt(taxa_por_peso["emprego"]), ". O cruzamento de regime do esboço aparece em ",
         sum(economia$regime_fixo == "H restringe, N preserva"), " de ", nrow(economia),
         " destinos compatíveis ao fixar a capacidade política de S em 6. No exercício em ",
         "que os dois setores têm gastos e organização observados, o número de combinações ",
         "distintas de origem, destino e ano com cruzamento direto no limiar original é ",
         nrow(pares_diretos), ". Foram testadas as duas hipóteses de resposta da capacidade ",
         "à sindicalização. O resultado é sensível ",
         "à medida sindical, à parcela inicial e à elasticidade de substituição."),
  "",
  if (preciso) "Este relatório usa os pesos e as elasticidades recuperados do arquivo de replicação de Hubmer antes do arredondamento para a tabela publicada."
  else "Este relatório usa os pesos e as elasticidades impressos na Tabela B.I de Hubmer, arredondados a três casas decimais.",
  "",
  paste("Pareamento setorial dos EUA. O último ano da amostra de renda de Hubmer é 2012.",
        "As estimativas de elasticidade se repetem entre os cortes de emprego e organização de",
        paste0(anos_texto, "."), "Cada ano e cada setor entram uma vez em cada estatística."),
  "",
  tabela(paste0("**Tabela 1. Gasto e sindicalização por setor em ", ano_principal,
                ".** Emprego em pessoas, estimativa ponderada pela CPS. ",
                "Filiação e cobertura são porcentagens dos assalariados de cada setor no recorte sindical."),
         c("Setor", "Papel", "Elasticidade de gasto", "Emprego", "Filiação (%)", "Cobertura (%)"),
         linhas_principal),
  paste("Serviços sem elasticidade que ficaram fora das correlações e dos cenários:",
        paste0(lista_ou_nenhum(sem_elasticidade), ".")),
  paste("Serviços dentro da análise descritiva e fora do domínio do modelo binário:",
        paste0(lista_ou_nenhum(fora_dominio), ".")),
  "",
  tabela(paste("**Tabela 2. Associação entre elasticidade de gasto e taxa sindical, por ano.**",
               "Por postos é a correlação de Spearman com o mesmo peso para cada indústria.",
               "As demais linhas usam Pearson ponderado. A coluna de sensibilidade contém o mínimo",
               "e o máximo ao retirar uma indústria por vez. A última coluna é a taxa sindical",
               "ponderada por peso × elasticidade menos a taxa ponderada pelo peso original, em pontos percentuais."),
         c("Ano", "Recorte", "Medida", "Peso", "Setores", "Correlação", "Retirando um setor",
           "Diferença marginal (p.p.)"), linhas_assoc),
  paste("Nos pesos de gasto, a diferença marginal compara a composição de um dólar adicional",
        "com a de um dólar médio dentro das atividades pareadas, mantendo os preços fixos.",
        "PCE designa Personal Consumption Expenditures e CEX, Consumer Expenditure Survey.",
        "O setor traz consigo a taxa sindical dos seus assalariados. Para traduzir dólares em novos",
        "postos, seriam necessários os coeficientes de emprego e os encadeamentos de produção."),
  "",
  paste("As ponderações por emprego descrevem o conjunto de trabalhadores dos setores pareados.",
        "As taxas sindicais são de um recorte institucional de assalariados e o gasto de Hubmer",
        "tem unidade de despesa final. O arquivo associacoes.csv fornece o emprego coberto pelo",
        "pareamento, o peso total e os nomes das indústrias omitidas nos dois extremos."),
  "",
  "## Teste de transferência para o modelo de dois setores",
  "",
  paste("Cada cenário transfere a elasticidade de gasto de uma atividade ao setor de destino S,",
        "com parcela inicial s0 = 0,25. A tecnologia do mesmo choque a = 0,36, a elasticidade",
        "de substituição σ = 0,60, a erosão política de A, ρ = 0,50, e o limiar institucional",
        "τ = 20/9 são os do esboço. A hipótese homotética H e a alternativa N variam só a demanda.",
        "Os dados também permitem elasticidades abaixo de 1. Nesses casos N põe menos trabalhadores",
        "em S que H após o mesmo choque. Para fins do mecanismo de luxo exige-se elasticidade acima de 1."),
  "",
  paste("A conversão de elasticidade ξ em parâmetro de preferência é",
        "η = (ξ−σ)(1−s0) / [1−σ−s0(ξ−σ)]. O domínio aberto é 0,60 < ξ < 2,20.",
        "A parcela N resolve 1−s = (1−s0)(1−a)^(1−σ)(s/s0)^(1/η)."),
  "",
  tabela(paste("**Tabela 3. Equilíbrios com b de S igual a 6, fixado pelo esboço.**",
               "M0 e MH são comuns às linhas. A última coluna dá todo o intervalo aberto",
               "de b de S que gera cruzamento direto com dissuasão inicial e τ = 20/9,",
               "permitindo variar b e mantendo os demais parâmetros."),
         c("Setor de destino", "ξ", "η", "Emprego N (%)", "M N", "Decisão com τ fixo",
           "Sinais locais", "b de S admissível"), linhas_economia),
  paste("Na unidade b de A inicial igual a 1, M0 =", fmt(economia$m0[1]),
        "e MH =", paste0(fmt(economia$m_h[1]), "."),
        "O cruzamento direto exige MH < τ < mínimo(M0,MN). O inverso troca H e N.",
        "Também testamos se as derivadas na origem têm sinais diferentes. O caso direto",
        "exige MH' < 0 < MN' e o inverso exige MN' < 0 < MH'."),
  "",
  paste("Na calibração por proxy, u é filiação ou cobertura e b de A inicial vale 1.",
        "A hipótese linear impõe b de S = uS/uA. A quadrática impõe custos iguais e",
        "eficácia política d proporcional a u, de modo que b de S = (uS/uA)².",
        "A manufatura ancora a comparação de origem. Finanças e seguros, quando presentes,",
        "ilustram outra ocupação setorial da origem A e entram também como destino frente à",
        "manufatura. Excluímos sua comparação consigo mesmas. Os dados de sindicalização",
        "não identificam custos de coordenação, impacto político da ação coletiva, ρ,",
        "ganho governamental G nem valor da competição V."),
  "",
  tabela(paste("**Tabela 4. Diagnóstico de cruzamentos por referência e hipótese.** Cada célula",
               "de contagem usa o número de setores compatíveis da linha. Início conta dissuasão",
               "inicial no limiar original. Direto/inverso fixo exigem dissuasão inicial nesse limiar.",
               "Mesma margem conserva τ/M0 em 80/81 quando se altera b. Algum τ conta intervalos",
               "não vazios para cruzamento direto com dissuasão inicial. A largura máxima é a maior",
               "amplitude desse intervalo em porcentagem de M0. As duas últimas colunas referem-se",
               "aos sinais das derivadas na origem, avaliada ρ = 0,50."),
         c("Ano", "Referência A", "Medida", "Potência", "Setores", "Início",
           "Direto fixo", "Inverso fixo", "Direto mesma margem", "Direto algum τ",
           "Maior largura (% M0)", "Local direto", "Local inverso"), linhas_resumo),
  tabela(paste0("**Tabela 5. Hipótese quadrática de filiação em ", ano_principal,
                ".** Cada janela de τ permite um cruzamento direto após o choque com dissuasão ",
                "inicial. A janela de ρ calcula a inversão local de sinais para o b daquela linha."),
         c("A", "Setor de destino", "ξ", "b de S", "Regime, τ fixo", "Janela de τ",
           "Largura (% M0)", "Inversão local possível", "Janela de ρ"), linhas_quadraticas),
  paste("Os arquivos cenarios.csv e resumo_cenarios.csv conservam também a janela inversa de τ,",
        "a classificação com a mesma margem relativa inicial, as inclinações e as hipóteses",
        "lineares e de cobertura. Uma janela positiva expressa compatibilidade condicional.",
        "O pareamento não contém observações da disposição do governo para restringir as eleições",
        "nem da capacidade de resposta de uma federação diante dessa restrição."),
  "",
  "## Comparação literal entre dois ramos observados",
  "",
  paste("No exercício acima, S herda uma elasticidade relativa à cesta completa.",
        "O restante da economia recebe a densidade sindical de uma indústria de referência.",
        "Aqui usamos também a elasticidade de gasto da referência A. Dentro do par:",
        "ξ* = γS / [(1−s0)γA+s0γS]. Ao longo da expansão observada do gasto,",
        "ξ* excede 1 exatamente quando γS > γA. Para a base emprego, s0 é a fração",
        "dos assalariados da dupla que trabalha em S. Emprego e dispêndio têm a mesma",
        "parcela no modelo com um fator, salário comum e equilíbrio competitivo. Usamos",
        "também a fração efetiva do gasto PCE do par como sensibilidade. Estas parcelas",
        "descrevem uma economia binária hipotética."),
  "",
  paste("A elasticidade de A na manufatura agrega as elasticidades dos",
        "grupos 31, 32 e 33 com os pesos de gasto PCE na precisão desta execução.",
        "A alternativa σ = 0,20 está entre as estimativas americanas de Comin, Lashkari",
        "e Mestieri na Tabela XI. A alternativa a = 1 − 1/1,15 compara a ordem de",
        "grandeza com um ganho de 15% nos atendimentos resolvidos por hora entre trabalhadores",
        "de suporte estudados por Brynjolfsson, Li e Raymond. Nenhuma dessas referências mede",
        "a tecnologia de um par específico de indústrias ou a erosão política ρ."),
  "",
  tabela(paste0("**Tabela 6. Sensibilidade diádica, filiação quadrática em ", ano_principal,
                ".** Pares conta todos os destinos observados, e válidos conta os que ",
                "admitem η positivo com o σ e s0 da linha. Direto e inverso fixos contam ",
                "cruzamentos com dissuasão inicial diante do mesmo τ. As duas colunas ",
                "seguintes contam somente o canal de expansão de um serviço com ξ*>1 ",
                "e b de S maior que a capacidade pós-choque de A. A coluna local exige ",
                "MH′(0)<0<MN′(0)."),
         c("A", "Base de s0", "σ", "a", "Pares", "Válidos", "ξ*>1 válidos",
           "Início", "Direto fixo", "Inverso fixo", "Direto mesma margem, luxo",
           "Direto algum τ, luxo", "Local direto"), linhas_diadicas),
  tabela(paste0("**Tabela 7. Pares que atravessam o limiar original em ", ano_principal,
                ".** Os dois ramos têm elasticidade própria, s0 é a parcela de emprego ",
                "e a hipótese de organização é a razão quadrática de filiação. Os payoffs ",
                "e a unidade inicial de capacidade de A permanecem comuns a todos os pares."),
         c("A", "S", "s0", "γS", "γA", "ξ*", "σ", "a", "b de S", "M0", "MH", "MN", "Decisão"),
         linhas_casos),
  tabela(paste0("**Tabela 8. Manufatura para educação em ", ano_principal,
                ".** A janela de b de S mantém τ = 20/9, dissuasão na origem e ",
                "MH < τ < MN. Na hipótese b = (uS/uA)^q, a janela de q decorre dos ",
                "extremos exatos de b e das taxas de filiação. A interseção entre a janela ",
                "e 1 < q < 2 mostra se alguma resposta política intermediária satisfaz o cruzamento."),
         c("Base", "s0", "σ", "a", "ξ*", "uS/uA", "Janela de b", "Janela de q", "Interseção"),
         linhas_educacao),
  tabela(paste("**Tabela 9. Todos os cruzamentos diádicos no limiar original com proxies medidas.**",
               "O denominador soma especificações compatíveis para dois tipos de associação de b",
               "à densidade, duas medidas sindicais, duas bases da parcela, dois valores de σ",
               "e dois choques. Cada par aparece repetidamente. Direto por luxo exige ξ*>1",
               "e capacidade de S acima da de A após o choque. O arquivo cruzamentos_fixos.csv",
               "identifica as especificações e todas as margens."),
         c("Ano", "Especificações", "Dissuasão inicial", "Direto", "Direto por luxo",
           "Inverso", "Pares distintos com direto", "Pares com direto (S/A)"), linhas_todos_fixos),
  tabela(paste("**Tabela 10. Especificações com cruzamento direto no limiar original.**",
               "Incluem-se todos os anos, bases da parcela, elasticidades de substituição,",
               "choques, medidas e potências 1 ou 2. A razão sindical mínima é a raiz de",
               "ordem q do limite inferior de b da linha. A margem inicial é 100 × (M0−τ)/M0."),
         c("Ano", "S/A", "Base", "Medida e q", "σ", "a", "s0", "ξ*", "uS/uA",
           "Razão mínima", "b de S", "M0", "MH", "MN", "Margem inicial (%)"), linhas_fixos_diretos),
  tabela(paste("**Tabela 11. Mudanças de uma hipótese em torno dos cruzamentos diretos.**",
               "Cada linha mantém o par, o ano e o choque e muda uma das quatro escolhas",
               "de base, medida sindical, potência ou σ."),
         c("Ano", "S/A", "Base", "Medida e q", "σ", "a", "ξ*", "b de S", "M0",
           "MH", "MN", "Decisão com τ original"), linhas_adjacentes),
  tabela(paste("**Tabela 12. Precisão do peso de educação para a dissuasão inicial.**",
               "Manufatura para educação, cobertura quadrática em 2015, σ = 0,60.",
               "O valor alternativo 0,0256 também arredonda a 0,026 na tabela publicada.",
               "O corte de s0 é (τ−1)/(b−1). O peso mínimo de educação é o que produz essa",
               "fração mantendo o peso de manufatura constante."),
         c("Peso educação", "Peso manufatura", "s0", "s0 mínimo", "Peso educação mínimo",
           "a", "M0", "MH", "MN", "Decisão com τ original"), linhas_peso),
  tabela(paste("**Tabela 13. Cobertura sindical dos novos postos na educação.**",
               "Manufatura para educação, 2015, cobertura quadrática, σ = 0,60.",
               "O estoque inicial tem a cobertura de toda a educação. Somente os postos",
               "adicionais recebem os 15,8% observados entre os assalariados da educação privada.",
               "A cobertura mínima do entrante torna MN igual a τ quando o limite é positivo.",
               "Zero indica que o estoque e os trabalhadores de A já atingem o limiar em N."),
         c("Base", "a", "Estoque S (%)", "Manufatura (%)", "Entrantes (%)",
           "b marginal", "M0", "MH misto", "MN misto", "Mínimo em N (%)", "Decisão com τ original"),
         linhas_entrantes),
  paste("O índice misto é M(s)=(1−s)bA+s0 bEstoque+(s−s0)bMarginal.",
        "Normalizando bA inicial em um, bMarginal=(uEntrante/uA)². O limite inferior para",
        "preservar a competição em N é uA vezes a raiz de máximo{0,[τ−(1−sN)bA−s0 bEstoque]/(sN−s0)}.",
        "A taxa de 15,8% corresponde a 720 mil representados entre 4,551 milhões de assalariados",
        "na educação privada. O cenário atribui essa composição aos novos postos. A fonte não",
        "acompanha quais postos o ganho de renda efetivamente gerou.",
        "[BLS, Union Members 2015, tabela 3.](https://www.bls.gov/news.release/archives/union2_01282016.htm)"),
  "",
  paste("O arquivo diades.csv apresenta cada combinação, incluindo os pares fora do domínio.",
        "O arquivo resumo_diades.csv inclui os demais anos, a hipótese linear, a cobertura e",
        "o teste que mantém b de S em 6. Combinações do mesmo par em anos, medidas e especificações",
        "diferentes são sensibilidades repetidas da mesma elasticidade publicada."),
  "",
  "## Reprodução",
  "",
  paste("Na raiz de IA-dem, execute env LC_ALL=en_US.UTF-8 Rscript model/testar_crossing_servicos_observados.R",
        if (preciso) "com a opção --precisao-replicacao." else "sem argumentos.",
        "A entrada de pareamento e organização é data/crossing_servicos/pares.csv.",
        if (preciso) paste("O gasto e a elasticidade vêm de", arquivo_preciso) else "",
        "A pasta dos dados documenta as tabelas",
        "originais e o pareamento. O script confere contagens, chaves, restrições do modelo,",
        "uma segunda solução pela equação orçamentária, as derivadas por diferença finita,",
        "a reprodução do exemplo ilustrativo original e as classificações por desigualdades equivalentes."),
  "", paste("Versão utilizada:", R.version.string)
)
dir.create(destino, recursive = TRUE, showWarnings = FALSE)
write.csv(associacoes, file.path(destino, "associacoes.csv"), row.names = FALSE, na = "")
write.csv(cenarios, file.path(destino, "cenarios.csv"), row.names = FALSE, na = "")
write.csv(resumo, file.path(destino, "resumo_cenarios.csv"), row.names = FALSE, na = "")
write.csv(diades, file.path(destino, "diades.csv"), row.names = FALSE, na = "")
write.csv(resumo_diades, file.path(destino, "resumo_diades.csv"), row.names = FALSE, na = "")
write.csv(fixos_observados, file.path(destino, "cruzamentos_fixos.csv"), row.names = FALSE, na = "")
write.csv(adjacentes, file.path(destino, "contrastes_cruzamentos.csv"), row.names = FALSE, na = "")
write.csv(sens_peso, file.path(destino, "sensibilidade_peso_educacao.csv"), row.names = FALSE, na = "")
write.csv(entrantes, file.path(destino, "educacao_estoque_entrantes.csv"), row.names = FALSE, na = "")
writeLines(enc2utf8(relatorio), file.path(destino, "resultados.md"), useBytes = TRUE)
