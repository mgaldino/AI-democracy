# Numerical Verification: Formal Proofs P1-P3 (Crossed Fragility)

**Date**: 2026-05-02
**Verifier**: Computational verification script
**Script**: `model/verify_proofs_P1P3.py`
**Source documents**:
  - `notes/formal_proofs_P1_P3.md` (proofs)
  - `notes/analytical_formalization.md` (v5 model)

---

## Grade: PASS WITH CONCERNS

**55/57 checks PASS. 2 FAIL (multi-state approximation discrepancy, qualitatively benign).**

---

## 0. Parameters

| Symbol | Value | Description |
|--------|-------|-------------|
| omega_R | 0.30 | Displacement rate, rapid |
| omega_T1 | 0.05 | Displacement rate, threshold t=1 |
| omega_T2 | 0.60 | Displacement rate, threshold t=2 |
| omega_N | 0.02 | Displacement rate, no shock |
| sigma | 0.10 | Signal noise |
| C_D | 1.50 | Protest cost, democracy |
| C_A | 1.65 | Protest cost, autocracy **(proofs doc value)** |
| B | 0.60 | Compensation benefit |
| delta | 0.90 | Discount factor |
| gamma | 0.30 | Complementarity bonus |
| pi_fall_D | 0.20 | Democratic fall threshold |
| pi_fall_A | 0.05 | Autocratic fall threshold |
| pi_comp_D | 0.07 | Democratic compensation trigger |
| omega_bar_A | 0.40 | Autocratic elite evidence threshold |
| sigma_A | 0.15 | Elite assessment noise |

**NOTE**: The proofs document uses C_A = 1.65. The v5 confirmed parameters (Section "Confirmed parameters" of `analytical_formalization.md`) use C_A = 2.0. This discrepancy is a key concern (see below).

### Derived displaced fractions

| Trajectory | Omega_1 | Omega_2 |
|------------|---------|---------|
| Rapid (R)  | 0.3000  | 0.5100  |
| Threshold (T) | 0.0500 | 0.6200 |
| No shock (N) | 0.0200 | 0.0396 |

---

## 1. Task 1: Single-State Protest Computation

All v, h_bar, and pi* values match the proofs document exactly.

| Scenario | Period | phi_t | v | h_bar | Omega | Case | pi* | Threshold | Outcome |
|----------|--------|-------|-----|-------|-------|------|-----|-----------|---------|
| R*D | 1 | 0 | 1.36 | 0.0933 | 0.30 | Interior | 0.0933 | pi_comp_D=0.07 | COMP TRIGGERED |
| R*D | 2 | 1 | 0.40 | 0.7333 | 0.51 | No protest (h_bar>Omega) | 0.0000 | pi_fall_D=0.20 | **STABLE** |
| T*D | 1 | 0 | 1.90 | -0.2667 | 0.05 | Dominant (v>C_D) | 0.0500 | pi_comp_D=0.07 | NO COMP |
| T*D | 2 | 0 | 1.00 | 0.3333 | 0.62 | Interior | 0.3333 | pi_fall_D=0.20 | **FALLS** |
| R*A | 1 | 0 | 1.90 | -0.1515 | 0.30 | Dominant (v>C_A) | 0.3000 | pi_fall_A=0.05 | **FALLS in t=1** |
| R*A | 2 | 0 | 1.00 | 0.3939 | 0.51 | Interior | 0.3939 | pi_fall_A=0.05 | **FALLS** |
| T*A | 1 | 0 | 1.90 | -0.1515 | 0.05 | Dominant (v>C_A) | 0.0500 | pi_fall_A=0.05 | Borderline |
| T*A | 2 | 1 | 0.40 | 0.7576 | 0.62 | No protest (h_bar>Omega) | 0.0000 | pi_fall_A=0.05 | **STABLE** |

**All numerical values verified. No arithmetic errors.**

---

## 2. Task 2: Multi-State Equilibrium

The multi-state global game was solved numerically (root-finding for G(s*)=0).

| Case | Single-state pi* | Multi-state pi* at target | |diff| | Qualitative agreement? |
|------|-------------------|---------------------------|---------|------------------------|
| R*D t=1 comp | 0.0933 | 0.0969 | 0.0036 | YES (both > pi_comp_D) |
| R*D t=2 comp | 0.0000 | 0.0000 | 0.0000 | YES (both = 0) |
| T*D t=1 nocomp | 0.0500 | 0.0500 | 0.0000 | YES (dominant strategy) |
| T*D t=2 nocomp | 0.3333 | 0.6189 | **0.2855** | YES (both > pi_fall_D=0.20) |
| R*A t=1 nocomp | 0.3000 | 0.3000 | 0.0000 | YES (dominant strategy) |
| R*A t=2 nocomp | 0.3939 | 0.4639 | **0.0700** | YES (both > pi_fall_A=0.05) |
| T*A t=1 nocomp | 0.0500 | 0.0500 | 0.0000 | YES (dominant strategy) |
| T*A t=2 comp | 0.0000 | 0.0000 | 0.0000 | YES (both = 0) |

**Finding**: The single-state approximation diverges quantitatively from the multi-state solution at t=2 for T*D and R*A. However, in both cases the multi-state protest is HIGHER than the single-state approximation, so the qualitative outcomes (FALLS) are preserved and in fact strengthened. The divergence occurs because sigma=0.10 is not negligible compared to the state separation at t=2 (omega_R=0.30 and omega_T2=0.60 are only 3 sigma apart), so the posterior at the indifference cutoff bleeds across states.

---

## 3. Task 3: Self-Confirmation Argument for R*D

| Candidate | v | h_bar | pi* | pi* > pi_comp_D? | Self-confirming? |
|-----------|-----|-------|-----|------------------|------------------|
| A (comp expected) | 1.36 | 0.0933 | 0.0933 | YES (margin=0.023) | **YES** |
| B (no comp expected) | 1.90 | -0.267 | 0.3000 | YES (dominant) | **NO** (contradiction) |

Candidate B generates protest (pi=0.30) that exceeds pi_comp_D=0.07, which triggers compensation. This contradicts the assumption that no compensation is expected. Therefore Candidate B is not self-confirming.

**Unique self-confirming equilibrium: Candidate A (comp expected)**. Verified.

---

## 4. Task 4: KEY ISSUE -- C_A = 1.65 and Dominant Strategy under R*A

### With C_A = 1.65 (proofs doc)

- v = 1 + delta = 1.90 > C_A = 1.65
- **Dominant strategy**: all displaced protest regardless of coordination expectations
- pi_1 = Omega_1(R) = 0.30 >> pi_fall_A = 0.05
- **Autocracy falls in t=1, not t=2**

The proofs document acknowledges this and provides an "Alternative Derivation" for the t=2 accumulation narrative. The dominant-strategy result STRENGTHENS Proposition 2(a) but changes the mechanism from "gradual accumulation" to "immediate collapse."

### With C_A = 2.0 (v5 confirmed params)

- v = 1.90 < C_A = 2.0
- h_bar = 1 - 1.9/2.0 = 0.05
- Interior equilibrium: pi* = 0.05 = pi_fall_A (BORDERLINE in t=1)
- In t=2: pi* = 1 - 1/2.0 = 0.50 > 0.05 => FALLS in t=2 (clean accumulation narrative)

### T*A t=1 borderline

- With C_A = 1.65: pi = omega_T1 = 0.05 = pi_fall_A (knife-edge)
- With C_A = 2.0: h_bar = 0.05 > omega_T1 = 0.05, but v=1.9 < 2.0 gives h_bar=0.05, and omega_T1 = 0.05 < h_bar=0.05, so actually pi* = 0 (NO protest since Omega < h_bar is false: Omega=0.05 = h_bar=0.05, borderline). With strict inequality, pi* = 0.

---

## 5. Elite Authorization Probabilities

| omega | P(authorize) | Interpretation |
|-------|-------------|----------------|
| omega_R = 0.30 | 0.2525 | Elite blind to moderate crisis |
| omega_T1 = 0.05 | 0.0098 | Elite sees nothing |
| omega_T2 = 0.60 | 0.9088 | Elite sees massive crisis |
| omega_N = 0.02 | 0.0056 | Elite sees nothing |

Verified: omega_R < omega_bar_A (elite does not authorize under rapid) and omega_T2 > omega_bar_A (elite authorizes under threshold t=2).

---

## 6. Parametric Conditions for Proposition 3

All 8 sufficient conditions hold with strict positive margins:

| Condition | LHS | Rel | RHS | Margin | Status |
|-----------|-----|-----|-----|--------|--------|
| (i) h_bar_comp > pi_comp_D | 0.0933 | > | 0.0700 | 0.0233 | PASS |
| (ii) omega_T1 < pi_comp_D | 0.0500 | < | 0.0700 | 0.0200 | PASS |
| (iii) 1-1/C_D > pi_fall_D | 0.3333 | > | 0.2000 | 0.1333 | PASS |
| (iv) omega_R < omega_bar_A | 0.3000 | < | 0.4000 | 0.1000 | PASS |
| (v) omega_T2 > omega_bar_A | 0.6000 | > | 0.4000 | 0.2000 | PASS |
| (vi) 1-1/C_A < Omega_2(R) | 0.3939 | < | 0.5100 | 0.1161 | PASS |
| (vii) 1-1/C_A > pi_fall_A | 0.3939 | > | 0.0500 | 0.3439 | PASS |
| (viii) 1-(1-B)/C_A > Omega_2(T) | 0.7576 | > | 0.6200 | 0.1376 | PASS |

The narrowest margin is condition (ii) at 0.02, which sets the window for pi_comp_D. The open set argument for Proposition 3 is supported: all conditions are strict inequalities with positive margins, and all quantities are continuous in the parameters.

---

## 7. Full Check Summary

```
  Omega_2(R)                             [PASS]
  Omega_2(T)                             [PASS]
  v(R*D,t=1,comp)                        [PASS]
  v(R*D,t=2,comp)                        [PASS]
  v(T*D,t=1,disp)                        [PASS]
  v(T*D,t=2,nocomp)                      [PASS]
  v(R*A,t=1,nocomp)                      [PASS]
  v(R*A,t=2,nocomp)                      [PASS]
  v(T*A,t=2,comp)                        [PASS]
  h_bar(R*D,t=1)                         [PASS]
  h_bar(R*D,t=2)                         [PASS]
  h_bar(T*D,t=2)                         [PASS]
  h_bar(R*A,t=2)                         [PASS]
  h_bar(T*A,t=2)                         [PASS]
  pi*(R*D,t=1)                           [PASS]
  pi*(R*D,t=2)=0                         [PASS]
  pi*(T*D,t=1)=0.05                      [PASS]
  pi*(T*D,t=2)=1/3                       [PASS]
  pi*(R*A,t=1)=0.30                      [PASS]
  pi*(R*A,t=2)=0.3939                    [PASS]
  pi*(T*A,t=1)=0.05                      [PASS]
  pi*(T*A,t=2)=0                         [PASS]
  R*D t=1: comp triggered                [PASS]
  R*D t=1: no fall                       [PASS]
  R*D t=2: no fall                       [PASS]
  R*D: STABLE                            [PASS]
  T*D t=1: no comp                       [PASS]
  T*D t=2: FALLS                         [PASS]
  R*A t=1: FALLS (dominant)              [PASS]
  R*A t=2: FALLS                         [PASS]
  T*A t=1: survives (borderline)         [PASS]
  T*A t=2: STABLE                        [PASS]
  Self-confirm: A is SC                  [PASS]
  Self-confirm: B not SC                 [PASS]
  Self-confirm: unique A                 [PASS]
  R*A t=1 dominant                       [PASS]
  R*A t=1 falls t=1                      [PASS]
  Multi-state ~ single: R*D t=1 comp     [PASS]  |diff| = 0.0036
  Multi-state ~ single: R*D t=2 comp     [PASS]  |diff| = 0.0000
  Multi-state ~ single: T*D t=1 nocomp   [PASS]  |diff| = 0.0000
  Multi-state ~ single: T*D t=2 nocomp   [FAIL]  |diff| = 0.2855
  Multi-state ~ single: R*A t=1 nocomp   [PASS]  |diff| = 0.0000
  Multi-state ~ single: R*A t=2 nocomp   [FAIL]  |diff| = 0.0700
  Multi-state ~ single: T*A t=1 nocomp   [PASS]  |diff| = 0.0000
  Multi-state ~ single: T*A t=2 comp     [PASS]  |diff| = 0.0000
  Multi-state T*D t=2: STILL FALLS       [PASS]  pi(T) = 0.6189 > 0.20
  Multi-state R*A t=2: STILL FALLS       [PASS]  pi(R) = 0.4639 > 0.05
  Elite blind to R                       [PASS]
  Elite sees T2                          [PASS]
  Cond (i)                               [PASS]  margin=0.0233
  Cond (ii)                              [PASS]  margin=0.0200
  Cond (iii)                             [PASS]  margin=0.1333
  Cond (iv)                              [PASS]  margin=0.1000
  Cond (v)                               [PASS]  margin=0.2000
  Cond (vi)                              [PASS]  margin=0.1161
  Cond (vii)                             [PASS]  margin=0.3439
  Cond (viii)                            [PASS]  margin=0.1376

  TOTAL: 55/57 PASS, 2 FAIL
```

---

## 8. Concerns and Recommendations

### CONCERN 1 (HIGH): C_A parameter discrepancy

The proofs document uses C_A = 1.65, but the v5 confirmed parameters use C_A = 2.0.

**Impact**: With C_A = 1.65, v = 1.9 > C_A makes protest a dominant strategy under R*A in t=1. The autocracy falls immediately in t=1 (pi = 0.30 >> pi_fall_A = 0.05), rather than through the t=2 accumulation mechanism that the paper's narrative emphasizes. The result is mathematically STRONGER but narratively different.

**Recommendation**: Resolve which C_A value is canonical. If the paper uses C_A = 1.65, explicitly acknowledge in the proofs that R*A falls in t=1 (not just t=2). If the paper uses C_A = 2.0, update the proofs document.

### CONCERN 2 (MEDIUM): T*A t=1 knife-edge

pi = omega_T1 = 0.05 = pi_fall_A = 0.05. Survival depends on interpreting the fall condition as strict inequality (pi > pi_fall_A). The proofs document acknowledges this.

**Recommendation**: Set pi_fall_A = 0.06 (or any value > omega_T1) to eliminate the knife-edge. The result holds for an open set, so this is cosmetic.

### CONCERN 3 (LOW): Multi-state approximation accuracy

The single-state approximation diverges from the multi-state solution at t=2 (differences of 0.07-0.29). This is expected given sigma=0.10 and state separation of 0.25-0.30 (2.5-3 sigma). The proofs document claims the approximation is "accurate" at 2.5 sigma separation, which is optimistic.

**Recommendation**: Note in the proofs that the single-state approximation is qualitatively but not quantitatively accurate at t=2. The multi-state correction INCREASES protest at the target states, reinforcing all qualitative conclusions.

### CONCERN 4 (NONE): Proofs internal consistency

All numerical values in the proofs document match the formulas exactly. The logic of self-confirmation, existence conditions, equilibrium classification, and outcome determination is correct. No arithmetic errors were found.

---

## 9. Verdict

**PASS WITH CONCERNS**

The formal proofs P1-P3 are internally consistent and numerically correct given the stated parameters. All 4 crossed fragility outcomes (R*D stable, T*D falls, R*A falls, T*A stable) are verified. The 8 sufficient conditions for Proposition 3 hold with positive margins.

The concerns are:
1. The C_A discrepancy between the proofs doc (1.65) and v5 confirmed params (2.0) changes the R*A mechanism (immediate t=1 fall vs. gradual t=2 accumulation).
2. T*A t=1 is a knife-edge that should be resolved cosmetically.
3. The single-state approximation is qualitatively but not quantitatively accurate at t=2.

None of these concerns invalidate the propositions. The crossed fragility pattern is robust.
