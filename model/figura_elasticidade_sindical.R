# Da raiz do projeto: Rscript --vanilla model/figura_elasticidade_sindical.R
dados <- read.csv("data/crossing_servicos/pares.csv", fileEncoding = "UTF-8")
servicos <- subset(dados, ano == 2012 & servico == 1L)
manufatura <- subset(dados, ano == 2012 & setor == "manufatura")
stopifnot(nrow(servicos) == 14L, !anyDuplicated(servicos$setor), nrow(manufatura) == 1L,
          !anyNA(servicos[c("elasticidade", "filiados", "emprego")]),
          all(servicos$emprego > 0), manufatura$emprego > 0)
servicos$filiacao <- 100 * servicos$filiados / servicos$emprego
referencia <- 100 * manufatura$filiados / manufatura$emprego

# Posições dos rótulos, em unidades dos eixos. A extremidade de cada segmento
# coincide com o início ou o centro do rótulo, conforme o alinhamento.
rotulos <- data.frame(
  setor = c("armazenagem_correios", "educacao", "transportes", "saude_assistencia",
            "artes_lazer", "financas_seguros", "alojamento_alimentacao"),
  texto = c("Correios e armazenagem", "Educação", "Transportes", "Saúde e assistência",
            "Artes e lazer", "Finanças e seguros", "Alojamento e alimentação"),
  x = c(0.575, 1.470, 1.430, 1.300, 1.967, 1.583, 1.740),
  y = c(38.50, 31.72, 22.77, 13.75, 12.85, -1.50, 1.55),
  alinhar = c(0, 0, 0, 1, 0.5, 1, 0),
  segmento = c(FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
)
posicao <- match(rotulos$setor, servicos$setor)
stopifnot(!anyNA(posicao))

grDevices::pdf("figures/elasticidade_sindical_servicos.pdf", width = 7.6, height = 3.7,
               family = "Helvetica", encoding = "ISOLatin1.enc", useDingbats = FALSE,
               pointsize = 10)
par(mar = c(3.05, 3.60, 0.25, 0.25), mgp = c(1.97, 0.45, 0),
    tcl = -0.20, las = 1, xaxs = "i", yaxs = "i", fg = "#333D44")
plot.new()
plot.window(xlim = c(0.46, 2.13), ylim = c(-3.5, 41.5))
abline(h = c(0, 20, 30, 40), col = "#E6EBEE", lwd = 0.6)
abline(v = 1, col = "#A8B4BA", lty = "dotted", lwd = 0.9)
abline(h = referencia, col = "#81919B", lty = "dashed", lwd = 0.9)
axis(1, at = seq(0.5, 2, 0.25), labels = c("0,50", "0,75", "1,00", "1,25", "1,50", "1,75", "2,00"),
     col = "#A8B4BA", col.axis = "#33424B", cex.axis = 0.90)
axis(2, at = seq(0, 40, 10), col = "#A8B4BA", col.axis = "#33424B", cex.axis = 0.90)
mtext("Elasticidade-renda do gasto", side = 1, line = 1.80)
mtext("Assalariados filiados a sindicatos (%)", side = 2, line = 2.40, las = 0)
text(0.49, referencia + 1.35,
     paste0("Manufatura (", formatC(referencia, digits = 1, format = "f", decimal.mark = ","), "%)"),
     adj = c(0, 0), col = "#546874", cex = 0.84)

for (i in which(rotulos$segmento)) {
  j <- posicao[i]
  # Deixa um espaço entre o segmento e a palavra.
  deslocamento_x <- (rotulos$alinhar[i] - 0.5) * 0.020
  segments(servicos$elasticidade[j], servicos$filiacao[j],
           rotulos$x[i] + deslocamento_x, rotulos$y[i] - ifelse(rotulos$alinhar[i] == 0.5, 1.1, 0),
           col = "#87949E", lwd = 0.75)
}
points(servicos$elasticidade, servicos$filiacao, pch = 21, cex = 1.25,
       lwd = 0.6, bg = "#245367", col = "white")
for (i in seq_len(nrow(rotulos))) {
  text(rotulos$x[i], rotulos$y[i], rotulos$texto[i], adj = c(rotulos$alinhar[i], 0.5),
       cex = 0.88, col = "#233C49")
}
invisible(grDevices::dev.off())
