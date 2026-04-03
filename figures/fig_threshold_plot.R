omega_0 <- 1.0
omega_star_base <- 0.4
pi_bar <- 0.6
sigma <- seq(0.1, 5, length.out = 1000)

pdf("figures/fig_threshold_plot.pdf", width = 10, height = 4, family = "serif")
par(mfrow = c(1, 2), mar = c(4.5, 4.5, 2.0, 2.0), mgp = c(3, 0.8, 0))

# ========= Panel A: Baseline (as before) =========
pi_star <- 1 - pnorm((omega_star_base - omega_0) / sigma)
sigma_hat <- (omega_star_base - omega_0) / qnorm(1 - pi_bar)

y_lo <- 0.45; y_hi <- 1.0
plot(NULL, xlim = c(0.1, 5), ylim = c(y_lo, y_hi),
     xlab = "", ylab = "", axes = FALSE, xaxs = "i", yaxs = "i",
     main = expression(bold("A. Baseline")))

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
mtext(expression("Signal noise (" * sigma * ")"), side = 1, line = 2.8, cex = 0.9)
mtext(expression("Equilibrium participation (" * pi * "*)"), side = 2, line = 3.2, cex = 0.9)
mtext(expression(bar(pi)), side = 4, at = pi_bar, las = 1, line = 0.5, cex = 0.95)
mtext(expression(hat(sigma)), side = 1, at = sigma_hat, line = -0.5, cex = 0.85, col = "grey35")

text(x = sigma_hat * 0.38, y = 0.97, labels = "Coordination\nsucceeds",
     cex = 0.75, font = 3, adj = 0.5)
text(x = sigma_hat + (5 - sigma_hat) * 0.52, y = 0.97, labels = "Coordination\nfails",
     cex = 0.75, font = 3, adj = 0.5)

sigma_r_pos <- 0.5
arrows(x0 = sigma_r_pos, y0 = y_lo + 0.02,
       x1 = sigma_r_pos, y1 = 1 - pnorm((omega_star_base - omega_0) / sigma_r_pos) - 0.012,
       length = 0.07, lwd = 1.1)
text(x = sigma_r_pos, y = y_lo + 0.005, labels = expression(sigma[r] ~ "(rapid)"),
     cex = 0.72, adj = 0.5)

sigma_tau_pos <- 4.0
arrows(x0 = sigma_tau_pos, y0 = y_lo + 0.02,
       x1 = sigma_tau_pos, y1 = 1 - pnorm((omega_star_base - omega_0) / sigma_tau_pos) - 0.012,
       length = 0.07, lwd = 1.1)
text(x = sigma_tau_pos, y = y_lo + 0.005, labels = expression(sigma[tau] ~ "(threshold)"),
     cex = 0.72, adj = 0.5)

# ========= Panel B: Comparative statics on b_x =========

# b_x affects omega_star: higher b_x -> coordination easier -> lower omega_star -> curve shifts right
# omega_star is determined by Laplacian: pi at omega_star = b/(b+m)
# With b_high, b/(b+m) is larger, so more people participate at cutoff
# This means omega_star is lower (easier to coordinate), so sigma_hat is larger

# Baseline: b=1, m=0.5 -> b/(b+m)=0.667 -> omega_star=0.4, sigma_hat=2.37
# High b: b=2, m=0.5 -> b/(b+m)=0.8 -> need omega_star such that at omega_star, fraction participating = 0.8
# The cutoff shifts: with higher b, coordination is easier, hat_sigma increases

# For the figure, we show the effect on the pi*(sigma) curve
# Higher b_x -> omega_star lower (workers coordinate even in worse states) -> curve shifts up/right
# Use omega_star values that illustrate the shift

b_low <- 0.5; m_val <- 0.5
b_base <- 1.0
b_high <- 2.0

# omega_star adjusts so that pi at omega_star = b/(b+m) (Laplacian)
# But omega_star itself is the equilibrium cutoff in fundamental space
# The key effect on pi*(sigma) is through omega_star:
# pi*(sigma) = 1 - Phi((omega_star - omega_0)/sigma)
# Lower omega_star -> (omega_star - omega_0) more negative -> pi* higher for all sigma

# We'll use different omega_star values to represent different b_x
# b/(b+m): 0.5/1=0.5, 1/1.5=0.667, 2/2.5=0.8
# Corresponding omega_star: we need the equilibrium to be consistent
# For illustration, let omega_star vary: 0.6, 0.4, 0.2

omega_star_low <- 0.6   # low b (b=0.5, harder to coordinate)
omega_star_mid <- 0.4   # base b (b=1)
omega_star_high <- 0.2  # high b (b=2, easier to coordinate)

pi_low <- 1 - pnorm((omega_star_low - omega_0) / sigma)
pi_mid <- 1 - pnorm((omega_star_mid - omega_0) / sigma)
pi_high <- 1 - pnorm((omega_star_high - omega_0) / sigma)

sigma_hat_low <- (omega_star_low - omega_0) / qnorm(1 - pi_bar)
sigma_hat_mid <- (omega_star_mid - omega_0) / qnorm(1 - pi_bar)
sigma_hat_high <- (omega_star_high - omega_0) / qnorm(1 - pi_bar)

plot(NULL, xlim = c(0.1, 5), ylim = c(y_lo, y_hi),
     xlab = "", ylab = "", axes = FALSE, xaxs = "i", yaxs = "i",
     main = expression(bold("B. Comparative statics: " * b[x])))

segments(x0 = par("usr")[1], y0 = pi_bar, x1 = par("usr")[2], y1 = pi_bar,
         lty = 2, lwd = 1.0, col = "grey35")

# Draw curves
lines(sigma, pi_low, lwd = 1.8, col = "firebrick3", lty = 3)
lines(sigma, pi_mid, lwd = 2.2, col = "black")
lines(sigma, pi_high, lwd = 1.8, col = "steelblue3", lty = 5)

# Mark sigma_hat for each
segments(x0 = sigma_hat_low, y0 = y_lo, y1 = pi_bar, lty = 3, lwd = 0.8, col = "firebrick3")
segments(x0 = sigma_hat_mid, y0 = y_lo, y1 = pi_bar, lty = 3, lwd = 0.8, col = "grey35")
segments(x0 = sigma_hat_high, y0 = y_lo, y1 = pi_bar, lty = 3, lwd = 0.8, col = "steelblue3")

axis(1, at = 0:5, cex.axis = 0.95, tcl = -0.3, lwd = 0.7)
axis(2, at = seq(y_lo, y_hi, by = 0.1), las = 1, cex.axis = 0.95, tcl = -0.3, lwd = 0.7)
box(lwd = 0.7)
mtext(expression("Signal noise (" * sigma * ")"), side = 1, line = 2.8, cex = 0.9)
mtext(expression(bar(pi)), side = 4, at = pi_bar, las = 1, line = 0.5, cex = 0.95)

# Legend
legend("topright",
       legend = c(expression(b[x] ~ "= 2 (high)"),
                  expression(b[x] ~ "= 1 (base)"),
                  expression(b[x] ~ "= 0.5 (low)")),
       col = c("steelblue3", "black", "firebrick3"),
       lty = c(5, 1, 3), lwd = c(1.8, 2.2, 1.8),
       cex = 0.72, bty = "n")

# Annotate sigma_hats
mtext(expression(hat(sigma)[low]), side = 1, at = sigma_hat_low, line = -0.5,
      cex = 0.7, col = "firebrick3")
mtext(expression(hat(sigma)[base]), side = 1, at = sigma_hat_mid, line = -0.5,
      cex = 0.7, col = "grey35")
mtext(expression(hat(sigma)[high]), side = 1, at = sigma_hat_high, line = -0.5,
      cex = 0.7, col = "steelblue3")

# Arrow showing direction of shift
arrows(x0 = 1.8, y0 = 0.62, x1 = 3.2, y1 = 0.62,
       length = 0.08, lwd = 1.2, col = "grey40")
text(x = 2.5, y = 0.64, labels = expression(b[x] ~ "increases"),
     cex = 0.7, col = "grey40")

dev.off()
