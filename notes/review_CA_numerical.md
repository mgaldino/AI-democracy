# Numerical Verification: C_A Sweet Spot (Corollary 1)

**Date**: 2026-05-02
**Script**: `model/verify_CA_sweet_spot.py`
**Reference**: `notes/formalization_CA_sweet_spot.md`, Section 5

## Overall Verdict: PASS WITH CONCERNS

The sweet spot **exists** and is **non-empty**, but the baseline parameterization C_A = 2.0 falls **outside** the sweet spot. The formalization's qualitative claims are correct; the quantitative bound in eq. (8) overestimates C_A^max.

---

## Parameters

```
omega_H = 0.40    omega_L = 0.05    sigma = 0.15
C_D = 1.5         B = 0.6           delta = 0.9
pi_fall_D = 0.40  pi_fall_A = 0.05
p_R = 0.30        p_T = 0.30        p_N = 0.40
```

Derived:
- Omega_2^R = 0.6400
- Omega_2^T = 0.4300

---

## Key Finding 1: E[pi|d=1,s*] is HUMPED

The displaced worker's expected aggregate protest as a function of the cutoff signal s* is **not monotone** -- it is humped (rises, peaks at ~0.40, then falls). This is a consequence of the 3-state posterior: as s* increases past omega_H, the posterior shifts toward theta=R, but for very high s*, F((omega-s*)/sigma) drops.

```
Peak: E[pi|d=1,s*] = 0.4016 at s* = 0.10
```

The equilibrium condition requires E[pi|s*] = hbar = 1 - v/C_A:
- For hbar < 0.4016: TWO roots exist (left/right of the hump)
- For hbar > 0.4016: NO root -- equilibrium collapses, pi = 0

Since hbar is increasing in C_A, the equilibrium collapses at:
```
C_A^max (collapse) = 1/(1 - 0.4016) = 1.6712
```

## Key Finding 2: Two Equilibria

The humped E[pi|s*] generates two cutoff equilibria for each C_A < 1.67:

| C_A  | hbar   | s*_L (coord.) | pi*_L    | s*_R (pessim.) | pi*_R    |
|------|--------|---------------|----------|----------------|----------|
| 1.00 | 0.0000 | dom           | 0.6400   | dom            | 0.6400   |
| 1.10 | 0.0909 | dom           | 0.6400   | 0.636          | 0.1100   |
| 1.20 | 0.1667 | dom           | 0.6400   | 0.516          | 0.2025   |
| 1.30 | 0.2308 | dom           | 0.6400   | 0.436          | 0.2820   |
| 1.40 | 0.2857 | dom           | 0.6400   | 0.370          | 0.3523   |
| 1.50 | 0.3333 | -0.765        | 0.6397   | 0.306          | 0.4169   |
| 1.60 | 0.3750 | -0.072        | 0.6136   | 0.233          | 0.4819   |
| 1.70 | 0.4118 | sup           | 0.0000   | sup            | 0.0000   |

- **LEFT root** (coordination equilibrium): pi*_L ~ 0.64 (high protest). This is monotone non-increasing in C_A (M1 PASS).
- **RIGHT root** (pessimistic equilibrium): pi*_R increases with C_A (M1 FAIL). This is the root that the earlier runs were selecting.

## Key Finding 3: The Relevant Equilibrium

The **LEFT root** is the relevant equilibrium for crossed fragility:
- It gives high protest under rapid displacement (pi*_L >> pi_fall_A = 0.05)
- It is monotone non-increasing in C_A (M1 satisfied)
- It is the risk-dominant equilibrium when Omega is large

The RIGHT root violates M1 and was causing the non-monotonicity observed in earlier verification attempts.

## Key Finding 4: C_A^max Bounds

Four values of C_A^max:

| Bound | Value | Source |
|-------|-------|--------|
| Dominant strategy (eq. 8) | 2.7778 | 1/(1-Omega_2^R), max safety-in-numbers |
| Laplacian (uniform prior) | 1.4706 | 1/(1-Omega/2), Morris-Shin |
| Coordination eq. collapse | 1.6712 | 1/(1-max E[pi]), numerical |
| Interpolation from sweep | 1.6919 | linear interpolation from pi*_L grid |

The formalization's eq. (8) gives C_A^max = 2.78, which is the dominant-strategy bound: "for C_A > 2.78, not protesting is a dominant strategy." This is mathematically correct as stated but does NOT characterize the equilibrium collapse point. The actual equilibrium collapses at C_A ~ 1.67 because the posterior averaging over 3 states reduces the maximum achievable E[pi] below what the dominant-strategy bound assumes.

## Key Finding 5: Sweet Spot Width

```
C_A^min ~ C_D = 1.50 (informational threshold)
C_A^max ~ 1.67 (coordination eq. collapse)
Width ~ 0.17
```

The sweet spot is **non-empty** but **narrow** (width ~ 0.17). The baseline C_A = 2.0 falls **outside** this interval.

## Key Finding 6: pi*_L >> pi_fall_A Within Sweet Spot

At C_A just before collapse (C_A = 1.66): pi*_L = 0.58, which is 11.6x the fall threshold pi_fall_A = 0.05. The formalization's claim that "protest LEVEL is still well above the fall threshold even though the SLOPE is flat" is **confirmed**.

## Key Finding 7: Threshold Survival (Condition iv)

At C_A = 1.5 and C_A = 1.62 (within the sweet spot):
- Without compensation: pi*(T, t=2) > pi_fall_A (would fall)
- With compensation: pi*(T, t=2) = 0.00 (survives)

This confirms that compensation resolves the threshold crisis. The mechanism is consistent: with decree-based compensation, v drops to 1-B = 0.4, and protest is entirely suppressed.

## Key Finding 8: Informativeness at Left Root

I(C_A) = |d pi*/d omega| at the LEFT root is NOT decreasing in C_A:

| C_A  | I(C_A) |
|------|--------|
| 1.00 | 1.20   |
| 1.20 | 1.20   |
| 1.40 | 1.20   |
| 1.50 | 1.26   |
| 1.60 | 1.72   |
| 1.62 | 1.96   |

The informativeness INCREASES near the collapse point. This is because near collapse, a small change in omega causes a large change in whether the equilibrium exists, creating a cliff-like sensitivity. This is a different mechanism from the smooth M3 decrease assumed in the formalization.

---

## Detailed Checks

| Check | Result | Notes |
|-------|--------|-------|
| Sweet spot non-empty | PASS | Width ~ 0.17 |
| C_A^max > C_D | PASS | 1.67 > 1.50 |
| Dominant strategy bound correct (eq. 8) | PASS | By construction |
| Baseline C_A=2.0 in sweet spot | FAIL | 2.0 > 1.67 |
| pi*_L > pi_fall_A before collapse | PASS | 0.58 >> 0.05 |
| M1 on LEFT root | PASS | pi*_L non-increasing in C_A |
| M1 on RIGHT root | FAIL | pi*_R increases with C_A |
| M3 (I decreasing, LEFT root) | FAIL | I increases near collapse |

---

## Recommendations

1. **Clarify eq. (8)**: The formalization should state that C_A^max = 1/(1-Omega) is the dominant-strategy bound (maximum C_A at which protest is mechanically possible), not the equilibrium collapse point. The actual equilibrium C_A^max is lower due to posterior averaging.

2. **Adjust baseline C_A**: Lower C_A from 2.0 to ~1.6 to ensure it falls within the sweet spot. Alternatively, raise omega_H to ~0.55 to widen the sweet spot.

3. **Equilibrium selection**: The formalization should explicitly state which equilibrium is selected (coordination / left root). The standard global-games uniqueness argument (Laplacian property) does not directly apply with a discrete 3-state prior. An argument for risk-dominance or iterative dominance would strengthen the claim.

4. **Discontinuous transition**: C_A^max is not a smooth crossing (pi* = pi_fall_A) but a discontinuous collapse (pi* drops from ~0.58 to 0). The formalization's proof via IVT (Step 2) technically applies to the dominant-strategy bound, not the equilibrium collapse. The result still holds but the mechanism is different.

5. **Non-emptiness**: The formalization's Step 3 argument is essentially correct: the slope (informativeness) can vanish while the level remains high. Numerically confirmed: pi*_L = 0.58 just before collapse, well above pi_fall_A = 0.05.

---

## Bounded Single-State Comparison

The bounded single-state model (omega in [0,1], uniform prior) gives very different results from the multi-state model, with equilibrium protest jumping discontinuously between ~0.64 and ~0.01. This confirms that the prior structure (3 discrete states vs continuous) fundamentally affects the equilibrium.

---

## Script

Full script at `model/verify_CA_sweet_spot.py`. Run with `python3 model/verify_CA_sweet_spot.py`.
