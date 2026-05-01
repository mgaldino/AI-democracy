# Review: 12_simulation_reformulated.py (v2)

**Date**: 2026-05-01
**Reviewer**: Claude (manual review-python, tools restricted)
**File**: `model/12_simulation_reformulated.py`
**Reference spec**: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`
**Prior review**: `quality_reports/2026-05-01_review-python-simulation.md` (v1, score 53/100 BLOCK)

---

## 0. V1 Issues — Resolution Status

| V1 Issue | Severity | Resolved in v2? | Notes |
|----------|----------|-----------------|-------|
| Incumbent used ad-hoc thresholds (0.10/0.25), not model-derived Bayes | -30 | **YES** | Now uses `incumbent_compensates()` with full Bayesian ΔP > ω̂·B rule (lines 254-312). |
| Prior update was heuristic (pi > 0.15 binary switch) | -30 (part of above) | **YES** | Now uses `update_prior_workers()` (lines 195-219) and `update_prior_incumbent()` (lines 222-247) with proper Bayesian likelihood. |
| No seed | -10 | **YES** | `np.random.seed(42)` at line 19. Note: script is deterministic (no stochastic code), so seed is belt-and-suspenders. |
| No type hints | -5 | **YES** | All functions have type hints (float, str, int, Optional, dict, tuple, bool). |
| max_E_pi used prior instead of posterior | -5 (v1) | **PARTIAL** | Line 148-149: uses `expected_pi_at_cutoff(s_low=-5.0, ...)` which does compute the posterior at s=-5 and uses posterior-weighted Ω. This is correct in principle. However, s=-5 may not be extreme enough for all parameter configurations (see item 3.3 below). |

**Summary**: All four critical/major v1 issues are resolved. Major improvement.

---

## 1. Correctness: Incumbent Decision (comp iff ΔP > ω̂·B)

### 1.1 Bayesian Inference (lines 222-247)

The incumbent observes π₁ (with noise τ_x) and updates:

```
P(θ | π̃₁) ∝ N(π̃₁; π₁^eq(θ), τ_x²) · P(θ)
```

Implementation in `update_prior_incumbent()`:
- For each θ, computes `pi_eq = realized_pi(s_star_1, 1, theta, p)` — the equilibrium protest under that θ.
- Likelihood: `norm.pdf(pi1, loc=pi_eq, scale=sigma_obs)` where `sigma_obs = max(tau, 0.001)`.
- Normalizes. Falls back to prior if total < 1e-300.

**Assessment**: Correct. The Gaussian likelihood with τ_x as noise is a clean approximation. The `max(tau, 0.001)` guard prevents division by zero when τ_D ≈ 0. The dictator's dilemma emerges naturally: τ_A = 0.10 >> τ_D = 0.01, so the autocrat's likelihood is flatter and updating is weaker.

**One concern**: The incumbent observes `pi1` (the REALIZED protest given true θ), not `pi1 + noise`. The noise τ_x is used in the likelihood (as observation noise), not added to the observation. This is correct Bayesian formulation: the incumbent's observation model is π̃₁ = π₁^true + ε where ε ~ N(0, τ²). Given that the script passes the true π₁ as the observed value, this means the incumbent happens to observe the true value (no noise realization drawn). For a deterministic simulation (not Monte Carlo), this is acceptable — it represents the expected-value path. But it slightly overstates the autocrat's information (the noise is only in the likelihood width, not in the observation itself). **Minor issue, not a bug.**

### 1.2 Compensation Decision (lines 254-312)

```python
def incumbent_compensates(...) -> tuple[bool, dict]:
```

Steps:
1. Updates beliefs via `update_prior_incumbent` → `post_inc`.
2. Computes ω̂ = E[ω₁ | posterior] = Σ post_inc[θ] · ω(θ,t=1).
3. Cost = ω̂ · B.
4. Computes workers' updated prior (they observe π₁ without noise).
5. Solves t=2 equilibrium under comp (v=1-B) and no-comp (v=1).
6. Computes P(survive | comp) and P(survive | no comp) using incumbent's posterior.
7. ΔP = P(survive|comp) - P(survive|no).
8. Compensates iff ΔP > cost.

**Assessment**: This faithfully implements the spec's rule: comp iff ΔP > ω̂·B. The computation of ΔP is correct — it integrates over the incumbent's uncertainty about θ using the posterior.

**Issue 1.2a — Survival is binary, not smooth**: Lines 298-299 use a hard indicator `1.0 if pi2_comp < pi_fall else 0.0`. This is faithful to the spec (regime falls iff π > π̄), but makes ΔP a discontinuous function of parameters. For sensitivity analysis, a smooth approximation (e.g., sigmoid around π̄) would be more robust numerically. **Design choice, not a bug.**

**Issue 1.2b — Workers' prior for t=2**: Line 280 calls `update_prior_workers(pi1, s_star_1, 0, C_x, p, prior)` with `v=0`. The v and C_x arguments are passed but not used in the updating function (which only uses pi1 and s_star_1). This is confirmed: `update_prior_workers` at line 195 takes `t1_v` and `C_x` as arguments but never uses them. **Dead parameters — minor code smell, -1.**

---

## 2. Correctness: Prior Update (Bayesian, not heuristic)

### 2.1 Workers' Update (lines 195-219)

Workers observe π₁ publicly and compare against equilibrium predictions:

```
P(θ | π₁) ∝ N(π₁^obs; π₁^eq(θ), ε²) · P(θ)
```

With ε = 0.005 (small smoothing).

**Assessment**: This is a clean numerical implementation of Bayesian updating. The small ε prevents exact-match degeneracy (since π₁^eq(θ) for different θ may be very close, especially under threshold where ω_L states produce similar low protest). The Gaussian kernel is appropriate as a smooth approximation to the deterministic mapping.

**Issue 2.1a — ε = 0.005 is hardcoded**: Should ideally scale with the range of π values or be a named constant. Not critical, but a magic number. **Minor, -1.**

### 2.2 Incumbent's Update (lines 222-247)

Uses τ_x as the noise scale instead of ε. Same structure.

**Assessment**: Correct and consistent with the spec. The key asymmetry (τ_A >> τ_D) is preserved.

---

## 3. Remaining Bugs and Issues

### 3.1 Equilibrium Selection (lines 349-373) — NEW COMPLEXITY

V2 introduces a sophisticated equilibrium selection mechanism for t=1. Two candidate equilibria are computed (with and without expected compensation), and consistency is checked.

| Case | Selection | Assessment |
|------|-----------|------------|
| Neither consistent | No comp | Correct default |
| Both consistent | D→comp, A→no comp | Focal point selection. Reasonable but ad-hoc. |
| comp_no (inconsistent) | Uses no-comp eq but sets comp1=True | **ISSUE**: Line 368 sets `comp1=True` but uses `s1_no` and `pi1_no`. This means workers played the no-comp equilibrium (high v → more protest) but the incumbent compensates anyway. The diagnostic dict is `diag_no`, computed under the no-comp equilibrium. This is an inconsistent equilibrium — the comment at lines 365-368 acknowledges this. The choice to "use what the incumbent says" is pragmatic but not model-consistent. |
| comp_with but not comp_no | Comp eq | Correct — unique consistent equilibrium. |

**Issue 3.1a — Inconsistent equilibrium selection**: The case at line 363-368 (comp when not expected) produces an equilibrium where workers' expectations don't match the incumbent's action. In the formal model, this case should be handled differently (either exclude it or iterate to a fixed point). **Major conceptual issue, -5.**

### 3.2 Posterior Worker Signal (lines 88-105)

```python
def posterior_worker(s, t, p, prior) -> dict[str, float]:
    P(θ | d=1, s) ∝ ω(θ) · f((s-ω(θ))/σ) · prior(θ)
```

**Assessment**: Conditions on d=1 (displaced). The ω(θ) factor is the Bernoulli likelihood P(d=1|θ). Correct.

**Issue 3.2a**: This function is only ever called inside `expected_pi_at_cutoff` (line 116), which is the marginal worker's belief at the cutoff signal. The function conditions on d=1 but the docstring doesn't clarify that this is the DISPLACED worker's posterior. Since only displaced workers protest (by model), this is correct. But the function name `posterior_worker` could be `posterior_displaced_worker` for clarity. **Naming, -1.**

### 3.3 max_E_pi Approximation (line 148-149)

```python
s_low = -5.0
max_E_pi = expected_pi_at_cutoff(s_low, t, p, prior)
```

This approximates the case s* → -∞ (everyone protests) by evaluating at s = -5. For σ = 0.15 and ω in [0.05, 0.40], the standardized value is (ω - s)/σ ≈ (0.4 - (-5))/0.15 ≈ 36. At this point F ≈ 1, so the approximation is excellent for baseline parameters. But for σ > 1 or ω_H > 2, this could underestimate. **OK for current parameterization; fragile for extreme sweeps. Minor, -1.**

### 3.4 Forward-looking v in t=1 (lines 334-335)

```python
v1_no_comp = 1.0 + p.delta          # expects phi_2=0
v1_with_comp = 1.0 + p.delta * (1.0 - p.B)  # expects phi_2=1
```

**Spec check**: v_i = (1 - y_{it}) + δ · E[(1 - y_{i,t+1}) | d, s]

For a displaced worker in t=1 without comp: y_{i1} = 0, so (1-y_{i1}) = 1. Expected future loss: E[(1-y_{i,t+1})] depends on E[d_{i2}|d_{i1}=1] and E[φ₂].

With absorptive displacement: d_{i1}=1 → d_{i2}=1 (certain). So E[(1-y_{i2})] = 1 - B·φ₂.

- No comp: v = 1 + δ·1 = 1 + δ. **Correct.**
- With comp: v = 1 + δ·(1-B). **Correct.**

### 3.5 Sensitivity Analysis (lines 503-532)

The C_A sweep only varies C_A, keeping all other params at default (via `Params(C_A=round(C_A, 1))`). This is correct — the dataclass provides defaults for all other fields.

**Issue 3.5a**: The function creates a new `Params` object for each C_A value but ignores the `p` argument's non-default values. If the user customized `p` before calling `sensitivity_C_A(p)`, only C_A would vary — all other params would reset to defaults. **Bug — should copy p's values. -3.**

### 3.6 No __main__ Guard for Imports

The script runs simulation at import time if imported as a module (lines 535-538 are inside `if __name__ == "__main__":`). **Actually, it IS guarded. Correct.**

### 3.7 Dead Parameter in update_prior_workers

As noted in 1.2b, `t1_v` and `C_x` are accepted but unused. **-1.**

---

## 4. Alignment with Formal Model Specification

| Spec Element | Implemented? | Fidelity | Notes |
|--------------|-------------|----------|-------|
| θ ∈ {R, T, N} | Yes | Correct | Three states properly handled |
| (ω₁,ω₂)\|θ deterministic | Yes | Correct | omega_by_theta returns correct values |
| Absorptive displacement Ω₂ | Yes | Correct | `displaced_fraction` formula matches spec |
| Logistic F | Yes | Correct | scipy.stats.logistic |
| h(π) = π (linear) | Yes | Correct | h_bar = 1 - v/C_x |
| v_i forward-looking (δ) | Yes | Correct | v1 = 1 + δ·E[loss_{t+1}] |
| Worker posterior (Bayesian) | Yes | Correct | Conditions on d=1, proper likelihood |
| Worker prior update t=2 (Bayesian) | Yes | Correct | Gaussian kernel around equilibrium π |
| Incumbent inference (Bayesian + τ noise) | Yes | Correct | Dictator's dilemma emerges from τ_A >> τ_D |
| comp iff ΔP > ω̂·B | Yes | Correct | Full derivation with posterior-weighted ΔP |
| Speed asymmetry (democracy lag) | Yes | Correct | φ₂ lag via equilibrium selection and v computation |
| π̄_x^fall institutional | Yes | Correct | pi_fall_D > pi_fall_A |
| Equilibrium uniqueness | Not checked | — | No monotonicity verification |
| Employed workers protest via δ | No | Missing | Only displaced workers enter the protest calculation. Spec mentions v_i = δ·E[ω₂] for employed. Second-order per spec ("efeito de segunda ordem"), so acceptable omission. |
| γ (backward-looking) | Correctly absent | — | Removed from baseline per spec |
| Sensitivity analysis | Partial | C_A only | Spec doesn't mandate others, but B, σ, delta sweeps would be useful |

---

## 5. Code Quality

| Dimension | Score | Notes |
|-----------|-------|-------|
| Structure | Excellent | Clean separation: params → helpers → equilibrium → updating → incumbent → simulation → sensitivity |
| Type hints | Good | Present on all functions. Return types included (Optional, tuple, dict). |
| Docstrings | Good | All key functions documented. Mathematical formulas in docstrings. |
| Naming | Good | Descriptive. Minor: `posterior_worker` could be `posterior_displaced_worker`. |
| Dataclass usage | Good | Clean parameter bundle with sensible defaults. |
| Seed | Present | Line 19. Deterministic script, so this is precautionary. |
| Diagnostics | Excellent | `incumbent_compensates` returns full diagnostic dict — very useful for debugging and verification. |
| Output formatting | Good | Clean formatted output with Unicode symbols. Sensitivity table is readable. |
| Error handling | Adequate | Fallbacks for degenerate posteriors (< 1e-300). No crashes expected for baseline params. |

---

## 6. Summary Score

Starting from 100:

| Deduction | Reason | Severity |
|-----------|--------|----------|
| -5 | Inconsistent equilibrium case (line 363-368): workers expect no-comp but incumbent compensates. Not iterated to fixed point. Conceptual issue in edge case. | Major |
| -3 | `sensitivity_C_A` resets all params to default instead of copying from input `p` | Major |
| -1 | Dead parameters in `update_prior_workers` (t1_v, C_x unused) | Minor |
| -1 | ε = 0.005 hardcoded magic number (line 209) | Minor |
| -1 | `posterior_worker` name doesn't indicate conditioning on d=1 | Minor |
| -1 | s_low = -5.0 hardcoded; fragile for non-baseline σ | Minor |

**Score: 88/100 — COMMIT (with recommendations)**

---

## 7. Comparison with V1

| Metric | V1 | V2 | Change |
|--------|----|----|--------|
| Score | 53/100 (BLOCK) | 88/100 (COMMIT) | +35 |
| Incumbent decision | Ad-hoc thresholds | Model-derived ΔP > ω̂·B | Fixed |
| Prior update | Heuristic (pi > 0.15) | Bayesian (Gaussian kernel) | Fixed |
| Seed | Missing | Present | Fixed |
| Type hints | Missing | Present | Fixed |
| max_E_pi | Used prior weights | Uses posterior at s=-5 | Fixed |
| Equilibrium selection | Simple | Sophisticated (consistency check) | Improved but introduces edge case |

---

## 8. Recommendations (priority order)

1. **Fix sensitivity_C_A to preserve input params**: Replace `Params(C_A=round(C_A, 1))` with a copy that only overrides C_A:
   ```python
   from dataclasses import replace
   p_test = replace(p, C_A=round(C_A, 1))
   ```

2. **Handle inconsistent equilibrium case (line 363-368)** more rigorously: either iterate to a fixed point (workers' expectations match incumbent's action) or document the assumption. Currently, workers play the no-comp equilibrium but the incumbent compensates — this is not self-consistent.

3. **Name ε as a constant**: `BAYES_SMOOTHING_EPS = 0.005` at module level with a comment explaining its role.

4. **Add monotonicity check**: After solving the cutoff, verify that `expected_pi_at_cutoff` is decreasing in s (ensuring uniqueness). This is cheap and would catch parameter configurations where the global game has multiple equilibria.

5. **Consider adding B and sigma sensitivity sweeps**: C_A alone is informative but the model's robustness depends on the interaction of multiple parameters.

6. **Clean dead parameters**: Remove `t1_v` and `C_x` from `update_prior_workers` signature, or document why they're there for future use.

7. **Rename `posterior_worker` to `posterior_displaced_worker`**: Clarifies the conditioning on d=1.

---

## Verdict

Major improvement from v1. The script now faithfully implements the formal model's core mechanism: Bayesian incumbent inference with the dictator's dilemma emerging from τ_A >> τ_D, and the compensation rule comp iff ΔP > ω̂·B derived from model primitives. The worker-side global game was already correct in v1 and remains so. The prior update is now proper Bayesian updating, not a heuristic. Type hints and seed are in place.

The remaining issues are minor (dead parameters, magic constants, naming) except for the equilibrium selection edge case (inconsistent equilibrium at line 363-368) and the sensitivity function bug. Neither blocks the simulation from serving as numerical verification of the formal model for the baseline parameterization.

**Recommendation**: Commit. Fix the two major items (sensitivity params, equilibrium iteration) before using for paper figures or appendix tables.
