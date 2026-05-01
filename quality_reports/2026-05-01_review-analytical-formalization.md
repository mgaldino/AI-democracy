# Mathematical Review: Analytical Formalization (v2)

**Date**: 2026-05-01
**Reviewer**: Claude (mathematical review mode)
**File reviewed**: `notes/analytical_formalization.md`
**Scope**: Correctness of Lemma 2, fixed-point logic (Section 7.2), T x A visibility piercing (Section 8), visibility threshold definition (Section 5), and general logical gaps.

---

## 1. Lemma 2 (Section 3): Cumulative displacement bound and numerical example

### Claim
With absorbing displacement and ordering omega_N < omega_T1 < omega_R < omega_T2, Omega_2(T) > Omega_2(R) requires omega_T2 > omega_R(2 - omega_R)/(1 - omega_T1).

### Verification

From the formulas:
- Omega_2(R) = omega_R(2 - omega_R)
- Omega_2(T) = omega_T1 + (1 - omega_T1) * omega_T2

Setting Omega_2(T) > Omega_2(R) and solving:

omega_T2 > [omega_R(2 - omega_R) - omega_T1] / (1 - omega_T1)

The bound stated in the review question omits the subtraction of omega_T1 in the numerator. The **exact** bound is:

omega_T2 > [omega_R(2 - omega_R) - omega_T1] / (1 - omega_T1)

For omega_R = 0.30, omega_T1 = 0.05:
- Correct bound: (0.51 - 0.05) / 0.95 = 0.484
- Approximate bound (text): omega_T2 > omega_R(2 - omega_R) = 0.51 (for small omega_T1)
- Stated-in-question bound: 0.51/0.95 = 0.537

The **text** gives only the approximation ("roughly omega_T2 > omega_R(2 - omega_R)"), which is defensible for small omega_T1. The exact bound should be stated explicitly.

### Numerical example check
- Omega_2(R) = 0.30 * 1.70 = 0.51 -- **CORRECT**
- Omega_2(T) = 0.05 + 0.95 * 0.60 = 0.62 -- **CORRECT**
- 0.62 > 0.51 -- **CORRECT**

### Verdict
Numerical example is correct. Exact algebraic bound should be stated for completeness. Severity: **Low**.

---

## 2. Section 7.2: Fixed-point logic under R x D, no-comp equilibrium

### Claim
Under R x D, if workers expect no compensation, v_1 = 1 + delta = 1.9 > C_D = 1.5, so protest is dominant (all displaced protest, pi_1 = omega_R = 0.30). Then the incumbent sees moderate protest, would compensate, contradicting the no-comp assumption.

### Verification

**Step 1 (v computation)**: v_1^{D,n} = 1 + delta * 1 = 1 + 0.9 = 1.9. Present loss = 1 (full income loss, displaced, no comp). Future loss = 1 (absorbing, no comp expected). **CORRECT.**

**Step 2 (Dominance)**: v = 1.9 > C_D = 1.5. h_bar = 1 - v/C_x = 1 - 1.9/1.5 = -0.267 < 0. Interior equilibrium does not exist. Even with h(pi) = 0 (zero safety-in-numbers), cost = C_x = 1.5 < v = 1.9. **Protest is dominant for all displaced workers.** pi_1 = Omega_1(R) = omega_R = 0.30. **CORRECT.**

**Step 3 (Incumbent's response)**: Democracy incumbent observes pi_tilde approx 0.30 (tau_D very small). Only theta = R generates pi near 0.30 (under T or N, pi approx 0). Posterior P(R | pi_tilde = 0.30) approx 1. Democracy would compensate. **CORRECT directionally.**

**Step 4 (Contradiction)**: Incumbent compensates, contradicting no-comp assumption. **No-comp equilibrium is NOT self-confirming.** **CORRECT.**

### Gap identified
The compensation rule (Section 6.2) is not fully parameterized. The claim "incumbent would compensate" depends on Delta_P * P(crisis | pi_tilde) > omega_hat * B being satisfied. With pi_tilde = 0.30, P(crisis) approx 1, and omega_hat * B approx 0.30 * 0.6 = 0.18. The LHS should exceed the RHS, but this requires knowing Delta_P explicitly. The argument is correct directionally but not airtight.

### What if the evidence-weighted rule doesn't trigger?
For the rule to NOT trigger with pi_1 = 0.30 under democracy, Delta_P * P(crisis) would need to be below 0.18. Since P(crisis | pi = 0.30) approx 1 and Delta_P is the survival probability gain from compensating (which should be near 1 when crisis is real and pi_fall is a binding constraint), this is implausible. **The logic holds.**

### Verdict
**CORRECT.** The no-comp equilibrium is not self-confirming. Minor gap: compensation rule needs full specification. Severity: **Medium** (for the gap, not the logic).

---

## 3. Section 8 (T x A): Lambda((omega_T2 - s*_A)/sigma) approx 1

### Claim
Under T x A in t=2, omega_T2 = 0.60 is so far above s*_A that Lambda((omega_T2 - s*_A)/sigma) approx 1.

### Verification with review-question parameters (C_A = 2.5, sigma = 0.10)

h_bar = 1 - v/C_A = 1 - 1/2.5 = 0.60. If s*_A is near omega_R = 0.30:

(omega_T2 - s*_A) / sigma = (0.60 - 0.30) / 0.10 = 3.0

Lambda(3.0) = 1/(1 + e^{-3}) = 0.953. **Approximately 1. Correct for these parameters.**

### Verification with the document's own parameters (C_A = 2.0, sigma = 0.15, from reformulation plan)

h_bar = 1 - 1/2.0 = 0.50. If s*_A is near omega_R = 0.30:

(0.60 - 0.30) / 0.15 = 2.0

Lambda(2.0) = 1/(1 + e^{-2}) = 0.881. **Not approximately 1. More like 0.88.**

If s*_A = 0.40 (higher): (0.60 - 0.40)/0.15 = 1.33. Lambda(1.33) = 0.791. **Even worse.**

### Key issues

1. **The approximation is parameter-sensitive.** With sigma = 0.10, Lambda approx 0.95. With sigma = 0.15, Lambda approx 0.88. The claim "approximately 1" requires either small sigma or large omega_T2 - s*_A gap.

2. **s*_A is endogenous.** The argument that s*_A is "anchored near omega_R or omega_N" is hand-wavy. In the multi-state model, s* is determined by the transcendental equation G(s*) = 0 (Section 2.3). Without solving this, one cannot pin down s*_A.

3. **Even Lambda = 0.88 suffices for the qualitative argument.** The key claim is that pi(T, s*_A) >> pi(R, s*_A), which holds as long as Lambda((omega_T2 - s*_A)/sigma) is substantially larger than Lambda((omega_R - s*_A)/sigma). This relative gap matters more than the absolute value being "near 1."

### Verdict
**Directionally correct** but "approximately 1" is overstated for sigma = 0.15. The value is 0.88-0.95 depending on parameters. The qualitative argument (visibility piercing) still works. **Recommend stating the numerical range honestly.** Severity: **Medium**.

---

## 4. Section 5: Visibility threshold definition

### Concern
omega_bar_A^vis is defined as "smallest omega such that P(omega_t = omega | pi_tilde) = 1/2." But omega takes discrete values {omega_R, omega_T1, omega_T2, omega_N}. How does a continuous threshold over discrete values work?

### Analysis

The definition uses continuous-threshold language ("smallest omega such that...") but the model has only four discrete displacement rates. This is **ill-posed as written**.

**However**, the mathematics works if interpreted correctly. The protest level pi(omega, s*) = Omega(omega) * Lambda((omega - s*)/sigma) is a continuous function of omega when omega is treated as a free parameter. The visibility threshold can be defined over this continuous domain: omega_bar_x^vis is the omega where the incumbent's posterior probability of crisis crosses 1/2. The discrete states {omega_R, omega_T1, omega_T2, omega_N} are specific points on this continuum.

### Recommended fix

Rewrite the definition as: "Consider the protest function pi(omega) as a continuous function of hypothetical displacement rate omega. Define omega_bar_x^vis as the smallest omega in [0,1] such that an incumbent in regime x, observing pi_tilde_t corresponding to displacement rate omega, correctly identifies a crisis with probability > 1/2. The crossed fragility condition requires that the discrete states satisfy omega_R < omega_bar_A^vis < omega_T2."

### Verdict
**Conceptual gap in exposition, not in mathematics.** Fixable with a cleaner definition. Severity: **Medium**.

---

## 5. General: Logical gaps, sign errors, unstated assumptions

### G1: Inconsistency between formalization and reformulation plan (HIGH)

The analytical formalization uses **asymmetric** parameters:
- omega_R = 0.30, omega_T1 = 0.05, omega_T2 = 0.60 (rapid and threshold have DIFFERENT t=2 rates)

The reformulation plan uses **symmetric** parameters:
- omega_H = 0.40, omega_L = 0.05, with R = (omega_H, omega_H) and T = (omega_L, omega_H) -- both R and T have omega_H in t=2

These are **different models with different mechanisms**:
- Symmetric model: autocracy channel works through **composition** (Omega_2(R) > Omega_2(T))
- Asymmetric model: autocracy channel works through **visibility piercing** (omega_T2 >> omega_R overwhelms information suppression)

The Corollary at the end of Section 3 explicitly states: "Unlike the symmetric model (where Omega_2(R) > Omega_2(T)), the asymmetric displacement creates Omega_2(T) > Omega_2(R)." This **reverses** the composition ranking, invalidating the reformulation plan's mechanism for autocracy.

**Action required**: Decide which model is canonical and reconcile the documents.

### G2: Compensation rule underspecified (HIGH)

Section 6.2 states: comp_t = 1 iff Delta_P(pi_tilde) * P(crisis | pi_tilde) > omega_hat * B

But:
- Delta_P is never formally defined (what probabilities are being compared?)
- P(crisis | pi_tilde) is defined informally ("posterior belief that displacement is high")
- omega_hat = (pi*)^{-1}(pi_t) is mentioned only in the reformulation plan, not in the formalization
- The RHS (omega_hat * B) is the fiscal cost, but the LHS dimensions are unclear (probability * probability vs. expected benefit?)

Without full specification, the fixed-point argument (Section 7.2) and the T x A survival argument (Section 8.2) cannot be rigorously verified.

### G3: Uniqueness proof is a sketch (MEDIUM)

Section 4, part (b): "Formal proof via IFT perturbation around sigma = 0." No quantitative bound on sigma. The numerical examples use sigma = 0.10 or 0.15, but there is no verification that these are in the uniqueness region.

### G4: v_1^{A,c} formula incomplete (MEDIUM)

Section 7.1: v_1^{A,c} = (1-B) + delta * E[(1 - y_{i2})]

The term E[(1 - y_{i2})] depends on whether compensation is active in t=2 (phi_2), which depends on whether the autocrat detects and responds to the t=2 crisis. This creates a nested fixed-point: the worker's t=1 protest depends on v_1, which depends on E[phi_2], which depends on the incumbent's t=2 decision, which depends on the t=2 protest, which depends on compensation expectations. This circularity is not addressed.

### G5: Independence assumption in absorbing displacement (LOW)

Section 0.4: Omega_2 = omega_1 + (1 - omega_1) * omega_2 assumes d_{i2} is independent of d_{i1} for non-displaced workers. This is stated (iid conditional on theta) but economically strong: workers who survived t=1 displacement may differ systematically from random. Flagged as a simplification.

### G6: Section 8.2, T x D -- democracy compensates but lag makes it futile (LOW)

The argument assumes democracy passes comp_2 = 1 in t=2 under threshold. This requires the compensation rule to trigger. With omega_T2 = 0.60 and high protest, this should hold, but is not explicitly verified against the compensation rule.

### G7: Absorbing displacement + same omega_R both periods under rapid (LOW)

Under rapid, omega_1 = omega_2 = omega_R. But with absorbing displacement, the "new" displacement in t=2 applies only to the non-displaced fraction (1 - omega_R). The signal s_{i2} = omega_R + sigma * epsilon -- but what does omega_R mean in t=2? It is the per-period displacement rate applied to the surviving employed population. The signal is about the current-period rate, but the cumulative displaced fraction is Omega_2 = omega_R(2 - omega_R). Workers' signals observe omega_R (per-period rate), not Omega_2 (cumulative rate). This is consistent but could be confusing.

---

## Summary Table

| Section | Issue | Severity | Status |
|---------|-------|----------|--------|
| 3 (Lemma 2) | Exact bound omits omega_T1 in numerator; text gives approximation | Low | Correct numerically |
| 7.2 (Fixed point) | Logic correct; compensation rule needs specification | Medium | Qualitatively correct |
| 8 (T x A, Lambda) | "approx 1" overstated for sigma = 0.15; value ~0.88-0.93 | Medium | Qualitatively correct |
| 5 (Visibility threshold) | Definition ill-posed over discrete states; reframe needed | Medium | Fixable |
| General (G1) | Asymmetric vs symmetric model inconsistency | **High** | Needs resolution |
| General (G2) | Compensation rule underspecified | **High** | Blocks rigor |
| General (G3) | Uniqueness proof sketch only | Medium | Needs quantitative bound |
| General (G4) | v_1^{A,c} incomplete (nested fixed-point) | Medium | Needs resolution |
| General (G5) | Independence in absorbing displacement | Low | Flagged |

## Overall Assessment

The core theoretical argument (information-speed tradeoff generating crossed fragility) is logically coherent and well-motivated. The main structural issues are:

1. The relationship between the asymmetric formalization and the symmetric reformulation plan must be reconciled -- these are different models with different autocracy mechanisms.
2. The compensation rule must be fully specified to close the fixed-point arguments.
3. The visibility threshold definition needs a clean restatement.

No outright mathematical errors were found in the computations. The issues are gaps in specification and precision, not sign errors or logical contradictions.
