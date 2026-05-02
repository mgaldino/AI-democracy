# Analytical Review: Formalization of the $C_A$ Sweet Spot (Corollary 1)

**Reviewer**: Formal model reviewer (analytical correctness)
**Date**: 2026-05-02
**Document reviewed**: `notes/formalization_CA_sweet_spot.md`
**Reference model**: `paper.Rmd` Sections 3--4; `notes/analytical_formalization.md` (v5)

---

## Overall Assessment

**Grade: PASS WITH CONCERNS**

The formalization is well-structured and captures the right economic intuition. The existence arguments for $C_A^{\min}$ and $C_A^{\max}$ (Steps 1 and 2) are correct via the intermediate value theorem. However, the non-emptiness argument (Step 3) contains a significant analytical error: the central claim that "the slope vanishes before the level does" is false in the relevant asymptotic regime, and the argument as written does not rigorously establish inequality (6). The result is likely TRUE for the baseline parameterization, but the proof strategy is flawed. Additionally, the interaction between the sweet spot and condition (iv) is more problematic than the document acknowledges.

---

## Issue-by-Issue Analysis

### 1. Well-Definedness of $C_A^{\min}$ and $C_A^{\max}$

**Verdict: PASS**

Both objects are properly defined via implicit equations:
- $C_A^{\min}$: defined by $\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H$ (eq. 2)
- $C_A^{\max}$: defined by $\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}}$ (eq. 4)

The existence proofs via the IVT are correct:
- For $C_A^{\min}$: The boundary conditions are valid. At $C_A = C_D$, $\bar{\omega}_A^{\text{comp}}(C_D) = \bar{\omega}_D^{\text{comp}} < \omega_H$ follows from Proposition 1(a) (democracy compensates under rapid). As $C_A \to \infty$, $I(C_A) \to 0$, the posterior converges to the prior, $\Delta P \to 0$, and $\bar{\omega}_A^{\text{comp}} \to \infty$. The IVT applies given continuity of $\bar{\omega}_A^{\text{comp}}$ in $C_A$ (which follows from the continuity of the equilibrium mapping in parameters, standard in global games).
- For $C_A^{\max}$: At $C_A = C_D$, $\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$ holds because the protest level under democratic conditions is substantial (and $\bar{\pi}_A^{\text{fall}} = 0.05$ is low). As $C_A \to \infty$, $\pi^* \to 0 < \bar{\pi}_A^{\text{fall}}$. IVT applies.

**Minor concern**: The IVT argument for $C_A^{\min}$ assumes that $\bar{\omega}_A^{\text{comp}}(C_A)$ is continuous. This requires that the equilibrium mapping $\pi^*(\omega; C_A)$ is continuous in $C_A$, which in turn requires that the equilibrium cutoff $s^*(C_A)$ is continuous. In the global game with a unique equilibrium, this follows from the implicit function theorem applied to the equilibrium condition $G(s^*, C_A) = 0$, provided $\partial G / \partial s^* \neq 0$ at the equilibrium. This is not explicitly verified but is generically true. Not a serious gap.

### 2. Logical Validity of Steps 1 and 2

**Verdict: PASS**

Step 1 (lower bound) correctly identifies the mechanism: as $C_A$ increases, informativeness $I(C_A)$ decreases, the autocratic incumbent's compensation threshold $\bar{\omega}_A^{\text{comp}}$ rises, and at $C_A^{\min}$ the threshold crosses $\omega_H$, meaning the incumbent no longer compensates under rapid. The logic is sound and consistent with Lemma 1.

Step 2 (upper bound) correctly identifies that as $C_A$ increases, equilibrium protest $\pi^*$ decreases (by M1), and at $C_A^{\max}$ the protest level drops below $\bar{\pi}_A^{\text{fall}}$, meaning the autocracy survives by sheer repressive suppression. The logic is sound.

### 3. Consistency of M1--M4 with the Base Model

**Verdict: PASS WITH ONE CONCERN**

**(M1)** $\pi^*$ decreasing in $C_x$: **Valid.** In the global game with $h(\pi) = \pi$ (linear safety in numbers), the indifference condition for the marginal worker is $v = C_x(1 - E[\pi \mid s_i = s^*])$. Higher $C_x$ raises the right-hand side for any given $s^*$, which pushes the equilibrium cutoff $s^*$ upward. A higher $s^*$ means fewer workers cross the protest threshold, so $\pi^*(\omega) = \Omega \cdot \Pr(s_i > s^* \mid \omega)$ is lower for each $\omega$. In the unique equilibrium (which the global games machinery guarantees for sufficiently precise signals), this comparative static is monotone. The concern flagged by the agent about whether $\pi$ is decreasing in $C_x$ is NOT valid --- M1 holds.

**(M2)** $\pi^*$ increasing in $\Omega$: **Valid.** More displaced workers directly increases the pool of potential protesters. The equilibrium cutoff $s^*$ may adjust, but the net effect on $\pi^* = \Omega \cdot \Pr(s_i > s^*)$ is positive (the extensive margin dominates).

**(M3)** $I(C_x) = |\partial \pi^*/\partial \omega|$ decreasing in $C_x$: **Valid.** This is a consequence of the flattening of $\pi^*(\omega)$ as $C_x$ increases. The derivative $\partial \pi^*/\partial \omega$ involves the density of the signal distribution at the cutoff, which decreases as $s^*$ moves into the tail. More precisely: $\partial \pi^*/\partial \omega = (\Omega/\sigma) \cdot f(({\omega - s^*})/{\sigma})$, which depends on how far $\omega - s^*$ is from the mode of $f$. As $C_x$ increases, $s^*$ increases, $\omega - s^*$ becomes more negative, and for the logistic density $f$ (which is unimodal at 0), the density decreases. Thus $I(C_x)$ decreases.

**(M4)** $\bar{\omega}_A^{\text{comp}}$ increasing in $C_A$: **Needs care.** This is stated as a "consequence of M3 and the incumbent's Bayesian inference." The logic is: less informative protest $\to$ less posterior updating $\to$ lower perceived $\Delta P$ $\to$ higher threshold $\bar{\omega}_A^{\text{comp}}$. This is economically compelling, but the formal proof requires showing that the COMPOSITE function $\bar{\omega}_A^{\text{comp}}(C_A)$ is monotone, not just that its inputs are monotone. The compensation threshold is defined by $\Delta P(\bar{\omega}) = \bar{\omega} \cdot B$, where $\Delta P$ depends on $C_A$ through the entire equilibrium mapping. The comparative static $\partial \bar{\omega}_A^{\text{comp}} / \partial C_A > 0$ requires that the LHS $\Delta P$ shifts down faster than the RHS $\bar{\omega} \cdot B$ adjusts, which is plausible but not formally proven. This is stated as proven in Lemma 1, but the proof sketch in paper.Rmd is only a sketch.

**Not a blocking issue** for the Corollary, since M4 is an input from Lemma 1, and the Corollary's job is to derive consequences from M1--M4, not to prove them. But the formal model must eventually provide a complete proof of M4.

### 4. Non-Emptiness Argument (Step 3): MAIN CONCERN

**Verdict: FAIL (as written)**

This is the critical step and it contains a significant analytical error.

#### 4.1 The Central Claim Is Asymptotically False

The formalization's central argument (Section 2, Step 3, part (c)) states:

> "The slope vanishes before the level does."

Specifically, it claims that as $C_A$ increases, the SLOPE $|\partial \pi^*/\partial \omega| \propto [\pi^*(\omega_H) - \pi^*(\omega_L)] / (\omega_H - \omega_L)$ can vanish while the LEVEL $\pi^*(\omega_H)$ remains well above $\bar{\pi}_A^{\text{fall}}$.

**This is false in the relevant asymptotic regime.** For the logistic distribution, in the tail (large $s^*$, corresponding to large $C_A$):

$$\Lambda(z) \sim e^z \quad \text{as } z \to -\infty$$

So for large $C_A$ (large $s^*$):

$$\pi^*(\omega_H) = \Omega_2^R \cdot \Lambda\!\left(\frac{\omega_H - s^*}{\sigma}\right) \sim \Omega_2^R \cdot \exp\!\left(\frac{\omega_H - s^*}{\sigma}\right)$$

$$\pi^*(\omega_L) = \Omega_2^N \cdot \Lambda\!\left(\frac{\omega_L - s^*}{\sigma}\right) \sim \Omega_2^N \cdot \exp\!\left(\frac{\omega_L - s^*}{\sigma}\right)$$

The difference:

$$\Delta \pi = \pi^*(\omega_H) - \pi^*(\omega_L) \sim \Omega_2^R \cdot e^{(\omega_H - s^*)/\sigma} - \Omega_2^N \cdot e^{(\omega_L - s^*)/\sigma}$$

Since $\omega_H > \omega_L$, the first term dominates asymptotically:

$$\Delta \pi \sim \Omega_2^R \cdot e^{(\omega_H - s^*)/\sigma}$$

The level:

$$\pi^*(\omega_H) \sim \Omega_2^R \cdot e^{(\omega_H - s^*)/\sigma}$$

Therefore:

$$\frac{\Delta \pi}{\pi^*(\omega_H)} \to 1 \quad \text{as } C_A \to \infty$$

**The difference and the level vanish at the SAME RATE.** The slope does NOT vanish before the level. The claim in part (c) is mathematically incorrect in the asymptotic regime.

#### 4.2 What the Correct Argument Should Be

The non-emptiness of the sweet spot is a **quantitative** question, not a qualitative/structural one. It depends on the specific relationship between:

1. The informativeness threshold: how large must $\Delta \pi$ be for the incumbent's posterior to shift enough to trigger compensation?
2. The fall threshold: $\pi^*(\omega_H) > \bar{\pi}_A^{\text{fall}} = 0.05$.

The key insight (which the formalization correctly identifies but does not rigorously formalize) is that the INFORMATIVENESS threshold and the FALL threshold are measured in different units:

- The informativeness threshold depends on the posterior updating problem: $\Delta \pi$ must be large enough relative to the prior uncertainty $P(N) = 0.40$ for the posterior $P(R \mid \pi)$ to shift substantially. This requires $\Delta \pi$ to be on the order of the variation in the likelihood function $P(\pi \mid \theta)$, which depends on the spread of the prior.

- The fall threshold depends only on the LEVEL: $\pi^*(\omega_H) > 0.05$.

For the sweet spot to be non-empty, we need that at the $C_A$ where the informativeness crosses the incumbent's detection threshold, the level is still above 0.05. This is a parametric condition, not a structural guarantee.

**Correct approach**: The non-emptiness should be verified by:

(a) Numerically computing $C_A^{\min}$ and $C_A^{\max}$ for the baseline parameters and checking $C_A^{\min} < C_A^{\max}$.

(b) Providing sufficient conditions on the parameters (e.g., $\bar{\pi}_A^{\text{fall}}$ sufficiently small, $p_N$ sufficiently large, $\omega_H - \omega_L$ sufficiently large) that guarantee non-emptiness.

(c) Optionally, proving non-emptiness for a single parameterization (the baseline) by explicit computation.

The formalization's Section 5 provides the numerical verification setup, which is the right approach. But the ANALYTICAL argument in Step 3 should not claim a structural/asymptotic result that is false.

#### 4.3 The Quantitative Argument in (b) Is Suggestive but Not Rigorous

The formalization argues (Step 3, part (b)):

> "For the level to fall below $\bar{\pi}_A^{\text{fall}} = 0.05$, one needs $\Pr(s_i > s^*) < 0.05/0.64 \approx 0.08$ --- fewer than 8% of displaced workers protesting."

This is correct as a necessary condition for the level to breach the threshold. The formalization then argues that flattening the informativeness requires less extreme suppression. But as shown in 4.1 above, in the tail regime, flattening and level-reduction occur at the same rate. The argument would work in the MODERATE regime (where $\Lambda$ is in the range $[0.1, 0.5]$), where the mapping can be flat while the level is moderate. But this is a quantitative claim about the specific parameter values, not a structural guarantee.

### 5. Condition (iv) Interaction

**Verdict: CONCERN**

The formalization correctly identifies that condition (iv) (autocracy survives threshold) interacts with $C_A$ through $\bar{\omega}_A^{\text{comp}}$. The sweet spot must satisfy $\bar{\omega}_A^{\text{comp}}(C_A) < \Omega_2^T$ for the threshold crisis to still trigger compensation.

The buffer is $\Omega_2^T - \omega_H = \omega_L(1 - \omega_H) = 0.05 \times 0.60 = 0.03$ with baseline parameters. This is extremely narrow. The formalization acknowledges this but offers two mitigations:

1. The threshold crisis is "self-revealing" (operates through channels beyond protest). This is a narrative argument, not a formal one. In the formal model, the SOLE information channel is $\pi$. If the formal model only has one channel but the argument relies on additional channels, the model does not support the argument.

2. Alternative parameterizations (e.g., $\omega_R = 0.30$, $\omega_{T2} = 0.60$) provide a wider buffer. This is valid but amounts to saying "the baseline parameters are poorly calibrated for this result."

**Critical observation**: The analytical formalization (v5) in `analytical_formalization.md` has moved to a DIFFERENT model structure where the autocratic trigger is the elite's economic assessment ($\tilde{\omega}_S > \bar{\omega}_A$), independent of $\pi$. Under that model, condition (iv) does NOT interact with $C_A$ at all, because the elite's trigger depends on $\omega$, not on the protest mapping. The C_A sweet spot formalization appears to be based on the OLDER model (paper.Rmd) where the incumbent's compensation decision depends on Bayesian inference from $\pi$.

**This creates a consistency issue**: If the formalization is meant for the paper.Rmd model, then condition (iv) is a real problem with a 0.03 buffer. If it is meant for the v5 model, then condition (iv) is NOT a problem (because the trigger is independent of $\pi$), but the entire $C_A^{\min}$ construction changes (because the informativeness of $\pi$ is no longer the mechanism for the dictator's dilemma -- the mechanism is the elite's noisy economic assessment).

**The formalization must choose which model it serves and be consistent with that choice.**

### 6. Circular Reasoning and Unstated Assumptions

**Verdict: MINOR CONCERNS**

(a) **No circular reasoning detected.** The argument flow is: M1--M4 $\to$ existence of $C_A^{\min}$ and $C_A^{\max}$ $\to$ non-emptiness (attempted) $\to$ Corollary. The maintained assumptions are inputs, not derived within the corollary.

(b) **Unstated assumption**: The argument uses the single-state approximation (Section 3.2) for the closed-form of $C_A^{\max}$ (eq. 8). The single-state approximation is valid when $\sigma \ll \omega_H - \omega_L$ (the states are well-separated relative to signal noise). With $\sigma = 0.15$ and $\omega_H - \omega_L = 0.35$: the ratio $\sigma / (\omega_H - \omega_L) = 0.43$, which is NOT small. The single-state approximation may be inaccurate. The document should note that eq. (8) is a rough approximation, not a tight bound.

(c) **Unstated assumption about uniqueness**: The formalization assumes a unique equilibrium in the global game (needed for $\pi^*$ to be a well-defined function of $C_A$). With $h(\pi) = \pi$ (linear), the global game may have multiple equilibria for some parameter ranges. The document should explicitly invoke the uniqueness conditions (either sufficiently small $\sigma$ or the Laplacian property under improper prior).

(d) **The model version issue (see #5)**: The formalization does not clearly state which version of the model it references. The notation and mechanisms (Bayesian inference from $\pi$ for the incumbent, informativeness $I(C_A)$ driving the dictator's dilemma) are consistent with paper.Rmd (the model as currently written), not with the v5 analytical formalization (which uses elite economic assessment independent of $\pi$). But the baseline parameters listed ($\bar{\pi}_D^{\text{fall}} = 0.40$) match the reformulated model, not the original. This creates ambiguity.

### 7. Validity of M1 (Agent's Concern)

**Verdict: M1 IS VALID. The concern is not warranted.**

The agent flagged: "With $h(\pi) = \pi$ (linear safety in numbers), the equilibrium condition is $v_i > C_x(1-\pi)$, so $\pi = \Omega \cdot \Pr(v_i > C_x(1-\pi))$. Is $\pi$ decreasing in $C_x$?"

Yes. In the unique equilibrium of the global game:

1. The indifference condition for the marginal displaced worker (with signal $s_i = s^*$) is:

$$v = C_x \cdot (1 - E[\pi \mid s_i = s^*])$$

2. As $C_x$ increases, for any given $s^*$, the RHS increases (more cost for the same expected safety in numbers). To restore indifference, the worker must expect MORE safety in numbers, which requires $s^*$ to increase (stricter threshold), which is only self-consistent if fewer workers protest.

3. In the unique equilibrium (guaranteed by the global games structure with private signals), the comparative static $\partial s^* / \partial C_x > 0$ holds, which directly implies $\pi^*(\omega; C_x)$ is decreasing in $C_x$ for each $\omega$.

The concern about potential non-monotonicity (e.g., from the complementarity in $h(\pi) = \pi$) does not arise in the unique equilibrium. Complementarity generates multiple equilibria in the complete-information game, but the global game selects a unique equilibrium, and the selected equilibrium is monotone in all parameters that shift incentives uniformly across workers. $C_x$ is such a parameter (it affects all workers' costs equally), so M1 holds.

---

## Summary of Issues

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1 | $C_A^{\min}$, $C_A^{\max}$ well-defined and existence proven | --- | PASS |
| 2 | Steps 1-2 logically valid | --- | PASS |
| 3 | M1-M3 consistent with base model | --- | PASS |
| 4 | M4 (monotonicity of $\bar{\omega}_A^{\text{comp}}$) assumed from Lemma 1; proof sketch only | Minor | Noted |
| 5 | **Non-emptiness (Step 3): "slope vanishes before level" is asymptotically false** | **Major** | **FAIL** |
| 6 | Non-emptiness is a quantitative claim, not structural; needs numerical verification or explicit sufficient conditions | Major | Open |
| 7 | Condition (iv) buffer = 0.03; mitigation via "self-revealing" is narrative, not formal | Moderate | Concern |
| 8 | **Model version ambiguity**: formalization uses paper.Rmd mechanism (Bayesian inference from $\pi$) but v5 analytical formalization uses elite economic assessment (independent of $\pi$) | Moderate | Concern |
| 9 | Single-state approximation for $C_A^{\max}$ may be inaccurate ($\sigma / \Delta\omega = 0.43$) | Minor | Noted |
| 10 | Uniqueness of equilibrium assumed but not explicitly invoked | Minor | Noted |
| 11 | M1 validity: agent's concern is unwarranted; M1 holds in the unique equilibrium | --- | PASS |

---

## Recommendations

1. **Replace the analytical non-emptiness argument** (Step 3) with either:
   - (a) A purely numerical verification for the baseline parameterization (compute $C_A^{\min}$ and $C_A^{\max}$ by root-finding and check $C_A^{\min} < C_A^{\max}$), OR
   - (b) A correct analytical argument based on the INTERMEDIATE regime (not the tail). The argument would be: at moderate $C_A$, both $\pi^*(\omega_H)$ and $\pi^*(\omega_L)$ are in the range where $\Lambda$ changes slowly, so the mapping is flat while the level is moderate. This is a statement about the logistic CDF's properties in the intermediate regime, not an asymptotic statement. It can be formalized using the fact that the logistic CDF has maximum slope at $z = 0$ (where $\Lambda = 0.5$) and the slope drops off quadratically, meaning the mapping pi*(omega) flattens in the moderate regime while the level is still order-$\Omega/2$, which for $\Omega = 0.64$ gives level $\approx 0.32 \gg 0.05$.

2. **Resolve the model version ambiguity.** If the formalization is for the paper.Rmd model (Bayesian inference from $\pi$), keep the structure but acknowledge the condition (iv) problem explicitly. If it is for the v5 model (elite economic assessment), rewrite the $C_A^{\min}$ construction to reflect the new trigger mechanism. In the v5 model, $C_A$ enters through the PROTEST level (affecting both the fall condition and the democratic voice trigger), not through the informativeness of $\pi$ for the incumbent. The dictator's dilemma is no longer mediated by $\pi$'s informativeness but by the elite's noisy economic assessment.

3. **Delete the claim** "the slope vanishes before the level does" (Step 3, part (c), p. 150). Replace with: "At the $C_A$ where the informativeness threshold is crossed, the protest level remains above $\bar{\pi}_A^{\text{fall}}$ for the baseline parameters. This is verified numerically in Section 5."

4. **Strengthen condition (iv) analysis.** Either:
   - Adopt the v5 model structure (elite trigger independent of $\pi$), which eliminates the interaction, OR
   - Use parameters with a wider buffer (e.g., v5's $\omega_R = 0.30$, $\omega_{T2} = 0.60$, giving buffer $= 0.32$), OR
   - Prove formally that $C_A^{(iv)} > C_A^{\max}$ (the protest-suppression bound binds before the threshold-visibility bound) using the functional form.

5. **Add explicit uniqueness condition.** State: "We assume $\sigma$ is sufficiently small that the global game has a unique equilibrium (Morris and Shin 2003, Theorem 1). Under this condition, $\pi^*(\omega; C_A)$ is a well-defined function and the comparative statics M1--M4 apply to the unique equilibrium."

---

## Conclusion

The formalization correctly identifies the two competing effects of $C_A$ (informational blindness vs. protest suppression) and correctly constructs the sweet spot as an interval. The existence arguments for the bounds are sound. However, the non-emptiness proof (the most important step) relies on an asymptotically false claim about the relative rates at which the slope and level of the protest mapping vanish. The result is likely correct for the baseline parameters, but the proof needs to be rewritten. The condition (iv) interaction and model version ambiguity are secondary concerns that should also be resolved.

**Grade: PASS WITH CONCERNS** (would be PASS after fixing the non-emptiness argument and clarifying the model version).
