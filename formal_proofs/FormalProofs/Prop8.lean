/-
  Prop8.lean — Trajectory Separation (derived)

  Proposition 8: Under Var(beta) > 0 and alpha > 0,
  sigma_tau = h(Var(beta)) > h(0) = sigma_r.

  This converts the former A6 (trajectory separation assumption)
  into a derived result from the microfoundation.

  Source: paper.Rmd, Proposition 8 + Appendix D
-/

import Mathlib

noncomputable section

/-- h(v) = sqrt(sigma_0^2 + alpha^2 * v), the noise function. -/
def noise_fn (σ₀ α : ℝ) (v : ℝ) : ℝ := Real.sqrt (σ₀ ^ 2 + α ^ 2 * v)

/-- h(0) = sigma_0 (baseline noise under rapid displacement). -/
theorem noise_fn_at_zero (σ₀ : ℝ) (hσ₀ : σ₀ ≥ 0) (α : ℝ) :
    noise_fn σ₀ α 0 = σ₀ := by
  unfold noise_fn
  simp only [mul_zero, add_zero]
  exact Real.sqrt_sq hσ₀

/-- h is strictly increasing on [0, ∞) for alpha > 0. -/
theorem noise_fn_strictMono_on (σ₀ α : ℝ) (hα : α > 0) :
    StrictMonoOn (fun v => noise_fn σ₀ α v) (Set.Ici 0) := by
  intro v₁ hv₁ v₂ _ hlt
  unfold noise_fn
  apply Real.sqrt_lt_sqrt
  · have hσ2 : σ₀ ^ 2 ≥ 0 := sq_nonneg σ₀
    have hv₁nn : (0 : ℝ) ≤ v₁ := hv₁
    nlinarith [sq_nonneg α]
  · have hα2 : α ^ 2 > 0 := sq_pos_of_pos hα
    nlinarith

/-- **Proposition 8 (Trajectory separation).**
    Under Var(beta) > 0 and alpha > 0:
    sigma_tau = h(Var(beta)) > h(0) = sigma_r.

    Paper: converts A6 from assumption to derived result.
    The key primitive is heterogeneous complementarity (Var(beta) > 0). -/
theorem trajectory_separation (σ₀ α var_β : ℝ)
    (_hσ₀ : σ₀ > 0) (hα : α > 0) (hvar : var_β > 0) :
    noise_fn σ₀ α var_β > noise_fn σ₀ α 0 := by
  apply noise_fn_strictMono_on σ₀ α hα
  · simp [Set.mem_Ici]
  · simp [Set.mem_Ici]; linarith
  · linarith

end
