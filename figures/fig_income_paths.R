w_E <- 1
L   <- 1
beta <- 0.3
rapid_y     <- c(w_E - L, w_E - L)
threshold_y <- c(w_E + beta, w_E - L)

pdf("figures/fig_income_paths.pdf", width = 7, height = 3.5, family = "serif")
par(mfrow = c(1, 2), mar = c(4, 4.5, 2.5, 1), cex = 1.1)
col_loss <- rgb(0.8, 0.2, 0.2, alpha = 0.15)
col_gain <- rgb(0.2, 0.6, 0.2, alpha = 0.15)

# Left panel: Rapid
plot(1:2, rapid_y, type = "n", xlim = c(0.7, 2.3), ylim = c(-0.1, 1.5),
     xlab = "Period", ylab = expression(paste("Income  ", y[t])),
     main = "Rapid displacement", xaxt = "n", yaxt = "n", bty = "l")
axis(1, at = 1:2, labels = c(expression(italic(t) == 1), expression(italic(t) == 2)))
axis(2, at = seq(0, 1.5, 0.5), las = 1)
rect(0.7, 0, 2.3, w_E, col = col_loss, border = NA)
abline(h = w_E, lty = 2, lwd = 1.2, col = "grey40")
text(2.3, w_E + 0.07, expression(w[E]), adj = 1, cex = 0.9, col = "grey30")
lines(1:2, rapid_y, lwd = 2.5, col = "black")
points(1:2, rapid_y, pch = 19, cex = 1.3, col = "black")
text(1.5, 0.5, "loss", cex = 0.75, font = 3, col = "grey30")

# Right panel: Threshold
plot(1:2, threshold_y, type = "n", xlim = c(0.7, 2.3), ylim = c(-0.1, 1.5),
     xlab = "Period", ylab = expression(paste("Income  ", y[t])),
     main = "Threshold automation", xaxt = "n", yaxt = "n", bty = "l")
axis(1, at = 1:2, labels = c(expression(italic(t) == 1), expression(italic(t) == 2)))
axis(2, at = seq(0, 1.5, 0.5), las = 1)
rect(0.7, w_E, 1.5, threshold_y[1], col = col_gain, border = NA)
rect(1.5, 0, 2.3, w_E, col = col_loss, border = NA)
abline(h = w_E, lty = 2, lwd = 1.2, col = "grey40")
text(2.3, w_E + 0.07, expression(w[E]), adj = 1, cex = 0.9, col = "grey30")
lines(1:2, threshold_y, lwd = 2.5, col = "black")
points(1:2, threshold_y, pch = 19, cex = 1.3, col = "black")
text(1, threshold_y[1] + 0.10, expression(w[E] + beta), cex = 0.8, col = "grey20")
text(2, threshold_y[2] - 0.10, expression(w[E] - L), cex = 0.8, col = "grey20")
text(1.1, w_E + (threshold_y[1] - w_E) / 2, "gain", cex = 0.75, font = 3, col = "grey30")
text(1.9, w_E / 2, "loss", cex = 0.75, font = 3, col = "grey30")
dev.off()
