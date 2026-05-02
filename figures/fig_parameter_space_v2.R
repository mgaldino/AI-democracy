#!/usr/bin/env Rscript
# Parameter space exploration: phase diagram (delta, C_A)
# Shows when protest becomes dominant strategy vs interior equilibrium

library(ggplot2)
library(patchwork)

# --- Parameters ---
B <- 0.6
C_D <- 1.5
omega_R <- 0.30
omega_T1 <- 0.05
omega_T2 <- 0.60
pi_fall_D <- 0.20
pi_fall_A <- 0.05
pi_comp_D <- 0.07

# --- Analytical boundaries ---
# Dominant strategy boundary (no comp expected): delta > C_x - 1
# Dominant strategy boundary (comp expected): delta > (C_x - 1) / (1-B)
# Interior equilibrium protest: pi* = 1 - v/C_x (single-state approx)

# --- Figure 1: Phase diagram in (delta, C_A) space ---
delta_grid <- seq(0.3, 1.0, length.out = 200)
CA_grid <- seq(1.0, 3.0, length.out = 200)

df <- expand.grid(delta = delta_grid, C_A = CA_grid)

# For R x A (no comp expected): v = 1 + delta
df$v_RxA <- 1 + df$delta
df$dominant_RxA <- df$v_RxA > df$C_A
# Boundary: delta = C_A - 1
df$boundary_RxA <- df$C_A - 1

# For R x D (comp expected): v = 1 + delta*(1-B)
df$v_RxD <- 1 + df$delta * (1 - B)
df$dominant_RxD <- df$v_RxD > C_D  # uses C_D, not C_A

# Interior protest for R x A: pi* = 1 - v/C_A (if v < C_A)
df$pi_RxA <- ifelse(df$v_RxA < df$C_A,
                     pmax(0, 1 - df$v_RxA / df$C_A),
                     df$omega_R_dom <- omega_R)  # dominant: pi = Omega
df$pi_RxA[df$dominant_RxA] <- omega_R * (2 - omega_R)  # Omega_2^R

# Classify regions for R x A
df$region_RxA <- ifelse(df$v_RxA >= df$C_A, "Dominant strategy\n(all displaced protest)",
                  ifelse(1 - df$v_RxA / df$C_A > 0, "Interior equilibrium\n(coordination matters)",
                         "No protest"))

fig1 <- ggplot(df, aes(x = delta, y = C_A, fill = region_RxA)) +
  geom_raster(alpha = 0.7) +
  geom_abline(intercept = 1, slope = 1, linewidth = 1.2, color = "black", linetype = "solid") +
  annotate("text", x = 0.85, y = 1.5, label = expression(delta == C[A] - 1),
           angle = 35, size = 4, fontface = "bold") +
  geom_hline(yintercept = C_D, linetype = "dashed", color = "gray40") +
  annotate("text", x = 0.35, y = C_D + 0.05, label = expression(C[D] == 1.5),
           size = 3.5, color = "gray40") +
  geom_point(aes(x = 0.9, y = 1.65), color = "red", size = 3, shape = 4, stroke = 2) +
  annotate("text", x = 0.9, y = 1.55, label = "Baseline\n(dominant)", size = 3, color = "red") +
  geom_point(aes(x = 0.6, y = 1.65), color = "blue", size = 3, shape = 4, stroke = 2) +
  annotate("text", x = 0.6, y = 1.55, label = expression(delta == 0.6), size = 3, color = "blue") +
  scale_fill_manual(values = c(
    "Dominant strategy\n(all displaced protest)" = "#fee0d2",
    "Interior equilibrium\n(coordination matters)" = "#deebf7",
    "No protest" = "#e5f5e0"
  ), name = "Equilibrium type") +
  labs(
    x = expression(delta ~ "(discount factor)"),
    y = expression(C[A] ~ "(autocratic protest cost)"),
    title = expression("A. Phase diagram: R" %*% "A scenario (no compensation)")
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")

# --- Figure 2: v and C_x as functions of delta ---
df2 <- data.frame(delta = seq(0.3, 1.0, length.out = 100))
df2$v_no_comp <- 1 + df2$delta        # v without comp expected
df2$v_comp <- 1 + df2$delta * (1 - B) # v with comp expected (R x D)
df2$v_t2 <- 1                          # v in t=2 without comp (terminal)

fig2 <- ggplot(df2, aes(x = delta)) +
  geom_line(aes(y = v_no_comp, color = "v (no comp expected)"), linewidth = 1.2) +
  geom_line(aes(y = v_comp, color = "v (comp expected)"), linewidth = 1.2) +
  geom_line(aes(y = v_t2, color = "v (terminal, t=2)"), linewidth = 1.2, linetype = "dotted") +
  geom_hline(yintercept = 1.65, linetype = "dashed", color = "#b2182b") +
  geom_hline(yintercept = C_D, linetype = "dashed", color = "#2166ac") +
  annotate("text", x = 0.32, y = 1.70, label = expression(C[A] == 1.65),
           size = 3.5, color = "#b2182b") +
  annotate("text", x = 0.32, y = C_D + 0.05, label = expression(C[D] == 1.5),
           size = 3.5, color = "#2166ac") +
  geom_vline(xintercept = 0.65, linetype = "dotted", color = "gray50") +
  annotate("text", x = 0.67, y = 0.5, label = expression(delta[crit]^A == 0.65),
           size = 3, color = "gray50", hjust = 0) +
  scale_color_manual(values = c(
    "v (no comp expected)" = "#b2182b",
    "v (comp expected)" = "#2166ac",
    "v (terminal, t=2)" = "gray60"
  ), name = "") +
  labs(
    x = expression(delta ~ "(discount factor)"),
    y = "Value",
    title = "B. Expressive value v vs protest cost thresholds"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom") +
  ylim(0.3, 2.2)

# --- Figure 3: Crossed fragility parameter window ---
# For each delta, compute whether all 4 scenarios produce crossed fragility
df3 <- data.frame(delta = seq(0.3, 1.0, length.out = 200))

check_crossed <- function(d, ca) {
  # R x D: comp expected, v = 1 + d*(1-B)
  v_RxD <- 1 + d * (1 - B)
  pi_RxD <- max(0, 1 - v_RxD / C_D)
  RxD_comp <- pi_RxD > pi_comp_D  # voice trigger
  RxD_stable <- pi_RxD < pi_fall_D

  # T x D t=2: no comp, v = 1
  pi_TxD <- max(0, 1 - 1 / C_D)
  TxD_falls <- pi_TxD > pi_fall_D

  # R x A t=2: no comp, v = 1
  v_RxA_t2 <- 1
  if (v_RxA_t2 >= ca) {
    pi_RxA <- omega_R * (2 - omega_R)
  } else {
    pi_RxA <- max(0, 1 - v_RxA_t2 / ca)
  }
  RxA_falls <- pi_RxA > pi_fall_A

  # T x A: elite sees, comp by decree, v = 1-B
  v_TxA <- 1 - B
  if (v_TxA >= ca) {
    pi_TxA <- omega_T1 + (1 - omega_T1) * omega_T2
  } else {
    pi_TxA <- max(0, 1 - v_TxA / ca)
  }
  TxA_stable <- pi_TxA <= pi_fall_A

  return(RxD_comp & RxD_stable & TxD_falls & RxA_falls & TxA_stable)
}

CA_sweep <- seq(1.0, 2.5, length.out = 200)
df4 <- expand.grid(delta = seq(0.3, 1.0, length.out = 200), C_A = CA_sweep)
df4$crossed <- mapply(check_crossed, df4$delta, df4$C_A)

fig3 <- ggplot(df4, aes(x = delta, y = C_A, fill = crossed)) +
  geom_raster(alpha = 0.7) +
  scale_fill_manual(values = c("TRUE" = "#deebf7", "FALSE" = "#f0f0f0"),
                    labels = c("No crossed fragility", "Crossed fragility holds"),
                    name = "") +
  geom_point(aes(x = 0.9, y = 1.65), color = "red", size = 3, shape = 4, stroke = 2) +
  annotate("text", x = 0.9, y = 1.75, label = "Baseline", size = 3, color = "red") +
  labs(
    x = expression(delta ~ "(discount factor)"),
    y = expression(C[A] ~ "(autocratic protest cost)"),
    title = expression("C. Crossed fragility region in (" * delta * ", " * C[A] * ") space")
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")

# Combine
fig_combined <- fig1 / fig2 / fig3
ggsave("figures/fig_parameter_space_v2.pdf", fig_combined, width = 8, height = 14)

cat("Figure saved: figures/fig_parameter_space_v2.pdf\n")

# Print key boundaries
cat("\n--- Key boundaries ---\n")
cat(sprintf("Dominant strategy (no comp): delta > C_A - 1\n"))
cat(sprintf("  At C_A = 1.65: delta_crit = %.2f\n", 1.65 - 1))
cat(sprintf("  At C_A = 2.00: delta_crit = %.2f\n", 2.00 - 1))
cat(sprintf("Dominant strategy (comp expected): delta > (C_A - 1)/(1-B)\n"))
cat(sprintf("  At C_A = 1.65: delta_crit = %.2f (never with delta <= 1)\n", (1.65-1)/(1-B)))
