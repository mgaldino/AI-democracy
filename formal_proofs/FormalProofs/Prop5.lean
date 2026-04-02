/-
  Proposition 5 (Welfare state as insurance against delayed shocks)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, lines 205-207):
  "(a) Democracy is stable under threshold automation iff φ₀ ≥ φ̄.
   (b) For φ₀ < φ̄, Proposition 1 holds unchanged.
   (c) For φ₀ ≥ φ̄, democracy is stable under both trajectories."

  Proof strategy:
  The stability condition u_E(M) ≥ u_E(P) when displaced reduces to L·φ ≥ Δ+L
  (division-free form of φ ≥ φ̄ = (Δ+L)/L = 1 - |Δ|/L).
  Under threshold: coordination fails, φ_t = φ₀. Stable iff L·φ₀ ≥ Δ+L.
  Under rapid: coordination succeeds, φ_t = φ̄ = (Δ+L)/L. Always stable (exact equality).

  Source: paper.Rmd, lines 205-207
-/

import Mathlib

-- ===========================================================================
-- Core stability equivalence
-- ===========================================================================

/-- Democratic stability when displaced: u_E(M) = w_E - L(1-φ) ≥ w_E + Δ = u_E(P)
    is equivalent to L·φ ≥ Δ + L. This is the division-free form of φ ≥ φ̄. -/
theorem dem_stable_iff_Lphi (w_E L Δ φ : ℝ) :
    w_E - L * (1 - φ) ≥ w_E + Δ ↔ L * φ ≥ Δ + L := by
  constructor <;> intro h <;> nlinarith

/-- Connection to paper notation: (Δ+L)/L = 1 - |Δ|/L under A1 (Δ < 0).
    This connects the division-free condition to the paper's φ̄ = 1 - |Δ|/L. -/
theorem phi_bar_representations (L Δ : ℝ) (hL : L > 0) (hA1 : Δ < 0) :
    (Δ + L) / L = 1 - |Δ| / L := by
  have hab : |Δ| = -Δ := abs_of_neg hA1
  rw [hab]
  field_simp
  ring

-- ===========================================================================
-- Proposition 5(a): Threshold stable iff φ₀ ≥ φ̄
-- ===========================================================================

/-- P5(a): Under threshold automation, reactive compensation fails (coordination
    too low), so φ_t = φ₀. Democracy is stable iff L·φ₀ ≥ Δ+L (i.e., φ₀ ≥ φ̄). -/
theorem prop5a_threshold_stable_iff (w_E L Δ φ₀ : ℝ) :
    w_E - L * (1 - φ₀) ≥ w_E + Δ ↔ L * φ₀ ≥ Δ + L :=
  dem_stable_iff_Lphi w_E L Δ φ₀

-- ===========================================================================
-- Proposition 5(b): φ₀ < φ̄ → rapid stable, threshold unstable (= P1 pattern)
-- ===========================================================================

/-- P5(b), rapid part: Under rapid displacement, reactive compensation activates
    at φ̄ = (Δ+L)/L. Since L·φ̄ = Δ+L, democracy is stable (with exact equality). -/
theorem prop5b_rapid_stable
    (w_E L Δ : ℝ) (hL : L > 0) :
    w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ := by
  have : L * (1 - (Δ + L) / L) = -Δ := by
    field_simp
    ring
  linarith

/-- P5(b), threshold part: If L·φ₀ < Δ+L (i.e., φ₀ < φ̄), democracy is
    unstable under threshold automation. -/
theorem prop5b_threshold_unstable
    (w_E L Δ φ₀ : ℝ) (h : L * φ₀ < Δ + L) :
    ¬(w_E - L * (1 - φ₀) ≥ w_E + Δ) := by
  intro hs
  have := (dem_stable_iff_Lphi w_E L Δ φ₀).mp hs
  linarith

/-- P5(b) combined: If φ₀ < φ̄, the Proposition 1 pattern holds unchanged —
    democracy is stable under rapid (reactive compensation) and unstable
    under threshold (standing capacity insufficient). -/
theorem prop5b_P1_pattern
    (w_E L Δ φ₀ : ℝ) (hL : L > 0) (h : L * φ₀ < Δ + L) :
    (w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) ∧
    ¬(w_E - L * (1 - φ₀) ≥ w_E + Δ) :=
  ⟨prop5b_rapid_stable w_E L Δ hL,
   prop5b_threshold_unstable w_E L Δ φ₀ h⟩

-- ===========================================================================
-- Proposition 5(c): φ₀ ≥ φ̄ → stable under both trajectories
-- ===========================================================================

/-- P5(c): If L·φ₀ ≥ Δ+L (i.e., φ₀ ≥ φ̄), democracy is stable under both
    trajectories. Under threshold: φ = φ₀ ≥ φ̄. Under rapid: φ = max(φ₀,φ̄) ≥ φ̄.
    Both reduce to the standing capacity meeting the threshold. -/
theorem prop5c_both_stable
    (w_E L Δ φ₀ : ℝ) (hL : L > 0) (h : L * φ₀ ≥ Δ + L) :
    -- Threshold stable (φ_t = φ₀ ≥ φ̄)
    (w_E - L * (1 - φ₀) ≥ w_E + Δ) ∧
    -- Rapid stable (φ_t = max(φ₀, φ̄) ≥ φ̄; φ₀ alone already suffices)
    (w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) :=
  ⟨(dem_stable_iff_Lphi w_E L Δ φ₀).mpr h,
   prop5b_rapid_stable w_E L Δ hL⟩
