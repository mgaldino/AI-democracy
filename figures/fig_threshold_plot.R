omega_0 <- 1.0
omega_star <- 0.4
pi_bar <- 0.6
sigma <- seq(0.1, 5, length.out = 1000)
pi_star <- 1 - pnorm((omega_star - omega_0) / sigma)
sigma_hat <- (omega_star - omega_0) / qnorm(1 - pi_bar)

pdf("figures/fig_threshold_plot.pdf", width = 6, height = 4, family = "serif")
par(mar = c(4.5, 4.5, 1.0, 2.0), mgp = c(3, 0.8, 0))
y_lo <- 0.45; y_hi <- 1.0
plot(NULL, xlim = c(0.1, 5), ylim = c(y_lo, y_hi),
     xlab = "", ylab = "", axes = FALSE, xaxs = "i", yaxs = "i")

idx_left <- sigma <= sigma_hat
polygon(x = c(sigma[idx_left], rev(sigma[idx_left])),
        y = c(rep(y_lo, sum(idx_left)), rev(pi_star[idx_left])),
        col = rgb(0.75, 0.92, 0.75, 0.45), border = NA)
idx_right <- sigma >= sigma_hat
polygon(x = c(sigma[idx_right], rev(sigma[idx_right])),
        y = c(rep(y_lo, sum(idx_right)), rev(pi_star[idx_right])),
        col = rgb(0.95, 0.75, 0.75, 0.45), border = NA)

segments(x0 = par("usr")[1], y0 = pi_bar, x1 = par("usr")[2], y1 = pi_bar,
         lty = 2, lwd = 1.0, col = "grey35")
segments(x0 = sigma_hat, y0 = y_lo, y1 = pi_bar, lty = 3, lwd = 1.0, col = "grey35")
lines(sigma, pi_star, lwd = 2.2, col = "black")

axis(1, at = 0:5, cex.axis = 0.95, tcl = -0.3, lwd = 0.7)
axis(2, at = seq(y_lo, y_hi, by = 0.1), las = 1, cex.axis = 0.95, tcl = -0.3, lwd = 0.7)
box(lwd = 0.7)
mtext(expression("Signal noise (" * sigma * ")"), side = 1, line = 2.8, cex = 1.1)
mtext(expression("Equilibrium participation (" * pi * "*)"), side = 2, line = 3.2, cex = 1.1)
mtext(expression(bar(pi)), side = 4, at = pi_bar, las = 1, line = 0.5, cex = 1.05)
mtext(expression(hat(sigma)), side = 1, at = sigma_hat, line = -0.5, cex = 0.95, col = "grey35")

text(x = sigma_hat * 0.38, y = 0.97, labels = "Coordination\nsucceeds",
     cex = 0.82, font = 3, adj = 0.5)
text(x = sigma_hat + (5 - sigma_hat) * 0.52, y = 0.97, labels = "Coordination\nfails",
     cex = 0.82, font = 3, adj = 0.5)

sigma_r_pos <- 0.5
arrows(x0 = sigma_r_pos, y0 = y_lo + 0.02,
       x1 = sigma_r_pos, y1 = 1 - pnorm((omega_star - omega_0) / sigma_r_pos) - 0.012,
       length = 0.07, lwd = 1.1)
text(x = sigma_r_pos, y = y_lo + 0.005, labels = expression(sigma[r] ~ "(rapid)"),
     cex = 0.78, adj = 0.5)

sigma_tau_pos <- 4.0
arrows(x0 = sigma_tau_pos, y0 = y_lo + 0.02,
       x1 = sigma_tau_pos, y1 = 1 - pnorm((omega_star - omega_0) / sigma_tau_pos) - 0.012,
       length = 0.07, lwd = 1.1)
text(x = sigma_tau_pos, y = y_lo + 0.005, labels = expression(sigma[tau] ~ "(threshold)"),
     cex = 0.78, adj = 0.5)
dev.off()
