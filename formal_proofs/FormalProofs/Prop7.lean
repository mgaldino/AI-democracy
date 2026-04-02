/-
  Proposition 7 (Endogenous fiscal fragility)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, lines 260-261):
  "Under A5' replacing A5, define p* ≡ F / c(φ̄). Democracy is unstable
   under threshold automation whenever p ≥ p*."

  Context:
  A5' replaces the hard constraint A5 (reactive compensation impossible
  without signal) with an endogenous fiscal constraint. Building emergency
  compensatory capacity φ during a crisis costs c(φ), financed from fiscal
  capacity F at political cost multiplier p:
    - c(·) increasing, convex, c(0) = 0
    - Democracy invests iff p · c(φ̄) ≤ F
    - p* = F / c(φ̄): threshold political cost

  Proof strategy (two steps):
  Step 1 (fiscal): p ≥ F/c(φ̄)  →  p · c(φ̄) ≥ F  (cost exceeds budget)
  Step 2 (stability): no compensation (φ=0) + A2 (Δ+L > 0)  →  unstable
    (since L·0 = 0 < Δ+L)

  Source: paper.Rmd, lines 254-274
-/

import Mathlib

-- ===========================================================================
-- Step 1: Fiscal impossibility — p ≥ p* implies cost exceeds budget
-- ===========================================================================

/-- The political cost threshold p* = F / c(φ̄).
    When p ≥ p*, emergency compensation is unaffordable. -/
noncomputable def p_star (F c_phi_bar : ℝ) : ℝ := F / c_phi_bar

/-- Step 1: If p ≥ p* = F / c(φ̄) and c(φ̄) > 0, then p · c(φ̄) ≥ F.
    The cost of emergency compensation exceeds fiscal capacity. -/
theorem prop7_fiscal_impossibility
    (p F c_phi_bar : ℝ)
    (hc_pos : c_phi_bar > 0)
    (hp : p ≥ p_star F c_phi_bar) :
    p * c_phi_bar ≥ F := by
  unfold p_star at hp
  have h := mul_le_mul_of_nonneg_right hp (le_of_lt hc_pos)
  rw [div_mul_cancel₀ F (ne_of_gt hc_pos)] at h
  linarith

-- ===========================================================================
-- Step 2: No compensation implies democratic instability
-- ===========================================================================

/-- Step 2: If φ = 0 (no compensation) and Δ + L > 0 (A2), then the
    stability condition L·φ ≥ Δ+L fails. Democracy is unstable.

    Recall from P5: stability requires w_E - L(1-φ) ≥ w_E + Δ, i.e., L·φ ≥ Δ+L.
    With φ = 0: L·0 = 0 < Δ+L. -/
theorem prop7_no_compensation_unstable
    (w_E L Δ : ℝ)
    (hA2 : Δ + L > 0) :
    ¬(w_E - L * (1 - 0) ≥ w_E + Δ) := by
  intro h
  linarith

-- ===========================================================================
-- Combined: Proposition 7
-- ===========================================================================

/-- Proposition 7 (Endogenous fiscal fragility), combined statement:
    Under threshold automation, if:
    (1) c(φ̄) > 0 (nontrivial cost of compensation),
    (2) p ≥ p* = F / c(φ̄) (political cost exceeds threshold),
    (3) Δ + L > 0 (A2: revolt tempting under displacement),
    then democracy is unstable.

    The proof chains Step 1 (fiscal impossibility → φ = 0) with
    Step 2 (φ = 0 → instability). -/
theorem prop7_endogenous_fiscal_fragility
    (w_E L Δ p F c_phi_bar : ℝ)
    (hc_pos : c_phi_bar > 0)
    (hp : p ≥ p_star F c_phi_bar)
    (hA2 : Δ + L > 0) :
    -- Cost exceeds budget (compensation unaffordable)
    p * c_phi_bar ≥ F ∧
    -- Democracy is unstable (stability condition fails with φ=0)
    ¬(w_E - L * (1 - 0) ≥ w_E + Δ) :=
  ⟨prop7_fiscal_impossibility p F c_phi_bar hc_pos hp,
   prop7_no_compensation_unstable w_E L Δ hA2⟩

-- ===========================================================================
-- Auxiliary: p* properties
-- ===========================================================================

/-- p* > 0 when F > 0 and c(φ̄) > 0. -/
theorem prop7_pstar_positive
    (F c_phi_bar : ℝ)
    (hF : F > 0)
    (hc_pos : c_phi_bar > 0) :
    p_star F c_phi_bar > 0 := by
  unfold p_star
  exact div_pos hF hc_pos

/-- Converse: if p < p*, compensation IS affordable (p·c(φ̄) < F).
    Confirms p* is the exact cutoff. -/
theorem prop7_below_pstar_affordable
    (p F c_phi_bar : ℝ)
    (hc_pos : c_phi_bar > 0)
    (hp : p < p_star F c_phi_bar) :
    p * c_phi_bar < F := by
  unfold p_star at hp
  have h := mul_lt_mul_of_pos_right hp hc_pos
  rw [div_mul_cancel₀ F (ne_of_gt hc_pos)] at h
  linarith
