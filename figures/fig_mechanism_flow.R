pdf("figures/fig_mechanism_flow.pdf", width = 8, height = 4.5)
par(mar = c(0.5, 0.5, 0.5, 0.5), family = "serif")
plot.new()
plot.window(xlim = c(0, 100), ylim = c(0, 55))

draw_box <- function(cx, cy, w, h, label, fill = "white", border = "black",
                     cex = 0.72, font = 1, text_col = "black", lwd = 1.2) {
  rect(cx - w/2, cy - h/2, cx + w/2, cy + h/2, col = fill, border = border, lwd = lwd)
  text(cx, cy, label, cex = cex, font = font, col = text_col)
}
draw_arrow <- function(x0, y0, x1, y1, lwd = 1.3, col = "grey30") {
  arrows(x0, y0, x1, y1, length = 0.08, lwd = lwd, col = col)
}

y_top <- 40; y_bot <- 15
x <- c(8, 24, 40, 58, 78)
bw <- 13; bw_s <- 11; bh <- 6; bh_s <- 5
col_stable <- "#C8E6C9"; col_unstable <- "#FFCDD2"; col_neutral <- "#F5F5F5"; col_border <- "grey30"
dy_split <- 4.2

x_divide <- 32
segments(x_divide, 2, x_divide, 50, lty = 2, col = "grey50", lwd = 1.0)
text(x_divide - 14, 51, "Economic premise", cex = 0.62, font = 3, col = "grey40")
text(x_divide + 18, 51, "Political model", cex = 0.62, font = 3, col = "grey40")

text(1, y_top, "Rapid", cex = 0.68, font = 2, srt = 0, adj = c(0, 0.5), col = "grey25")
text(1, y_bot, "Threshold", cex = 0.68, font = 2, srt = 0, adj = c(0, 0.5), col = "grey25")

# TOP PATH — Rapid
draw_box(x[1], y_top, bw, bh, "Rapid\ndisplacement", fill = col_neutral, border = col_border)
draw_box(x[2], y_top, bw, bh, expression(paste(sigma[r], " low")), fill = col_neutral, border = col_border)
draw_box(x[3], y_top, bw, bh, expression(paste(pi, "* ", "" >= "", " ", bar(pi))), fill = col_neutral, border = col_border)
draw_box(x[4], y_top + dy_split, bw_s, bh_s, expression(paste("Dem: ", phi, " = ", bar(phi))), fill = col_neutral, border = col_border, cex = 0.65)
draw_box(x[4], y_top - dy_split, bw_s, bh_s, expression(paste("Aut: ", eta, " = ", eta[r])), fill = col_neutral, border = col_border, cex = 0.65)
draw_box(x[5], y_top + dy_split, bw_s, bh_s, "Stable", fill = col_stable, border = col_border, cex = 0.78, font = 2)
draw_box(x[5], y_top - dy_split, bw_s, bh_s, "Unstable*", fill = col_unstable, border = col_border, cex = 0.78, font = 2)

draw_arrow(x[1] + bw/2, y_top, x[2] - bw/2, y_top)
draw_arrow(x[2] + bw/2, y_top, x[3] - bw/2, y_top)
draw_arrow(x[3] + bw/2, y_top + 1, x[4] - bw_s/2, y_top + dy_split)
draw_arrow(x[3] + bw/2, y_top - 1, x[4] - bw_s/2, y_top - dy_split)
draw_arrow(x[4] + bw_s/2, y_top + dy_split, x[5] - bw_s/2, y_top + dy_split)
draw_arrow(x[4] + bw_s/2, y_top - dy_split, x[5] - bw_s/2, y_top - dy_split)

# BOTTOM PATH — Threshold
draw_box(x[1], y_bot, bw, bh, "Threshold\nautomation", fill = col_neutral, border = col_border)
draw_box(x[2], y_bot, bw, bh, expression(paste(sigma[tau], " high")), fill = col_neutral, border = col_border)
draw_box(x[3], y_bot, bw, bh, expression(paste(pi, "* ", "" < "", " ", bar(pi))), fill = col_neutral, border = col_border)
draw_box(x[4], y_bot + dy_split, bw_s, bh_s, expression(paste("Dem: ", phi, " = 0")), fill = col_neutral, border = col_border, cex = 0.65)
draw_box(x[4], y_bot - dy_split, bw_s, bh_s, expression(paste("Aut: ", eta, " = 1")), fill = col_neutral, border = col_border, cex = 0.65)
draw_box(x[5], y_bot + dy_split, bw_s, bh_s, "Unstable", fill = col_unstable, border = col_border, cex = 0.78, font = 2)
draw_box(x[5], y_bot - dy_split, bw_s, bh_s, "Stable", fill = col_stable, border = col_border, cex = 0.78, font = 2)

draw_arrow(x[1] + bw/2, y_bot, x[2] - bw/2, y_bot)
draw_arrow(x[2] + bw/2, y_bot, x[3] - bw/2, y_bot)
draw_arrow(x[3] + bw/2, y_bot + 1, x[4] - bw_s/2, y_bot + dy_split)
draw_arrow(x[3] + bw/2, y_bot - 1, x[4] - bw_s/2, y_bot - dy_split)
draw_arrow(x[4] + bw_s/2, y_bot + dy_split, x[5] - bw_s/2, y_bot + dy_split)
draw_arrow(x[4] + bw_s/2, y_bot - dy_split, x[5] - bw_s/2, y_bot - dy_split)

# Headers
y_header <- 48.5
text(x[1], y_header, "Trajectory", cex = 0.60, font = 3, col = "grey35")
text(x[2], y_header, "Signal noise", cex = 0.60, font = 3, col = "grey35")
text(x[3], y_header, "Coordination", cex = 0.60, font = 3, col = "grey35")
text(x[4], y_header, "Inst. response", cex = 0.60, font = 3, col = "grey35")
text(x[5], y_header, "Stability", cex = 0.60, font = 3, col = "grey35")

text(50, 2.5, expression(paste("*Unstable for moderate autocracies: ", kappa[0], " < ", bar(kappa) / eta[r])),
     cex = 0.55, col = "grey40")
segments(3, 27.5, 97, 27.5, lty = 3, col = "grey70", lwd = 0.7)
dev.off()
