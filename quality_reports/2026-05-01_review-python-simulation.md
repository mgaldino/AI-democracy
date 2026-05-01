# Review: 12_simulation_reformulated.py

**Date**: 2026-05-01
**Reviewer**: Claude (manual review-python, tools restricted)
**File**: `model/12_simulation_reformulated.py`
**Reference spec**: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`

---

## 1. Correctness of Numerical Methods

| Item | Status | Notes |
|------|--------|-------|
| Root-finding (brentq) | OK | Correct algorithm for monotone objectives. Tolerance 1e-10 is fine. |
| Logistic CDF/PDF | OK | Uses scipy.stats.logistic — correct standard implementation. |
| Bracket expansion | MINOR ISSUE | Loop `while objective(a) < 0 and a > -10` expands bracket to [-10, 10]. This may be insufficient if parameters push the cutoff beyond this range (e.g., very low sigma). Safe for baseline params but fragile for sensitivity sweeps. |
| Dominance region detection | OK | Correctly checks hbar <= 0 (all protest) and max_E_pi < hbar (no one protests). |
| max_E_pi computation (line 167-175) | BUG | Uses `prior_theta` (the prior) instead of computing the posterior-weighted limit. When s* -> -inf, E[pi] should be sum over theta of posterior(theta|s=-inf)*Omega(theta), not prior*Omega. In practice, as s*->-inf, posterior concentrates on highest-omega state, so using prior underestimates max feasible E[pi]. May cause false "no equilibrium" in edge cases. |

## 2. Code Quality

| Dimension | Score | Notes |
|-----------|-------|-------|
| Structure | Good | Clean separation: params, helpers, equilibrium solver, incumbent, simulation, sensitivity. |
| Naming | Good | Descriptive names (omega1_by_theta, compute_realized_pi). Minor: `Omega2` is both a function and a variable name (line 81 vs 135). |
| Modularity | Good | Functions are appropriately scoped. Could extract "consistency check" block (lines 355-368) into a function. |
| Dataclass usage | Good | Clean parameter bundle. |
| Docstrings | Adequate | Present on all key functions. Some could be more precise about return types. |
| Type hints | Missing | No type hints on function signatures. (-5 per rubric) |

## 3. Potential Bugs and Edge Cases

| Issue | Severity | Location | Description |
|-------|----------|----------|-------------|
| Posterior fallback | Minor | Line 114-116 | Fallback to uniform when total < 1e-300 is numerically sound but semantically questionable — could mask parameter configurations where no state produces nonzero likelihood. |
| Division by zero in h_bar | CRITICAL if C_x=0 | Line 58 | `1.0 - v / C_x` — if C_x = 0 (unrealistic but defensively: no guard). Params ensure C_x > 0, so not triggered. |
| np.random in incumbent_decides | Design issue | Line 256 | Stochastic function without seed. The deterministic version is used in the main flow, so this is dead code in practice. But if called, results are not reproducible. (-10 per rubric) |
| Prior update heuristic (t=2) | MAJOR | Lines 414-422 | Hard-coded threshold `pi1 > 0.15` to choose between two fixed posteriors. This is NOT Bayesian updating — it's a discrete heuristic that does not scale with parameters. The spec says "prior atualizado para t=2 (apos observar pi_1)" via Bayes, not a binary switch. Undermines model fidelity. |
| Incumbent threshold hard-coded | MAJOR | Lines 276-279, 298-305 | Fixed `comp_threshold = 0.10` (D) and `0.25` (A). The spec derives `comp iff DeltaP > omega_hat * B` from Bayesian inference. The simulation skips this derivation entirely and uses ad-hoc constants. Results depend on these magic numbers, not on model primitives. |
| omega2_by_theta for T and R identical | By design | Line 63-64 | Both return omega_H. Correct per spec (threshold hits in t=2). |
| Float('inf') comparisons | Safe | Lines 178, 222 | Python handles float('inf') comparisons correctly. |

## 4. Alignment with Formal Model Specification

| Spec element | Implemented? | Fidelity |
|--------------|-------------|----------|
| Three states theta in {R, T, N} | Yes | Correct |
| Absorptive displacement Omega2 | Yes | Correct formula |
| Logistic F, h(pi)=pi | Yes | Correct |
| v_i forward-looking (delta) | Partial | t=1 v is correct. t=2 v = 1-B*phi2 correct. But no "fear of future" for employed workers. |
| Incumbent: comp iff DeltaP > omega_hat*B | NO | Replaced by hard-coded thresholds. Major deviation from spec. |
| Bayesian updating P(theta|pi) by incumbent | NO | Replaced by heuristic (pi > 0.15 switches between fixed posteriors). |
| Speed asymmetry (democracy lag) | Partial | Implemented via phi2 assignment, but only tested in equilibrium consistency check for t=1. |
| pi_fall as institutional parameter | Yes | Correct (pi_fall_D > pi_fall_A). |
| Posterior for worker signals | Yes | Correct Bayesian computation (lines 91-117). |
| Sensitivity analysis | Yes | C_A sweep present. |

## 5. Summary Score (per quality-gates.md rubric)

| Deduction | Reason |
|-----------|--------|
| -30 | Bug in domain: incumbent decision uses ad-hoc thresholds, not model-derived rule |
| -10 | Seed missing (np.random used without set.seed in incumbent_decides) |
| -5 | No type hints |
| -2 | Magic numbers (0.15, 0.10, 0.25, 0.08, 0.30) without derivation or parametric justification |

**Score: 53/100 — BLOCK**

## 6. Recommendations (priority order)

1. **Replace incumbent heuristics with model-derived rule.** Implement the actual Bayesian inversion: incumbent observes pi, inverts pi*(omega) to infer omega_hat, computes DeltaP, and compares to omega_hat*B. This is the core mechanism (dictator's dilemma) and skipping it invalidates the simulation as a verification of the formal model.

2. **Replace hard-coded prior update in t=2** (line 414-422) with proper Bayesian updating P(theta | pi_1) using the equilibrium mapping. Even an approximate numerical inversion would be better than a binary switch at 0.15.

3. **Add np.random.seed()** at script entry or remove stochastic incumbent function (it is unused in the main flow).

4. **Add type hints** to all function signatures.

5. **Fix max_E_pi computation** (line 167-175): use posterior-weighted Omega values, not prior-weighted, for the dominance check.

6. **Widen bracket search** or add a warning when brentq bounds are hit at [-10, 10].

---

## Verdict

The script correctly implements the worker-side global game (posterior computation, equilibrium cutoff via brentq, realized protest) but **critically deviates from the formal model on the incumbent side**. The two hard-coded heuristics (prior update and compensation threshold) mean the simulation does not actually verify the paper's mechanism. The crossed fragility result may hold for the chosen magic numbers but is not demonstrated as a consequence of the model's primitives. Before using this simulation as evidence for the paper, the incumbent decision must be derived from model parameters.
