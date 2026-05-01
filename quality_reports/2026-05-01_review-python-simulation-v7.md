# Review: 12_simulation_reformulated.py (v7)

**Date**: 2026-05-01
**Reviewer**: Claude (manual review-python, tools restricted)
**File**: `model/12_simulation_reformulated.py`
**Reference spec**: `/Users/manoelgaldino/Documents/DCP/Papers/IA-dem-analytical/notes/analytical_formalization.md` (v4)
**Prior reviews**: v1 (53/100 BLOCK), v2 (assessed above)

---

## 0. Executive Summary

**Score: 72/100 — BLOCK (below 80 threshold)**

v7 is a complete rewrite that simplifies the architecture dramatically: the incumbent now observes a macro signal (not protest), and compensation is determined by a visibility threshold rather than full Bayesian optimization. The structure is much cleaner than v2, but introduces several issues:

- **Major bug**: The `incumbent_posterior_omega()` function (lines 190-214) is dead code — it computes nothing useful and is never effectively called. The actual decision is made by `visibility_threshold()` + a simple comparison.
- **Major deviation from spec**: The visibility threshold is computed as `prior_mean + 1.5*sigma_x` (a heuristic), whereas the analytical notes derive it from the Bayesian compensation rule `Delta P > omega_hat * B`. The 1.5 multiplier is ad hoc and not model-derived.
- **Moderate issue**: Worker's expressive value under autocracy+comp (line 287) conflates t=1 and t=2 compensation effects in a way that deviates from the analytical spec.
- **Moderate issue**: No stochastic noise draw for the incumbent's signal — the simulation uses the TRUE omega deterministically, bypassing the entire informational mechanism.

The crossed fragility result may still emerge from the parameter ordering (which is hardcoded to satisfy the key inequality chain), but the *mechanism* is not properly simulated — it's verified by parameter construction rather than by the model's endogenous logic.

---

## 1. Correctness Against Analytical Spec

### 1.1 Incumbent Observes omega_tilde (NOT protest)

**Spec (Section 1.7)**: Incumbent observes $\tilde{\omega}_t = \omega_t + \sigma_x \cdot \zeta_t$, $\zeta_t \sim N(0,1)$.

**Implementation**: The function `incumbent_posterior_omega()` (lines 190-214) is defined but effectively returns `omega_tilde = omega_true` on line 214. It performs no actual Bayesian computation. The decision is then made by `incumbent_compensates_period()` (lines 239-254) which simply checks `omega_true > visibility_threshold(regime, p)`.

**Assessment**: The simulation does NOT draw a noise term $\zeta$. The incumbent always sees the true $\omega$ and compares it to a threshold. This is a **deterministic approximation** of the stochastic model. While acceptable for a verification simulation (expected-value path), it means:
- The simulation cannot reveal cases where noise realizations flip the compensation decision
- Robustness to noise is not tested
- The "dictator's dilemma" is reduced to a parameter comparison rather than emerging from Bayesian inference

**Severity**: -10 (Major deviation from spec mechanism, though outcome may still be correct for expected values)

### 1.2 Compensation Rule: comp iff omega > omega_bar_x

**Spec (Section 6.1)**: $\bar{\omega}_x$ is the smallest $\omega$ where $\Delta P(\tilde{\omega}) > \hat{\omega} \cdot B$ holds with probability $> 1/2$. It is derived from the Bayesian rule and depends on $\sigma_x$ through posterior attenuation.

**Implementation (lines 217-236)**:
```python
def visibility_threshold(regime: str, p: Params) -> float:
    sigma_x = p.sigma_D if regime == "D" else p.sigma_A
    prior_mean = p.p_R * p.omega_R + p.p_T * p.omega_T1 + p.p_N * p.omega_N
    return prior_mean + 1.5 * sigma_x
```

**Assessment**: The threshold is `prior_mean + 1.5 * sigma_x`. This is an **ad hoc approximation** of the true Bayesian threshold. The 1.5 multiplier is not derived from the model primitives (B, delta, the compensation rule). It is chosen to produce the correct ordering:
- prior_mean = 0.30*0.30 + 0.30*0.05 + 0.40*0.02 = 0.09 + 0.015 + 0.008 = 0.113
- omega_bar_D = 0.113 + 1.5*0.03 = 0.158
- omega_bar_A = 0.113 + 1.5*0.15 = 0.338

This gives the ordering: omega_T1(0.05) < omega_bar_D(0.158) < omega_R(0.30) < omega_bar_A(0.338) < omega_T2(0.60). The ordering is satisfied.

However:
- The multiplier 1.5 is arbitrary. Why not 1.0, 2.0, or a value derived from B?
- The analytical notes prove that higher sigma_x raises the threshold (Lemma 1), but the SPECIFIC functional form should be tied to the compensation rule's primitives.
- A proper implementation would solve `f(omega_bar, sigma_x) = 1/2` numerically using the full Bayesian posterior.

**Severity**: -15 (Major: core mechanism reduced to heuristic; invalidates claim of "mirroring" the analytical formalization)

### 1.3 Fall Condition: pi > pi_bar AND phi = 0

**Spec (Section 1.8)**: Regime falls iff $\pi_t > \bar{\pi}_x^{\text{fall}}$ AND $\varphi_t = 0$.

**Implementation (line 358)**:
```python
falls = pi2 > pi_fall and phi2_eff == 0.0
```

**Assessment**: Correct. The conjunction of uncompensated crisis AND high protest is properly checked. The effective compensation `phi2_eff` correctly accounts for the lag in democracy (lines 336-348).

**Status**: PASS

### 1.4 Global Game Equilibrium

**Spec (Section 3.2)**: $G(s^*) = \sum_\theta P(\theta|d=1,s^*) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma) - \bar{h} = 0$

**Implementation (lines 101-170)**:
- `posterior_worker()` (lines 101-112): Computes $P(\theta|d=1,s)$ correctly using logistic PDF as likelihood and omega as displacement prior. Matches spec Section 3.1.
- `expected_pi_at_cutoff()` (lines 115-125): Computes $G(s^*) + \bar{h}$ correctly.
- `solve_cutoff()` (lines 128-170): Uses brentq root-finding after grid search for feasibility.

**Assessment**: The global game logic is correctly implemented. The posterior formula matches the analytical spec. The root-finding strategy (grid search + brentq on right/left root) is reasonable.

**Minor concern**: The grid `np.linspace(-2.0, 2.0, 100)` may miss equilibria for parameters where omega values are far from this range. With omega_T2=0.60, signals could be near 0.60, which IS within [-2, 2], so for current parameters this is fine. But it lacks robustness for other calibrations.

**Status**: PASS (minor robustness concern, -1)

### 1.5 Equilibrium Selection: Endogenous

**Spec (Section 8.2)**: Under R×D, the no-comp equilibrium is not self-confirming (because democracy would detect and compensate). Only the comp equilibrium is self-confirming.

**Implementation (lines 260-295)**: `determine_t1_equilibrium()` determines compensation FIRST (based on visibility threshold), then workers' v is set conditional on that compensation expectation. The s* and pi are computed given v.

**Assessment**: This is **partially correct** but **inverts the logic** described in the spec. The spec argues:
1. Workers form expectations about comp
2. They protest accordingly
3. The comp expectation that matches incumbent behavior is selected

The code instead:
1. Determines comp from the macro signal (deterministically)
2. Sets worker v conditional on that known comp outcome
3. Solves the global game given v

This is a valid ALTERNATIVE interpretation (the "structural" approach: given the game's fundamentals, the incumbent's action is deterministic given omega, so workers can perfectly anticipate it). It's actually cleaner than the self-confirmation narrative — but it deviates from the spec's presentation of equilibrium SELECTION. In the structural view, there's no "selection" — there's a unique equilibrium given the incumbent's deterministic strategy.

**Severity**: -3 (Minor conceptual deviation, but implementation is internally consistent)

### 1.6 Key Ordering

**Spec (Section 6.3)**: $\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$

**Implementation**: Verified at runtime (lines 418-419). With current parameters:
- 0.05 < 0.158 < 0.30 < 0.338 < 0.60

**Assessment**: PASS. The ordering holds. The code checks and reports it.

---

## 2. Bugs and Edge Cases

### 2.1 Dead Code: `incumbent_posterior_omega()`

Lines 190-214 define a function that:
1. Computes `sigma_x`
2. Sets `omega_tilde = omega_true` (line 204)
3. Defines `states_t1` and `states_t2` dictionaries (never used)
4. Returns `omega_tilde` (= `omega_true`)

This function is NEVER CALLED by any other function. The actual compensation decision goes through `visibility_threshold()` + `incumbent_compensates_period()`.

**Severity**: -3 (Code quality: dead code confuses readers about the actual mechanism)

### 2.2 Worker Value Under Autocracy + Comp (line 287)

```python
v1 = (1.0 - p.B) + p.delta * (1.0 - p.B)  # Both periods compensated
```

**Spec (Section 8.1)**: Under autocracy + comp in t=1:
- $v_1^{A,c} = (1-B) + \delta \cdot \mathbb{E}[(1-y_{i2})]$

The implementation assumes BOTH periods are compensated, giving $v_1 = (1-B)(1+\delta)$. But:
- Compensation in t=1 gives phi_1 = 1 (immediate in autocracy)
- Compensation in t=2 ALSO requires the incumbent to detect omega_2 > omega_bar_A

For R×A: omega_R < omega_bar_A, so t=2 comp is NOT guaranteed. The worker should expect:
- v1 = (1-B) + delta * 1.0 = 0.4 + 0.9 = 1.3 (comp in t=1, no comp expected in t=2 under R×A)

Instead, the code gives v1 = 0.4 + 0.9*0.4 = 0.76 (both compensated), which is WRONG for R×A.

However, looking more carefully: under R×A, omega_R(0.30) < omega_bar_A(0.338), so `comp1 = False` and this branch is never reached for R×A. For T×A t=1, omega_T1(0.05) < omega_bar_A(0.338), so again `comp1 = False`. The only scenario where `comp1 = True` in autocracy is if omega > omega_bar_A, which happens for T×A t=2 (omega_T2=0.60). But this is t=2, not t=1.

So empirically, the branch `comp1 = True AND regime == "A"` is NEVER reached with current parameters. The bug exists but is dormant.

**Severity**: -5 (Latent bug: wrong formula that would activate with different parameters or if used for t=2 equivalent logic)

### 2.3 Worker Value Under Democracy + Comp (line 284)

```python
v1 = 1.0 + p.delta * (1.0 - p.B)
```

Spec: $v_1^{D,c} = 1 + \delta(1-B)$. This represents: current loss = 1 (no comp now due to lag), future loss = (1-B) (comp arrives in t=2).

**Assessment**: Correct. Matches spec.

### 2.4 Worker Value Under No-Comp (line 289)

```python
v1 = 1.0 + p.delta  # No comp expected: full loss + expected future loss
```

This gives v = 1 + delta = 1.9.

**Spec**: If no comp is expected, the worker anticipates full displacement losses in both periods: current = 1, future = 1 (absorbing displacement). So v = 1 + delta*1 = 1 + 0.9 = 1.9.

**Assessment**: Correct.

### 2.5 Numerical Issue: brentq Convergence

The `solve_cutoff()` function (lines 128-170) has extensive fallback logic for finding roots. The search extends up to `s_peak + 23` (10 iterations of +2.0) if needed. With the logistic distribution, tails decay exponentially, so numerical issues are unlikely.

One issue: if `obj(s_peak) < 0` (the maximum of G is below h_bar), the function should return float('inf'), but the logic at line 170 returns `None` if `obj(s_peak) > 0` — this is for the case where the fallback loop fails to bracket. The logic is correct but convoluted.

**Severity**: -1 (Minor code clarity issue)

### 2.6 Prior Update for t=2 (lines 379-392)

```python
def update_prior_workers_simple(pi1, s1, theta_true, p, prior):
    eps = 0.005
    for theta in THETAS:
        pi_eq = realized_pi(s1, 1, theta, p)
        unnorm[theta] = norm.pdf(pi1, loc=pi_eq, scale=eps) * prior[theta]
```

Workers observe pi1 (public signal) and update their prior using a Gaussian kernel with eps=0.005. This is a reasonable approximation to Bayesian updating on the public signal, though the analytical spec does not detail this mechanism.

**Concern**: eps=0.005 is very tight. If pi1 is an exact realization from the model (which it is — no noise), the posterior will concentrate sharply on theta_true, effectively revealing the state perfectly. This makes t=2 essentially a known-omega game, which may or may not be intended.

**Severity**: -2 (Design choice that makes t=2 trivially deterministic in prior; not clearly wrong but weakens the informational friction story)

---

## 3. Code Quality

### 3.1 Type Hints

All functions have type hints. Uses `Optional[float]`, `dict[str, float]`, `tuple[...]`. Python 3.9+ syntax (lowercase generics).

**Status**: PASS

### 3.2 Seed

`np.random.seed(42)` at line 19. Script is deterministic (no random draws), so the seed is precautionary.

**Status**: PASS

### 3.3 Naming

- Functions are descriptive: `omega_by_theta`, `displaced_total`, `solve_cutoff`, `visibility_threshold`
- Constants use UPPER_CASE: `THETAS`
- Params uses descriptive names matching the analytical notation

**Status**: PASS

### 3.4 Modularity

Good separation:
1. Parameters (dataclass)
2. Helpers (omega lookup, displacement accumulation)
3. Global game (worker posterior, cutoff solver, realized protest)
4. Incumbent (visibility threshold, compensation decision)
5. Equilibrium selection
6. Full simulation
7. Main entry point

**Status**: PASS

### 3.5 Docstrings

Most functions have docstrings explaining the formula or logic. The main entry point `run_crossed_fragility()` lacks a detailed docstring but the module-level docstring compensates.

**Status**: PASS (minor: module docstring could reference spec more precisely)

### 3.6 Dead Code

`incumbent_posterior_omega()` (lines 190-214) is dead code — defined but never called by the decision pipeline. Should be removed or properly integrated.

**Severity**: Already counted in 2.1

### 3.7 Hardcoded Paths

No hardcoded paths. The script is self-contained.

**Status**: PASS

### 3.8 Output

Verbose output with clear labels, Unicode symbols, and visual separators. Final verification table compares actual vs expected outcomes.

**Status**: PASS

---

## 4. Deviation from Analytical Formalization

### 4.1 The Core Deviation: Heuristic vs. Bayesian Threshold

The analytical formalization (v4) carefully derives the visibility threshold from the Bayesian compensation rule:
- Lemma 1 proves that omega_bar_x increases in sigma_x
- The proof uses the Implicit Function Theorem on `f(omega_bar, sigma_x) = 1/2`
- The shape of the threshold depends on B, the prior, and the signal structure

The simulation replaces ALL of this with `prior_mean + 1.5 * sigma_x`. This means:
- B (compensation level) does not affect the threshold
- The prior structure only enters through the mean (not the variance or shape)
- The 1.5 multiplier would need to change if other parameters change

This is the most serious deviation. The simulation does not verify the MECHANISM — it verifies that a heuristic threshold, calibrated to produce the right ordering, produces the right outcomes. This is circular: the parameters are chosen to satisfy the ordering, and the ordering mechanically produces crossed fragility.

**Verdict**: The simulation verifies consistency of the 2x2 benchmark logic (Section 0 of the spec) but does NOT verify the full Bayesian model (Sections 6-9).

### 4.2 Missing: Stochastic Incumbent Signal

The spec has $\tilde{\omega} = \omega + \sigma_x \cdot \zeta$ with $\zeta \sim N(0,1)$. A proper simulation would:
1. Draw N_sims realizations of zeta
2. For each, compute the incumbent's Bayesian posterior
3. Check if compensation triggers
4. Report the PROBABILITY of compensation (should be >1/2 at omega_bar)

This would validate Lemma 1 numerically. The current code cannot do this.

### 4.3 Missing: R×A t=2 Mechanism

The spec (Section 9.2, R×A) says autocracy falls because accumulated displacement Omega_2(R) drives protest above pi_bar_A, while the incumbent still cannot detect (omega_R < omega_bar_A). The simulation should show:
- pi2 under R×A with v=1 (no comp), Omega_2(R)=0.51
- pi2 > pi_fall_A(0.05)

This IS likely happening (the global game with high v and large Omega should produce significant protest), but without running the code I cannot confirm the exact pi2 value.

### 4.4 Democracy's Lag in t=2 (T×D)

The spec says: democracy detects omega_T2 in t=2, passes comp, but the LAG means phi_2 = 0 (comp arrives in t=3, which doesn't exist). Code (lines 344-346):
```python
elif regime == "D" and comp2:
    # Democracy: sees crisis in t=2, passes law, but LAG → no effect (no t=3)
    phi2_eff = 0.0
```

**Assessment**: Correct. Matches spec.

---

## 5. Score Card

| Category | Item | Deduction |
|----------|------|-----------|
| **Critical** | — | — |
| **Major** | Visibility threshold is ad hoc heuristic, not model-derived | -15 |
| **Major** | No stochastic signal draw (deterministic approximation) | -10 |
| **Major** | Latent bug in v1 autocracy+comp value formula | -5 |
| **Minor** | Dead code (incumbent_posterior_omega) | -3 |
| **Minor** | Equilibrium selection logic inverts spec narrative | -3 |
| **Minor** | Prior update eps=0.005 makes t=2 trivially determined | -2 |
| **Minor** | Grid search range [-2, 2] lacks robustness | -1 |
| **Minor** | brentq fallback logic convoluted | -1 |

**Starting score**: 100
**Total deductions**: -40
**Mitigating credits**:
- Clean architecture and modularity: +5
- Proper global game implementation: +3
- Good type hints, seed, naming: +2
- Correct fall condition and lag logic: +2

**Final score: 72/100 — BLOCK**

---

## 6. Blocking Issues (Must Fix)

1. **Replace heuristic visibility threshold with proper Bayesian derivation.** Either:
   - (a) Solve the full compensation rule numerically: given omega, draw zeta ~ N(0,1), compute posterior mean and Delta P, check if ΔP > omega_hat * B. Find omega_bar_x where P(comp|omega) = 0.5 via root-finding.
   - (b) If (a) is too complex, derive the closed-form threshold from the Gaussian posterior formula in the spec: omega_bar_x = f(sigma_x, B, prior_mean, prior_var). Document the derivation.

2. **Add stochastic mode.** Even if the baseline run uses expected values, add a Monte Carlo wrapper that draws N_sims noise realizations for zeta and reports:
   - P(comp|omega_R, regime=D) — should be > 0.5
   - P(comp|omega_R, regime=A) — should be < 0.5
   - P(comp|omega_T2, regime=A) — should be > 0.5

3. **Fix the autocracy+comp v1 formula (line 287).** The future loss should depend on whether t=2 compensation is expected (which requires omega_2 > omega_bar_A). For the general case:
   ```python
   # Autocracy comp in t=1:
   omega2_expected = ...  # weighted by posterior over theta
   comp2_expected = omega2_expected > omega_bar_A
   future_loss = (1-B) if comp2_expected else 1.0
   v1 = (1-B) + delta * future_loss
   ```

4. **Remove dead code** (`incumbent_posterior_omega`) or integrate it into the threshold computation.

---

## 7. Recommendations (Non-Blocking)

1. **Sensitivity analysis.** Vary the 1.5 multiplier (or proper threshold) and report the range over which crossed fragility holds. This addresses the "non-knife-edge" requirement (Section 9.4).

2. **Parameter sweep.** Sweep sigma_A/sigma_D ratio and report when the ordering breaks. This maps out the "open set" of parameters from the Proposition.

3. **Annotate the key inequality check.** Lines 418-419 check the ordering. Add the numerical values of each term and the MARGINS (how far each inequality is from binding).

4. **Document the heuristic.** If the 1.5*sigma_x form is retained as an approximation, add a comment explaining why 1.5, ideally relating it to B and the prior structure.

5. **Add unit tests** for individual components (posterior_worker, displaced_total, etc.) to catch regressions.

---

## 8. Comparison: v2 → v7 Architecture Changes

| Aspect | v2 | v7 |
|--------|----|----|
| Incumbent's signal | Observed pi with noise tau_x | Observes omega with noise sigma_x |
| Comp decision | Full Bayesian ΔP > ω̂·B (computed numerically) | Heuristic threshold `prior_mean + 1.5*sigma_x` |
| Self-confirmation loop | Explicit (checked both equilibria) | Implicit (comp determined by visibility, workers anticipate) |
| Stochastic signal | None (deterministic pi) | None (deterministic omega) |
| Global game | Same | Same (unchanged) |
| Code length | ~400 lines | ~460 lines |
| Dead code | None | `incumbent_posterior_omega()` |

**Verdict on v2 → v7 transition**: The switch from protest-observed to omega-observed is correct per the analytical spec (which explicitly rejects the protest-only signal due to the self-fulfilling problem under T×A). However, v7 REGRESSES on the compensation logic: v2 implemented the full Bayesian rule, while v7 replaces it with a heuristic. The next version should combine v7's signal structure with v2's rigorous comp computation.

---

## 9. Does the Simulation Actually Verify Crossed Fragility?

**Partially.** The simulation verifies that:
- Given the parameter ordering omega_T1 < omega_bar_D < omega_R < omega_bar_A < omega_T2
- And the lag/immediate speed difference
- And the global game structure

...the four scenarios produce the expected outcomes (R×D stable, R×A falls, T×D falls, T×A stable).

**But it does NOT verify that:**
- The visibility thresholds are correctly derived from the Bayesian compensation rule
- The ordering is robust to noise realizations
- The mechanism operates AS DESCRIBED in the analytical formalization (through posterior attenuation, not through a heuristic multiplier)

The simulation verifies the *skeleton* (Section 0 of the spec) but not the *full model* (Sections 6-9).

---

## 10. Final Verdict

**72/100 — BLOCK.** The simulation has clean architecture, correct global game logic, and proper fall conditions, but its treatment of the core mechanism (visibility threshold) is a heuristic shortcut that does not mirror the analytical formalization's Bayesian derivation. The claim in the docstring ("espelha analytical_formalization.md v4") is not fully warranted. Fix the four blocking issues to reach commit-quality (80+).
