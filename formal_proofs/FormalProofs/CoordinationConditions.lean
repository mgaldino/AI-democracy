/-
  CoordinationConditions.lean

  Algebraic conditions for Morris-Shin (2003, Theorem 2.2) uniqueness
  in the coordination game from the AI-democracy paper.

  Worker i observes signal s_i about fundamental ω and decides whether
  to participate (a=1) or abstain (a=0). If aggregate participation
  π ≥ π̄, participants get benefit b > 0; if π < π̄, participants
  bear cost m > 0. The expected payoff from participation given
  posterior belief q_i = Pr[π ≥ π̄ | s_i] is:

    payoff(q) = q · b - (1 - q) · m

  Worker i participates iff payoff(q_i) ≥ 0, i.e., q_i ≥ m/(b + m).

  Source: paper.Rmd, Section 2 (Information and Collective Action) + Appendix B
-/

import Mathlib

noncomputable section

/-- Net expected payoff from participation given belief q, benefit b, and cost m. -/
def participation_payoff (q b m : ℝ) : ℝ := q * b - (1 - q) * m

/-- Critical belief threshold: q* = m / (b + m). -/
def critical_threshold (b m : ℝ) : ℝ := m / (b + m)

/-! ## 1. Dominance regions -/

/-- When q = 1 (certainty that visibility is achieved), participation is strictly dominant.
    payoff(1) = 1 · b - 0 · m = b > 0. -/
theorem dominance_high_belief (b m : ℝ) (hb : b > 0) :
    participation_payoff 1 b m > 0 := by
  unfold participation_payoff
  linarith

/-- When q = 0 (certainty that visibility fails), abstention is strictly dominant.
    payoff(0) = 0 · b - 1 · m = -m < 0. -/
theorem dominance_low_belief (b m : ℝ) (hm : m > 0) :
    participation_payoff 0 b m < 0 := by
  unfold participation_payoff
  linarith

/-! ## 2. Critical belief threshold -/

/-- The critical threshold q* = m/(b+m) lies strictly between 0 and 1
    whenever both b > 0 and m > 0. -/
theorem critical_threshold_in_unit_interval (b m : ℝ) (hb : b > 0) (hm : m > 0) :
    0 < critical_threshold b m ∧ critical_threshold b m < 1 := by
  unfold critical_threshold
  constructor
  · positivity
  · rw [div_lt_one (by linarith : b + m > 0)]
    linarith

/-- At q = q*, the participation payoff is exactly zero (indifference).
    payoff(m/(b+m)) = m/(b+m) · b - (1 - m/(b+m)) · m = 0. -/
theorem indifference_at_threshold (b m : ℝ) (hb : b > 0) (hm : m > 0) :
    participation_payoff (critical_threshold b m) b m = 0 := by
  unfold participation_payoff critical_threshold
  field_simp
  ring

/-! ## 3. Monotonicity -/

/-- The participation payoff is strictly increasing in the belief q.
    If q₁ > q₂ then payoff(q₁) > payoff(q₂), since
    d(payoff)/dq = b + m > 0. -/
theorem payoff_strictly_increasing (q₁ q₂ b m : ℝ) (hb : b > 0) (hm : m > 0)
    (hq : q₁ > q₂) :
    participation_payoff q₁ b m > participation_payoff q₂ b m := by
  unfold participation_payoff
  nlinarith

/-! ## 4. Single-crossing: participation optimal iff belief above threshold -/

/-- Participation is optimal (non-negative payoff) if and only if the worker's
    belief q weakly exceeds the critical threshold q* = m/(b+m).
    This is the single-crossing property that enables Morris-Shin uniqueness:
    there is exactly one crossing of the zero-payoff line. -/
theorem participate_iff_belief_above_threshold (q b m : ℝ) (hb : b > 0) (hm : m > 0) :
    participation_payoff q b m ≥ 0 ↔ q ≥ critical_threshold b m := by
  unfold participation_payoff critical_threshold
  have hbm : (0 : ℝ) < b + m := by linarith
  constructor
  · intro h
    rw [ge_iff_le, div_le_iff₀ hbm]
    nlinarith
  · intro h
    rw [ge_iff_le, div_le_iff₀ hbm] at h
    nlinarith

end
