# fig_parametric_space.R
# Parametric space figure for AI and Democracy formal model
# Generates Panel A (Autocracy stability) and Panel B (Democracy stability)

library(ggplot2)
library(patchwork)

# --- Parameters (numerical example) ---
L       <- 1
Delta   <- 0.4
kappa_bar   <- L - Delta        # 0.6
phi_bar     <- L - Delta        # 0.6
eta_R       <- 0.5
kappa_upper <- kappa_bar / eta_R # 1.2

# --- Output directory ---
out_dir <- tryCatch(dirname(sys.frame(1)$ofile), error = function(e) NULL)
if (is.null(out_dir) || out_dir == "") {
  out_dir <- "/Users/manoelgaldino/Documents/DCP/Papers/IA-dem/figures"
}

# --- Colorblind-friendly palette (Okabe-Ito inspired) ---
col_red    <- "#CC3311"
col_amber  <- "#EE7733"
col_green  <- "#009988"

# --- Shared theme ---
theme_strip <- theme_minimal(base_size = 11) +
  theme(
    panel.grid       = element_blank(),
    axis.text.y      = element_blank(),
    axis.ticks.y     = element_blank(),
    axis.title.y     = element_blank(),
    axis.ticks.x     = element_line(colour = "grey30", linewidth = 0.3),
    axis.line.x      = element_line(colour = "grey30", linewidth = 0.3),
    plot.title       = element_text(face = "bold", size = 12, hjust = 0),
    plot.subtitle    = element_text(size = 9, colour = "grey40", hjust = 0),
    plot.margin      = margin(t = 8, r = 12, b = 4, l = 12)
  )

strip_height <- 0.6   # half-height of the strip

# =========================================================
# Panel A - Autocracy stability regions along kappa_0
# =========================================================

df_a <- data.frame(
  xmin  = c(0,          kappa_bar,  kappa_upper),
  xmax  = c(kappa_bar,  kappa_upper, 2),
  label = c("Weak\nautocracy",
            "Moderate\nautocracy",
            "Strong\nautocracy"),
  fill  = c("weak", "moderate", "strong")
)

pa <- ggplot(df_a) +
  # Colored regions
  geom_rect(aes(xmin = xmin, xmax = xmax, ymin = -strip_height, ymax = strip_height,
                fill = fill), colour = NA) +
  # Region labels (centered inside each strip)
  geom_text(aes(x = (xmin + xmax) / 2, y = 0, label = label),
            size = 3.2, lineheight = 0.9, colour = "white", fontface = "bold") +
  # Threshold dashed lines (using annotate to avoid warnings)
  annotate("segment", x = kappa_bar, xend = kappa_bar,
           y = -strip_height - 0.15, yend = strip_height + 0.15,
           linetype = "dashed", linewidth = 0.5, colour = "grey20") +
  annotate("segment", x = kappa_upper, xend = kappa_upper,
           y = -strip_height - 0.15, yend = strip_height + 0.15,
           linetype = "dashed", linewidth = 0.5, colour = "grey20") +
  # Threshold labels
  annotate("text", x = kappa_bar, y = strip_height + 0.35,
           label = expression(bar(kappa) == 0.6),
           size = 3.5, colour = "grey20") +
  annotate("text", x = kappa_upper, y = strip_height + 0.35,
           label = expression(bar(kappa)/eta[R] == 1.2),
           size = 3.5, colour = "grey20") +
  # Subtitle annotations below the strip
  annotate("text", x = kappa_bar / 2, y = -strip_height - 0.35,
           label = "Unstable\n(both trajectories)",
           size = 2.4, colour = "grey45", lineheight = 0.85) +
  annotate("text", x = (kappa_bar + kappa_upper) / 2, y = -strip_height - 0.35,
           label = "Stable (threshold)\nUnstable (rapid)",
           size = 2.4, colour = "grey45", lineheight = 0.85) +
  annotate("text", x = (kappa_upper + 2) / 2, y = -strip_height - 0.35,
           label = "Stable\n(both trajectories)",
           size = 2.4, colour = "grey45", lineheight = 0.85) +
  # Scales
  scale_fill_manual(values = c(weak = col_red, moderate = col_amber, strong = col_green),
                    guide = "none") +
  scale_x_continuous(
    name = expression(kappa[0]~"(standing repressive capacity)"),
    limits = c(0, 2), expand = c(0, 0),
    breaks = seq(0, 2, 0.2)
  ) +
  scale_y_continuous(limits = c(-1.1, 1.0), expand = c(0, 0)) +
  labs(title = "A.  Autocracy stability regions") +
  theme_strip

# =========================================================
# Panel B - Democracy stability regions along phi_0
# =========================================================

df_b <- data.frame(
  xmin  = c(0,        phi_bar),
  xmax  = c(phi_bar,  1),
  label = c("Weak\ndemocracy",
            "Strong\ndemocracy"),
  fill  = c("weak", "strong")
)

pb <- ggplot(df_b) +
  # Colored regions
  geom_rect(aes(xmin = xmin, xmax = xmax, ymin = -strip_height, ymax = strip_height,
                fill = fill), colour = NA) +
  # Region labels
  geom_text(aes(x = (xmin + xmax) / 2, y = 0, label = label),
            size = 3.2, lineheight = 0.9, colour = "white", fontface = "bold") +
  # Threshold dashed line (using annotate)
  annotate("segment", x = phi_bar, xend = phi_bar,
           y = -strip_height - 0.15, yend = strip_height + 0.15,
           linetype = "dashed", linewidth = 0.5, colour = "grey20") +
  # Threshold label
  annotate("text", x = phi_bar, y = strip_height + 0.35,
           label = expression(bar(phi) == 0.6),
           size = 3.5, colour = "grey20") +
  # Subtitle annotations
  annotate("text", x = phi_bar / 2, y = -strip_height - 0.35,
           label = "Stable (rapid)\nUnstable (threshold)",
           size = 2.4, colour = "grey45", lineheight = 0.85) +
  annotate("text", x = (phi_bar + 1) / 2, y = -strip_height - 0.35,
           label = "Stable\n(both trajectories)",
           size = 2.4, colour = "grey45", lineheight = 0.85) +
  # Scales
  scale_fill_manual(values = c(weak = col_red, strong = col_green),
                    guide = "none") +
  scale_x_continuous(
    name = expression(phi[0]~"(institutional democratic resilience)"),
    limits = c(0, 1), expand = c(0, 0),
    breaks = seq(0, 1, 0.1)
  ) +
  scale_y_continuous(limits = c(-1.1, 1.0), expand = c(0, 0)) +
  labs(title = expression(bold("B.  Democracy stability regions"))) +
  theme_strip

# =========================================================
# Combine and save
# =========================================================

fig <- pa / pb + plot_layout(heights = c(1, 1))

# Save as PDF (standard device for maximum compatibility)
ggsave(file.path(out_dir, "fig_parametric_space.pdf"),
       plot = fig, width = 7, height = 4, device = "pdf")
ggsave(file.path(out_dir, "fig_parametric_space.png"),
       plot = fig, width = 7, height = 4, dpi = 300)

cat("Figures saved to:", out_dir, "\n")
