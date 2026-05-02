# Numerical Verification: C_A Sweet Spot and sigma_A Amplification (v5 Model)

**Date**: 2026-05-02
**Reference**: `notes/formalization_CA_sigmaA_v5.md`, `notes/analytical_formalization.md`
**Script**: `model/verify_CA_sigmaA_v5.py`
**Reviewer**: Computational economist (numerical verification)

---

## 1. Parameters Used

All parameters from formalization_CA_sigmaA_v5.md Section 3.1:

```
omega_R  = 0.30     omega_T1 = 0.05     omega_T2 = 0.60     omega_N = 0.02
sigma    = 0.10     C_D = 1.5           C_A = 2.0 (baseline) B = 0.6
delta    = 0.9      pi_fall_D = 0.20    pi_fall_A = 0.05
sigma_A  = 0.15     omega_bar_A = 0.40
```

Derived: Omega_2_R = 0.5100, Omega_2_T = 0.6200, Omega_2_N = 0.0396.

---

## 2. C_A Sweet Spot Results

### 2.1 Analytical Bounds

| Bound | Value | Status |
|-------|-------|--------|
| C_A_Lap (Laplacian lower bound) | 1.0526 | Correct |
| C_A_dom (dominant strategy upper bound) | 2.0408 | Correct |
| Condition (NE): hbar(C_D) = 0.3333 > pi_fall_A = 0.05 | Margin 0.2833 | PASS |

### 2.2 E[pi|d=1,s*] Shape Diagnostic

The expected protest function E[pi|d=1,s*] is **HUMPED**, confirming the formalization:

- Peak E[pi] = **0.4190** at s* = 0.101
- Boundary behavior: 0.2801 -> 0.4190 -> 0.000001
- Equilibrium collapse: hbar = 0.4190 corresponds to C_A = 1/(1-0.4190) = **1.7212**

This means that for C_A > 1.72, hbar > max E[pi], and NO cutoff equilibrium exists -- protest is fully suppressed.

### 2.3 C_A Sweep (Multi-State, t=2, v=1)

| C_A | hbar | s*_L | pi*_L(R) | pi*_R(R) | pi*_L > 0.05 | Sweet spot? |
|-----|------|------|----------|----------|--------------|-------------|
| 1.00 | 0.000 | dom | 0.5100 | 0.5100 | YES | NO (C_A < C_D) |
| 1.20 | 0.167 | dom | 0.5100 | 0.0097 | YES | NO |
| 1.40 | 0.286 | -0.333 | 0.5091 | 0.0241 | YES | NO |
| 1.50 | 0.333 | -0.092 | 0.5000 | 0.0359 | YES | NO (= C_D) |
| **1.60** | **0.375** | **-0.010** | **0.4881** | **0.3350** | **YES** | **YES** |
| **1.70** | **0.412** | **0.067** | **0.4647** | **0.4076** | **YES** | **YES** |
| 1.80 | 0.444 | sup | 0.0000 | 0.0000 | NO | NO |
| 2.00 | 0.500 | sup | 0.0000 | 0.0000 | NO | NO |
| 2.50 | 0.600 | sup | 0.0000 | 0.0000 | NO | NO |

### 2.4 Fine Sweep Results

- **CA_max (smooth crossing)**: 1.7378
- **CA_collapse (discontinuous)**: 1.7200
- **CA_dom (dominant strategy bound)**: 2.0408
- **Equilibrium collapse point**: 1.7212

**Effective C_A^max = 1.7378** (the first value at which the left-root protest drops below pi_fall_A, which happens via discontinuous collapse).

### 2.5 Sweet Spot Summary

$$C_A \in (1.50, 1.74), \quad \text{width} = 0.24$$

**M1 (pi*_L non-increasing in C_A)**: PASS

**Transition type**: DISCONTINUOUS -- protest collapses abruptly from ~0.46 to 0 when C_A crosses ~1.72, rather than smoothly declining through 0.05.

### 2.6 CRITICAL FINDING: Baseline C_A = 2.0 is OUTSIDE the Sweet Spot

The formalization claims (Section 3.3, item 4):

> "From v5 verified outcomes: R×A t=2: π₂ = 0.500 > π̄_A^fall = 0.05. Autocracy falls."

and (Section 1.4):

> "The baseline C_A = 2.0 is just below C_A^dom, consistent with the verified outcome that protest exists (π₂ = 0.500 > 0.05) at this value."

**These claims are WRONG in the multi-state global game.** At C_A = 2.0:
- hbar = 0.500 > max E[pi] = 0.419
- No cutoff equilibrium exists
- Protest is fully suppressed: pi* = 0
- The autocracy does NOT fall under rapid

**Root cause**: The analytical_formalization.md Scenario 2 (Section 12, line 491) uses the **single-state approximation** (Section 3): "Omega_2(R) = 0.51 > hbar = 0.50 -> protest exists." In the single-state model, pi* = hbar = 0.50 when hbar < Omega. This is barely satisfied (0.50 < 0.51).

However, the **multi-state model** (Section 4) gives max E[pi|d=1,s*] = 0.419. Since hbar = 0.50 > 0.419, no cutoff equilibrium exists in the multi-state model, and protest collapses to zero. The discrepancy arises because multi-state posterior averaging over {R, T, N} dilutes the expected safety-in-numbers: a displaced worker at signal s* cannot be sure the state is R (where many others are displaced) vs. T_t1 or N (where few are displaced).

The dominant strategy bound C_A_dom = 2.04 gives the value at which not protesting is dominant regardless of coordination. But the equilibrium collapses much earlier (at C_A = 1.72) because the multi-state posterior averaging reduces E[pi] below the single-state level.

**In short: the baseline parameterization works in the single-state benchmark but FAILS in the multi-state model.** The "verified outcomes" table (Section 12) implicitly uses the single-state approximation, which is inconsistent with the multi-state global game used for the Proposition.

### 2.7 Comparison with Prior Review Findings

| Prior finding | Status with v5 params |
|---------------|----------------------|
| Equilibrium transition is DISCONTINUOUS | **CONFIRMED** (collapse at C_A ~1.72) |
| E[pi|d=1,s*] is humped | **CONFIRMED** (peak = 0.419) |
| Sweet spot was narrow (1.50, 1.67) | Slightly wider now: (1.50, 1.74), width 0.24 |
| Baseline C_A=2.0 was OUTSIDE | **STILL OUTSIDE** |

The prior review's core findings are robust to the v5 parameter change. The sweet spot widened slightly (from ~0.17 to ~0.24) because omega_R decreased from 0.40 to 0.30, changing Omega_2_R from 0.64 to 0.51.

---

## 3. sigma_A Amplification Results

### 3.1 Fixed omega_bar_A = 0.40

| sigma_A | p_R | p_T | gap (p_T - p_R) |
|---------|-----|-----|-----------------|
| 0.05 | 0.0228 | 1.0000 | 0.9772 |
| 0.10 | 0.1587 | 0.9772 | 0.8186 |
| 0.15 | 0.2525 | 0.9088 | 0.6563 |
| 0.20 | 0.3085 | 0.8413 | 0.5328 |
| 0.30 | 0.3694 | 0.7475 | 0.3781 |
| 0.50 | 0.4207 | 0.6554 | 0.2347 |

**With fixed omega_bar_A, the gap SHRINKS monotonically.** Both p_R and p_T converge toward 0.5. This confirms the formalization's Observation 1: amplification requires the endogenous threshold effect.

### 3.2 Endogenous omega_bar_A = 0.20 + 1.33*sigma_A (User Specification)

| sigma_A | omega_bar_A | p_R | p_T | gap | cond (iii) | cond (iv) |
|---------|-------------|-----|-----|-----|------------|-----------|
| 0.05 | 0.267 | 0.7486 | 1.0000 | 0.2514 | NO | YES |
| 0.10 | 0.333 | 0.3707 | 0.9962 | 0.6255 | YES | YES |
| **0.15** | **0.400** | **0.2536** | **0.9093** | **0.6558** | **YES** | **YES** |
| 0.20 | 0.466 | 0.2033 | 0.7486 | 0.5453 | YES | YES |
| 0.30 | 0.599 | 0.1595 | 0.5013 | 0.3419 | YES | YES |
| 0.50 | 0.865 | 0.1292 | 0.2981 | 0.1688 | YES | NO |

**Critical sigma_A values**: sigma_A_min = 0.075 (omega_R = omega_bar_A), sigma_A_star = 0.301 (omega_T2 = omega_bar_A).

**Amplification range**: sigma_A in (0.075, 0.301).

### 3.3 Endogenous omega_bar_A = 0.25 + 1.0*sigma_A (Formalization Specification)

| sigma_A | omega_bar_A | p_R | p_T | gap | cond (iii) | cond (iv) |
|---------|-------------|-----|-----|-----|------------|-----------|
| 0.05 | 0.300 | 0.5000 | 1.0000 | 0.5000 | NO | YES |
| 0.10 | 0.350 | 0.3085 | 0.9938 | 0.6853 | YES | YES |
| **0.15** | **0.400** | **0.2525** | **0.9088** | **0.6563** | **YES** | **YES** |
| 0.20 | 0.450 | 0.2266 | 0.7734 | 0.5467 | YES | YES |
| 0.30 | 0.550 | 0.2023 | 0.5662 | 0.3639 | YES | YES |
| 0.50 | 0.750 | 0.1841 | 0.3821 | 0.1980 | YES | NO |

**Critical sigma_A values**: sigma_A_min = 0.050, sigma_A_star = 0.350.

### 3.4 Part (a): p_R Decreasing

**PASS** (both models). p_R decreases monotonically with sigma_A for sigma_A > sigma_A_min. The autocracy is progressively less likely to compensate under rapid as the selectorate shrinks.

### 3.5 Part (b): p_T > 0.5 in Amplification Range

**PASS** (both models). p_T stays above 0.5 for all sigma_A within the amplification range. The autocracy continues to compensate under threshold.

### 3.6 Gap Behavior: NUANCE

The Proposition states (part b):

> d/d(sigma_A) [p_T - p_R] > 0 provided omega_T2 - omega_bar_A >> omega_bar_A - omega_R

**Numerical finding: the gap does NOT widen monotonically.** It peaks near the lower end of the amplification range, then shrinks:

| sigma_A | gap (user model) | d(gap)/d(sigma_A) |
|---------|------------------|-------------------|
| 0.10 | 0.6255 | +3.33 (widening) |
| 0.15 | 0.6558 | -1.48 (SHRINKING) |
| 0.20 | 0.5453 | -2.48 (shrinking) |
| 0.30 | 0.3419 | -1.50 (shrinking) |

| sigma_A | gap (form. model) | d(gap)/d(sigma_A) |
|---------|-------------------|-------------------|
| 0.10 | 0.6853 | +1.15 (widening) |
| 0.15 | 0.6563 | -1.84 (SHRINKING) |
| 0.20 | 0.5467 | -2.26 (shrinking) |
| 0.30 | 0.3639 | -1.37 (shrinking) |

**The gap widens only for sigma_A near sigma_A_min, then shrinks.** The Proposition's proviso "omega_T2 - omega_bar_A >> omega_bar_A - omega_R" holds only at low sigma_A. As sigma_A increases, omega_bar_A approaches omega_T2, the proviso fails, and the gap shrinks.

**This is not a contradiction of the Proposition**, which is carefully qualified. But the formalization text (Section 2.2, part b) could be more explicit that the gap-widening is a LOCAL property near sigma_A_min, not a global one.

The core result -- that R×A fragility is amplified (p_R falls) while T×A stability is maintained (p_T > 0.5) throughout the amplification range -- holds regardless of the gap direction. The crossed fragility CONDITIONS (iii) and (iv) hold for all sigma_A in (sigma_A_min, sigma_A_star). This is the substance of the Proposition.

---

## 4. Check Summary

| # | Check | Result |
|---|-------|--------|
| 1a | Condition (NE) satisfied | **PASS** |
| 1b | Sweet spot non-empty | **PASS** |
| 1c | C_A_dom bound correct | **PASS** |
| 1d | Baseline C_A=2.0 inside sweet spot | **FAIL** |
| 1e | M1 (pi*_L non-increasing in C_A) | **PASS** |
| 1f | E[pi|d=1,s*] is humped | **PASS** |
| 2a | p_R decreasing with sigma_A (user model) | **PASS** |
| 2b | p_T > 0.5 in amplification range (user model) | **PASS** |
| 2c | p_R decreasing with sigma_A (formalization model) | **PASS** |
| 2d | p_T > 0.5 in amplification range (formalization model) | **PASS** |

**Score: 9/10**

---

## 5. Verdict

### GRADE: PASS WITH CONCERNS

### What passes:

1. **Corollary (C_A sweet spot)**: The sweet spot exists, is non-empty, width = 0.24. The analytical bounds (C_A_Lap, C_A_dom) are correct. M1 holds. The qualitative structure of the result is correct.

2. **Proposition (sigma_A amplification)**: Part (a) -- p_R decreasing with sigma_A -- is confirmed with both models. Part (b) -- p_T > 0.5 in the amplification range -- is confirmed. The amplification range is well-characterized (sigma_A_min to sigma_A_star).

### Concern:

**Baseline C_A = 2.0 is OUTSIDE the sweet spot.** The multi-state global game equilibrium collapses at C_A approx 1.72, well below 2.0. At C_A = 2.0, hbar = 0.50 > max E[pi] = 0.419, so no cutoff equilibrium exists and protest is zero. The formalization's claim that pi_2 = 0.500 at C_A = 2.0 appears to confuse accumulated displacement (Omega_2_R = 0.51) with equilibrium protest.

**This means the baseline parameterization in analytical_formalization.md (Section 12) is inconsistent with the multi-state equilibrium: R×A does NOT fall at the baseline C_A = 2.0.**

### Recommendations:

1. **Lower C_A to ~1.65** (center of the sweet spot) to ensure baseline is inside. This is a calibration choice, not a structural change.

2. **Alternatively, raise omega_R** to widen the sweet spot. With omega_R = 0.40, Omega_2_R = 0.64, and the peak E[pi] would be higher, pushing C_A_max upward.

3. **Clarify in the formalization** that C_A_dom is a DOMINANT STRATEGY bound, not the equilibrium collapse point. The actual C_A_max is lower due to multi-state posterior averaging.

4. **Clarify the gap-widening claim** in Proposition part (b): the gap p_T - p_R widens only locally near sigma_A_min. The substance of the result (conditions iii and iv both hold in the amplification range) does not require gap monotonicity.

5. **Reconcile Section 12 of analytical_formalization.md**: the "verified outcomes" table should use equilibrium protest from the global game, not raw displacement.

---

## 6. Design Decisions Documented

### Decision: Baseline C_A calibration
- **Current**: C_A = 2.0 (outside sweet spot in multi-state model)
- **Recommended**: C_A = 1.65 (center of sweet spot)
- **Alternative discarded**: C_A = C_A_dom = 2.04 (dominant strategy bound; protest always zero, not useful)
- **Alternative discarded**: Keep C_A = 2.0 and use single-state benchmark (inconsistent with the multi-state model used elsewhere)

### Decision: Gap-widening claim in Proposition 2(b)
- **Current text**: "The gap widens: d/d(sigma_A) [p_T - p_R] > 0"
- **Numerical reality**: Gap widens only locally near sigma_A_min, then shrinks
- **Recommendation**: Weaken to "The conditions (iii) and (iv) hold simultaneously for all sigma_A in the amplification range, and the R×A fragility (p_R) monotonically increases (p_R decreases)"
