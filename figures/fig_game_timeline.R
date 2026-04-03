pdf("figures/fig_game_timeline.pdf", width = 9, height = 5.5)
par(mar = c(0.5, 0.5, 0.5, 0.5), family = "serif")
plot.new()
plot.window(xlim = c(0, 100), ylim = c(0, 60))

# Colors
col_stable   <- "#C8E6C9"
col_unstable <- "#FFCDD2"
col_neutral  <- "#F5F5F5"
col_compl    <- "#E3F2FD"
col_border   <- "grey30"

draw_box <- function(cx, cy, w, h, label, fill = "white", border = "black",
                     cex = 0.65, font = 1, text_col = "black", lwd = 1.2) {
  rect(cx - w/2, cy - h/2, cx + w/2, cy + h/2, col = fill, border = border, lwd = lwd)
  if (is.expression(label)) {
    text(cx, cy, label, cex = cex, font = font, col = text_col)
  } else {
    text(cx, cy, label, cex = cex, font = font, col = text_col)
  }
}

draw_arrow <- function(x0, y0, x1, y1, lwd = 1.2, col = "grey30") {
  arrows(x0, y0, x1, y1, length = 0.07, lwd = lwd, col = col)
}

# Layout: two panels side by side
segments(50, 2, 50, 58, lty = 2, col = "grey50", lwd = 1.0)

# Panel titles
text(25, 57, "Rapid Displacement", cex = 0.85, font = 2, col = "grey25")
text(75, 57, "Threshold Automation", cex = 0.85, font = 2, col = "grey25")

# Period labels
text(13, 52, "Period 1", cex = 0.7, font = 3, col = "grey40")
text(37, 52, "Period 2", cex = 0.7, font = 3, col = "grey40")
text(63, 52, "Period 1", cex = 0.7, font = 3, col = "grey40")
text(87, 52, "Period 2", cex = 0.7, font = 3, col = "grey40")

# Row positions
y1 <- 46; y2 <- 39; y3 <- 32; y4 <- 25; y5 <- 18
bw <- 20; bh <- 5

# ========= LEFT PANEL: RAPID =========
x_r1 <- 13; x_r2 <- 37

# t=1
draw_box(x_r1, y1, bw, bh, expression(paste(omega[1], " high: ", l[1], " = L")),
         fill = col_unstable, border = col_border, cex = 0.58)
draw_box(x_r1, y2, bw, bh, "Uniform displacement\n(all E lose together)",
         fill = col_neutral, border = col_border, cex = 0.55)
draw_box(x_r1, y3, bw, bh, expression(paste(sigma[r], " low: ", pi, "* >= ", bar(pi))),
         fill = col_neutral, border = col_border, cex = 0.58)
draw_box(x_r1, y4, bw, bh+1, "D: coalition -> compensation\nA: repression degraded",
         fill = col_neutral, border = col_border, cex = 0.55)
draw_box(x_r1, y5, bw, bh, "D: Stable\nA: Unstable*",
         fill = col_neutral, border = col_border, cex = 0.58, font = 2)

draw_arrow(x_r1, y1 - bh/2, x_r1, y2 + bh/2)
draw_arrow(x_r1, y2 - bh/2, x_r1, y3 + bh/2)
draw_arrow(x_r1, y3 - bh/2, x_r1, y4 + (bh+1)/2)
draw_arrow(x_r1, y4 - (bh+1)/2, x_r1, y5 + bh/2)

# t=2
draw_box(x_r2, y1, bw, bh, "Displacement persists\n(absorbing state)",
         fill = col_unstable, border = col_border, cex = 0.55)
draw_box(x_r2, y2, bw, bh, "Same uniform condition",
         fill = col_neutral, border = col_border, cex = 0.55)
draw_box(x_r2, y3, bw, bh, "Coordination persists",
         fill = col_neutral, border = col_border, cex = 0.58)
draw_box(x_r2, y4, bw, bh+1, "D: capacity persists (A7)\nA: opposition persists",
         fill = col_neutral, border = col_border, cex = 0.55)
draw_box(x_r2, y5, bw, bh, "D: Stable\nA: Unstable*",
         fill = col_neutral, border = col_border, cex = 0.58, font = 2)

draw_arrow(x_r2, y1 - bh/2, x_r2, y2 + bh/2)
draw_arrow(x_r2, y2 - bh/2, x_r2, y3 + bh/2)
draw_arrow(x_r2, y3 - bh/2, x_r2, y4 + (bh+1)/2)
draw_arrow(x_r2, y4 - (bh+1)/2, x_r2, y5 + bh/2)

draw_arrow(x_r1 + bw/2, y5, x_r2 - bw/2, y5, lwd = 1.5, col = "grey50")

# ========= RIGHT PANEL: THRESHOLD =========
x_t1 <- 63; x_t2 <- 87

# t=1: complementarity
draw_box(x_t1, y1, bw, bh, expression(paste(omega[1], " low: ", l[1], " = 0")),
         fill = col_compl, border = col_border, cex = 0.58)
draw_box(x_t1, y2, bw, bh, "Complementarity phase\n(winners created)",
         fill = col_compl, border = col_border, cex = 0.55)
draw_box(x_t1, y3, bw, bh, "No grievance\nNo coordination needed",
         fill = col_compl, border = col_border, cex = 0.55)
draw_box(x_t1, y4, bw, bh+1, "D: no crisis, no capacity\n    built (phi = 0)\nA: no crisis",
         fill = col_compl, border = col_border, cex = 0.52)
draw_box(x_t1, y5, bw, bh, "D: Stable\nA: Stable",
         fill = col_compl, border = col_border, cex = 0.58, font = 2)

draw_arrow(x_t1, y1 - bh/2, x_t1, y2 + bh/2)
draw_arrow(x_t1, y2 - bh/2, x_t1, y3 + bh/2)
draw_arrow(x_t1, y3 - bh/2, x_t1, y4 + (bh+1)/2)
draw_arrow(x_t1, y4 - (bh+1)/2, x_t1, y5 + bh/2)

# t=2: threshold crossed
draw_box(x_t2, y1, bw, bh, expression(paste(omega[2], " high: ", l[2], " = L")),
         fill = col_unstable, border = col_border, cex = 0.58)
draw_box(x_t2, y2, bw, bh, "Losers dispersed\namong winners",
         fill = col_neutral, border = col_border, cex = 0.55)
draw_box(x_t2, y3, bw, bh, expression(paste(sigma[tau], " high: ", pi, "* < ", bar(pi))),
         fill = col_neutral, border = col_border, cex = 0.58)
draw_box(x_t2, y4, bw, bh+1, "D: no coalition, A7 blocks\n    -> no compensation\nA: full repression",
         fill = col_neutral, border = col_border, cex = 0.52)
draw_box(x_t2, y5, bw, bh, "D: Unstable\nA: Stable",
         fill = col_neutral, border = col_border, cex = 0.58, font = 2)

draw_arrow(x_t2, y1 - bh/2, x_t2, y2 + bh/2)
draw_arrow(x_t2, y2 - bh/2, x_t2, y3 + bh/2)
draw_arrow(x_t2, y3 - bh/2, x_t2, y4 + (bh+1)/2)
draw_arrow(x_t2, y4 - (bh+1)/2, x_t2, y5 + bh/2)

draw_arrow(x_t1 + bw/2, y5, x_t2 - bw/2, y5, lwd = 1.5, col = "grey50")

# Step labels
text(2, y1, "1", cex = 0.6, font = 2, col = "grey50")
text(2, y2, "2", cex = 0.6, font = 2, col = "grey50")
text(2, y3, "3", cex = 0.6, font = 2, col = "grey50")
text(2, y4, "4", cex = 0.6, font = 2, col = "grey50")
text(2, y5, "5", cex = 0.6, font = 2, col = "grey50")

text(5.5, y1, "Shock", cex = 0.5, font = 3, col = "grey45", adj = 0)
text(5.5, y2, "Structure", cex = 0.5, font = 3, col = "grey45", adj = 0)
text(5.5, y3, "Coord.", cex = 0.5, font = 3, col = "grey45", adj = 0)
text(5.5, y4, "Response", cex = 0.5, font = 3, col = "grey45", adj = 0)
text(5.5, y5, "Outcome", cex = 0.5, font = 3, col = "grey45", adj = 0)

# Footnote
text(50, 3, expression(paste("*Unstable for moderate autocracies (",
     kappa[0] < bar(kappa)/eta[r], ")")),
     cex = 0.50, col = "grey40")

dev.off()
