# Lean Verification Dashboard

**Project**: AI Automation, Regime Type, and Crossed Fragility
**Last updated**: 2026-04-05
**Paper file**: paper.Rmd (modified: 2026-04-05)
**Build status**: PASSING

## Summary

| Status | Count |
|--------|-------|
| Verified | 17 |
| Has sorry | 0 |
| Stale (needs re-verification) | 0 |
| Not formalized | 0 |
| **Total results in paper** | **17** |

All results verified end-to-end. Lemmas 1-2 (global games) are now formalized via the external SupermodularGames library, connected through CoordinationLemmas.lean.

## Detailed Status

| # | Result | Paper line | Lean File | Status | Notes |
|---|--------|:----------:|-----------|:------:|-------|
| 1 | **Lemma 1 (Unique cutoff equilibrium)** | 186 | CoordinationLemmas.lean + SupermodularGames | **VERIFIED** | Via coordination_unique_cutoff (Laplacian uniqueness) |
| 2 | **Lemma 2 (Noise comparative statics)** | 188 | CoordinationLemmas.lean + SupermodularGames | **VERIFIED** | Via participationRate_strictAntiOn + noise_threshold_exists_unique |
| 3 | **Proposition 1 (Democratic fragility)** | 206 | Prop1.lean | **VERIFIED** | L2 as hypothesis. P1a: rapid stable. P1b: threshold unstable. |
| 4 | **Proposition 2 (Autocratic fragility)** | 214 | Prop2.lean | **VERIFIED** | L2 as hypothesis. Iff conditions on κ₀. |
| 5 | **Proposition 3 (Crossed fragility)** | 222 | Prop3.lean | **VERIFIED** | Interval [κ̄, κ̄/η_r) → crossed pattern. |
| 6 | **Proposition 4 (Welfare cost)** | 234 | Prop4.lean | **VERIFIED** | gap = κ̄ > 0 |
| 7 | **Remark 1 (Threshold of thresholds)** | 241 | Remarks.lean | **VERIFIED** | |
| 8 | **Remark 2a (Width of crossed interval)** | 247 | Remarks.lean | **VERIFIED** | |
| 9 | **Remark 2b (Increasing in κ̄)** | 247 | Remarks.lean | **VERIFIED** | |
| 10 | **Remark 2c (Decreasing in η_r)** | 247 | Remarks.lean | **VERIFIED** | |
| 11 | **Remark 2d (Zero when η_r = 1)** | 247 | Remarks.lean | **VERIFIED** | |
| 12 | **Proposition 5 (Welfare state insurance)** | 269 | Prop5.lean | **VERIFIED** | P5a-c: standing capacity as insurance |
| 13 | **Proposition 6 (Functional equivalence)** | 275 | Prop6.lean | **VERIFIED** | P6a: both strong stable. P6b: welfare gap ≥ κ̄ |
| 14 | **Proposition 7 (Fiscal fragility)** | 433 | Prop7.lean | **VERIFIED** | Fiscal impossibility + instability |

| 15 | **Coordination Conditions (M-S prerequisites)** | App. B | CoordinationConditions.lean | **VERIFIED** | Dominance regions, q*∈(0,1), single-crossing |
| 16 | **Bridge: rapid coordination succeeds** | A6 | CoordinationLemmas.lean | **VERIFIED** | σ_r ≤ σ̂ → π* ≥ π̄ |
| 17 | **Bridge: threshold coordination fails** | A6 | CoordinationLemmas.lean | **VERIFIED** | σ_τ > σ̂ → π* < π̄ |

Corollaries 1-3 omitted (typology tables, not formal theorems).

## Staleness Details

No stale proofs. All Lean files are newer than paper.Rmd.

## Architecture

```
FormalProofs/
├── Basic.lean                — Model definitions (ModelParams, Δ, φ̄, κ̄, A1, A2)
├── CoordinationConditions.lean — M-S prerequisites (dominance, q*, single-crossing)
├── CoordinationLemmas.lean   — Bridge: L1-L2 → P1-P3 (imports SupermodularGames)
├── Remarks.lean              — Remark 1 + Remark 2 (a-d)
├── Prop1.lean                — P1: Democratic fragility
├── Prop2.lean                — P2: Autocratic fragility
├── Prop3.lean                — P3: Crossed fragility (interval condition)
├── Prop4.lean                — P4: Welfare cost of autocratic stability
├── Prop5.lean                — P5: Welfare state as insurance
├── Prop6.lean                — P6: Functional equivalence with welfare gap
└── Prop7.lean                — P7: Endogenous fiscal fragility

External dependency:
  SupermodularGames/ (path: ../../../SupermodularGames)
  ├── Core/Defs.lean           — HasIncreasingDifferences, Tarski, Topkis
  ├── Uniqueness/SingleCrossing.lean — Brouwer 1D, unique FP via strict anti-gap
  ├── Uniqueness/Laplacian.lean      — NoiseCDF, unique root, Laplacian cutoff
  ├── Applications/BinaryAction.lean — participationRate definition
  └── Applications/GlobalGames.lean  — L1 (unique cutoff), L2 (π* decreasing), σ̂
```

## Remaining Work

**All 17 results verified.** No remaining unformalized results. Zero sorry, zero custom axioms.

The proof chain is complete:
- SupermodularGames proves L1 (unique cutoff) and L2 (π* decreasing in σ, unique σ̂)
- CoordinationLemmas bridges: σ_r ≤ σ̂ → coordination succeeds; σ_τ > σ̂ → fails
- Prop1-3 prove crossed fragility from the coordination outcomes
