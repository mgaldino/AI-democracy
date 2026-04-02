/-
  Proposition 2 (Autocratic fragility)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, line 152):
  "Under A1-A4: (a) autocracy is stable under rapid displacement iff
   κ₀ ≥ κ̄/η_r; (b) autocracy is stable under threshold automation iff κ₀ ≥ κ̄."

  Autocratic stability when displaced:
    u_E(M|A) = w_E - L, u_E(P|A) = w_E + Δ - κ₀·η
    M preferred iff κ₀·η ≥ Δ + L = κ̄

  Lemma 2 coordination outcomes (taken as hypotheses, not proved):
  - Rapid: coordination succeeds → η = η_r (repression degraded)
  - Threshold t=2: coordination fails → η = 1 (full repressive effectiveness)

  Source: paper.Rmd, lines 152-157
-/

import Mathlib

-- ===========================================================================
-- Core autocratic stability equivalence
-- ===========================================================================

/-- Autocratic stability when displaced: w_E - L ≥ w_E + Δ - κ₀·η
    is equivalent to κ₀·η ≥ kb (where kb = Δ + L = κ̄). -/
theorem autoc_stable_iff_eta
    (w_E L Δ κ₀ η kb : ℝ)
    (hkb : kb = Δ + L) :
    (w_E - L ≥ w_E + Δ - κ₀ * η) ↔ (κ₀ * η ≥ kb) := by
  subst hkb
  constructor <;> intro h <;> nlinarith

-- ===========================================================================
-- P2(a): Rapid — iff κ₀ ≥ κ̄/η_r
-- ===========================================================================

/-- P2(a): Under rapid, η = η_r (Lemma 2 hypothesis). Autocracy stable iff
    κ₀·η_r ≥ κ̄, which (dividing by η_r > 0) is iff κ₀ ≥ κ̄/η_r. -/
theorem prop2a_rapid_iff
    (κ₀ kb η_r : ℝ)
    (hη_pos : η_r > 0) :
    (κ₀ * η_r ≥ kb) ↔ (κ₀ ≥ kb / η_r) := by
  constructor
  · intro h
    rw [ge_iff_le, div_le_iff₀ hη_pos]
    exact h
  · intro h
    rw [ge_iff_le] at h
    exact (div_le_iff₀ hη_pos).mp h

-- ===========================================================================
-- P2(b): Threshold — iff κ₀ ≥ κ̄
-- ===========================================================================

/-- P2(b): Under threshold t=2, η = 1 (Lemma 2 hypothesis). Autocracy
    stable iff κ₀·1 = κ₀ ≥ κ̄. -/
theorem prop2b_threshold_iff
    (κ₀ kb : ℝ) :
    (κ₀ * 1 ≥ kb) ↔ (κ₀ ≥ kb) := by
  simp [mul_one]

-- ===========================================================================
-- P2 combined: Autocratic fragility pattern
-- ===========================================================================

/-- **Proposition 2 (Autocratic Fragility).** Under A1-A4:
    (a) autocracy stable under rapid iff κ₀ ≥ κ̄/η_r;
    (b) autocracy stable under threshold iff κ₀ ≥ κ̄.
    Since η_r < 1, the rapid condition is strictly harder (κ̄/η_r > κ̄). -/
theorem prop2_autocratic_fragility
    (w_E L Δ κ₀ η_r kb : ℝ)
    (hkb : kb = Δ + L)
    (hη_pos : η_r > 0) :
    -- (a) Rapid: stable iff κ₀ ≥ κ̄/η_r
    ((w_E - L ≥ w_E + Δ - κ₀ * η_r) ↔ (κ₀ ≥ kb / η_r)) ∧
    -- (b) Threshold: stable iff κ₀ ≥ κ̄
    ((w_E - L ≥ w_E + Δ - κ₀ * 1) ↔ (κ₀ ≥ kb)) := by
  have h_rapid := autoc_stable_iff_eta w_E L Δ κ₀ η_r kb hkb
  have h_threshold := autoc_stable_iff_eta w_E L Δ κ₀ 1 kb hkb
  constructor
  · rw [h_rapid]
    exact prop2a_rapid_iff κ₀ kb η_r hη_pos
  · rw [h_threshold]
    exact prop2b_threshold_iff κ₀ kb
