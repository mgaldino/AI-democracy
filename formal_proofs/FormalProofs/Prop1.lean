/-
  Proposition 1 (Democratic fragility)
  — AI Automation, Regime Type, and Crossed Fragility

  Original statement (paper.Rmd, line 144):
  "Under A1-A5: (a) democracy is stable under rapid displacement;
   (b) democracy is unstable under threshold automation."

  Lemma 2 coordination outcomes (taken as hypotheses, not proved):
  - Rapid: shock predictable → coordination succeeds → φ = φ̄ = (Δ+L)/L
  - Threshold t=2: shock unpredictable → coordination fails → φ = 0

  Source: paper.Rmd, lines 144-150
-/

import Mathlib

-- ===========================================================================
-- Proposition 1(a): Democracy stable under rapid displacement
-- ===========================================================================

/-- P1(a): Under rapid displacement, coordination succeeds (Lemma 2 hypothesis)
    and reactive compensation activates at φ̄ = (Δ+L)/L. Democracy is stable
    because L·φ̄ = Δ+L (exact equality at the stability threshold).
    Displacement persists into t=2 (absorbing state) with the same condition. -/
theorem prop1a_rapid_stable
    (w_E L Δ : ℝ) (hL : L > 0) :
    w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ := by
  have h : L * (1 - (Δ + L) / L) = -Δ := by field_simp; ring
  linarith

-- ===========================================================================
-- Proposition 1(b): Democracy unstable under threshold automation
-- ===========================================================================

/-- P1(b): Under threshold automation, t=1 is stable (no displacement).
    In t=2, coordination fails (Lemma 2 hypothesis), so φ = 0.
    Stability would require w_E - L ≥ w_E + Δ, i.e., Δ + L ≤ 0,
    contradicting A2 (Δ + L > 0). -/
theorem prop1b_threshold_unstable
    (w_E L Δ : ℝ) (hA2 : Δ + L > 0) :
    ¬(w_E - L * (1 - 0) ≥ w_E + Δ) := by
  intro hs
  linarith

-- ===========================================================================
-- Proposition 1 (combined): Democratic fragility pattern
-- ===========================================================================

/-- **Proposition 1 (Democratic Fragility).** Under A1-A5:
    (a) democracy is stable under rapid displacement;
    (b) democracy is unstable under threshold automation.
    The asymmetry arises from the interaction between shock type and the
    reactive mechanism of democratic compensation (coordination-dependent). -/
theorem prop1_democratic_fragility
    (w_E L Δ : ℝ) (hL : L > 0) (hA2 : Δ + L > 0) :
    (w_E - L * (1 - (Δ + L) / L) ≥ w_E + Δ) ∧
    ¬(w_E - L * (1 - 0) ≥ w_E + Δ) :=
  ⟨prop1a_rapid_stable w_E L Δ hL,
   prop1b_threshold_unstable w_E L Δ hA2⟩
