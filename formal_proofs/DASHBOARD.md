# Lean Verification Dashboard

**Project**: AI Automation, Regime Type, and Crossed Fragility
**Last updated**: 2026-04-02
**Paper file**: paper.Rmd (modified: 2026-04-02 12:13)
**Build status**: PASSING

## Summary

| Status | Count |
|--------|-------|
| Verified | 15 |
| Has sorry | 0 |
| Stale (needs re-verification) | 0 |
| Not formalized | 2 |
| **Total results in paper** | **17** |

Note: Lemmas 1-2 (global games) are the only remaining unformalized results. All propositions, remarks, and their sub-results are verified. Coordination outcomes from Lemmas 1-2 enter P1-P3 as hypotheses.

## Detailed Status

| # | Result | Paper line | Lean File | Status | Notes |
|---|--------|:----------:|-----------|:------:|-------|
| 1 | Lemma 1 (Unique cutoff equilibrium) | 130 | — | NOT FORMALIZED | Requires global games (Morris & Shin) |
| 2 | Lemma 2 (Noise comparative statics) | 130 | — | NOT FORMALIZED | Requires global games (Morris & Shin) |
| 3 | **Proposition 1 (Democratic fragility)** | 146 | Prop1.lean | **VERIFIED** | L2 as hypothesis. P1a: rapid stable. P1b: threshold unstable. |
| 4 | **Proposition 2 (Autocratic fragility)** | 154 | Prop2.lean | **VERIFIED** | L2 as hypothesis. Iff conditions on κ₀. |
| 5 | **Proposition 3 (Crossed fragility)** | 162 | Prop3.lean | **VERIFIED** | Interval [κ̄, κ̄/η_r) → crossed pattern. |
| 6 | **Proposition 4 (Welfare cost)** | 172 | Prop4.lean | **VERIFIED** | gap = κ̄ > 0 |
| 7 | **Remark 1 (Threshold of thresholds)** | 179 | Remarks.lean | **VERIFIED** | |
| 8 | **Remark 2a (Width of crossed interval)** | 185 | Remarks.lean | **VERIFIED** | |
| 9 | **Remark 2b (Increasing in κ̄)** | 185 | Remarks.lean | **VERIFIED** | |
| 10 | **Remark 2c (Decreasing in η_r)** | 185 | Remarks.lean | **VERIFIED** | |
| 11 | **Remark 2d (Zero when η_r = 1)** | 185 | Remarks.lean | **VERIFIED** | |
| 12 | **Proposition 5 (Welfare state insurance)** | 207 | Prop5.lean | **VERIFIED** | P5a-c: standing capacity as insurance |
| 13 | **Proposition 6 (Functional equivalence)** | 213 | Prop6.lean | **VERIFIED** | P6a: both strong stable. P6b: welfare gap ≥ κ̄ |
| 14 | **Proposition 7 (Fiscal fragility)** | 262 | Prop7.lean | **VERIFIED** | Fiscal impossibility + instability |

| 15 | **Coordination Conditions (M-S prerequisites)** | App. B | CoordinationConditions.lean | **VERIFIED** | Dominance regions, q*∈(0,1), single-crossing |

Corollaries 1-3 omitted (typology tables, not formal theorems).

## Staleness Details

No stale proofs. All Lean files are newer than paper.Rmd.

## Architecture

```
FormalProofs/
├── Basic.lean      — Model definitions (ModelParams, Δ, φ̄, κ̄, A1, A2)
├── Remarks.lean    — Remark 1 + Remark 2 (a-d)
├── Prop1.lean      — P1: Democratic fragility (L2 as hypothesis)
├── Prop2.lean      — P2: Autocratic fragility (L2 as hypothesis)
├── Prop3.lean      — P3: Crossed fragility (interval condition)
├── Prop4.lean      — P4: Welfare cost of autocratic stability
├── Prop5.lean      — P5: Welfare state as insurance
├── Prop6.lean      — P6: Functional equivalence with welfare gap
└── Prop7.lean      — P7: Endogenous fiscal fragility
```

## Remaining Work

Only **Lemmas 1-2** (global games coordination equilibrium) remain unformalized. These require formalizing Morris & Shin (1998) global games in Lean/Mathlib — a significant undertaking with no existing Mathlib infrastructure. The coordination outcomes are taken as hypotheses in P1-P3, so the logical structure of all propositions is fully verified.

**Options:**
1. Leave as-is: 14/16 verified, with L1-L2 as acknowledged axioms. Sufficient for paper submission.
2. Formalize L1-L2 as `axiom` declarations (makes the dependency explicit in Lean).
3. Full formalization of global games (research-level Lean project, out of scope for this paper).
