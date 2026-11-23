# Executar com Rscript model/verificar_crossing_demanda_ia.R na raiz do projeto.
# O exercício é determinístico. Os parâmetros são ilustrativos.

if (!file.exists("model/verificar_crossing_demanda_ia.R")) {
  stop("Execute o script a partir da raiz do projeto IA-dem.")
}

s0 <- 0.25
sigma <- 0.60
r <- 1 - sigma
eta_h <- 1
eta_n <- 6
rho <- 0.50
b_s <- 6
ganho_governo <- 2
valor_federacao <- 0.90
custo_proposta <- 0.10
choque <- 0.36
limiar <- ganho_governo^2 / (2 * valor_federacao)

caminho_relatorio <- "quality_reports/2026-11-23_crossing_demanda_resultados.md"
caminho_figura <- "figures/crossing_demanda_ia.pdf"
caminho_tabela <- "figures/crossing_demanda_tabela.tex"
stopifnot(0 < custo_proposta, custo_proposta < ganho_governo)

# A raiz é única porque o lado esquerdo é estritamente crescente na parcela.
residuo_demanda <- function(parcela, a, eta) {
  parcela + (1 - s0) * (1 - a)^r * (parcela / s0)^(1 / eta) - 1
}

parcela_servicos <- function(a, eta) {
  if (a == 0) return(s0)
  uniroot(residuo_demanda, c(s0, 1), a = a, eta = eta, tol = 1e-13)$root
}

capacidade_a <- function(a) (1 - rho * a)^2
capacidade_total <- function(a, parcela, capacidade_s = b_s) {
  (1 - parcela) * capacidade_a(a) + parcela * capacidade_s
}

regime_por_margem <- function(margem) {
  ifelse(margem > 1e-10, "Competição preservada",
         ifelse(margem < -1e-10, "Competição restringida", "Indiferença"))
}

equilibrio <- function(a, eta) {
  parcela <- vapply(a, parcela_servicos, numeric(1), eta = eta)
  poder <- capacidade_total(a, parcela)
  margem <- poder - limiar
  regime <- regime_por_margem(margem)
  data.frame(a, eta, parcela, poder, margem, custo = ganho_governo^2 / (2 * poder),
             regime)
}

derivada_parcela <- function(eta) {
  r * s0 * (1 - s0) * eta / (1 - s0 + s0 * eta)
}
derivada_poder <- function(eta) (b_s - 1) * derivada_parcela(eta) - 2 * rho * (1 - s0)
elasticidade_renda <- function(eta) sigma + r * eta / (1 - s0 + s0 * eta)

# Diferença à direita de segunda ordem. A automação está restrita a a >= 0.
derivada_numerica <- function(eta) {
  h <- 1e-4
  ensaio <- equilibrio(c(0, h, 2 * h), eta)
  pesos <- c(-3, 4, -1) / (2 * h)
  c(parcela = sum(pesos * ensaio$parcela), poder = sum(pesos * ensaio$poder))
}

inicial <- equilibrio(0, eta_h)
homotetico <- equilibrio(choque, eta_h)
nao_homotetico <- equilibrio(choque, eta_n)
etas <- c(eta_h, eta_n)
derivadas_fd <- vapply(etas, derivada_numerica, c(parcela = 0, poder = 0))

b_a_pos <- capacidade_a(choque)
s_critica <- (limiar - b_a_pos) / (b_s - b_a_pos)
coef_preco <- (1 - s0) * (1 - choque)^r
stopifnot(homotetico$parcela < s_critica, s_critica < 1 - coef_preco)
eta_regime <- log(s_critica / s0) / log((1 - s_critica) / coef_preco)
eta_local <- 2 * rho * (1 - s0) / (s0 * (r * (b_s - 1) - 2 * rho))
eta_regime_raiz <- uniroot(function(eta) equilibrio(choque, eta)$margem,
                           etas, tol = 1e-12)$root
eta_local_raiz <- uniroot(function(eta) derivada_numerica(eta)[["poder"]],
                          etas, tol = 1e-10)$root
eta_variacao_zero <- uniroot(function(eta) equilibrio(choque, eta)$poder - inicial$poder,
                             etas, tol = 1e-12)$root
b_s_inversao <- 1 + 2 * rho * (1 - s0) / derivada_parcela(c(eta_n, eta_h))

# Na ordem alternativa, o esforço é pago mesmo quando dissuade a proposta.
custo_proposta_previa <- c(custo_proposta, 0.005)
limiar_previo <- (ganho_governo - custo_proposta_previa)^2 / (2 * valor_federacao)
margem_previa_h <- homotetico$poder - limiar_previo
margem_previa_n <- nao_homotetico$poder - limiar_previo
suporte_valor <- c(0.895, 0.905)

margem_h <- function(a) equilibrio(a, eta_h)$margem
a_queda <- uniroot(margem_h, c(0, choque), tol = 1e-12)$root
a_retorno <- uniroot(margem_h, c(choque, 0.95), tol = 1e-12)$root

grade_a <- sort(unique(c(seq(0, 0.99, by = 0.001), choque)))
grade_h <- equilibrio(grade_a, eta_h)
grade_n <- equilibrio(grade_a, eta_n)
grade <- rbind(grade_h, grade_n)

# Verificação independente pela função dispêndio, com u = C^(1 - sigma).
parcela_por_dispendio <- function(a, eta) {
  if (a == 0) return(s0)
  orcamento <- function(u) (1 - s0) * (1 - a)^r * u + s0 * u^eta - 1
  u <- uniroot(orcamento, c(1, 1 + s0^(-1 / eta)), tol = 1e-13)$root
  s0 * u^eta
}
parcelas_orcamento <- mapply(parcela_por_dispendio, grade$a, grade$eta)
erro_orcamento <- max(abs(parcelas_orcamento - grade$parcela))
erro_foc <- max(abs(residuo_demanda(grade$parcela, grade$a, grade$eta)))
parcela_h_exata <- s0 / (s0 + (1 - s0) * (1 - grade_a)^r)
erro_h <- max(abs(parcela_h_exata - grade_h$parcela))
quantidade_a <- (1 - grade$parcela) / (1 - grade$a)
quantidade_s <- grade$parcela
erro_emprego <- max(abs(quantidade_a * (1 - grade$a) + quantidade_s - 1))
gap <- grade_n$poder - grade_h$poder
gap_composto <- (grade_n$parcela - grade_h$parcela) * (b_s - capacidade_a(grade_a))
erro_gap <- max(abs(gap - gap_composto))

# Alterar apenas b_S no ponto pós-choque isola a contribuição da organização setorial.
b_s_sensibilidade <- c(b_a_pos / 2, b_a_pos, b_s)
gap_sensibilidade <- capacidade_total(choque, nao_homotetico$parcela, b_s_sensibilidade) -
  capacidade_total(choque, homotetico$parcela, b_s_sensibilidade)

stopifnot(
  erro_orcamento < 1e-10, erro_foc < 1e-10, erro_h < 1e-10, erro_emprego < 1e-12,
  erro_gap < 1e-12, all(grade$parcela >= s0), all(grade$parcela < 1),
  all(grade_n$parcela[-1] > grade_h$parcela[-1]),
  abs(inicial$poder - equilibrio(0, eta_n)$poder) < 1e-12,
  homotetico$poder < limiar, limiar < inicial$poder, inicial$poder < nao_homotetico$poder,
  homotetico$custo > valor_federacao, nao_homotetico$custo < valor_federacao,
  all(abs(derivada_parcela(etas) - derivadas_fd["parcela", ]) < 1e-6),
  all(abs(derivada_poder(etas) - derivadas_fd["poder", ]) < 1e-6),
  all(abs(derivada_poder(etas) - c(-0.375, 0.25)) < 1e-12),
  abs(eta_regime_raiz - eta_regime) < 1e-8, abs(eta_local_raiz - eta_local) < 1e-5,
  abs(eta_local - 3) < 1e-12,
  all(abs(b_s_inversao - c(4.75, 11)) < 1e-12),
  margem_previa_h[1] > 0, margem_previa_h[2] < 0, all(margem_previa_n > 0),
  inicial$custo < min(suporte_valor), nao_homotetico$custo < min(suporte_valor),
  homotetico$custo > max(suporte_valor),
  gap_sensibilidade[1] < 0, abs(gap_sensibilidade[2]) < 1e-12, gap_sensibilidade[3] > 0,
  a_queda < choque, choque < a_retorno
)

numero <- function(x, casas = 4) {
  formatC(x, digits = casas, format = "f", decimal.mark = ",")
}
linha <- function(...) paste0("| ", paste(c(...), collapse = " | "), " |")
fonte <- "Fonte: cálculos com parâmetros sintéticos do esboço."

linhas_equilibrio <- function(ponto, resultado) {
  linha(ponto, numero(resultado$a, 2), numero(resultado$eta, 0),
        numero(resultado$parcela), numero(resultado$poder), numero(resultado$margem),
        numero(resultado$custo), resultado$regime)
}

relatorio <- c(
  "# Demanda setorial e competição democrática",
  "",
  "Resultados numéricos do esboço de 23 de novembro de 2026. O exercício compara a mesma tecnologia com duas especificações de demanda. As unidades de custo e valor correspondem às dos payoffs do jogo.",
  "",
  "## Parâmetros e equilíbrios",
  "",
  paste0("A parcela inicial do setor S é ", numero(s0, 2), ", a elasticidade de substituição é ",
         numero(sigma, 2), ", o efeito direto da automação sobre a eficácia no setor A tem coeficiente ",
         numero(rho, 2), " e a capacidade por trabalhador no setor S vale ", numero(b_s, 0), "."),
  paste0("O ganho da restrição é G = ", numero(ganho_governo, 2),
         ", o valor da competição para a federação é V = ", numero(valor_federacao, 2),
         " e o custo de apresentar a proposta é f = ", numero(custo_proposta, 2),
         ". O limiar de dissuasão é G²/(2V) = ", numero(limiar, 6), "."),
  "",
  "**Tabela 1. Equilíbrio no ponto inicial e após o mesmo choque de IA.** A parcela de S é uma fração do emprego total, normalizado em um. A margem é M menos o limiar. O custo é a despesa mínima de defesa diante de uma proposta de restrição.",
  "",
  linha("Situação", "a", "η", "Emprego em S", "Capacidade M", "Margem", "Custo G²/(2M)", "Regime"),
  "|---|---:|---:|---:|---:|---:|---:|---|",
  linhas_equilibrio("Inicial, homotética", inicial),
  linhas_equilibrio("Inicial, não homotética", equilibrio(0, eta_n)),
  linhas_equilibrio("Após IA, homotética", homotetico),
  linhas_equilibrio("Após IA, não homotética", nao_homotetico), "", fonte, "",
  paste0("A mudança de M em relação à origem é ", numero(homotetico$poder - inicial$poder),
         " na demanda homotética e ", numero(nao_homotetico$poder - inicial$poder),
         " na não homotética. Após o choque, a distância entre as capacidades é ",
         numero(nao_homotetico$poder - homotetico$poder),
         " e a diferença de emprego em S é de ", numero(100 * (nao_homotetico$parcela -
          homotetico$parcela), 2), " pontos percentuais."),
  paste0("Qualquer limiar estritamente entre ", numero(homotetico$poder, 6), " e ",
         numero(inicial$poder, 6), " preserva a competição inicialmente e a separação observada depois do choque. No limiar exato a federação é indiferente."),
  "",
  "## Inclinações e valores críticos",
  "",
  "**Tabela 2. Sensibilidade inicial ao aumento de a.** As colunas numéricas usam diferenças à direita de segunda ordem. A elasticidade-renda mede, a preços fixos, a variação percentual da quantidade de S para uma alta de 1% no orçamento inicial.",
  "",
  linha("Demanda", "η", "Elasticidade-renda de S", "ds/da analítica", "ds/da numérica",
        "dM/da analítica", "dM/da numérica"),
  "|---|---:|---:|---:|---:|---:|---:|",
  vapply(seq_along(etas), function(i) {
    linha(c("Homotética", "Não homotética")[i], numero(etas[i], 0),
          numero(elasticidade_renda(etas[i])), numero(derivada_parcela(etas[i])),
          numero(derivadas_fd["parcela", i]), numero(derivada_poder(etas[i])),
          numero(derivadas_fd["poder", i]))
  }, character(1)),
  "", fonte, "",
  paste0("- No choque de ", numero(choque, 2), " a competição é preservada para η acima de ",
         numero(eta_regime, 6), " (raiz numérica ", numero(eta_regime_raiz, 6),
         "), quando o emprego em S ultrapassa ", numero(100 * s_critica, 3),
         "%. Esse limiar de η equivale à elasticidade-renda inicial de S de ",
         numero(elasticidade_renda(eta_regime), 6), "."),
  paste0("- A variação total de M entre a origem e o choque de ", numero(choque, 2),
         " muda de sinal em η = ", numero(eta_variacao_zero, 6), "."),
  paste0("- A derivada de M na origem muda de sinal em η = ", numero(eta_local, 6),
         " (raiz numérica ", numero(eta_local_raiz, 6),
         "). Isso equivale à elasticidade-renda inicial de S igual a ",
         numero(elasticidade_renda(eta_local), 4), "."),
  paste0("- Mantendo η homotético e não homotético nos valores da Tabela 2, a inversão local de inclinações ocorre para a capacidade por trabalhador de S estritamente entre ",
         numero(b_s_inversao[1], 2), " e ", numero(b_s_inversao[2], 2), "."),
  paste0("- Na demanda homotética, duas raízes de M(a) igual ao limiar estão em a = ",
         numero(a_queda, 6), " e a = ", numero(a_retorno, 6),
         ". Cada ponto da figura compara economias que partem de eleições competitivas. A segunda raiz descreve a volta da dissuasão no contrafactual estático."),
  "",
  "**Tabela 3. Diferença de capacidade entre demanda não homotética e homotética após o choque, variando a organização de S.** A capacidade de A nesse ponto é a mesma nos três cenários.",
  "",
  linha("Capacidade de S por trabalhador", "Capacidade de A por trabalhador", "M não homotética menos M homotética"),
  "|---:|---:|---:|",
  vapply(seq_along(b_s_sensibilidade), function(i) {
    linha(numero(b_s_sensibilidade[i]), numero(b_a_pos), numero(gap_sensibilidade[i]))
  }, character(1)),
  "", fonte, "",
  "## Ordem das decisões e informação privada",
  "",
  "**Tabela 4. Defesa mobilizada antes da apresentação da proposta.** O limiar é (G−f)²/(2V). Como o gasto de mobilização é antecipado, a federação o suporta inclusive quando decide impedir a proposta. Os dois resultados são avaliados no mesmo choque da Tabela 1.",
  "",
  linha("Custo de apresentar f", "Limiar", "Margem homotética", "Regime homotético",
        "Margem não homotética", "Regime não homotético"),
  "|---:|---:|---:|---|---:|---|",
  vapply(seq_along(limiar_previo), function(i) {
    linha(numero(custo_proposta_previa[i], 3), numero(limiar_previo[i], 6),
          numero(margem_previa_h[i], 6), regime_por_margem(margem_previa_h[i]),
          numero(margem_previa_n[i], 6), regime_por_margem(margem_previa_n[i]))
  }, character(1)),
  "", fonte, "",
  paste0("Na ordem original, suponha que a federação conheça privadamente V e que o suporte conhecido pelo governo seja [",
         numero(suporte_valor[1], 3), ", ", numero(suporte_valor[2], 3),
         "]. O custo mínimo de defesa é ", numero(inicial$custo, 6), " na origem, ",
         numero(homotetico$custo, 6), " após o choque na demanda homotética e ",
         numero(nao_homotetico$custo, 6),
         " na não homotética. O custo está abaixo de todo o suporte na origem e na não homotética, e acima de todo o suporte na homotética após o choque. Todos os tipos escolhem a mesma resposta em cada respectivo subjogo."),
  "",
  "## Verificações e reprodução",
  "",
  paste0("A malha contém ", length(grade_a), " pontos de automação por cenário, entre 0 e 0,99. Os maiores resíduos absolutos foram:"),
  "",
  sprintf("- Equação implícita da demanda: %.2e.", erro_foc),
  sprintf("- Parcela obtida pela equação de dispêndio independente: %.2e.", erro_orcamento),
  sprintf("- Parcela homotética em forma fechada: %.2e.", erro_h),
  sprintf("- Restrição de emprego total: %.2e.", erro_emprego),
  sprintf("- Decomposição exata da diferença entre as capacidades: %.2e.", erro_gap),
  "",
  "A rotina também verifica o ponto inicial comum, a ordenação das parcelas em toda a malha positiva, os sinais das margens e do custo da defesa, os dois limiares analíticos e o efeito de igualar ou inverter as capacidades setoriais no ponto pós-choque.",
  "",
  paste0("Executado com ", R.version.string, ", usando R base. Na raiz do projeto, rode ",
         "`Rscript model/verificar_crossing_demanda_ia.R` para reproduzir este arquivo, ",
         "`figures/crossing_demanda_ia.pdf` e `figures/crossing_demanda_tabela.tex`.")
)

linha_latex <- function(nome, estado) {
  valores <- c(nome, numero(100 * estado$parcela, 2), numero(estado$poder, 4),
               numero(estado$custo, 4), estado$regime)
  paste0(paste(valores, collapse = " & "), " \\\\")
}
tabela_latex <- c(linha_latex("Antes da IA", inicial),
                  linha_latex("Depois, homotética", homotetico),
                  linha_latex("Depois, não homotética", nao_homotetico))

desenhar_figura <- function(arquivo) {
  manter <- grade_a <= 0.50
  x <- grade_a[manter]
  h <- grade_h$poder[manter]
  n <- grade_n$poder[manter]
  azul <- "#245995"
  terracota <- "#A33C22"
  cinza <- "#575D65"
  grDevices::pdf(arquivo, width = 7.1, height = 3.65, useDingbats = FALSE,
                 title = "Demanda setorial e democracia")
  on.exit(grDevices::dev.off(), add = TRUE)
  par(mar = c(4.1, 4.5, 1.45, 0.8), mgp = c(2.6, 0.65, 0), las = 1,
      family = "Helvetica", fg = "#313944", col.axis = "#313944", bty = "l")
  plot(x, n, type = "n", ylim = range(c(n, h, limiar)) + c(-0.035, 0.025),
       xaxs = "i", axes = FALSE, xlab = "Redução do trabalho por unidade de A",
       ylab = "Capacidade de defesa (M)")
  janela <- par("usr")
  rect(a_queda, janela[3], min(a_retorno, max(x)), janela[4],
       col = "#F0F1F3", border = NA)
  marcas_y <- pretty(range(c(n, h, limiar)), n = 5)
  abline(h = marcas_y, col = "#E1E3E5", lwd = 0.5)
  abline(h = limiar, col = cinza, lty = "dashed", lwd = 1.3)
  abline(v = choque, col = cinza, lty = "dotted", lwd = 0.9)
  lines(x, h, col = terracota, lwd = 2.6, lty = "longdash")
  lines(x, n, col = azul, lwd = 2.6)
  points(rep(choque, 2), c(homotetico$poder, nao_homotetico$poder),
         col = c(terracota, azul), bg = "white", pch = c(22, 21), lwd = 1.6, cex = 1.05)
  marcas_x <- seq(0, 0.5, by = 0.1)
  axis(1, at = marcas_x, labels = numero(marcas_x, 1))
  axis(2, at = marcas_y, labels = numero(marcas_y, 1))
  axis(3, at = choque, labels = paste0("Choque ", numero(choque, 2)),
       tick = FALSE, line = -0.1, cex.axis = 0.83)
  box(bty = "l")
  legend("topleft", c("Demanda não homotética", "Demanda homotética", "Limiar do regime"),
         col = c(azul, terracota, cinza), lty = c("solid", "longdash", "dashed"),
         lwd = c(2.6, 2.6, 1.3), bty = "n", cex = 0.80, inset = c(0.005, 0.001))
}

salvar_resultados <- function() {
  figura_tmp <- tempfile(tmpdir = dirname(caminho_figura), fileext = ".pdf")
  relatorio_tmp <- tempfile(tmpdir = dirname(caminho_relatorio), fileext = ".md")
  tabela_tmp <- tempfile(tmpdir = dirname(caminho_tabela), fileext = ".tex")
  on.exit(unlink(c(figura_tmp, relatorio_tmp, tabela_tmp)), add = TRUE)
  desenhar_figura(figura_tmp)
  writeLines(enc2utf8(tabela_latex), tabela_tmp, useBytes = TRUE)
  writeLines(enc2utf8(relatorio), relatorio_tmp, useBytes = TRUE)
  if (!file.rename(figura_tmp, caminho_figura)) stop("Falha ao salvar a figura.")
  if (!file.rename(tabela_tmp, caminho_tabela)) stop("Falha ao salvar a tabela LaTeX.")
  if (!file.rename(relatorio_tmp, caminho_relatorio)) stop("Falha ao salvar o relatório.")
}
salvar_resultados()
