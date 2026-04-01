# =============================================================================
# Numerical Sketch: Endogenous Platform Choice under Threshold Automation
# =============================================================================
#
# Purpose:
# Replace ex-ante M-party vs P-party roles with a single agenda-setter inside E
# who chooses between:
#   C = compensatory platform (uniform compensation phi_bar)
#   R = populist platform (type-independent regime change payoff)
#
# Core logic:
# 1. Under rapid automation, sigma_E = 0. E is homogeneous, so C dominates.
# 2. Under threshold automation, sigma_E > 0. C is type-dependent, R is pooling.
# 3. If the agenda-setter chooses R, the campaign further fragments E.
# 4. This generates two self-consistent equilibria when heterogeneity is large
#    enough: compromise (choose C) and populist (choose R).
#
# Final-version note:
# The formal model can replace the deterministic "R equilibrium exists" rule
# with a stochastic win probability, e.g.
#   pr_win_R = plogis(zeta * (share_R_campaign - share_C))
# and the agenda-setter enters with R if office_rent * pr_win_R >= entry_cost_R.
# =============================================================================

derive_base_params <- function(base_params) {
  delta <- base_params$theta * base_params$W - base_params$k - base_params$w_E
  phi_bar <- 1 - abs(delta) / base_params$L
  kappa_bar <- base_params$L - abs(delta)

  c(
    Delta = delta,
    phi_bar = phi_bar,
    kappa_bar = kappa_bar
  )
}

u_compensation <- function(x_i, phi_level, base_params) {
  x_i - base_params$L * (1 - phi_level)
}

u_populism <- function(base_params) {
  base_params$theta * base_params$W - base_params$k
}

support_shares <- function(
    sigma_E,
    phi_0,
    phi_bar,
    base_params,
    platform_params) {

  if (sigma_E <= 0) {
    return(list(
      share_C = 1,
      share_R_no_momentum = 0,
      share_R_campaign = 0,
      cutoff_material = base_params$w_E,
      cutoff_campaign = base_params$w_E,
      x_min = base_params$w_E,
      x_max = base_params$w_E,
      automatic_compensation = FALSE
    ))
  }

  x_min <- base_params$w_E - sigma_E
  x_max <- base_params$w_E + sigma_E

  if (phi_0 >= phi_bar) {
    return(list(
      share_C = 1,
      share_R_no_momentum = 0,
      share_R_campaign = 0,
      cutoff_material = -Inf,
      cutoff_campaign = -Inf,
      x_min = x_min,
      x_max = x_max,
      automatic_compensation = TRUE
    ))
  }

  cutoff_material <- base_params$w_E

  # Reduced-form self-reinforcement:
  # campaign bonus = rho * sigma_E^2
  # With x_i ~ U[w_E - sigma_E, w_E + sigma_E], this implies:
  # share_R_campaign = 0.5 + 0.5 * rho * sigma_E
  cutoff_campaign <- base_params$w_E +
    platform_params$cleavage_amplification * sigma_E^2

  share_r_no_momentum <- (cutoff_material - x_min) / (x_max - x_min)
  share_r_campaign <- (cutoff_campaign - x_min) / (x_max - x_min)

  share_r_no_momentum <- max(0, min(1, share_r_no_momentum))
  share_r_campaign <- max(0, min(1, share_r_campaign))

  list(
    share_C = 1 - share_r_no_momentum,
    share_R_no_momentum = share_r_no_momentum,
    share_R_campaign = share_r_campaign,
    cutoff_material = cutoff_material,
    cutoff_campaign = cutoff_campaign,
    x_min = x_min,
    x_max = x_max,
    automatic_compensation = FALSE
  )
}

platform_payoffs <- function(shares, platform_params) {
  payoff_C <- platform_params$office_rent * shares$share_C
  payoff_R_no_momentum <- platform_params$office_rent *
    shares$share_R_no_momentum - platform_params$entry_cost_R
  payoff_R_campaign <- platform_params$office_rent *
    shares$share_R_campaign - platform_params$entry_cost_R

  list(
    payoff_C = payoff_C,
    payoff_R_no_momentum = payoff_R_no_momentum,
    payoff_R_campaign = payoff_R_campaign
  )
}

evaluate_game <- function(
    sigma_E,
    phi_0,
    base_params,
    derived_params,
    platform_params) {

  shares <- support_shares(
    sigma_E = sigma_E,
    phi_0 = phi_0,
    phi_bar = derived_params["phi_bar"],
    base_params = base_params,
    platform_params = platform_params
  )

  payoffs <- platform_payoffs(
    shares = shares,
    platform_params = platform_params
  )

  tol <- platform_params$comparison_tolerance
  compromise_eq <- payoffs$payoff_C + tol >= payoffs$payoff_R_no_momentum
  populist_eq <- payoffs$payoff_R_campaign + tol >= payoffs$payoff_C

  list(
    sigma_E = sigma_E,
    phi_0 = phi_0,
    shares = shares,
    payoffs = payoffs,
    compromise_eq = compromise_eq,
    populist_eq = populist_eq,
    two_equilibria = compromise_eq && populist_eq
  )
}

print_rule <- function(title) {
  cat("\n", strrep("=", 78), "\n", sep = "")
  cat(title, "\n")
  cat(strrep("=", 78), "\n", sep = "")
}

print_threshold_row <- function(result, base_params, derived_params) {
  sigma_E <- result$sigma_E
  shares <- result$shares
  payoffs <- result$payoffs

  cat(sprintf("\nsigma_E = %.2f\n", sigma_E))
  cat(sprintf("  x_i in [%.2f, %.2f]\n", shares$x_min, shares$x_max))
  cat(sprintf("  Material cutoff (R beats C): x_i < %.2f\n",
              shares$cutoff_material))
  cat(sprintf("  Campaign cutoff (after R entry): x_i < %.2f\n",
              shares$cutoff_campaign))
  cat(sprintf("  Support for C: %.0f%%\n", 100 * shares$share_C))
  cat(sprintf("  Support for R without momentum: %.0f%%\n",
              100 * shares$share_R_no_momentum))
  cat(sprintf("  Support for R with momentum: %.0f%%\n",
              100 * shares$share_R_campaign))
  cat(sprintf("  Entrepreneur payoff from C: %.2f\n", payoffs$payoff_C))
  cat(sprintf("  Entrepreneur payoff from R without momentum: %.2f\n",
              payoffs$payoff_R_no_momentum))
  cat(sprintf("  Entrepreneur payoff from R with momentum: %.2f\n",
              payoffs$payoff_R_campaign))

  cat("  Low type payoff comparison:\n")
  cat(sprintf("    u_i(C) at x_min = %.2f\n",
              u_compensation(shares$x_min, derived_params["phi_bar"],
                             base_params)))
  cat(sprintf("    u_i(R)          = %.2f\n", u_populism(base_params)))

  cat("  High type payoff comparison:\n")
  cat(sprintf("    u_i(C) at x_max = %.2f\n",
              u_compensation(shares$x_max, derived_params["phi_bar"],
                             base_params)))
  cat(sprintf("    u_i(R)          = %.2f\n", u_populism(base_params)))

  cat(sprintf("  Compromise equilibrium exists? %s\n",
              ifelse(result$compromise_eq, "YES", "NO")))
  cat(sprintf("  Populist equilibrium exists? %s\n",
              ifelse(result$populist_eq, "YES", "NO")))
  cat(sprintf("  Two equilibria? %s\n",
              ifelse(result$two_equilibria, "YES", "NO")))
}

run_assertions <- function(
    base_params,
    derived_params,
    platform_params,
    threshold_results,
    welfare_results) {

  stopifnot(derived_params["Delta"] < 0)
  stopifnot(derived_params["Delta"] + base_params$L > 0)
  stopifnot(base_params$gamma >= derived_params["phi_bar"] * base_params$c_tax)
  stopifnot(base_params$kappa_0 >= derived_params["kappa_bar"])
  stopifnot(base_params$kappa_0 <
              derived_params["kappa_bar"] / base_params$eta_R)

  rapid_result <- evaluate_game(
    sigma_E = 0,
    phi_0 = 0,
    base_params = base_params,
    derived_params = derived_params,
    platform_params = platform_params
  )

  stopifnot(rapid_result$compromise_eq)
  stopifnot(!rapid_result$populist_eq)

  low_sigma_result <- threshold_results[[1]]
  high_sigma_result <- threshold_results[[length(threshold_results)]]

  stopifnot(low_sigma_result$compromise_eq)
  stopifnot(!low_sigma_result$populist_eq)
  stopifnot(high_sigma_result$compromise_eq)
  stopifnot(high_sigma_result$populist_eq)

  strong_welfare <- welfare_results[[length(welfare_results)]]
  stopifnot(strong_welfare$compromise_eq)
  stopifnot(!strong_welfare$populist_eq)
}

base_params <- list(
  w_E = 1,
  W = 2,
  L = 1,
  theta = 0.5,
  k = 0.4,
  kappa_0 = 0.8,
  eta_R = 0.5,
  gamma = 0.8,
  c_tax = 1
)

platform_params <- list(
  office_rent = 1,
  entry_cost_R = 0.12,
  cleavage_amplification = 1,
  comparison_tolerance = 1e-9
)

derived_params <- derive_base_params(base_params)
sigma_bar <- (2 * platform_params$entry_cost_R) /
  (platform_params$office_rent * platform_params$cleavage_amplification)

print_rule("BASE MODEL")
cat(sprintf("Delta     = %.2f\n", derived_params["Delta"]))
cat(sprintf("phi_bar   = %.2f\n", derived_params["phi_bar"]))
cat(sprintf("kappa_bar = %.2f\n", derived_params["kappa_bar"]))
cat(sprintf("kappa_bar / eta_R = %.2f\n",
            derived_params["kappa_bar"] / base_params$eta_R))
cat(sprintf("Autocratic crossed-fragility window holds? %s\n",
            ifelse(
              base_params$kappa_0 >= derived_params["kappa_bar"] &&
                base_params$kappa_0 <
                derived_params["kappa_bar"] / base_params$eta_R,
              "YES",
              "NO"
            )))

print_rule("APPENDIX A CONDITION")
cat(sprintf("gamma = %.2f\n", base_params$gamma))
cat(sprintf("phi_bar * c = %.2f\n",
            derived_params["phi_bar"] * base_params$c_tax))
cat(sprintf("N compensates? %s\n",
            ifelse(base_params$gamma >=
                     derived_params["phi_bar"] * base_params$c_tax,
                   "YES", "NO")))

print_rule("ENDOGENOUS PLATFORM-CHOICE GAME")
cat("Agenda-setter inside E chooses between C and R.\n")
cat("C keeps the compensation platform and wins support from high-x_i workers.\n")
cat("R offers pooling populism and pays a fixed entry cost.\n")
cat("If R is expected to be weak, support stays at the material baseline.\n")
cat("If R is expected to be viable, the campaign activates extra cleavage.\n")
cat("If C is selected, the game then moves to Appendix A and N decides whether\n")
cat("to finance compensation.\n")
cat(sprintf("Heterogeneity threshold for a populist equilibrium: sigma_bar = %.2f\n",
            sigma_bar))

print_rule("RAPID AUTOMATION")
rapid_result <- evaluate_game(
  sigma_E = 0,
  phi_0 = 0,
  base_params = base_params,
  derived_params = derived_params,
  platform_params = platform_params
)

cat("sigma_E = 0\n")
cat("E is homogeneous, so the agenda-setter cannot profitably pool grievances.\n")
cat(sprintf("Payoff from C = %.2f\n", rapid_result$payoffs$payoff_C))
cat(sprintf("Payoff from R = %.2f\n", rapid_result$payoffs$payoff_R_campaign))
cat("Result: unique compromise equilibrium.\n")

print_rule("THRESHOLD AUTOMATION, WEAK DEMOCRACY (phi_0 = 0)")
sigma_grid <- c(0.10, 0.20, 0.30, 0.40, 0.50)
threshold_results <- lapply(
  sigma_grid,
  function(current_sigma) {
    evaluate_game(
      sigma_E = current_sigma,
      phi_0 = 0,
      base_params = base_params,
      derived_params = derived_params,
      platform_params = platform_params
    )
  }
)

invisible(lapply(
  threshold_results,
  function(result) {
    print_threshold_row(
      result = result,
      base_params = base_params,
      derived_params = derived_params
    )
  }
))

print_rule("WELFARE STATE AS EQUILIBRIUM SELECTOR")
phi_0_values <- c(0, 0.30, 0.60, 0.80)
sigma_reference <- 0.30

welfare_results <- lapply(
  phi_0_values,
  function(current_phi_0) {
    evaluate_game(
      sigma_E = sigma_reference,
      phi_0 = current_phi_0,
      base_params = base_params,
      derived_params = derived_params,
      platform_params = platform_params
    )
  }
)

for (result in welfare_results) {
  cat(sprintf("\nphi_0 = %.2f\n", result$phi_0))

  if (result$shares$automatic_compensation) {
    cat("  phi_0 >= phi_bar: compensation is automatic.\n")
    cat("  The agenda-setter cannot block C by switching platforms.\n")
    cat("  Result: unique compromise equilibrium.\n")
  } else {
    cat("  phi_0 < phi_bar: compensation still requires coalition-building.\n")
    cat(sprintf("  Support for C = %.0f%%\n", 100 * result$shares$share_C))
    cat(sprintf("  Support for R with momentum = %.0f%%\n",
                100 * result$shares$share_R_campaign))
    cat(sprintf("  Two equilibria? %s\n",
                ifelse(result$two_equilibria, "YES", "NO")))
  }
}

run_assertions(
  base_params = base_params,
  derived_params = derived_params,
  platform_params = platform_params,
  threshold_results = threshold_results,
  welfare_results = welfare_results
)

print_rule("SUMMARY")
cat("Weak democracy (phi_0 = 0):\n")
cat("  Rapid: unique compromise equilibrium.\n")
cat("  Threshold: compromise always exists; populist equilibrium exists when\n")
cat("             sigma_E >= sigma_bar.\n")

cat("\nStrong democracy (phi_0 >= phi_bar):\n")
cat("  Rapid: unique compromise equilibrium.\n")
cat("  Threshold: unique compromise equilibrium.\n")

cat("\nAutocracy remains unchanged relative to the baseline model:\n")
cat("  Rapid: unstable when kappa_0 * eta_R < kappa_bar.\n")
cat("  Threshold: stable when kappa_0 >= kappa_bar.\n")

cat("\nCrossed fragility survives, but the democratic threshold case is now\n")
cat("endogenous: populism appears only when heterogeneity is large enough to\n")
cat("make R profitable for the agenda-setter inside E.\n")
