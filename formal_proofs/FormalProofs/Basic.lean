/-
  Formal Proofs — AI Automation, Regime Type, and Crossed Fragility

  This module contains formalizations of the results
  presented in the paper.

  Structure:
  - Section 1: Definitions and basic types
  - Section 2: Baseline results (P1-P4)
  - Section 3: Extension results (P5-P7)
  - Section 4: Coordination lemmas (L1-L2)

  Results to formalize (from paper.Rmd):
  - Lemma 1: Unique cutoff equilibrium (coordination game)
  - Lemma 2: Noise comparative statics (pi* decreasing in sigma)
  - Proposition 1: Democratic fragility pattern (stable under rapid, unstable under threshold)
  - Proposition 2: Autocratic fragility pattern (iff conditions on kappa_0)
  - Proposition 3: Crossed fragility (kappa_0 in [kappa_bar, kappa_bar/eta_r))
  - Proposition 4: Welfare cost of autocratic stability (gap = kappa_bar)
  - Proposition 5: Welfare state as insurance (phi_0 >= phi_bar => stable)
  - Proposition 6: Functional equivalence with welfare gap
  - Remark 1: Threshold of thresholds (L* = kappa_0 + |Delta|)
  - Remark 2: Width of crossed interval (kappa_bar(1-eta_r)/eta_r)
-/

import Mathlib

-- ===========================================================================
-- Section 1: Definitions
-- ===========================================================================

-- Parameters of the model
structure ModelParams where
  w_E : ℝ       -- baseline income of exposed workers
  W : ℝ         -- total per capita output
  L : ℝ         -- magnitude of automation shock
  θ : ℝ         -- share of output captured by E under regime change
  k : ℝ         -- cost of transition
  κ₀ : ℝ        -- standing repressive capacity
  η_r : ℝ       -- repressive effectiveness under rapid (degraded)
  β : ℝ         -- complementarity gain under threshold t=1
  φ₀ : ℝ        -- standing compensatory capacity (extension)
  -- Parameter restrictions
  h_W : W > w_E
  h_L_pos : L > 0
  h_L_bound : L ≤ w_E
  h_θ : 0 < θ ∧ θ < 1
  h_k : k > 0
  h_κ₀ : κ₀ > 0
  h_η_r : 0 < η_r ∧ η_r < 1
  h_β : β ≥ 0
  h_φ₀ : φ₀ ≥ 0

-- Derived quantities
noncomputable def Δ (p : ModelParams) : ℝ := p.θ * p.W - p.k - p.w_E
noncomputable def φ_bar (p : ModelParams) : ℝ := 1 - |Δ p| / p.L
noncomputable def κ_bar (p : ModelParams) : ℝ := p.L - |Δ p|

-- Assumptions
def A1 (p : ModelParams) : Prop := Δ p < 0
def A2 (p : ModelParams) : Prop := Δ p + p.L > 0

-- ===========================================================================
-- Section 2: Setup verification
-- ===========================================================================

-- Verify the setup compiles
theorem setup_test : 1 + 1 = 2 := by norm_num
