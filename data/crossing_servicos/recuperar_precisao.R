# Executar a partir da raiz. Implementa, para as três estatísticas utilizadas,
# o programa de Hubmer code_estimation/2e_sum_2dig.do (Stata).
base <- file.path("data", "crossing_servicos")
originais <- file.path(base, "raw", "hubmer_replica")
painel <- as.data.frame(haven::read_dta(file.path(originais, "data_pcepfi1.dta"),
                                       col_select = c("year", "comcode", "beta", "esh_cex", "esh_pce")))
quantis <- as.data.frame(haven::read_dta(file.path(originais, "quantiles_expsh4.dta"),
                                        col_select = "comcode"))
stopifnot(!anyDuplicated(quantis$comcode), !anyDuplicated(painel[c("comcode", "year")]))

# Stata normaliza dentro do ano para todos os bens com beta observado, antes
# de restringir pelo merge com a base de quartis. Um peso faltante vale zero.
dados <- subset(painel, year >= 1982 & year <= 2012 & !is.na(beta))
for (variavel in c("esh_cex", "esh_pce")) {
  peso <- dados[[variavel]]
  peso[is.na(peso)] <- 0
  soma_anual <- ave(peso, dados$year, FUN = sum)
  stopifnot(all(soma_anual > 0))
  dados[[variavel]] <- peso / soma_anual
}
dados <- dados[dados$comcode %in% quantis$comcode, ]
stopifnot(identical(sort(unique(as.integer(dados$year))), 1982:2012))
dados$io <- substr(dados$comcode, 1L, 2L)
dados$beta_cex <- dados$beta * dados$esh_cex
anual <- aggregate(dados[c("esh_cex", "esh_pce", "beta_cex")],
                   dados[c("io", "year")], sum)
# Dentro de cada ramo, o beta é ponderado por participação CEX. O equivalente
# à soma do Stata para um grupo sem peso positivo é zero.
anual$beta <- 0
positivo <- anual$esh_cex > 0
anual$beta[positivo] <- anual$beta_cex[positivo] / anual$esh_cex[positivo]
beta_medio <- ave(anual$beta * anual$esh_cex, anual$year, FUN = sum)
anual$elasticidade <- 1 + anual$beta - beta_medio
por_io <- aggregate(anual[c("esh_cex", "esh_pce", "elasticidade")], list(io = anual$io), mean)
names(por_io)[2:3] <- c("peso_cex", "peso_gasto")
impresso <- read.csv(file.path(base, "hubmer_bi.csv"), colClasses = c(io = "character"))
stopifnot(setequal(impresso$io, por_io$io))
por_io <- por_io[match(impresso$io, por_io$io), ]
stopifnot(all(round(por_io$peso_cex, 3L) == impresso$peso_cex),
          all(round(por_io$peso_gasto, 3L) == impresso$peso_gasto),
          all(round(por_io$elasticidade - 1, 3L) == impresso$gamma_menos_um))

mapa <- read.csv(file.path(base, "crosswalk.csv"), colClasses = c(io = "character"))
partes <- lapply(strsplit(mapa$io, "+", fixed = TRUE), match, table = por_io$io)
stopifnot(!anyNA(unlist(partes)))
parametros <- data.frame(
  setor = mapa$setor, io = mapa$io,
  elasticidade = vapply(partes, function(p) weighted.mean(por_io$elasticidade[p], por_io$peso_gasto[p]), numeric(1L)),
  peso_gasto = vapply(partes, function(p) sum(por_io$peso_gasto[p]), numeric(1L)),
  peso_cex = vapply(partes, function(p) sum(por_io$peso_cex[p]), numeric(1L))
)
write.csv(por_io, file.path(base, "hubmer_bi_precisao.csv"), row.names = FALSE)
write.csv(parametros, file.path(base, "parametros_precisos.csv"), row.names = FALSE)

nota <- c(
  "# Precisão dos pesos de gasto na Tabela B.I",
  "",
  "Os arquivos de replicação de Hubmer permitem recuperar os valores antes do arredondamento. A especificação abaixo reproduz, após o arredondamento a três casas, as 22 participações PCE, as 22 participações CEX e os 22 coeficientes de elasticidade publicados.",
  "",
  "O programa original do autor é `code_estimation/2e_sum_2dig.do`. Ele aplica a restrição de anos 1982–2012 e de coeficiente beta disponível a `data_interm/data_pcepfi1.dta`. Para cada ano, converte pesos faltantes em zero e normaliza cada série de pesos sobre os bens elegíveis. Em seguida mantém observações com correspondência de código de bem em `data_interm/CEX/quantiles_expsh4.dta`. Agrupa pela raiz de dois caracteres do código de produto, soma as participações e calcula a elasticidade do ramo a partir dos betas ponderados pelas participações CEX. A centralização por ano faz com que a média orçamentária dos betas corresponda a elasticidade unitária no conjunto dos bens. Finalmente, calcula a média temporal de cada estatística setorial.",
  "",
  sprintf("O painel filtrado contém %d observações de %d bens distintos em %d anos calendários. A replicação contém pesos anuais para 1982–2012, inclusive anos intermediários às tabelas quinquenais de insumo-produto. O cálculo aqui usa os registros anuais do autor e a mesma ordem de operações.", nrow(dados), length(unique(dados$comcode)), length(unique(dados$year))),
  "",
  "As operações foram refeitas em precisão dupla em R. Conservar oito casas de apresentação evita atribuir significado econômico a diferenças numéricas entre softwares. Na manufatura, a referência é o composto das elasticidades dos grupos 31, 32 e 33, ponderado pelas participações PCE médias recuperadas. O composto foi calculado para este confronto.",
  "",
  "Tabela 1. Parâmetros anteriores ao arredondamento para os 16 ramos do pareamento. Pesos em frações do gasto total.",
  "",
  "| Ramo | Elasticidade | Peso PCE | Peso CEX |", "|---|---:|---:|---:|",
  sprintf("| %s | %.8f | %.8f | %.8f |", mapa$nome, parametros$elasticidade, parametros$peso_gasto, parametros$peso_cex),
  "",
  "O depósito do periódico contém cerca de 729 MiB. A pasta `raw/hubmer_replica/` conserva os dois insumos agregados, o código Stata, o README do autor e a tabela LaTeX original. A restrição a três casas aparece no comando de formatação do arquivo Stata. A variável de quartis de gasto adicional apresenta pequenas diferenças entre o TeX distribuído e o PDF publicado em alguns ramos e está fora desta reconstrução. [Depósito oficial](https://www.econometricsociety.org/publications/econometrica/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/18580_Data_and_Programs.zip) e [Tabela B.I publicada](https://www.econometricsociety.org/publications/econometrica/browse/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/ecta200523-sup-0001-onlineappendix.pdf#page=11).",
  "",
  "Na raiz do projeto, `sh data/crossing_servicos/extrair_replica_hubmer.sh` recupera os cinco arquivos do depósito, usando o diretório temporário para o arquivo grande. `env LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 Rscript --vanilla data/crossing_servicos/recuperar_precisao.R` produz esta nota e os CSVs para os 22 ramos originais e para os 16 ramos do pareamento. O pacote R necessário é `haven`. Fontes consultadas em 23 de novembro de 2026."
)
writeLines(nota, file.path(base, "precisao_pesos.md"), useBytes = TRUE)
