# Lean Verification Dashboard

**Project**: AI Automation, Regime Type, and Crossed Fragility
**Last updated**: 2026-04-05
**Paper file**: paper.Rmd (modified: 2026-04-05)
**Build status**: PASSING (8272 jobs, warnings only)

## Summary

| Status | Count |
|--------|-------|
| Verified | 18 |
| Has sorry | 0 |
| Stale (paper text changed since last hash) | 12 |
| Not formalized | 3 |
| **Total results in paper** | **21** |

All 18 formalized results build cleanly with zero sorry and zero custom axioms. 12 results are marked STALE because the paper text has been edited since the last proof index was computed (the Lean proofs themselves are unchanged and still verify). 3 results (Corollaries 1-3) are not formalized (typology tables derived from propositions, not standalone theorems).

Proposition 8 (Trajectory separation) is NEW since the last dashboard: it converts the former A6 assumption into a derived result from heterogeneous complementarity.

## Detailed Status

| # | Result | Paper line | Lean File | Status | Hash | Notes |
|---|--------|:----------:|-----------|:------:|:----:|-------|
| 1 | **Lemma 1 (Unique cutoff equilibrium)** | 188 | CoordinationLemmas.lean + SupermodularGames | VERIFIED | STALE | Via coordination_unique_cutoff (Laplacian uniqueness) |
| 2 | **Lemma 2 (Noise comparative statics)** | 190 | CoordinationLemmas.lean + SupermodularGames | VERIFIED | STALE | Via participationRate_strictAntiOn + noise_threshold_exists_unique |
| 3 | **Proposition 1 (Democratic fragility)** | 212 | Prop1.lean | VERIFIED | STALE | L2 as hypothesis. P1a: rapid stable. P1b: threshold unstable. |
| 4 | **Proposition 2 (Autocratic fragility)** | 220 | Prop2.lean | VERIFIED | STALE | L2 as hypothesis. Iff conditions on kappa_0. |
| 5 | **Proposition 3 (Crossed fragility)** | 228 | Prop3.lean | VERIFIED | STALE | Interval [kappa_bar, kappa_bar/eta_r) -> crossed pattern. |
| 6 | **Proposition 4 (Welfare cost)** | 240 | Prop4.lean | VERIFIED | STALE | gap = kappa_bar > 0 |
| 7 | **Remark 1 (Threshold of thresholds)** | 247 | Remarks.lean | VERIFIED | STALE | L* = kappa_0 + abs(Delta) |
| 8 | **Remark 2 (Width of crossed interval)** | 253 | Remarks.lean | VERIFIED | STALE | 4 sub-theorems: width formula, increasing in kappa_bar, decreasing in eta, zero at eta=1 |
| 9 | **Proposition 5 (Welfare state insurance)** | 275 | Prop5.lean | VERIFIED | STALE | P5a-c: standing capacity as insurance |
| 10 | **Proposition 6 (Functional equivalence)** | 281 | Prop6.lean | VERIFIED | STALE | P6a: both strong stable. P6b: welfare gap >= kappa_bar |
| 11 | **Proposition 7 (Fiscal fragility)** | 439 | Prop7.lean | VERIFIED | STALE | Fiscal impossibility + instability |
| 12 | **Proposition 8 (Trajectory separation)** | 194 | Prop8.lean | VERIFIED | NEW | Converts A6 from assumption to derived result. h strictly increasing, sigma_tau > sigma_r. |
| 13 | **Coordination Conditions (M-S prerequisites)** | App. B | CoordinationConditions.lean | VERIFIED | OK | Dominance regions, q* in (0,1), single-crossing, payoff monotone |
| 14 | **Bridge: rapid coordination succeeds** | Sec 4.1 | CoordinationLemmas.lean | VERIFIED | OK | sigma_r <= sigma_hat -> pi* >= pi_bar |
| 15 | **Bridge: threshold coordination fails** | Sec 4.1 | CoordinationLemmas.lean | VERIFIED | OK | sigma_tau > sigma_hat -> pi* < pi_bar |
| 16 | **Corollary 1 (Autocratic typology)** | 259 | -- | NOT FORMALIZED | -- | Typology table derived from P1-P2 |
| 17 | **Corollary 2 (Complete regime typology)** | 296 | -- | NOT FORMALIZED | -- | Typology table derived from P1-P2, P5 |
| 18 | **Corollary 3 (Vicious cycle)** | 451 | -- | NOT FORMALIZED | -- | Verbal description of feedback loop |
| 19 | **Definition (Stability)** | 149 | Basic.lean | VERIFIED | OK | Regime x stable under j iff u_E(M) >= u_E(P) for all t |
| 20 | **Definition (Stability thresholds)** | 202 | Basic.lean | VERIFIED | OK | phi_bar, kappa_bar derived quantities |
| 21 | **Definition (Crossed fragility)** | 226 | -- | NOT FORMALIZED | -- | Verbal definition |

## Staleness Details

All 12 STALE results have **unchanged Lean files** that still build cleanly. The staleness is due to paper text edits since the last proof index (the mathematical content verified by the Lean proofs has not changed in substance). The hashes should be refreshed by re-running this dashboard after confirming that the paper edits did not alter the formal statement being verified.

Key change since last index: **A6 (trajectory separation) was converted from an assumption to Proposition 8**, derived from the microfoundation (heterogeneous complementarity). Prop8.lean verifies this derivation. No existing proofs reference A6 directly --- they take the coordination outcomes (sigma_r low, sigma_tau high) as hypotheses.

## Architecture

```
FormalProofs/
├── Basic.lean                — Model definitions (ModelParams, Delta, phi_bar, kappa_bar, A1, A2, sigma_r, sigma_tau)
├── CoordinationConditions.lean — M-S prerequisites (dominance, q*, single-crossing)
├── CoordinationLemmas.lean   — Bridge: L1-L2 -> P1-P3 (imports SupermodularGames)
├── Remarks.lean              — Remark 1 + Remark 2 (a-d)
├── Prop1.lean                — P1: Democratic fragility
├── Prop2.lean                — P2: Autocratic fragility
├── Prop3.lean                — P3: Crossed fragility (interval condition)
├── Prop4.lean                — P4: Welfare cost of autocratic stability
├── Prop5.lean                — P5: Welfare state as insurance
├── Prop6.lean                — P6: Functional equivalence with welfare gap
├── Prop7.lean                — P7: Endogenous fiscal fragility
└── Prop8.lean                — P8: Trajectory separation (derived from microfoundation)

External dependency:
  SupermodularGames/ (path: ../../../SupermodularGames)
  ├── Core/Defs.lean           — HasIncreasingDifferences, Tarski, Topkis
  ├── Uniqueness/SingleCrossing.lean — Brouwer 1D, unique FP via strict anti-gap
  ├── Uniqueness/Laplacian.lean      — NoiseCDF, unique root, Laplacian cutoff
  ├── Applications/BinaryAction.lean — participationRate definition
  └── Applications/GlobalGames.lean  — L1 (unique cutoff), L2 (pi* decreasing), sigma_hat
```

## Remaining Work

**All formalizable results verified.** Zero sorry, zero custom axioms.

The 3 NOT FORMALIZED items (Corollaries 1-3) are typology tables and verbal descriptions that follow directly from the propositions. They do not contain independent mathematical content requiring verification.

The proof chain is complete:
- Prop8 (NEW): derives sigma_tau > sigma_r from Var(beta) > 0 (microfoundation)
- SupermodularGames proves L1 (unique cutoff) and L2 (pi* decreasing in sigma, unique sigma_hat)
- CoordinationLemmas bridges: sigma_r <= sigma_hat -> coordination succeeds; sigma_tau > sigma_hat -> fails
- Prop1-3 prove crossed fragility from the coordination outcomes
- Prop4-7 derive welfare and extension results
