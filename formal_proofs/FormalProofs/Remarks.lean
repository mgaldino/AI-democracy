/-
  Remarks 1 and 2 — AI Automation, Regime Type, and Crossed Fragility

  Remark 1 (Threshold of thresholds):
  "Define L* ≡ κ₀ + |Δ|. For L > L*, autocracy is unstable under threshold automation."

  Remark 2 (Width of the crossed interval):
  "The set of κ₀ values generating the crossed pattern has width
   κ̄(1-η_r)/η_r, which is increasing in κ̄, decreasing in η_r,
   and zero when η_r = 1."

  Source: paper.Rmd, lines 177-185
-/

import Mathlib

-- ===========================================================================
-- Definitions (self-contained for this module)
-- ===========================================================================

/-- The net attractiveness of revolt absent automation: Δ = θW - k - w_E -/
noncomputable def Delta (θ W k w_E : ℝ) : ℝ := θ * W - k - w_E

/-- The repressive threshold: κ̄ = L - |Δ| -/
noncomputable def kappa_bar (L θ W k w_E : ℝ) : ℝ := L - |Delta θ W k w_E|

/-- The threshold of thresholds: L* = κ₀ + |Δ| -/
noncomputable def L_star (κ₀ θ W k w_E : ℝ) : ℝ := κ₀ + |Delta θ W k w_E|

-- ===========================================================================
-- Remark 1: Threshold of thresholds
-- ===========================================================================

/-- Remark 1: If L > L* = κ₀ + |Δ|, then κ̄ > κ₀.
    This means autocracy is unstable under threshold automation
    because standing repressive capacity is insufficient. -/
theorem remark1_threshold_of_thresholds
    (L κ₀ θ W k w_E : ℝ)
    (h : L > L_star κ₀ θ W k w_E) :
    kappa_bar L θ W k w_E > κ₀ := by
  -- Unfold definitions: L* = κ₀ + |Δ| and κ̄ = L - |Δ|
  -- From L > κ₀ + |Δ|, we get L - |Δ| > κ₀, i.e., κ̄ > κ₀
  unfold L_star at h
  unfold kappa_bar
  linarith

-- ===========================================================================
-- Remark 2: Width of the crossed interval
-- ===========================================================================

/-- Remark 2a: The width of the crossed fragility interval [κ̄, κ̄/η_r)
    equals κ̄(1 - η_r)/η_r. -/
theorem remark2_width_of_crossed_interval
    (kb η_r : ℝ)
    (hη_pos : η_r > 0)
    (hη_lt1 : η_r < 1)
    (hκ_pos : kb > 0) :
    kb / η_r - kb = kb * (1 - η_r) / η_r := by
  -- Algebraic identity: kb/η_r - kb = kb(1/η_r - 1) = kb(1-η_r)/η_r
  field_simp

/-- Remark 2b: The width is increasing in κ̄.
    Formally: if kb1 < kb2, then width(kb1) < width(kb2). -/
theorem remark2_increasing_in_kappa_bar
    (kb1 kb2 η_r : ℝ)
    (hη_pos : η_r > 0)
    (hη_lt1 : η_r < 1)
    (hκ : kb1 < kb2)
    (hκ₁_pos : kb1 > 0) :
    kb1 * (1 - η_r) / η_r < kb2 * (1 - η_r) / η_r := by
  -- (1 - η_r)/η_r > 0 since 0 < η_r < 1, so multiplying by larger κ̄ gives larger width
  have h1 : 1 - η_r > 0 := by linarith
  have h2 : (1 - η_r) / η_r > 0 := div_pos h1 hη_pos
  exact div_lt_div_of_pos_right (mul_lt_mul_of_pos_right hκ h1) hη_pos

/-- Remark 2c: The width is decreasing in η_r.
    Formally: if e1 < e2 < 1, then width(e2) < width(e1). -/
theorem remark2_decreasing_in_eta
    (kb e1 e2 : ℝ)
    (he1_pos : e1 > 0)
    (he2_pos : e2 > 0)
    (he1_lt1 : e1 < 1)
    (he2_lt1 : e2 < 1)
    (hη : e1 < e2)
    (hκ_pos : kb > 0) :
    kb * (1 - e2) / e2 < kb * (1 - e1) / e1 := by
  -- kb/η is decreasing in η when kb > 0, so kb(1-η)/η is also decreasing
  rw [div_lt_div_iff₀ he2_pos he1_pos]
  have h1 : 1 - e2 < 1 - e1 := by linarith
  nlinarith [mul_pos hκ_pos he1_pos, mul_pos hκ_pos he2_pos]

/-- Remark 2d: The width is zero when η_r = 1. -/
theorem remark2_zero_when_eta_one
    (kb : ℝ) :
    kb * (1 - 1) / 1 = 0 := by
  ring
