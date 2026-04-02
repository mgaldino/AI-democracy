/-
  Proposition 4 (Welfare cost of autocratic stability)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, lines 170-173):
  "Conditional on regime survival, E's welfare is strictly higher under democracy:
   u_E(M | D, stable) - u_E(M | A, stable) = κ̄ > 0"

  Proof sketch from the paper:
  Democracy stable (rapid, t=1): u_E = w_E + Δ.
  Autocracy stable (threshold, t=2): u_E = w_E - L.
  Difference: Δ + L = κ̄ > 0.

  Key insight: Under A1 (Δ < 0), |Δ| = -Δ, so κ̄ = L - |Δ| = L + Δ.
  Under A2 (Δ + L > 0), this is strictly positive.
-/

import Mathlib

-- ===========================================================================
-- Definitions (reused from Remarks.lean for consistency)
-- ===========================================================================

/-- The net attractiveness of revolt absent automation: Δ = θW - k - w_E -/
noncomputable def Delta' (θ W k w_E : ℝ) : ℝ := θ * W - k - w_E

/-- The repressive threshold: κ̄ = L - |Δ| -/
noncomputable def kappa_bar' (L θ W k w_E : ℝ) : ℝ := L - |Delta' θ W k w_E|

-- ===========================================================================
-- Proposition 4: Welfare cost of autocratic stability
-- ===========================================================================

/-- Proposition 4, Part 1: The welfare gap between democratic and autocratic
    citizens (conditional on regime survival) equals exactly κ̄ = L - |Δ|.

    Democracy stable (rapid): u_E = w_E + Δ (displaced but compensated at φ̄).
    Autocracy stable (threshold): u_E = w_E - L (displaced, repressed, no compensation).
    The gap Δ + L equals κ̄ when Δ < 0. -/
theorem prop4_welfare_gap_eq_kappa_bar
    (w_E L Δ : ℝ)
    (hA1 : Δ < 0) :
    (w_E + Δ) - (w_E - L) = L - |Δ| := by
  -- (w_E + Δ) - (w_E - L) simplifies to Δ + L
  -- Under A1 (Δ < 0): |Δ| = -Δ, so L - |Δ| = L - (-Δ) = L + Δ
  have hab : |Δ| = -Δ := abs_of_neg hA1
  linarith

/-- Proposition 4, Part 2: The welfare gap κ̄ is strictly positive.
    This follows directly from A2 (Δ + L > 0) and A1 (Δ < 0). -/
theorem prop4_welfare_gap_positive
    (L Δ : ℝ)
    (hA1 : Δ < 0)
    (hA2 : Δ + L > 0) :
    L - |Δ| > 0 := by
  -- Under A1: |Δ| = -Δ, so L - |Δ| = L + Δ = Δ + L > 0 by A2
  have hab : |Δ| = -Δ := abs_of_neg hA1
  linarith

/-- Proposition 4, Combined: The welfare gap equals κ̄ AND κ̄ > 0.
    This is the full statement as it appears in the paper. -/
theorem prop4_welfare_cost_of_autocratic_stability
    (w_E L Δ : ℝ)
    (hA1 : Δ < 0)
    (hA2 : Δ + L > 0) :
    (w_E + Δ) - (w_E - L) = L - |Δ| ∧ L - |Δ| > 0 := by
  exact ⟨prop4_welfare_gap_eq_kappa_bar w_E L Δ hA1,
         prop4_welfare_gap_positive L Δ hA1 hA2⟩
