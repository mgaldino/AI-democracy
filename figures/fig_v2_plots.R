#!/usr/bin/env Rscript
# Figures for paper v2: comparative statics and sigma_A amplification
# Parameters from v5 analytical formalization

library(ggplot2)
library(patchwork)

# --- Parameters ---
omega_R   <- 0.30
omega_T1  <- 0.05
omega_T2  <- 0.60
omega_N   <- 0.02
C_D       <- 1.50
B         <- 0.60
pi_fall_D <- 0.20
pi_fall_A <- 0.05

# Elite threshold: linear model omega_bar_A = alpha_0 + alpha_1 * sigma_A
alpha_0 <- 0.20
alpha_1 <- 1.33

# --- Figure 1: sigma_A amplification ---
# p_R and p_T as functions of sigma_A

sigma_A_grid <- seq(0.05, 0.40, by = 0.005)

compute_probs <- function(sigma_A) {
  omega_bar_A <- alpha_0 + alpha_1 * sigma_A
  p_R <- pnorm((omega_R - omega_bar_A) / sigma_A)
  p_T <- pnorm((omega_T2 - omega_bar_A) / sigma_A)
  data.frame(sigma_A = sigma_A, p_R = p_R, p_T = p_T, omega_bar_A = omega_bar_A)
}

df_sigma <- do.call(rbind, lapply(sigma_A_grid, compute_probs))

# Filter to valid range (omega_bar_A < omega_T2)
df_sigma <- df_sigma[df_sigma$omega_bar_A < omega_T2, ]

p1a <- ggplot(df_sigma) +
  geom_line(aes(x = sigma_A, y = p_T, color = "Threshold (massive)"), linewidth = 1.2) +
  geom_line(aes(x = sigma_A, y = p_R, color = "Rapid (moderate)"), linewidth = 1.2) +
  geom_hline(yintercept = 0.5, linetype = "dashed", alpha = 0.5) +
  scale_color_manual(
    values = c("Threshold (massive)" = "#2166ac", "Rapid (moderate)" = "#b2182b"),
    name = "Trajectory"
  ) +
  labs(
    x = expression(sigma[A] ~ "(elite information noise)"),
    y = "P(elite approves compensation)",
    title = "A. Elite approval probability"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")

# Panel B: crossed fragility interval
p1b <- ggplot(df_sigma) +
  geom_ribbon(aes(x = sigma_A, ymin = 0, ymax = omega_bar_A),
              fill = "#fee0d2", alpha = 0.7) +
  geom_line(aes(x = sigma_A, y = omega_bar_A), linewidth = 1.2, color = "#b2182b") +
  geom_hline(yintercept = omega_R, linetype = "dashed", color = "gray40") +
  geom_hline(yintercept = omega_T2, linetype = "dashed", color = "gray40") +
  annotate("text", x = max(df_sigma$sigma_A) - 0.02, y = omega_R + 0.02,
           label = expression(omega[R]), size = 4) +
  annotate("text", x = max(df_sigma$sigma_A) - 0.02, y = omega_T2 + 0.02,
           label = expression(omega[T2]), size = 4) +
  annotate("text", x = 0.15, y = 0.15,
           label = "Crossed fragility\ninterval", size = 3.5, fontface = "italic") +
  labs(
    x = expression(sigma[A] ~ "(elite information noise)"),
    y = expression(bar(omega)[A] ~ "(elite evidence threshold)"),
    title = expression("B. Crossed fragility interval expands with " * sigma[A])
  ) +
  theme_minimal(base_size = 12)

fig_sigma <- p1a / p1b
ggsave("figures/fig_sigma_amplification.pdf", fig_sigma, width = 7, height = 8)

# --- Figure 2: C_A sweet spot ---
# Protest level as function of C_A (single-state approximation)

C_A_grid <- seq(1.0, 2.5, by = 0.01)
Omega_2R <- omega_R * (2 - omega_R)  # 0.51

# Single-state interior equilibrium: pi* = 1 - v/C_A when 0 < 1-v/C_A < Omega
# v = 1 for displaced uncompensated in t=2
compute_protest <- function(C_A) {
  hbar <- 1 - 1 / C_A
  if (hbar <= 0) return(0)
  if (hbar >= Omega_2R) return(Omega_2R)
  return(hbar)
}

df_CA <- data.frame(
  C_A = C_A_grid,
  pi_star = sapply(C_A_grid, compute_protest)
)

# Dominant strategy bound
C_A_dom <- 1 / (1 - Omega_2R)

fig_CA <- ggplot(df_CA) +
  geom_line(aes(x = C_A, y = pi_star), linewidth = 1.2, color = "#2166ac") +
  geom_hline(yintercept = pi_fall_A, linetype = "dashed", color = "#b2182b") +
  geom_vline(xintercept = C_D, linetype = "dotted", color = "gray50") +
  geom_vline(xintercept = C_A_dom, linetype = "dotted", color = "gray50") +
  annotate("text", x = C_D + 0.03, y = Omega_2R + 0.02,
           label = expression(C[D]), size = 4, hjust = 0) +
  annotate("text", x = C_A_dom + 0.03, y = Omega_2R + 0.02,
           label = expression(C[A]^{dom}), size = 4, hjust = 0) +
  annotate("text", x = 1.2, y = pi_fall_A + 0.02,
           label = expression(bar(pi)[A]^{fall}), size = 4, color = "#b2182b") +
  annotate("rect", xmin = C_D, xmax = C_A_dom, ymin = -Inf, ymax = Inf,
           fill = "#fee0d2", alpha = 0.3) +
  annotate("text", x = (C_D + C_A_dom) / 2, y = 0.35,
           label = "Sweet spot", size = 4, fontface = "italic") +
  labs(
    x = expression(C[A] ~ "(cost of protest in autocracy)"),
    y = expression(pi * "*" ~ "(equilibrium protest under rapid t=2)"),
    title = expression("Equilibrium protest and the " * C[A] * " sweet spot")
  ) +
  scale_y_continuous(limits = c(0, Omega_2R + 0.05)) +
  theme_minimal(base_size = 12)

ggsave("figures/fig_CA_sweet_spot.pdf", fig_CA, width = 7, height = 5)

cat("Figures saved:\n")
cat("  figures/fig_sigma_amplification.pdf\n")
cat("  figures/fig_CA_sweet_spot.pdf\n")
