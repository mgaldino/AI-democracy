/-
  CoordinationLemmas.lean

  Bridge module: connects the SupermodularGames library (Lemmas 1-2)
  to the IA-dem paper's propositions (P1-3).

  The library proves:
  - coordination_unique_cutoff: unique equilibrium cutoff (Lemma 1)
  - participationRate_strictAntiOn: pi*(sigma) strictly decreasing (Lemma 2)
  - noise_threshold_exists_unique: unique sigma_hat with pi*(sigma_hat) = pi_bar

  This module derives the bridge theorems:
  - rapid_coordination_succeeds: sigma_r <= sigma_hat -> pi*(sigma_r) >= pi_bar
  - threshold_coordination_fails: sigma_tau > sigma_hat -> pi*(sigma_tau) < pi_bar

  These justify the values hardcoded in Prop1-3:
  - Rapid: coordination succeeds -> phi = phi_bar (democracy), eta = eta_r (autocracy)
  - Threshold: coordination fails -> phi = 0 (democracy), eta = 1 (autocracy)

  Connection to existing files:
  - CoordinationConditions.lean: proves the algebraic preconditions (dominance
    regions, q* = m/(b+m), single-crossing) that justify applying Morris-Shin.
  - SupermodularGames library: proves that these preconditions yield unique
    equilibrium (Lemma 1) and noise comparative statics (Lemma 2).
  - This file: derives the trajectory-specific coordination outcomes that
    Prop1-3 take as given.

  Source: paper.Rmd, Section 3 (Equilibrium coordination) + Appendix B
-/

import SupermodularGames

noncomputable section

open Set

/-! ## Bridge theorems: from noise thresholds to coordination outcomes -/

/-- **Rapid coordination succeeds.** When signal noise sigma_r is at or below
    the noise threshold sigma_hat, equilibrium participation meets or exceeds
    the visibility threshold pi_bar.

    Paper connection (A4): sigma_r < min{sigma_hat_D, sigma_hat_A}, so workers
    coordinate effectively under rapid displacement. This activates compensation
    in democracy (phi = phi_bar) and degrades repression in autocracy (eta = eta_r).
    Used by Prop1(a), Prop2(a), Prop3(a). -/
theorem rapid_coordination_succeeds (cdf : NoiseCDF) (gap : ℝ) (hgap : gap < 0)
    (π_bar σ_r σ_hat : ℝ)
    (hσ_r : σ_r > 0) (hσ_hat : σ_hat > 0)
    (h_at_hat : participationRate cdf gap σ_hat = π_bar)
    (h_rapid : σ_r ≤ σ_hat) :
    participationRate cdf gap σ_r ≥ π_bar := by
  rcases h_rapid.eq_or_lt with h_eq | h_lt
  · -- sigma_r = sigma_hat: exact equality at the threshold
    rw [h_eq, h_at_hat]
  · -- sigma_r < sigma_hat: strict decrease gives pi*(sigma_r) > pi_bar
    have := participationRate_strictAntiOn cdf gap hgap
      (mem_Ioi.mpr hσ_r) (mem_Ioi.mpr hσ_hat) h_lt
    linarith

/-- **Threshold coordination fails.** When signal noise sigma_tau exceeds
    the noise threshold sigma_hat, equilibrium participation falls strictly
    below the visibility threshold pi_bar.

    Paper connection (A4): sigma_tau > max{sigma_hat_D, sigma_hat_A}, so workers
    fail to coordinate under threshold automation. Democracy cannot build
    compensation (phi = 0) and autocratic repression operates at full
    effectiveness (eta = 1). Used by Prop1(b), Prop2(b), Prop3(b). -/
theorem threshold_coordination_fails (cdf : NoiseCDF) (gap : ℝ) (hgap : gap < 0)
    (π_bar σ_τ σ_hat : ℝ)
    (hσ_τ : σ_τ > 0) (hσ_hat : σ_hat > 0)
    (h_at_hat : participationRate cdf gap σ_hat = π_bar)
    (h_threshold : σ_hat < σ_τ) :
    participationRate cdf gap σ_τ < π_bar := by
  have := participationRate_strictAntiOn cdf gap hgap
    (mem_Ioi.mpr hσ_hat) (mem_Ioi.mpr hσ_τ) h_threshold
  linarith

end
