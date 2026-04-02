# Lean Verification Dashboard

**Project**: AI Automation, Regime Type, and Crossed Fragility
**Last updated**: 2026-04-02
**Paper file**: paper.Rmd (modified: 2026-04-02 12:13)
**Build status**: PASSING

## Summary

| Status | Count |
|--------|-------|
| Verified | 5 |
| Has sorry | 0 |
| Stale (needs re-verification) | 0 |
| Not formalized | 9 |
| **Total results in paper** | **14** |

## Detailed Status

| # | Result | Paper line | Lean File | Status | Notes |
|---|--------|:----------:|-----------|:------:|-------|
| 1 | Lemma 1 (Unique cutoff equilibrium) | 126 | — | NOT FORMALIZED | Requires global games machinery |
| 2 | Lemma 2 (Noise comparative statics) | 128 | — | NOT FORMALIZED | Requires global games machinery |
| 3 | Proposition 1 (Democratic fragility) | 144 | — | NOT FORMALIZED | Depends on Lemma 2 |
| 4 | Proposition 2 (Autocratic fragility) | 152 | — | NOT FORMALIZED | Depends on Lemma 2 |
| 5 | Proposition 3 (Crossed fragility) | 160 | — | NOT FORMALIZED | Depends on P1+P2 |
| 6 | Proposition 4 (Welfare cost) | 170 | — | NOT FORMALIZED | Algebra, independent |
| 7 | **Remark 1 (Threshold of thresholds)** | 177 | Remarks.lean | **VERIFIED** | |
| 8 | **Remark 2a (Width of crossed interval)** | 183 | Remarks.lean | **VERIFIED** | |
| 9 | **Remark 2b (Increasing in κ̄)** | 183 | Remarks.lean | **VERIFIED** | |
| 10 | **Remark 2c (Decreasing in η_r)** | 183 | Remarks.lean | **VERIFIED** | |
| 11 | **Remark 2d (Zero when η_r = 1)** | 183 | Remarks.lean | **VERIFIED** | |
| 12 | Proposition 5 (Welfare state insurance) | 205 | — | NOT FORMALIZED | |
| 13 | Proposition 6 (Functional equivalence) | 211 | — | NOT FORMALIZED | |
| 14 | Proposition 7 (Fiscal fragility) | 260 | — | NOT FORMALIZED | Uses c(φ) function |

Corollaries 1-3 omitted (typology tables, not formal theorems).

## Staleness Details

No stale proofs. The paper has not been modified since the Lean proofs were written.

## Next Steps

Recommended order for next formalizations:

1. **Proposition 4** (welfare cost) — pure algebra on Δ, L, κ̄. No coordination needed. Easiest next target.
2. **Proposition 5** (welfare state insurance) — extends P1 with φ₀. Algebra.
3. **Proposition 6** (functional equivalence) — combines P5 with P2. Algebra.
4. **Propositions 1-3** — require formalizing the coordination equilibrium (Lemmas 1-2 as hypotheses or sorry'd). Medium difficulty.
5. **Lemmas 1-2** — require formalizing global games in Lean/Mathlib. Hard. Consider taking as axioms with proof deferred.
