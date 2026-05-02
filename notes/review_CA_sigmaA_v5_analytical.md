# Analytical Review: C_A Sweet Spot and sigma_A Amplification (v5 Formalization)

**Reviewer**: Formal model reviewer (analytical correctness)
**Date**: 2026-05-02
**Document reviewed**: `notes/formalization_CA_sigmaA_v5.md`
**Authoritative model**: `notes/analytical_formalization.md` (v5: asymmetric triggers, selectorate as meta-primitive)
**Prior reviews consulted**: `notes/review_CA_analytical.md` (old formalization), `notes/review_CA_numerical.md` (old numerical)

---

## Overall Assessment

**Grade: PASS WITH CONCERNS**

The v5 formalization is a substantial improvement over the old formalization. It correctly separates the $C_A$ channel (protest volume) from the dictator's dilemma channel ($\sigma_A$ / elite assessment), which eliminates the most problematic features of the old version -- the informativeness-based $C_A^{\min}$, the flawed "slope vanishes before level" non-emptiness argument, and the narrow condition (iv) buffer. The $\sigma_A$ amplification proposition (Section 2) is directionally correct but contains a significant analytical gap in part (b), which the document itself diagnoses and partially corrects through self-review. The main concerns are: (1) a lingering issue with the gap-widening claim in the amplification result, (2) the Laplacian lower bound is used incorrectly as a bound on the multi-state equilibrium, and (3) several unstated assumptions about the functional form of $\bar{\omega}_A(\sigma_A)$.

---

## Item-by-Item Analysis

### 1. Is the $C_A^{\min} = C_D$ lower bound justified?

**Verdict: PASS**

In the v5 model, the autocratic elite's compensation trigger is $\tilde{\omega}_S > \bar{\omega}_A$, which is independent of both $\pi$ and $C_A$. The elite's failure to compensate under rapid is driven entirely by $\omega_R < \bar{\omega}_A$ -- a condition on the economic fundamental relative to the elite's threshold, not on protest informativeness. Therefore the old mechanism (Bayesian inference from $\pi \to$ informativeness-based $C_A^{\min}$) is genuinely absent from v5.

The lower bound $C_A^{\min} = C_D$ is definitional: for the regime to be meaningfully autocratic, its protest cost must exceed the democratic cost. The document correctly notes (Step 1, p. 90-92) that even at $C_A$ slightly above $C_D$, the dictator's dilemma operates because $P(\tilde{\omega}_S > \bar{\omega}_A | \omega_R) < 1/2$, given $\omega_R < \bar{\omega}_A$. This is independent of $C_A$.

**This is a genuine improvement over the old formalization**, where the lower bound relied on the contestable claim that protest informativeness drops faster than protest level (shown to be asymptotically false in the prior review).

**One minor note**: The bound $C_A > C_D$ is conceptual, not derived from equilibrium analysis. It is an assumption about what constitutes an autocracy. This is fine for the paper's purposes (it is a definition, not a theorem), but the document should be clear that this is a definitional assumption, not a derived result. The document does state this explicitly (Step 1: "The lower bound is definitional"), so this is handled correctly.

### 2. Is the IVT argument for $C_A^{\max}$ valid given that the transition may be discontinuous?

**Verdict: PASS WITH CONCERN**

The prior numerical review (of the OLD model with 3 discrete states) found that the equilibrium transition at $C_A^{\max}$ is **discontinuous**: the E[pi|d=1,s*] function is humped, and the equilibrium collapses from $\pi^* \approx 0.58$ to $\pi^* = 0$ when $C_A$ crosses the collapse point (~1.67 in the old parameterization). This is a saddle-node bifurcation, not a smooth zero-crossing.

**Does this concern apply to the v5 formalization?** The answer depends on the equilibrium structure of the v5 model:

- The v5 model uses the same global game structure with the same signal distribution (logistic), the same safety-in-numbers function ($h(\pi) = \pi$), and the same type of multi-state prior ($\theta \in \{R, T, N\}$ with discrete support).

- The humped $E[\pi|d=1,s^*]$ is a consequence of the posterior-weighted sum over discrete states. As $s^*$ increases, the posterior shifts toward higher-$\omega$ states (likelihood ratio effect), but $\Lambda((\omega - s^*)/\sigma) \to 0$ for all states. The competition between these forces creates the hump. **This feature is structural and carries over to v5.**

- Therefore, the equilibrium in v5 likely exhibits the same saddle-node bifurcation at $C_A^{\max}$.

**The IVT argument in Step 2 (p. 94-102)**: The document applies the IVT to the "continuous function $C_A \mapsto \pi^*(C_A, \Omega_2^R, 1) - \bar{\pi}_A^{\text{fall}}$" and claims it crosses zero at a unique point.

This is **technically valid** if we interpret $\pi^*$ as the equilibrium of the LEFT root (coordination equilibrium), which is the relevant one. As $C_A$ increases:
- At $C_A = C_D$: $\pi^*(C_D, \Omega_2^R, 1) \gg \bar{\pi}_A^{\text{fall}}$ (positive).
- At $C_A \to \infty$: $\pi^* \to 0$ (negative).

But the issue is that $\pi^*$ does not cross zero smoothly -- it **jumps** from a positive value to zero at the bifurcation point. The IVT still works in a technical sense: the function $\pi^*(C_A) - \bar{\pi}_A^{\text{fall}}$ is positive for $C_A$ below the collapse point and negative (in fact, equal to $-\bar{\pi}_A^{\text{fall}}$) above it. Since $\pi^*$ at the left root just before collapse is much higher than $\bar{\pi}_A^{\text{fall}}$ (the old numerical review found $\pi^* = 0.58 \gg 0.05$), the function never smoothly crosses the threshold -- it jumps past it. The $C_A^{\max}$ is therefore the collapse point itself, not a smooth crossing point.

**Consequence**: The uniqueness claim at the end of Step 2 ("Uniqueness follows from the strict monotonicity of $\pi^*$ in $C_A$") is technically incorrect as stated, because at the collapse point the equilibrium is not unique -- there is a saddle-node where the left and right roots coalesce. However, this does not affect the result: $C_A^{\max}$ exists, is well-defined (as the supremum of $C_A$ values for which $\pi^* > \bar{\pi}_A^{\text{fall}}$), and satisfies $C_A^{\max} > C_D$.

**The correct statement** would be: $C_A^{\max}$ is the supremum of $\{C_A > C_D : \pi^*(C_A, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}\}$. This supremum exists and is finite (bounded above by $C_A^{\text{dom}} = v/(1-\Omega_2^R)$). The IVT is not strictly needed; a supremum argument suffices.

**Impact**: Minor. The conclusion is correct; the proof mechanism is slightly misidentified but can be repaired easily.

### 3. Is the non-emptiness argument correct?

**Verdict: PASS**

This is where the v5 formalization makes its biggest improvement. The old formalization used a structural claim ("slope vanishes before level") that the prior review showed to be asymptotically false. The v5 formalization replaces this with a **parametric condition** (NE):

$$\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}} \tag{NE}$$

The argument is:
- If (NE) holds, then at $C_A = C_D$ the left side is positive, so $C_A^{\max} > C_D = C_A^{\min}$, and the interval is non-empty.
- (NE) is verified for the baseline: $\pi^*(C_D = 1.5, \Omega_2^R = 0.51, v=1) \approx 0.333 \gg 0.05 = \bar{\pi}_A^{\text{fall}}$.

This is logically correct and avoids the asymptotic fallacy of the old formalization. The non-emptiness is not claimed to be structural -- it is stated as a sufficient condition on parameters, with an empirical plausibility argument.

**The plausibility argument** (p. 109-116) is convincing: for (NE) to fail, one would need 90%+ of displaced workers to refrain from protesting even at democratic costs ($C_D = 1.5$) with 51% displacement. This is empirically implausible under democratic conditions.

**One caveat**: The single-state approximation used for the plausibility argument ($\pi^* \approx \bar{h} = 1 - v/C_x = 1/3$) is the Laplacian property, which applies to the continuous single-state global game with improper uniform prior. The v5 model has a discrete 3-state prior. The document acknowledges this caveat (p. 144: "The Laplacian property applies to the continuous single-state global game... not to the multi-state discrete model of v5"). However, the document also notes that the verified outcome at the baseline ($\pi_2 = 0.500$ at $C_A = 2.0$) exceeds the Laplacian benchmark, suggesting that the multi-state model sustains MORE protest than the Laplacian benchmark predicts. This is consistent -- in the multi-state model with a strong posterior favoring state R, protest at state $\omega_R$ can exceed $\bar{h}$.

**Verdict on (NE)**: The parametric condition is correctly stated, correctly verified for the baseline, and avoids the error of the old formalization. This is a clean fix.

### 4. Is the $\sigma_A$ amplification proposition correct?

**Part (a): $p_R$ decreases as $\sigma_A$ increases**

**Verdict: PASS WITH CONCERN**

The argument identifies two competing effects of increasing $\sigma_A$:
- Effect 1 (threshold rises): $\bar{\omega}_A$ increases, pushing $z_R = (\omega_R - \bar{\omega}_A)/\sigma_A$ further below zero. This decreases $p_R$.
- Effect 2 (noise spreads tail): more noise spreads the distribution, which in isolation would increase the probability of the right tail exceeding the threshold (if $z_R < 0$, spreading the tail puts more mass above the threshold).

The document correctly identifies that these effects have opposite signs and that the result is **ambiguous in general**. It then introduces a sufficient condition (SC-a):

$$\bar{\omega}'(\sigma_A) \geq \frac{\bar{\omega}(\sigma_A) - \omega_R}{\sigma_A}$$

**Analysis of (SC-a)**: This condition says the threshold rises fast enough relative to the noise. For the linear model $\bar{\omega}_A = \alpha_0 + \alpha_1 \sigma_A$ with $\alpha_0 = 0.25$ (calibrated so $\bar{\omega}_A(0.15) = 0.40$), (SC-a) becomes $\alpha_1 \geq (\alpha_0 - \omega_R)/\sigma_A + \alpha_1$, i.e., $\omega_R \geq \alpha_0$. With $\omega_R = 0.30$ and $\alpha_0 = 0.25$: satisfied.

**Concern**: The condition $\omega_R \geq \alpha_0$ means "with perfect information ($\sigma_A = 0$), the elite WOULD see the rapid crisis as exceeding their threshold." This is a nontrivial assumption about the elite's base preference. If $\alpha_0 > \omega_R$ (with perfect information, the elite considers even $\omega_R$ too low to warrant spending), then (SC-a) may fail, and $p_R$ could increase with $\sigma_A$ in some range. The document should state this assumption explicitly as a maintained condition.

The limiting argument (p. 258: "$p_R \to 0$ as $\sigma_A \to \infty$, $p_R = 1$ at $\sigma_A = 0$") is correct and establishes that $p_R$ must eventually decrease. But the path may be non-monotonic. The document's claim that "in the operating regime ($\omega_R < \bar{\omega}_A$), $dp_R/d\sigma_A < 0$ holds whenever $\bar{\omega}'(\sigma_A) > 0$ and $|z_R|$ is bounded away from zero" (p. 265) is **incorrect as stated** -- the sign depends on the MAGNITUDE of $\bar{\omega}'$ relative to $|z_R|/\sigma_A$, not merely on $\bar{\omega}' > 0$. The statement should be: "holds whenever (SC-a) is satisfied."

**Part (b): The gap $p_T - p_R$ widens**

**Verdict: CONCERN**

This is the most problematic part of the proposition. The document goes through an honest self-correction process:

1. Initially states that $p_T - p_R$ widens as $\sigma_A$ increases (p. 214-218).
2. Then discovers that both $z_T$ and $z_R$ decrease, so both $p_T$ and $p_R$ decrease (p. 268-287).
3. Claims the differential rate ensures the gap widens "when $\omega_{T2} - \bar{\omega}_A \gg \bar{\omega}_A - \omega_R$" (p. 289).

**But the numerical verification contradicts this claim.** The document's own numbers (Section 3.3, Observation 1) show that with $\bar{\omega}_A$ FIXED:

| $\sigma_A$ | Gap ($p_T - p_R$) |
|-------------|-------------------|
| 0.05        | very large         |
| 0.10        | 0.818              |
| 0.15        | 0.657              |
| 0.25        | 0.443              |

The gap **shrinks** with fixed $\bar{\omega}_A$, because both probabilities converge to 0.5.

With ENDOGENOUS $\bar{\omega}_A(\sigma_A) = 0.25 + 1.0 \cdot \sigma_A$:

| $\sigma_A$ | $\bar{\omega}_A$ | $p_R$ | $p_T$ | Gap |
|-------------|-------------------|--------|--------|------|
| 0.15        | 0.40              | 0.252  | 0.909  | 0.657 |
| 0.25        | 0.50              | 0.212  | 0.655  | 0.443 |
| 0.35        | 0.60              | 0.196  | 0.500  | 0.304 |

**The gap STILL shrinks, even with the endogenous threshold.** The amplification claim in part (b) is numerically falsified for this specific linear model.

**Root cause**: The claim that "$|z_R|$ INCREASES faster than $z_T$ decreases" (p. 287) is not guaranteed. In the linear model with $\alpha_1 = 1.0$:
- $z_R = (\omega_R - \alpha_0)/\sigma_A - \alpha_1 = 0.05/\sigma_A - 1.0$
- $z_T = (\omega_{T2} - \alpha_0)/\sigma_A - \alpha_1 = 0.35/\sigma_A - 1.0$

As $\sigma_A \to \infty$: $z_R \to -1.0$, $z_T \to -1.0$. Both converge to $-\alpha_1$. So $\Phi(z_R) \to \Phi(-1) \approx 0.159$ and $\Phi(z_T) \to \Phi(-1) \approx 0.159$. The gap $\to 0$.

As $\sigma_A \to 0^+$: $z_R \to +\infty$, $z_T \to +\infty$. Both $p_R, p_T \to 1$. Gap $\to 0$.

At intermediate $\sigma_A$: the gap is maximized somewhere. For the specific numbers, the maximum gap occurs at relatively low $\sigma_A$ (around 0.10-0.15) and decreases thereafter.

**The correct statement is**: Part (a) is correct ($p_R$ decreases, strengthening R$\times$A fragility). Part (b) should state that the CONDITIONS for crossed fragility ($p_R < 1/2$ AND $p_T > 1/2$) hold over a wider range of $\omega_R$ as $\sigma_A$ increases (part (c), which is correct), not that the gap $p_T - p_R$ widens. The crossed fragility INTERVAL widens (more $\omega_R$ values qualify), but the gap for any FIXED pair $(\omega_R, \omega_{T2})$ may shrink.

**Part (c): Crossed fragility interval widens**

**Verdict: PASS**

The argument in part (c) is correct as stated. The crossed fragility interval is $\mathcal{I}(\sigma_A) = \{\omega_R : \omega_R < \bar{\omega}_A(\sigma_A)\}$ (intersected with $\omega_R > \omega_{T1}$). Since $\bar{\omega}_A$ is increasing in $\sigma_A$ (maintained assumption), $\mathcal{I}$ expands. This is a set-expansion result, not a gap-magnitude result.

**However**, this expansion is bounded: when $\bar{\omega}_A(\sigma_A) \geq \omega_{T2}$, condition (iv) fails (the elite's threshold exceeds even the massive crisis). The document correctly identifies this bound (p. 422: $\sigma_A^* = (\omega_{T2} - \alpha_0)/\alpha_1 = 0.35$).

### 5. Unstated assumptions and gaps

**5.1 Functional form of $\bar{\omega}_A(\sigma_A)$**

**Severity: Moderate**

The entire $\sigma_A$ amplification result depends on $\bar{\omega}_A$ being increasing in $\sigma_A$. The document provides a heuristic derivation (Section 2.1, p. 186-202) but never formally derives $\bar{\omega}_A(\sigma_A)$ from primitives. The derivation sketch argues:
- Elite approves iff $E[\text{cost of inaction} | \tilde{\omega}_S] > \tau_{\text{elite}} \cdot B$
- Higher $\sigma_A$ spreads the posterior, reducing $E[\text{cost of inaction}]$ for moderate signals
- Therefore the elite requires a higher signal to approve

This is economically intuitive but not formally proven. The exact functional form ($\bar{\omega}_A = \alpha_0 + \alpha_1 \sigma_A$ used in the numerics) is assumed for tractability, not derived. **Different functional forms could change the comparative statics.** For example, if $\bar{\omega}_A$ is concave in $\sigma_A$ (threshold rises quickly at first, then saturates), the amplification range may be wider than in the linear case.

**Recommendation**: State explicitly that the proposition requires $\bar{\omega}_A'(\sigma_A) > 0$ as a maintained assumption (supported by the economic intuition in Section 2.1 but not formally derived). The linear specification is illustrative.

**5.2 Equilibrium selection in the multi-state model**

**Severity: Minor**

The v5 model has a discrete 3-state prior ($\theta \in \{R, T, N\}$). The prior numerical review showed that this can generate two equilibrium cutoffs (left/right roots of the humped $G(s^*)$ function). The formalization does not address which equilibrium is selected.

For the $C_A$ sweet spot, the relevant equilibrium is the LEFT root (coordination equilibrium), which gives high protest and satisfies M1. The document implicitly assumes this selection but does not state it. The standard global-games uniqueness argument (Laplacian property) applies to the continuous-prior case, not to discrete priors.

**Recommendation**: Add a remark stating that the analysis assumes the coordination (risk-dominant) equilibrium is selected, and note that uniqueness in the discrete-prior model requires further analysis.

**5.3 The Laplacian lower bound is misapplied**

**Severity: Minor-to-Moderate**

Section 1.4 (p. 140-146) presents $C_A^{\text{Lap}} = v/(1 - \bar{\pi}_A^{\text{fall}}) \approx 1.053$ as a lower bound on $C_A^{\max}$. The document then cautions (p. 144) that the Laplacian property applies to the continuous single-state model, not the multi-state model.

However, the document then uses the verified outcome ($\pi_2 = 0.500$ at $C_A = 2.0$) to argue that "the Laplacian benchmark understates protest in the multi-state model." This is a comparison of specific numerical values, not a general ordering. The Laplacian benchmark gives $\bar{h} = 1 - 1/C_A$. At $C_A = 2.0$: $\bar{h} = 0.50$, which equals the verified $\pi_2 = 0.500$. So the Laplacian benchmark is actually quite accurate here, not understating.

More importantly, calling $C_A^{\text{Lap}}$ a "lower bound on $C_A^{\max}$" is only valid if the multi-state equilibrium sustains at least as much protest as the Laplacian benchmark for ALL $C_A$ values. This has not been proven and may not hold (the prior numerical review showed that the multi-state equilibrium can collapse at $C_A$ values lower than the Laplacian would predict, due to the hump in $E[\pi]$).

**Recommendation**: Clarify that $C_A^{\text{Lap}}$ is the single-state benchmark, useful for intuition, but not a rigorous lower bound on $C_A^{\max}$ in the multi-state model. The dominant strategy bound $C_A^{\text{dom}}$ IS a rigorous upper bound.

**5.4 Condition (iv) independence from $C_A$**

**Severity: None (RESOLVED)**

The old formalization had a narrow buffer of 0.03 for condition (iv). In v5, the elite's trigger is $\tilde{\omega}_S > \bar{\omega}_A$, which depends on $\omega$ and $\sigma_A$, not on $C_A$. The document correctly notes (Step 4, p. 118-127) that higher $C_A$ only further suppresses compensated protest, making condition (iv) easier to satisfy. This is a genuine resolution of the old concern. **No issue.**

**5.5 Prior numerical concerns: do they apply to v5?**

The prior numerical review (of the old formalization) found three issues:

**(a) Sweet spot may be narrow (width ~ 0.17).**

In the old model with $\omega_H = 0.40$: $C_A^{\max} \approx 1.67$, $C_A^{\min} \approx 1.50$, width $\approx 0.17$.

In v5 with $\omega_R = 0.30$: $C_A^{\min} = C_D = 1.5$, and $C_A^{\max}$ is between 1.053 (Laplacian) and 2.04 (dominant strategy). The verified outcome shows $\pi_2 = 0.500$ at $C_A = 2.0$, so $C_A^{\max} > 2.0$. Width is at least $2.0 - 1.5 = 0.5$.

**The sweet spot appears WIDER in v5 because**: (i) the lower bound is lower ($C_D = 1.5$ vs ~1.5, essentially the same), but (ii) the upper bound is higher ($> 2.0$ vs ~1.67) because the v5 model has different parameters ($\omega_R = 0.30$ instead of $\omega_H = 0.40$, $\sigma = 0.10$ instead of 0.15). The narrower $\sigma$ in v5 makes signals more precise, which tends to push the equilibrium collapse point higher. **This concern is mitigated but not eliminated** -- numerical verification of the exact $C_A^{\max}$ in the v5 multi-state model is still needed.

**(b) Discontinuous equilibrium transition.**

As analyzed in Item 2 above, this likely persists in v5. The IVT argument should be replaced with a supremum argument. **Minor concern.**

**(c) Humped E[pi|d=1,s*] generating two equilibria.**

This is structural (consequence of discrete prior) and carries over to v5. The document does not address equilibrium selection. **Moderate concern** (see 5.2 above).

---

## Consistency with Authoritative Model (analytical_formalization.md v5)

The formalization is fully consistent with the v5 model structure:

1. **Asymmetric triggers**: Democracy uses voice trigger ($\pi > \bar{\pi}_D^{\text{comp}}$), autocracy uses elite assessment ($\tilde{\omega}_S > \bar{\omega}_A$). The formalization correctly uses this structure throughout.

2. **Parameters**: All parameters match the v5 confirmed parameters (Section 12 of analytical_formalization.md).

3. **Key ordering**: $\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$ is maintained.

4. **Compensation decisions**: The formalization's analysis of conditions (i)-(v) is consistent with the v5 scenario table (Section 8 of analytical_formalization.md).

5. **No model version ambiguity**: Unlike the old formalization (which mixed paper.Rmd mechanisms with v5 parameters), this formalization is consistently v5.

---

## Summary of Issues

| # | Issue | Severity | Status |
|---|-------|----------|--------|
| 1 | $C_A^{\min} = C_D$ lower bound | --- | **PASS** |
| 2 | IVT for $C_A^{\max}$: technically valid but mechanism is bifurcation, not smooth crossing | Minor | **PASS WITH NOTE** |
| 3 | Non-emptiness via (NE) parametric condition | --- | **PASS** |
| 4a | $\sigma_A$ part (a): $p_R$ decreasing | --- | **PASS** (under SC-a) |
| 4b | $\sigma_A$ part (b): gap $p_T - p_R$ widens | **Moderate** | **FAIL** (numerically falsified by document's own calculations) |
| 4c | $\sigma_A$ part (c): crossed fragility interval widens | --- | **PASS** |
| 5.1 | $\bar{\omega}_A(\sigma_A)$ functional form assumed, not derived | Moderate | **CONCERN** |
| 5.2 | Equilibrium selection in multi-state model not addressed | Minor | **CONCERN** |
| 5.3 | Laplacian lower bound misapplied to multi-state model | Minor | **CONCERN** |
| 5.4 | Condition (iv) independence from $C_A$ | --- | **RESOLVED** |
| 5.5a | Sweet spot width | --- | **MITIGATED** (wider in v5) |
| 5.5b | Discontinuous transition | Minor | **PERSISTS** |
| 5.5c | Two equilibria from humped E[pi] | Moderate | **PERSISTS** |

---

## Recommendations

### Must-fix (for analytical correctness)

1. **Restate part (b) of the $\sigma_A$ amplification proposition.** The current claim -- that the gap $p_T - p_R$ widens with $\sigma_A$ -- is falsified by the document's own numerical calculations (both with fixed and endogenous $\bar{\omega}_A$, the gap shrinks). The correct result is:
   - $p_R$ decreases (part a, correct).
   - $p_T$ remains above $1/2$ provided $\omega_{T2} > \bar{\omega}_A(\sigma_A)$ (the corrected version on p. 276-291 is fine).
   - The crossed fragility CONDITIONS ($p_R < 1/2$ AND $p_T > 1/2$) hold over a wider range of $\omega_R$ values (part c, correct).
   - **Delete the claim** "$\frac{\partial}{\partial \sigma_A}[p_T - p_R] > 0$" from the formal statement (p. 216-218). Replace with: "The set of $\omega_R$ values satisfying both conditions (iii) and (iv) expands as $\sigma_A$ increases."

2. **State (SC-a) as a maintained assumption** for part (a), not as a background condition. Without (SC-a) or an equivalent condition, part (a) is not proven.

### Should-fix (for rigor)

3. **Replace the IVT uniqueness claim** (end of Step 2) with a supremum argument. The equilibrium transition is a bifurcation; the IVT applies but uniqueness does not follow from strict monotonicity at the collapse point.

4. **Clarify equilibrium selection.** State that the analysis uses the coordination (left-root) equilibrium. Note that the standard global-games uniqueness result requires a continuous prior or sufficiently diffuse signals.

5. **Reclassify $C_A^{\text{Lap}}$** as a single-state benchmark, not a rigorous lower bound on $C_A^{\max}$ in the multi-state model.

### Nice-to-have

6. **Derive $\bar{\omega}_A(\sigma_A)$ from the elite's decision problem.** Even a simple model (e.g., binary elite decision with Gaussian signal, quadratic loss) would pin down the functional form and make the $\sigma_A$ results non-parametric.

7. **Run the numerical verification script** (Section 3.4) to confirm the $\sigma_A$ comparative statics with the v5 parameters.

---

## Comparison with Old Formalization

| Feature | Old (formalization_CA_sweet_spot.md) | v5 (this document) | Assessment |
|---------|--------------------------------------|---------------------|------------|
| Lower bound $C_A^{\min}$ | Informativeness-based (Bayesian from $\pi$) | Definitional ($C_A > C_D$) | **Improved**: eliminates reliance on flawed "slope vanishes before level" argument |
| Upper bound $C_A^{\max}$ | Same (protest volume) | Same (protest volume) | **Unchanged** |
| Non-emptiness | Structural claim (asymptotically false) | Parametric condition (NE) | **Improved**: correct and verifiable |
| Condition (iv) | Narrow buffer (0.03), relies on "self-revealing" narrative | Independent of $C_A$ (elite trigger uses $\tilde{\omega}_S$) | **Improved**: eliminates the interaction |
| Model consistency | Ambiguous (mixed paper.Rmd + v5) | Consistent v5 | **Improved** |
| $\sigma_A$ amplification | Not present | New result (partially correct) | **New**: part (a) and (c) correct, part (b) needs repair |

---

## Conclusion

The v5 formalization resolves the three main problems of the old formalization: the flawed non-emptiness argument (replaced by parametric condition NE), the narrow condition (iv) buffer (eliminated by the v5 trigger structure), and the model version ambiguity (consistently v5). The $C_A$ sweet spot corollary is now analytically correct. The $\sigma_A$ amplification proposition is partially correct: parts (a) and (c) hold under stated conditions, but part (b) (gap widening) is falsified by the document's own numerical calculations and must be restated. The gap $p_T - p_R$ may not widen; what widens is the SET of parameters for which crossed fragility holds. With the recommended fixes to part (b), the overall grade would upgrade to PASS.

**Grade: PASS WITH CONCERNS**
