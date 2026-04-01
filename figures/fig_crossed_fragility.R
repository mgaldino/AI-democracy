# fig_crossed_fragility.R
# 2x2 crossed fragility pattern: regime type x automation trajectory
# Shows stability/instability with color shading and the crossed inversion

library(ggplot2)

# --- Output directory ---
out_dir <- tryCatch(dirname(sys.frame(1)$ofile), error = function(e) NULL)
if (is.null(out_dir) || out_dir == "") {
  out_dir <- "/Users/manoelgaldino/Documents/DCP/Papers/IA-dem/figures"
}

# --- Colorblind-friendly palette (Okabe-Ito inspired) ---
col_stable   <- "#009988"   # teal-green
col_unstable <- "#CC3311"   # red

# --- Data: 5 regime types x 2 trajectories ---
df <- data.frame(
  regime = factor(
    rep(c("Strong\ndemocracy",
          "Weak\ndemocracy",
          "Moderate\nautocracy",
          "Strong\nautocracy",
          "Weak\nautocracy"), each = 2),
    levels = c("Strong\nautocracy",
               "Moderate\nautocracy",
               "Weak\nautocracy",
               "Weak\ndemocracy",
               "Strong\ndemocracy")
  ),
  trajectory = factor(
    rep(c("Rapid", "Threshold"), 5),
    levels = c("Rapid", "Threshold")
  ),
  stable = c(
    TRUE,  TRUE,   # Strong democracy: stable under both
    TRUE,  FALSE,  # Weak democracy: stable rapid, unstable threshold
    FALSE, TRUE,   # Moderate autocracy: unstable rapid, stable threshold
    TRUE,  TRUE,   # Strong autocracy: stable under both
    FALSE, FALSE   # Weak autocracy: unstable under both
  )
)

df$label <- ifelse(df$stable, "Stable", "Unstable")

# --- The figure ---
fig <- ggplot(df, aes(x = trajectory, y = regime, fill = stable)) +
  geom_tile(colour = "white", linewidth = 1.5) +
  geom_text(aes(label = label),
            size = 4, fontface = "bold",
            colour = "white") +
  scale_fill_manual(
    values = c("TRUE" = col_stable, "FALSE" = col_unstable),
    guide = "none"
  ) +
  # Bracket annotation for "Crossed fragility" (P3)
  annotate("segment",
           x = 2.65, xend = 2.65,
           y = 3.5, yend = 4.5,
           linewidth = 0.8, colour = "grey30") +
  annotate("segment",
           x = 2.60, xend = 2.65,
           y = 3.5, yend = 3.5,
           linewidth = 0.8, colour = "grey30") +
  annotate("segment",
           x = 2.60, xend = 2.65,
           y = 4.5, yend = 4.5,
           linewidth = 0.8, colour = "grey30") +
  annotate("text",
           x = 2.85, y = 4,
           label = "Crossed\nfragility\n(Prop. 3)",
           size = 3, colour = "grey30",
           lineheight = 0.85, hjust = 0) +
  # Axis labels and conditions
  scale_x_discrete(
    position = "top",
    labels = c(
      "Rapid" = expression(atop("Rapid", scriptstyle(l[1]==L~~l[2]==0))),
      "Threshold" = expression(atop("Threshold", scriptstyle(l[1]==0~~l[2]==L)))
    )
  ) +
  scale_y_discrete(
    labels = c(
      "Strong\nautocracy" = expression("Strong autocracy  " * scriptstyle(group("", kappa[0] >= bar(kappa)/eta[R], ""))),
      "Moderate\nautocracy" = expression("Moderate autocracy  " * scriptstyle(group("[", list(bar(kappa), bar(kappa)/eta[R]), ")"))),
      "Weak\nautocracy" = expression("Weak autocracy  " * scriptstyle(group("", kappa[0] < bar(kappa), ""))),
      "Weak\ndemocracy" = expression("Weak democracy  " * scriptstyle(group("", phi[0] < bar(phi), ""))),
      "Strong\ndemocracy" = expression("Strong democracy  " * scriptstyle(group("", phi[0] >= bar(phi), "")))
    )
  ) +
  labs(
    title = "Regime stability under two automation trajectories",
    subtitle = "Complete typology (Corollary 2). The crossed fragility pattern (Proposition 3)\napplies to weak democracies vs. moderate autocracies.",
    x = NULL, y = NULL
  ) +
  coord_cartesian(clip = "off", xlim = c(0.5, 3.3)) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid       = element_blank(),
    axis.ticks       = element_blank(),
    plot.title       = element_text(face = "bold", size = 13, hjust = 0),
    plot.subtitle    = element_text(size = 9, colour = "grey40", hjust = 0),
    plot.margin      = margin(t = 8, r = 60, b = 8, l = 8),
    axis.text.y      = element_text(size = 10, hjust = 1),
    axis.text.x.top  = element_text(size = 10)
  )

# --- Save ---
ggsave(file.path(out_dir, "fig_crossed_fragility.pdf"),
       plot = fig, width = 7, height = 5, device = "pdf")
ggsave(file.path(out_dir, "fig_crossed_fragility.png"),
       plot = fig, width = 7, height = 5, dpi = 300)

cat("Crossed fragility figure saved to:", out_dir, "\n")
