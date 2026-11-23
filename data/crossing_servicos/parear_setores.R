# Executar a partir da raiz do repositório: Rscript data/crossing_servicos/parear_setores.R
# Dependências: readxl e pdftotext (Poppler).
base <- file.path("data", "crossing_servicos")
anos <- c(2012L, 2015L, 2025L)
tabela <- read.csv(file.path(base, "hubmer_bi.csv"), colClasses = c(io = "character"))
mapa <- read.csv(file.path(base, "crosswalk.csv"), colClasses = c(io = "character"))
stopifnot(!anyDuplicated(tabela$io), !anyDuplicated(mapa$setor),
          all(mapa$cic_min <= mapa$cic_max),
          all(tail(mapa$cic_min, -1L) > head(mapa$cic_max, -1L)))

# Confere as três colunas transcritas contra o PDF publicado. Neste PDF a
# fonte representa alguns pontos decimais pelo caractere de controle 0x06.
pdf <- file.path(base, "raw", "hubmer_2023_suplemento.pdf")
pagina <- system2("pdftotext", c("-f", "11", "-l", "11", "-layout", shQuote(pdf), "-"),
                  stdout = TRUE)
stopifnot(is.null(attr(pagina, "status")))
pagina <- gsub("\006", ".", pagina, fixed = TRUE)
pagina <- gsub("\u2212", "-", pagina, fixed = TRUE)
linhas <- trimws(pagina)
linhas <- linhas[grepl("^([0-9]{2}|4A|oo)\\s{2,}", linhas, perl = TRUE)]
campos <- strsplit(linhas, "[[:space:]]+")
codigo_pdf <- vapply(campos, `[[`, character(1L), 1L)
momentos <- t(vapply(campos, function(x) as.numeric(tail(x, 6L)), numeric(6L)))
stopifnot(identical(codigo_pdf, tabela$io),
          all(momentos[, 1] == tabela$peso_cex),
          all(momentos[, 2] == tabela$peso_gasto),
          all(momentos[, 4] == tabela$gamma_menos_um))

# Cada ramo tem uma elasticidade publicada. Para a referência manufatureira,
# formamos um composto dos três ramos publicados com seus pesos de gasto PCE.
codigos <- strsplit(mapa$io, "+", fixed = TRUE)
linhas_io <- lapply(codigos, match, table = tabela$io)
stopifnot(!anyNA(unlist(linhas_io)))
mapa$elasticidade <- vapply(linhas_io, function(j) {
  weighted.mean(1 + tabela$gamma_menos_um[j], tabela$peso_gasto[j])
}, numeric(1L))
mapa$peso_gasto <- vapply(linhas_io, function(j) sum(tabela$peso_gasto[j]), numeric(1L))
mapa$peso_cex <- vapply(linhas_io, function(j) sum(tabela$peso_cex[j]), numeric(1L))

variaveis <- c("obs_cps", "emprego", "filiados", "cobertos")
cabecalho <- c("CIC", "Industry", "Obs", "Employment (in 1000s)", "Members (in 1000s)",
               "Covered (in 1000s)", "% Mem", "% Cov")
# Conferências independentes da regra de agregação por código, usando os
# respectivos subtotais publicados nas planilhas originais. Os que combinam
# mais de um grupo analítico são reunidos explicitamente abaixo.
subtotais <- list(
  manufatura = c("NONDURABLE GOODS MANUFACTURING", "DURABLE GOODS MANUFACTURING"),
  atacado = "WHOLESALE TRADE", varejo = "RETAIL TRADE",
  informacao = "INFORMATION", financas_seguros = "FINANCE & INSURANCE",
  profissionais_tecnicos = "PROF., SCIENTIFIC, TECHNICAL SERVICES",
  educacao = "EDUCATIONAL SERVICES", saude_assistencia = "HEALTH CARE & SOCIAL ASSISTANCE",
  artes_lazer = "ARTS, ENTERTAINMENT, & RECREATION", alojamento_alimentacao = "ACCOMODATION & FOOD SERVICES",
  outros_servicos = "OTHER SERVICES, EXC. PUBLIC ADMIN."
)

ler_ano <- function(ano) {
  arquivo <- file.path(base, "raw", sprintf("unionstats_%d.xlsx", ano))
  # O rodapé contém texto mesclado em todas as colunas. Só convertemos
  # números para as linhas de dados, após identificar o código da indústria.
  raw <- as.data.frame(readxl::read_excel(arquivo, skip = 2L, col_types = "text"))
  stopifnot(identical(names(raw), cabecalho))
  names(raw) <- c("codigo", "industria_cps", variaveis, "taxa_mem_fonte", "taxa_cov_fonte")
  d <- raw[grepl("^[0-9]+$", raw$codigo), ]
  d$cic <- as.integer(d$codigo)
  d$ano <- ano
  numericas <- c(variaveis, "taxa_mem_fonte", "taxa_cov_fonte")
  d[numericas] <- lapply(d[numericas], as.numeric)
  stopifnot(!anyDuplicated(d$cic), !anyNA(d[numericas]), all(d$emprego > 0),
            all(d$obs_cps > 0), all(d$filiados >= 0), all(d$filiados <= d$cobertos + 1e-9),
            all(d$cobertos <= d$emprego + 1e-9),
            all(abs(d$filiados / d$emprego - d$taxa_mem_fonte) < 1e-6),
            all(abs(d$cobertos / d$emprego - d$taxa_cov_fonte) < 1e-6))

  grupo <- findInterval(d$cic, mapa$cic_min)
  pos <- pmax(grupo, 1L)
  mapeado <- grupo > 0L & d$cic <= mapa$cic_max[pos]
  # Entre utilidades e outros serviços apenas construção (770), imóveis e
  # gestão de empresas ficam de fora. As pontas da tabela são agro, mineração
  # e administração pública, todas fora do confronto.
  fora <- d$cic < 570L | d$cic > 9290L | d$cic %in% c(770L, 7070L, 7071L, 7072L, 7570L)
  stopifnot(identical(mapeado, !fora))
  detalhes <- d[mapeado, c("ano", "cic", "industria_cps", variaveis)]
  detalhes$setor <- mapa$setor[pos[mapeado]]
  totais <- aggregate(detalhes[variaveis], list(setor = detalhes$setor), sum)
  stopifnot(setequal(totais$setor, mapa$setor))
  verificar_subtotal <- function(estimativa, rotulos) {
    idx <- match(rotulos, raw$industria_cps)
    stopifnot(!anyNA(idx))
    publicado <- vapply(raw[idx, variaveis, drop = FALSE],
                        function(coluna) sum(as.numeric(coluna)), numeric(1L))
    stopifnot(all(abs(estimativa - publicado) <= 1e-7 * pmax(1, publicado)))
  }
  total <- function(ids) colSums(totais[totais$setor %in% ids, variaveis, drop = FALSE])
  parcela_fora <- function(cics) colSums(d[d$cic %in% cics, variaveis, drop = FALSE])
  for (id in names(subtotais)) verificar_subtotal(total(id), subtotais[[id]])
  verificar_subtotal(total(c("transportes", "armazenagem_correios")), "TRANSPORTATION & WAREHOUSING")
  verificar_subtotal(total("locacao") + parcela_fora(c(7070L, 7071L, 7072L)),
                     "REAL ESTATE & RENTAL & LEASING")
  verificar_subtotal(total("administrativos_residuos") + parcela_fora(7570L), "MANAGEMENT & RELATED SERVICES")
  verificar_subtotal(total("utilidades") + parcela_fora(770L), "UTILITIES")

  # As três colunas da fonte estão em milhares de trabalhadores. Preservar
  # as casas decimais evita que as taxas dependam da formatação do Excel.
  pessoas <- c("emprego", "filiados", "cobertos")
  detalhes[pessoas] <- detalhes[pessoas] * 1000
  totais[pessoas] <- totais[pessoas] * 1000
  censo <- totais[match(mapa$setor, totais$setor), variaveis, drop = FALSE]
  pares <- data.frame(setor = mapa$setor, nome = mapa$nome, ano = ano,
                      elasticidade = mapa$elasticidade, censo, servico = mapa$servico,
                      peso_gasto = mapa$peso_gasto, peso_cex = mapa$peso_cex, io = mapa$io)
  pares$pct_filiados <- 100 * pares$filiados / pares$emprego
  pares$pct_cobertos <- 100 * pares$cobertos / pares$emprego
  list(pares = pares, detalhe = detalhes)
}

anos_processados <- lapply(anos, ler_ano)
pares <- do.call(rbind, lapply(anos_processados, `[[`, "pares"))
detalhe <- do.call(rbind, lapply(anos_processados, `[[`, "detalhe"))
stopifnot(!anyDuplicated(pares[c("setor", "ano")]), !anyDuplicated(detalhe[c("ano", "cic")]),
          all(table(pares$ano) == nrow(mapa)), all(tapply(pares$servico, pares$ano, sum) == 14L))
write.csv(pares, file.path(base, "pares.csv"), row.names = FALSE, fileEncoding = "UTF-8")
write.csv(detalhe, file.path(base, "detalhe_cic.csv"), row.names = FALSE, fileEncoding = "UTF-8")

relatorio <- c("# Conferência do pareamento por ramo de atividade",
  "", "Fontes de 23 de novembro de 2026. Cada ano tem 14 ramos de serviços, mais manufatura e utilidades. O denominador de cada taxa é o total estimado de assalariados daquele ramo.",
  "", "O script confrontou as três colunas transcritas com a Tabela B.I publicada de Hubmer. Para a CPS, verificou a unicidade dos códigos, a cobertura do mapeamento, os subtotais e a concordância das taxas publicadas com as contagens detalhadas no Excel.",
  "", "Tabela 1. Elasticidade de gasto (média do período de Hubmer) e percentuais de filiação e cobertura dos assalariados de cada ramo e ano.",
  "", "| Ramo | Ano | Elasticidade | Filiação (%) | Cobertura (%) |",
  "|---|---:|---:|---:|---:|",
  sprintf("| %s | %d | %.3f | %.2f | %.2f |", pares$nome, pares$ano, pares$elasticidade,
          pares$pct_filiados, pares$pct_cobertos))
writeLines(relatorio, file.path(base, "verificacao.md"), useBytes = TRUE)
