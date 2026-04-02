/-
  Proposition 6 (Functional equivalence with welfare gap)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, lines 211-218):
  "(a) Both strong democracies (φ₀ ≥ φ̄) and strong autocracies (κ₀ ≥ κ̄/η_r)
       are stable under both trajectories.
   (b) Under threshold automation, E's welfare differs:
       u_E(M | D-strong) - u_E(M | A-strong) ≥ κ̄ > 0"

  Proof strategy:
  Part (a):
    Strong democracy: stable under both by P5(c) (φ₀ ≥ φ̄ ⟹ stable everywhere).
    Strong autocracy: κ₀ ≥ κ̄/η_r.
      Under rapid (η = η_r): need κ₀·η_r ≥ κ̄. Since κ₀ ≥ κ̄/η_r, we have κ₀·η_r ≥ κ̄. ✓
      Under threshold (η = 1): need κ₀ ≥ κ̄. Since η_r < 1, κ̄/η_r > κ̄, so κ₀ ≥ κ̄. ✓

  Part (b):
    Strong democracy, threshold t=2: u_E = w_E - L(1 - φ₀).
      Since L·φ₀ ≥ Δ + L (φ₀ ≥ φ̄), we get u_E ≥ w_E + Δ.
    Strong autocracy, threshold t=2: u_E = w_E - L (no compensation).
    Difference ≥ (w_E + Δ) - (w_E - L) = Δ + L.
    Under A1 (Δ < 0): κ̄ = L - |Δ| = L + Δ = Δ + L.
    So difference ≥ κ̄ > 0 (by A2: Δ + L > 0).

  Source: paper.Rmd, lines 211-218
-/

import Mathlib

-- ===========================================================================
-- Part (a): Strong democracy stable under both trajectories
-- ===========================================================================

/-- P6(a), democratic half: A strong democracy (L·φ₀ ≥ Δ+L, i.e., φ₀ ≥ φ̄)
    is stable under both trajectories. Under threshold φ = φ₀; under rapid
    φ = max(φ₀, φ̄) ≥ φ̄. This is P5(c) restated. -/
theorem prop6a_strong_dem_both_stable
    (w_E L Δ φ₀ : ℝ) (hL : L > 0) (hStrong : L * φ₀ ≥ Δ + L) :
    -- Threshold stable (φ_t = φ₀)
    (w_E - L * (1 - φ₀) ≥ w_E + Δ) ∧
    -- Rapid stable (φ_t = max(φ₀, φ̄) ≥ φ̄; even φ̄ alone suffices)
    (w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) := by
  constructor
  · -- Threshold: L·φ₀ ≥ Δ+L ⟹ w_E - L(1-φ₀) ≥ w_E + Δ
    nlinarith
  · -- Rapid: reactive compensation at φ̄ = (Δ+L)/L always yields exact stability
    have : L * (1 - (Δ + L) / L) = -Δ := by field_simp; ring
    linarith

-- ===========================================================================
-- Part (a): Strong autocracy stable under both trajectories
-- ===========================================================================

/-- Auxiliary: if κ₀ ≥ κ̄/η_r, then κ₀·η_r ≥ κ̄. This is the rapid stability
    condition for strong autocracies. -/
theorem strong_autoc_rapid_stable
    (κ₀ kb η_r : ℝ)
    (hη_pos : η_r > 0) (hStrong : κ₀ ≥ kb / η_r) :
    κ₀ * η_r ≥ kb := by
  rw [ge_iff_le, ← sub_nonneg] at hStrong ⊢
  have h1 := mul_nonneg (sub_nonneg.mpr (le_of_sub_nonneg hStrong)) (le_of_lt hη_pos)
  nlinarith [div_mul_cancel₀ kb (ne_of_gt hη_pos)]

/-- Auxiliary: if κ₀ ≥ κ̄/η_r and 0 < η_r < 1 and κ̄ > 0, then κ₀ > κ̄.
    This is because κ̄/η_r > κ̄ when η_r < 1 and κ̄ > 0. -/
theorem strong_autoc_exceeds_kappa_bar
    (κ₀ kb η_r : ℝ)
    (hη_pos : η_r > 0) (hη_lt1 : η_r < 1) (hkb_pos : kb > 0)
    (hStrong : κ₀ ≥ kb / η_r) :
    κ₀ > kb := by
  have h1 : kb / η_r > kb := by
    rw [gt_iff_lt, lt_div_iff₀ hη_pos]
    nlinarith
  linarith

/-- P6(a), autocratic half: A strong autocracy (κ₀ ≥ κ̄/η_r) is stable under
    both trajectories. Under rapid (η = η_r): κ₀·η_r ≥ κ̄. Under threshold
    (η = 1): κ₀ ≥ κ̄ (since κ₀ ≥ κ̄/η_r > κ̄ when η_r < 1). -/
theorem prop6a_strong_autoc_both_stable
    (κ₀ kb η_r : ℝ)
    (hη_pos : η_r > 0) (hη_lt1 : η_r < 1) (hkb_pos : kb > 0)
    (hStrong : κ₀ ≥ kb / η_r) :
    -- Rapid: κ₀·η_r ≥ κ̄
    (κ₀ * η_r ≥ kb) ∧
    -- Threshold: κ₀ ≥ κ̄
    (κ₀ ≥ kb) := by
  exact ⟨strong_autoc_rapid_stable κ₀ kb η_r hη_pos hStrong,
         le_of_lt (strong_autoc_exceeds_kappa_bar κ₀ kb η_r hη_pos hη_lt1 hkb_pos hStrong)⟩

-- ===========================================================================
-- Part (b): Welfare gap under threshold automation
-- ===========================================================================

/-- P6(b), welfare gap: The difference between strong democracy and strong
    autocracy utility under threshold is at least Δ + L.
    Democracy: u_E = w_E - L(1-φ₀). Autocracy: u_E = w_E - L.
    Difference = L·φ₀ ≥ Δ+L. -/
theorem prop6b_welfare_gap_ge_delta_plus_L
    (w_E L φ₀ Δ : ℝ) (hStrong : L * φ₀ ≥ Δ + L) :
    (w_E - L * (1 - φ₀)) - (w_E - L) ≥ Δ + L := by
  nlinarith

/-- P6(b), connection: Under A1 (Δ < 0), Δ + L = L - |Δ| = κ̄. -/
theorem delta_plus_L_eq_kappa_bar'
    (L Δ : ℝ) (hA1 : Δ < 0) :
    Δ + L = L - |Δ| := by
  have : |Δ| = -Δ := abs_of_neg hA1
  linarith

/-- P6(b), combined: Under threshold automation, the welfare gap between
    strong democracy and strong autocracy is at least κ̄ = L - |Δ|, and
    κ̄ > 0. This is the full statement of P6(b).

    Gap = L·φ₀ ≥ Δ+L = L-|Δ| = κ̄ > 0 -/
theorem prop6b_welfare_gap
    (w_E L φ₀ Δ : ℝ)
    (hA1 : Δ < 0) (hA2 : Δ + L > 0)
    (hStrong : L * φ₀ ≥ Δ + L) :
    (w_E - L * (1 - φ₀)) - (w_E - L) ≥ L - |Δ| ∧ L - |Δ| > 0 := by
  constructor
  · have h_gap := prop6b_welfare_gap_ge_delta_plus_L w_E L φ₀ Δ hStrong
    have h_eq := delta_plus_L_eq_kappa_bar' L Δ hA1
    linarith
  · have : |Δ| = -Δ := abs_of_neg hA1
    linarith
