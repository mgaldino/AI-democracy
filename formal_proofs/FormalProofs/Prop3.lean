/-
  Proposition 3 (Crossed fragility)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, line 160):
  "Under A1-A5, if κ₀ ∈ [κ̄, κ̄/η_r):
   (a) under rapid displacement, democracy is stable and autocracy is unstable;
   (b) under threshold automation, democracy is unstable and autocracy is stable."

  This is the central result: the *form* of the automation trajectory determines
  which regime type is fragile, producing a crossed pattern.

  Source: paper.Rmd, lines 160-164
-/

import Mathlib

-- ===========================================================================
-- P3(a): Rapid — democracy stable, autocracy unstable
-- ===========================================================================

/-- P3(a): Under rapid displacement with κ₀ ∈ [κ̄, κ̄/η_r):
    - Democracy stable: reactive compensation at φ̄ = (Δ+L)/L gives exact equality.
    - Autocracy unstable: κ₀ < κ̄/η_r → κ₀·η_r < κ̄ (degraded repression insufficient). -/
theorem prop3a_rapid_crossed
    (w_E L Δ κ₀ kb η_r : ℝ)
    (hL : L > 0)
    (hA2 : Δ + L > 0)
    (hη_pos : η_r > 0)
    (hkb_def : kb = Δ + L)
    (h_interval_lower : κ₀ ≥ kb)
    (h_interval_upper : κ₀ < kb / η_r) :
    -- Democracy stable under rapid (φ = (Δ+L)/L)
    (w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) ∧
    -- Autocracy unstable under rapid (κ₀·η_r < kb)
    (κ₀ * η_r < kb) := by
  constructor
  · have h1 : L * (1 - (Δ + L) / L) = -Δ := by field_simp; ring
    linarith
  · have h := mul_lt_mul_of_pos_right h_interval_upper hη_pos
    rw [div_mul_cancel₀ kb (ne_of_gt hη_pos)] at h
    linarith

-- ===========================================================================
-- P3(b): Threshold — democracy unstable, autocracy stable
-- ===========================================================================

/-- P3(b): Under threshold automation with κ₀ ∈ [κ̄, κ̄/η_r):
    - Democracy unstable: coordination fails → φ = 0, and 0 < Δ+L (A2).
    - Autocracy stable: κ₀ ≥ κ̄ and η = 1 → κ₀·1 = κ₀ ≥ κ̄. -/
theorem prop3b_threshold_crossed
    (w_E L Δ κ₀ kb : ℝ)
    (hA2 : Δ + L > 0)
    (hkb_def : kb = Δ + L)
    (h_interval_lower : κ₀ ≥ kb) :
    -- Democracy unstable under threshold (φ = 0)
    ¬(w_E - L * (1 - 0) ≥ w_E + Δ) ∧
    -- Autocracy stable under threshold (κ₀ · 1 ≥ kb)
    (κ₀ * 1 ≥ kb) := by
  constructor
  · intro hs; linarith
  · linarith

-- ===========================================================================
-- P3 combined: Crossed fragility
-- ===========================================================================

/-- **Proposition 3 (Crossed Fragility).** Under A1-A5, for κ₀ ∈ [κ̄, κ̄/η_r):
    (a) Rapid: democracy stable ∧ autocracy unstable.
    (b) Threshold: democracy unstable ∧ autocracy stable.
    Regime fragility depends on the *interaction* between the automation
    trajectory and the regime's institutional response mechanism. -/
theorem prop3_crossed_fragility
    (w_E L Δ κ₀ kb η_r : ℝ)
    (hL : L > 0)
    (hA2 : Δ + L > 0)
    (hη_pos : η_r > 0)
    (hkb_def : kb = Δ + L)
    (h_interval_lower : κ₀ ≥ kb)
    (h_interval_upper : κ₀ < kb / η_r) :
    -- (a) Rapid: democracy stable ∧ autocracy unstable
    ((w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) ∧ (κ₀ * η_r < kb)) ∧
    -- (b) Threshold: democracy unstable ∧ autocracy stable
    (¬(w_E - L * (1 - 0) ≥ w_E + Δ) ∧ (κ₀ * 1 ≥ kb)) :=
  ⟨prop3a_rapid_crossed w_E L Δ κ₀ kb η_r hL hA2 hη_pos
     hkb_def h_interval_lower h_interval_upper,
   prop3b_threshold_crossed w_E L Δ κ₀ kb hA2
     hkb_def h_interval_lower⟩
