# Independent Verification of Lemma 0 Claims

**Date**: 2026-05-02  
**Verifier**: Independent mathematical verifier (not the author of the proof)  
**Scope**: Seven claims from the Lemma 0 proof in paper.Rmd + quality_reports/2026-05-02_lemma0-rigorous-proof.md

---

## Summary

| Claim | Description | Verdict |
|-------|-------------|---------|
| 1 | Participation threshold h_bar formula | **PASS** (with clarification) |
| 2 | Single-state equilibrium pi* = h_bar | **PASS** |
| 3 | Comparative statics directions | **PASS** (with caveat) |
| 4 | IVT existence proof boundary behavior | **PASS** |
| 5 | Uniqueness via G'(s*) < 0 | **PASS** (numerically; RC3 fails at baseline) |
| 6 | IFT comparative statics | **PASS** |
| 7 | Parameter verification of RC4 | **PASS** (RC4 holds, but downstream issue found) |

**Critical finding**: A parameter inconsistency is confirmed. At baseline parameters (v = 1.9, C_A = 2.0), the single-state equilibrium gives pi* = h_bar = 0.05, which is LESS than pi_fall^A = 0.06. The autocracy survives under rapid t=2. This contradicts Proposition 2(a). The Lemma 0 proof itself is correct; the problem is downstream.

---

## Claim 1: Participation Threshold h_bar

**Question**: Is h_bar = C_x/(v + C_x) or h_bar = 1 - v/C_x?

**Analysis**: These formulas arise from two DIFFERENT payoff structures:

- **Paper's payoff** (line 122 of paper.Rmd): Protest iff v_i > C_x(1 - h(pi)). The payoff from protesting is u = v - C_x(1 - pi), and from not protesting is 0. Indifference: v = C_x(1 - pi), giving pi = 1 - v/C_x. Therefore **h_bar = 1 - v/C_x**.

- **Alternative payoff** (from the verification prompt): u = v*pi - C_x(1 - pi) = (v + C_x)*pi - C_x. Indifference: (v + C_x)*pi = C_x, giving pi = C_x/(v + C_x).

The key distinction is whether the expressive benefit v is a fixed private value (paper's formulation) or scales with participation. In the paper, v is a fixed expressive benefit of protesting (anger, fear), and C_x(1 - pi) is the net cost reduced by safety-in-numbers. The condition v > C_x(1 - pi) means "my private motivation exceeds the effective cost." This is the standard global games formulation.

**Numerical check**: With v = 1.9, C_A = 2.0:
- Paper: h_bar = 1 - 1.9/2.0 = 0.05
- Alternative: h_bar = 2.0/3.9 = 0.513

These are entirely different numbers. The paper's formula is correct given its own payoff specification.

**Verdict**: **PASS**. h_bar = 1 - v/C_x is correct for the paper's payoff structure. The verification prompt's formula h_bar = C_x/(v + C_x) corresponds to a different payoff specification not used in the paper.

---

## Claim 2: Single-State Equilibrium pi* = h_bar

**Question**: Does pi* = h_bar hold exactly, or only in some limit?

**Derivation from first principles**: In a single-state game with known omega, displaced fraction Omega, logistic noise:
- Protest pi = Omega * Lambda((omega - s*)/sigma)
- Indifference: E[pi | d=1, s=s*] = h_bar
- In single state, this becomes: Omega * Lambda((omega - s*)/sigma) = h_bar
- Therefore pi* = h_bar exactly (by the indifference condition itself)

This is NOT an approximation. It holds for any finite sigma, as long as 0 < h_bar < Omega. The result is exact because with a single known state, there is no uncertainty about omega -- the only uncertainty is about how many others cross the cutoff, which is pinned by the logistic CDF.

**Numerical verification**: Tested at 7 parameter combinations (varying omega, Omega, sigma, v, C_x). All produce |pi* - h_bar| < 10^{-16}.

**Verdict**: **PASS**. pi* = h_bar is exact for single-state logistic global games, not a limiting result.

---

## Claim 3: Comparative Statics Directions

**Question**: The paper claims dpi*/dC_x > 0 and dpi*/dv < 0. Are these correct?

**Derivation**: From pi* = h_bar = 1 - v/C_x:
- dpi*/dC_x = d(1 - v/C_x)/dC_x = v/C_x^2 > 0 (confirmed)
- dpi*/dv = d(1 - v/C_x)/dv = -1/C_x < 0 (confirmed)

**Intuition**: These are counterintuitive at first glance but correct. h_bar is the COORDINATION THRESHOLD -- the minimum participation needed to make the marginal worker willing to protest. The equilibrium pins pi* = h_bar. When C_x rises, more coordination is needed (h_bar rises), and the equilibrium meets the higher threshold.

**Critical caveat**: The interior comparative statics hold only for C_x in (v, v/(1-Omega)). Outside this range:
- C_x < v: dominant strategy, pi* = Omega (all displaced protest)
- C_x > v/(1-Omega): no interior equilibrium, pi* = 0

So globally, protest is NOT monotonically increasing in C_x. It is flat at Omega, then increases from 0 toward Omega in the interior, then crashes to 0.

The paper's rigorous proof (quality report Section 3.7) correctly states the domain restriction. The paper text (Appendix A, Corollary 1 proof) uses the notation "M1 (protest decreasing in C_A)" which CONTRADICTS the actual mathematical result. This is a labeling error in the downstream usage, not in Lemma 0 itself.

**Verdict**: **PASS** for the mathematical claims. However, the label "M1 (protest decreasing in C_A)" used in the Corollary 1 proof (line 452 of paper.Rmd) is INCORRECT -- it should say "protest increasing in C_A in the interior."

---

## Claim 4: IVT Existence Proof Boundary Behavior

**Right boundary (s -> +inf)**: As s -> +inf, Lambda((omega_theta - s)/sigma) -> 0 for all theta. Therefore G(s) -> 0 - h_bar = -h_bar < 0.

Numerical verification at s = 10: G(10) approx -0.05 = -h_bar. **Correct.**

**Left boundary (s -> -inf)**: As s -> -inf, Lambda((omega_theta - s)/sigma) -> 1, and the posterior weights converge to w_theta^- = omega_theta * p_theta * exp(-omega_theta/sigma) / Z^-.

The limiting value:
G_-inf = sum(w_theta^- * Omega_1(theta)) - h_bar = 0.0959 - 0.05 = 0.0459 > 0.

The paper's proof SKETCH (line 252 of paper.Rmd) says "G -> Omega(theta*) - h_bar where theta* has largest omega_t." This is **imprecise** -- the actual limit is a posterior-weighted average, not the max displaced fraction. However, the rigorous proof in quality_reports correctly uses RC4 with the weighted sum.

Numerical verification at s = -0.5: G(-0.5) = 0.0462 > 0. **Correct.**

**Verdict**: **PASS**. The IVT argument is valid. The proof sketch is slightly imprecise but the rigorous version is correct.

---

## Claim 5: Uniqueness via G'(s*) < 0

**Numerical verification**: At s* = 0.4578 (found by root-finding):
- G'(s*) = -0.4105 < 0 (confirmed)

Decomposition:
- Coordination term: sum(q_theta * Pi'_theta) = -0.4145 (dominates)
- Posterior-shift term: sum(q'_theta * Pi_theta) = +0.0040 (small)
- Total: -0.4105

The coordination term is ~100x larger than the posterior-shift term, confirming that the coordination effect dominates.

**Uniqueness**: Scanning G(s) over [-1, 1.45] reveals exactly 1 sign change, confirming a unique zero.

**RC3 status**: The sufficient condition RC3 requires sigma < 0.0062, but the actual sigma = 0.10. The condition FAILS. However, uniqueness holds numerically. The proof correctly notes RC3 is sufficient, not necessary, and the quality report recommends stating uniqueness is "verified numerically at baseline."

**Verdict**: **PASS** (numerically confirmed; formal sufficient condition not satisfied at baseline).

---

## Claim 6: IFT Comparative Statics

**Verification**: G(s; C_x, v) = H(s) - h_bar(C_x, v). Since H(s) = sum P(theta|d=1,s) * Omega_theta * Lambda((omega_theta-s)/sigma) depends only on omega, sigma, priors, and s -- NOT on C_x or v -- we have:

- dG/dC_x = -dh_bar/dC_x = -(v/C_x^2) = -v/C_x^2 < 0
- ds*/dC_x = -dG/dC_x / G'(s*) = v/(C_x^2 * G'(s*))
- Since G'(s*) < 0: ds*/dC_x < 0 (cutoff decreases with cost)

This is internally consistent: higher cost lowers the cutoff, which means fewer signals exceed it, but the threshold h_bar rises, and the equilibrium pi* = h_bar increases.

At baseline: dG/dC_x = -1.9/4 = -0.475. Confirmed.

**Verdict**: **PASS**. All IFT calculations are correct.

---

## Claim 7: Parameter Verification

**RC4 at baseline (autocracy, t=1)**:

Limiting weights:
- w_R^- = 0.30 * 0.30 * exp(-3) = 0.00448 (normalized: 0.2226)
- w_T^- = 0.05 * 0.30 * exp(-0.5) = 0.00910 (normalized: 0.4520)
- w_N^- = 0.02 * 0.40 * exp(-0.2) = 0.00655 (normalized: 0.3254)

LHS = 0.2226*0.30 + 0.4520*0.05 + 0.3254*0.02 = 0.0959
RHS = h_bar = 0.05

0.0959 > 0.05: **RC4 holds** with margin 0.046.

**Other RCs at baseline**:
- RC1: v = 1.9 < C_A = 2.0, h_bar = 0.05 in (0,1). **Passes.**
- RC2: h_bar = 0.05 < max(Omega_1) = 0.30. **Passes.**
- RC3: sigma = 0.10 > sigma_bound = 0.0062. **Fails** (sufficient condition too strong).

**Downstream parameter issue (CRITICAL)**:

At t=2 under rapid automation, single-state equilibrium gives:
- pi* = h_bar = 1 - 1.9/2.0 = 0.05
- pi_fall^A = 0.06
- pi* = 0.05 < 0.06 = pi_fall^A

The autocracy SURVIVES. This contradicts Proposition 2(a) which claims the autocracy falls under rapid displacement.

For the autocracy to fall, we need pi* > 0.06, i.e., h_bar > 0.06, i.e., 1 - v/C_A > 0.06, i.e., v < 0.94 * C_A = 1.88. With v = 1.9, this fails by 0.02.

Possible fixes:
1. Lower pi_fall^A to 0.04 (then 0.05 > 0.04, works)
2. Raise C_A to 2.15 (then h_bar = 1 - 1.9/2.15 = 0.116, works)
3. Lower v to 1.88 (then h_bar = 0.06, knife-edge)
4. Use a different payoff normalization

**Verdict**: **PASS** on RC4 itself. **FAIL** on downstream consistency: the parameter values are inconsistent with Proposition 2(a)'s claim that autocracy falls under rapid.

---

## Overall Assessment

The Lemma 0 proof is **mathematically correct** in all its claims. The h_bar formula, the single-state equivalence, the IVT existence argument, the uniqueness mechanism, and the IFT comparative statics are all verified.

Two issues require attention:

1. **Label inconsistency** (medium severity): The Corollary 1 proof (line 452) references "M1 (protest decreasing in C_A)" but the actual result from Lemma 0(g) is that protest is INCREASING in C_A in the interior. This label should be corrected.

2. **Parameter inconsistency** (high severity): At baseline parameters, pi* = 0.05 < pi_fall^A = 0.06, so the autocracy survives under rapid t=2. This breaks Proposition 2(a). The quality report on Lemma 0 (Section 3.8, lines 268-284) already identifies this issue. A parameter adjustment is needed.

The RC3 sufficient condition for uniqueness fails at baseline (sigma = 0.10 >> sigma_bound = 0.006), but this is acknowledged in the proof. Uniqueness holds numerically with G'(s*) = -0.41 strongly negative.
