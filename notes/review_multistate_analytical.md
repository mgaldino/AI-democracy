# Review: Multi-State Global Game Equilibrium Derivations

**Reviewer**: Mathematical reviewer (analytical proofs)
**Document reviewed**: `notes/multistate_equilibrium_derivations.md`
**Date**: 2026-05-02

---

## D1. State-Specific Protest Lemma

### Verdict: PASS

**Logical correctness.** All four parts (a)-(d) are correctly argued.

- **(a)** The decomposition of $\pi_\theta$ into $\Omega_t(\theta) \cdot \Lambda((\omega_\theta - s^*)/\sigma)$ follows cleanly from the independence of displacement and signal noise, plus LLN for the continuum. The use of logistic symmetry $1 - \Lambda(z) = \Lambda(-z)$ is correct.

- **(b)** The indifference condition rearrangement is standard. The key step -- that conditional on $\theta$, aggregate protest is deterministic (via LLN) so $E[\pi \mid \theta] = \pi_\theta$ -- is correctly identified.

- **(c)** Straightforward monotonicity properties of the logistic CDF. No issues.

- **(d)** The dominant strategy argument is correct: when $v > C_x$, the RHS of the protest condition $C_x(1-\pi) \leq C_x < v$ is bounded above by $C_x < v$ for all $\pi \in [0,1]$.

**Algebraic accuracy.** Numerical verification checks out:
- Democracy dominant strategy: $\bar{h} = 1 - 1.9/1.5 = -0.267 < 0$. Correct.
- Autocracy interior: $\bar{h} = 1 - 1.9/2.0 = 0.05$. Correct.
- $\Omega_2(R) = 0.30 + (1-0.30) \times 0.30 = 0.30 + 0.21 = 0.51$. Correct.
- $\Omega_2(T) = 0.05 + (1-0.05) \times 0.60 = 0.05 + 0.57 = 0.62$. Correct.
- Autocracy $t=1$ numerical: $\pi_R(1) = 0.30 \times \Lambda(-1.58) = 0.30 \times 0.171 = 0.0513$. Verified against script output (0.051328). Correct.
- Weighted average check: $0.974 \times 0.0513 + 0.019 \times 0.0008 + 0.008 \times 0.0002 = 0.0500 = \bar{h}$. Verified. Correct.

**No issues found.**

---

## D2. Cutoff Location

### Verdict: PASS WITH CONCERNS

**Logical correctness.** The main arguments are sound, but there are issues:

1. **SIGN ERROR in proposition statement (line 138).** The proposition states:
   $$w_\theta^{-\infty} = \frac{\omega_t(\theta) \cdot p_\theta \cdot e^{\omega_t(\theta)/\sigma}}{\sum_{\theta'} \omega_t(\theta') \cdot p_{\theta'} \cdot e^{\omega_t(\theta')/\sigma}}$$

   But the proof (lines 168-172) correctly derives:
   $$w_\theta^{-\infty} \propto \omega_\theta \cdot p_\theta \cdot e^{-\omega_\theta/\sigma}$$

   The exponent should be $e^{-\omega/\sigma}$, NOT $e^{+\omega/\sigma}$. The proof is correct; the proposition statement has the wrong sign. The downstream numerical calculations (lines 182-194) use the correct sign ($e^{-\omega/\sigma}$), so the computed values $G_{-\infty} = 0.096$ and the verification against the scan ($G(-0.5) = 0.046$) are correct.

   **The verification script (`verify_multistate_equilibrium.py`, line 284) also has the wrong sign** -- it uses `np.exp(w / sigma)` instead of `np.exp(-w / sigma)`. The script's "Asymptotic weights (s -> -inf)" are therefore incorrect (R=0.981 instead of the correct R=0.223), though this error does not affect the script's other computations (which use the exact $G(s)$ function, not the asymptotic approximation).

   **Fix required**: Change the proposition statement to $e^{-\omega_t(\theta)/\sigma}$, and fix the verification script.

2. **Part (c): Existence condition is necessary, not sufficient.** The proposition states "An interior equilibrium exists if and only if $\max_s G(s) \geq 0$, which requires $G_{-\infty} > 0$." The first clause is correct (by IVT + continuity), but the second is too strong: $G_{-\infty} > 0$ is sufficient for existence (by IVT, since $G \to -\bar{h} < 0$ as $s \to +\infty$), but it is not necessary in general -- $G$ could have a local maximum above zero at some intermediate $s$ even if $G_{-\infty} \leq 0$. The proof acknowledges this nuance ("It remains to check whether $G$ can cross zero in between") but the proposition statement conflates "requires $G_{-\infty} > 0$" with the actual condition "$\max_s G(s) \geq 0$." For this model's parameters, $G_{-\infty} > 0$ does hold, so the issue is formal rather than substantive.

3. **Part (e): The approximation formula.** The formula
   $$s^* \approx \omega_{k+1} - \sigma \cdot \log\left(\frac{\bar{h}/\Omega_{k+1}}{1 - \bar{h}/\Omega_{k+1}}\right)$$
   is correct as the inverse logistic applied to the single-state indifference under $\theta_{k+1}$. Note that $\Lambda^{-1}(p) = \log(p/(1-p))$, so $s^* = \omega_{k+1} - \sigma \cdot \Lambda^{-1}(\bar{h}/\Omega_{k+1})$. The numerical check: $s^* \approx 0.30 + 0.161 = 0.461$ vs. exact $0.4578$. Match to within 0.003. Correct.

4. **"The cutoff is closer to $\omega_{k+1}$"** -- This claim needs qualification. It is true when $\bar{h}/\Omega_{k+1} < 1/2$ (i.e., $\bar{h} < \Omega_{k+1}/2$), which makes $\Lambda^{-1}(\bar{h}/\Omega_{k+1}) < 0$, hence $s^* > \omega_{k+1}$. In the numerical example, $\bar{h}/\Omega_R = 0.05/0.30 = 0.167 < 0.5$, so $s^*$ is ABOVE $\omega_R$, not just "closer to" it. The statement is correct but could be more precise.

**Algebraic accuracy.** The manual calculations match the script output where both are computed. The sign error in the proposition is purely notational (the proof and downstream computations are correct).

**Model consistency.** Correct use of the model throughout.

**Equilibrium selection (item 4 from the review checklist).** D2 addresses equilibrium selection implicitly:
- For well-separated states and small $\sigma$, the cutoff is approximately unique (uniqueness argument in Technical Appendix, lines 496-497).
- The standard Morris & Shin (2003) uniqueness result applies to single-state games with uniform prior. For the multi-state discrete prior, the extension is not formally proven here but is asserted with good justification: when $\sigma$ is small relative to inter-state gaps, the posterior concentrates on one state, reducing the problem locally to a single-state game.
- **Concern**: The formal uniqueness argument for discrete multi-state priors deserves a reference or a more rigorous proof. Athey (2001) or Frankel, Morris & Pauzner (2003) on games with many states could be cited. The claim "Full uniqueness for small $\sigma$ follows from Morris & Shin (2003), extended to the multi-state case" is plausible but hand-wavy.
- **The equilibrium selected** (D2(e) places $s^*$ near $\omega_R$ for the autocracy case) is the one where the posterior concentrates on the dominant state. This is consistent with the global games limit selection: as $\sigma \to 0$, the unique cutoff approaches the "laplacian" belief benchmark. In the multi-state case, this corresponds to the cutoff being determined by the state that "matters most" for the indifference condition.

---

## D3. Prior Concentration in $t=2$

### Verdict: PASS

**Logical correctness.** The argument is clean and correct.

- **(a)** The strict ordering $\pi_N(1) < \pi_T(1) < \pi_R(1)$ follows from the strict monotonicity of both $\Omega_1(\theta) = \omega_\theta$ and $\Lambda((\omega_\theta - s^*)/\sigma)$ in $\omega_\theta$. Both functions are strictly increasing in $\omega_\theta$ (given $s^*$ is fixed), so their product is also strictly increasing. For the dominant strategy case, $\pi_\theta = \omega_\theta$, and distinctness is immediate from $\omega_N < \omega_{T1} < \omega_R$.

- **(b)** The key insight -- that with a continuum of workers and LLN, $\pi_1$ is a deterministic, invertible function of $\theta$ -- is correct. Each worker observes $\pi_1$ (a public signal), and since $\pi_\theta$ is injective in $\theta$ (part (a)), observation of $\pi_1$ perfectly reveals $\theta$. No error here.

- **(c)** The degeneration to single-state equilibrium with concentrated prior is standard. The claim $\pi^* = \bar{h}$ for linear safety-in-numbers is the well-known result. The three cases (dominant strategy, interior, no protest) are correctly enumerated.

**Concern (minor).** The argument implicitly assumes that workers can observe $\pi_1$ exactly (or at least with enough precision to distinguish the three values). In practice, with a large but finite population, $\pi_1$ would have sampling noise. For a continuum, this is formally exact. The assumption is noted but not problematic for the theoretical model.

**The D3 prior concentration argument is valid.** Workers observe $\pi_1$ exactly (continuum + LLN), which identifies $\theta$ since $\pi_R(1) \neq \pi_T(1) \neq \pi_N(1)$.

**Algebraic accuracy.** The numerical verification in D3 is correct:
- Compensated democracy: $v = (1-B)(1+\delta) = 0.76$, $\bar{h}_2 = 1 - 0.76/1.5 = 0.493$. Correct.
- Under R: $0.493 < 0.51 = \Omega_2(R)$, interior. Under T: $0.493 < 0.62$, interior. Correct.
- Compensated autocracy: $\bar{h}_2 = 1 - 0.76/2.0 = 0.62$. Under T: $\bar{h}_2 = 0.62 = \Omega_2(T)$, borderline. Correct.

**Note**: The use of $v = (1-B)(1+\delta) = 0.76$ for "compensated" in D3's numerical verification is for a scenario where compensation applies in BOTH periods (or where the worker anticipates continuation). This differs from the "last period" value $v = 1-B = 0.4$ used in D5. The two are conceptually different -- one assumes a future, the other does not. Both are used correctly in their respective contexts, though the document should be clearer about which applies when.

---

## D4. $R \times A$: Autocratic Survival Condition

### Verdict: PASS WITH CONCERNS

**Logical correctness.** The derivation is sound but the boundary case analysis could be more rigorous.

1. **The main result** ($\pi_R(1) \approx \bar{h}$ when posterior concentrates on R) follows correctly from D2(e). The approximation $\pi_R(1) \approx \bar{h}$ is well-justified: with $P(R \mid d=1, s^*) = 0.974$ (numerical verification), the single-state approximation captures 97.4% of the indifference condition.

2. **The boundary case.** $\pi_R(1) = 0.0513$ vs. $\bar{\pi}_A^{\text{fall}} = 0.05$. The excess is 0.0013, or about 2.6% of the threshold. The document offers three interpretations (strict fall, calibration adjustment, endogenous v). All three are reasonable.

   **Concern**: The document says "$\pi_R(1) \approx \bar{h}$" and then notes $\bar{h} = 0.05 = \bar{\pi}_A^{\text{fall}}$. But the approximation $\pi_R \approx \bar{h}$ is exact only in the single-state limit. In the multi-state game, $\pi_R$ can differ from $\bar{h}$ because the posterior also weights T and N states. Here, $\pi_R = 0.0513 > \bar{h} = 0.05$ because the T and N contributions to the indifference condition are positive (albeit small), allowing R's contribution to be slightly above $\bar{h}$. The document correctly computes this but does not explicitly explain WHY $\pi_R > \bar{h}$: it is because $\pi_T$ and $\pi_N$ are positive, so the weighted average $\sum P(\theta)\pi_\theta = \bar{h}$ requires the R term to be slightly above $\bar{h}$ when the other terms are below. This could be stated more clearly.

3. **The $t=2$ analysis** correctly distinguishes two cases:
   - $v_2 = 1$ (last period): $\bar{h}_2 = 0.50$, $\pi_R(2) = 0.50 \gg 0.05$. Decisive fall.
   - $v_2 = 1.9$ (continuation): $\bar{h}_2 = 0.05$, $\pi_R(2) = 0.05$. Borderline.

   The document correctly notes this is a modeling choice about what happens at the horizon.

4. **The key structural result** (lines 340-341) -- that the mechanism is the same regardless of timing -- is well argued. The elite blindness mechanism ($P(\text{approve} \mid \omega_R) = 0.25$) drives the result qualitatively; the exact timing is a quantitative detail.

**Rigor of the boundary case (review item 6).** The analysis is adequate but not fully rigorous. Specifically:
- The document suggests $\bar{\pi}_A^{\text{fall}} = 0.06$ resolves the issue. This is correct: if $\bar{\pi}_A^{\text{fall}} = 0.06$, then $\pi_R(1) = 0.051 < 0.06$ and the autocracy survives t=1.
- The endogenous v adjustment argument (interpretation 3) is plausible but hand-wavy. The claim that "the worker at $s^*$ does not fully expect $v = 1.9$ because the posterior assigns some weight to N" is correct in principle -- under state N, the future displacement rate is low, so the expected future loss is less than 1, and $v < 1.9$. But the magnitude of this effect is not computed. A quick estimate: $E[v \mid s^*] = P(R|s^*) \cdot 1.9 + P(T|s^*) \cdot v_T + P(N|s^*) \cdot v_N$. With $P(R) = 0.974$, $P(T) = 0.019$, $P(N) = 0.008$, and (say) $v_N = 1 + \delta \cdot \omega_N = 1 + 0.9 \times 0.02 = 1.018$, the adjustment is tiny: $0.974 \times 1.9 + 0.019 \times 1.9 + 0.008 \times 1.018 = 1.896$. This changes $\bar{h}$ from 0.050 to 0.052, making the excess worse. So the endogenous v argument actually does NOT help for this parameter configuration. The document should not rely on this interpretation.
- **Recommendation**: Simply acknowledge the boundary nature and note that the result is robust for $\bar{\pi}_A^{\text{fall}} \geq 0.052$.

**Algebraic accuracy.** Spot-checked: $v/C_A = 1.9/2.0 = 0.95$, $1 - 0.05 = 0.95$. Correct. $C_A > 1.9/0.96 = 1.979$. Correct. All numerical values match script output.

---

## D5. Boundary Conditions for All Four Scenarios

### D5.1. $D \times R$: STABLE

#### Verdict: PASS WITH CONCERNS

**The credible commitment mechanism (review item 5).**

The self-confirmation logic runs:
1. Workers expect compensation will be triggered (because pi will exceed $\bar{\pi}_D^{\text{comp}}$).
2. With compensation expected, $v_{cred} = 1 + \delta(1-B) = 1.36 < C_D = 1.5$.
3. Coordination game is restored with $\bar{h} = 0.093$.
4. Multi-state equilibrium gives $\pi_R(1) = 0.097$.
5. $\pi_R(1) = 0.097 > \bar{\pi}_D^{\text{comp}}$ (assumed), confirming the expectation of compensation.

**Is there circularity?** There are two candidate equilibria to check:

- **Equilibrium A (no compensation expected)**: $v = 1.9 > C_D$. Dominant strategy. $\pi_R(1) = 0.30$. This triggers compensation. But workers expected NO compensation -- contradiction: in equilibrium, if $\pi > \bar{\pi}_D^{\text{comp}}$, compensation IS enacted, so rational workers should incorporate this. This equilibrium is NOT self-consistent.

- **Equilibrium B (compensation expected)**: $v = 1.36 < C_D$. Interior cutoff. $\pi_R(1) = 0.097$. If $\bar{\pi}_D^{\text{comp}} < 0.097$, compensation is triggered, confirming the expectation. This equilibrium IS self-consistent.

The logic is NOT circular -- it is a rational expectations argument. The document correctly identifies this (lines 527-537). The equilibrium is the one where beliefs and outcomes are mutually consistent.

**Concerns:**

1. **Missing: check that Equilibrium A is not also self-consistent.** If workers expect no compensation and $\pi = 0.30 > \bar{\pi}_D^{\text{comp}}$, compensation is triggered. But this contradicts the expectation of no compensation. So Equilibrium A is indeed inconsistent. The document handles this correctly (lines 529-531) but the exposition could be clearer that both candidate equilibria are checked.

2. **Unspecified $\bar{\pi}_D^{\text{comp}}$.** The document assumes $\bar{\pi}_D^{\text{comp}} < 0.097$ without specifying its value. For the self-confirmation to work, this threshold must be below the equilibrium protest level. The paper should state the value explicitly and verify the condition.

3. **Existence of the multi-state cutoff.** The document notes (Technical Appendix, lines 491-492) that the existence condition for the credible commitment equilibrium is "barely satisfied": $\bar{h} = 0.093 < G_{-\infty} = 0.096$, with a margin of only 0.003. This tightness means:
   - Small parameter perturbations could eliminate the equilibrium.
   - The equilibrium, if it exists, sits near the boundary of existence, which raises concerns about robustness.
   - **Recommendation**: Verify numerically that $s^*$ exists (the document claims $s^* = 0.374$ but this should be confirmed by the script -- the script uses the wrong $v_{cred}$ and finds no solution with its erroneous value).

4. **The v formula.** The document uses $v_{cred} = 1 + \delta(1-B) = 1 + 0.9 \times 0.4 = 1.36$. This is correct under the assumption that displacement is absorbing and compensation $B$ is guaranteed in $t=2$. The displaced worker's current loss is 1, and the expected future loss is $(1-B)$ (since they will be displaced in $t=2$ with certainty, but receive $B$, so their loss is $1-B$). Verified: $1 + 0.9 \times 0.4 = 1.36$. Correct.

   **Note**: The verification script computes a different formula: $v_{credible} = 1 + \delta \times \omega_R \times (1-B) = 1.108$, which is WRONG. The script treats the future displacement as uncertain (probability $\omega_R$), but since displacement is absorbing, a worker who is displaced in $t=1$ is displaced in $t=2$ with certainty. The derivation document is correct.

### D5.2. $D \times T$: FALLS in $t=2$

#### Verdict: PASS WITH CONCERNS

**Logical structure is correct.** The prosperity trap mechanism (no compensation built in $t=1$ because most workers benefit from complementarity) combined with institutional lag (compensation enacted in $t=2$ arrives too late) is compelling.

**Concern: $v$ value in $t=2$.**

The document uses $v = 1 + \delta = 1.9$ for displaced workers in $t=2$. But:
- If $t=2$ is the last period (two-period model), then there is no $t=3$, so the future loss component should be zero: $v_2 = 1$ (current loss only).
- If there is a continuation beyond $t=2$, then $v = 1 + \delta$ is appropriate.

The document itself uses $v_2 = 1$ for the AxR scenario in D5.3/D4 (line 432, 475). The summary table shows $v = 1.9$ for DxT $t=2$ but $v = 1.0$ for AxR $t=2$. This is **inconsistent**.

**Impact on the result**: Even with $v_2 = 1$, $\bar{h}_2 = 1 - 1/1.5 = 0.333 < \Omega_2(T) = 0.62$, so $\pi_T(2) = 0.333 > \bar{\pi}_D^{\text{fall}} = 0.20$. Democracy still falls. The qualitative result is robust, but the quantitative protest level changes from 0.62 to 0.333. The dominant strategy claim ($v > C_D$) is wrong if $v_2 = 1 < C_D = 1.5$; it would be an interior cutoff equilibrium instead. **The summary table entry for DxT $t=2$ should use $v = 1$ and $\pi_T(2) = 0.333$, not $v = 1.9$ and $\pi_T(2) = 0.62$.**

### D5.3. $A \times R$: FALLS

#### Verdict: PASS

The analysis correctly inherits the D4 results and the boundary case discussion. The $t=2$ analysis with $v_2 = 1$ (last period) gives $\pi_R(2) = 0.50 \gg 0.05$, a decisive fall. No issues beyond those already noted in D4.

### D5.4. $A \times T$: STABLE

#### Verdict: PASS

The analysis is correct:
- $t=1$: $\pi_T(1) = 0.0008 \ll 0.05$. Clear survival.
- $t=2$: Elite approval 91%, compensation by decree, $v$ drops. With either $v = 0.76$ or $v = 0.4$, $\bar{h}_2 \geq \Omega_2(T) = 0.62$, so no protest. The knife-edge at $v = 0.76$ ($\bar{h}_2 = 0.62 = \Omega_2(T)$) is correctly identified.

**Minor note**: The $v = 0.76$ case gives $\bar{h}_2 = \Omega_2(T)$ exactly, which means $\Lambda^{-1}(\bar{h}_2/\Omega_2) = \Lambda^{-1}(1) \to +\infty$, so $s^* \to -\infty$. No worker crosses the (infinitely low) cutoff, confirming $\pi = 0$. The document's conclusion is correct.

---

## Cross-Cutting Issues

### v Calculation Check

| Scenario | v formula | Document value | Verified |
|:---|:---|:---|:---|
| Displaced, uncompensated | $1 + \delta$ | 1.9 | CORRECT |
| Credible commitment | $1 + \delta(1-B)$ | 1.36 | CORRECT |
| Compensated, last period | $1-B$ | 0.4 | CORRECT |
| Compensated, continuation | $(1-B)(1+\delta)$ | 0.76 | CORRECT |
| Last period, uncompensated | 1 | 1.0 | CORRECT (used in D4/D5.3 for AxR $t=2$) |

The v formulas are correctly derived from the model. The issue is that the document inconsistently applies "last period" vs "continuation" across scenarios (see D5.2 concern above).

### Dominant Strategy Regime

Correctly handled throughout. When $v > C_x$, protesting is dominant and $\pi_\theta = \Omega_t(\theta)$. The check $\bar{h} = 1 - v/C_x < 0$ correctly identifies this regime. No errors found.

### Equilibrium Selection

The document's equilibrium selection is implicitly the one selected by the global games limit ($\sigma \to 0$). For the multi-state extension with well-separated states, this reduces to a single-state game near the cutoff, and the standard uniqueness argument applies. The formal extension to discrete multi-state priors is not rigorously proven but is consistent with the literature. The equilibrium placed near $\omega_R$ (the "right root") is the correct one: it is the unique cutoff where the posterior concentrates on the state that drives the indifference condition.

---

## Errors Found

| ID | Location | Severity | Description |
|:---|:---|:---|:---|
| E1 | D2(b), line 138 | **HIGH** | Sign error in proposition statement: $e^{+\omega/\sigma}$ should be $e^{-\omega/\sigma}$. Proof (line 172) is correct. |
| E2 | D5.2, line 410 | **MEDIUM** | Uses $v = 1.9$ for DxT $t=2$, but if $t=2$ is last period, $v = 1$. Inconsistent with D5.3 ($v_2 = 1$). Result is qualitatively robust but quantitatively wrong. |
| E3 | D5, summary table line 473 | **MEDIUM** | DxT $t=2$ row shows $v = 1.90$, $\pi = 0.620$. Should be $v = 1.00$, $\bar{h} = 0.333$, $\pi = 0.333$ (if last period) or the continuation assumption should be justified and applied consistently across all scenarios. |
| E4 | verify script, line 284 | **MEDIUM** | Script uses `exp(w/sigma)` for $s \to -\infty$ asymptotic weights; should be `exp(-w/sigma)`. Does not affect other script computations. |
| E5 | verify script, line 420 | **MEDIUM** | Script computes $v_{credible} = 1 + \delta \omega_R (1-B) = 1.108$, but correct formula (displacement is absorbing) is $v_{cred} = 1 + \delta(1-B) = 1.36$. |
| E6 | D2(c), line 140 | **LOW** | Proposition says $G_{-\infty} > 0$ is required for existence. $G_{-\infty} > 0$ is sufficient (via IVT), not necessary in general. |
| E7 | D4, line 429 | **LOW** | "Endogenous v adjustment" interpretation is quantitatively wrong: the posterior adjustment of v barely changes it (from 1.9 to ~1.896), which makes $\bar{h}$ slightly larger and the boundary problem worse, not better. |
| E8 | D5.1, line 398 | **LOW** | $\bar{\pi}_D^{\text{comp}}$ is never specified. The self-confirmation check requires $\bar{\pi}_D^{\text{comp}} < 0.097$, but the threshold is left as an assumption. |

---

## Suggestions for Improvement

1. **Fix the sign error in D2(b)** (E1). Replace $e^{+\omega/\sigma}$ with $e^{-\omega/\sigma}$ in the proposition statement.

2. **Resolve the $v$ inconsistency for $t=2$** (E2, E3). Either: (a) consistently use $v = 1$ for all $t=2$ scenarios (two-period model, last period), or (b) consistently use $v = 1 + \delta$ with a stated continuation assumption and apply it uniformly across DxT and AxR.

3. **Fix the verification script** (E4, E5). The asymptotic weight calculation and the credible commitment v formula are both wrong. These do not affect the core numerical verification (which uses exact $G(s)$ computations) but are misleading.

4. **Remove or correct the endogenous v argument in D4** (E7). The quantitative effect goes in the wrong direction. Replace with: "The margin is robust for $\bar{\pi}_A^{\text{fall}} \geq 0.052$."

5. **Specify $\bar{\pi}_D^{\text{comp}}$** (E8). The credible commitment mechanism requires this threshold to be explicitly stated and checked.

6. **Strengthen the uniqueness argument.** The claim that uniqueness "follows from Morris & Shin (2003), extended to the multi-state case" deserves a reference to the multi-state/multi-action extension literature (e.g., Frankel, Morris & Pauzner 2003, "Equilibrium Selection in Global Games with Strategic Complementarities," JET).

7. **Clean up the proof of D2(b).** The proof contains visible self-correction ("Wait --- I need to be more careful. Let me redo...") and metacommentary ("this needs more thought"). While intellectually honest, a polished derivation should present the final correct argument without the revision trail.

---

## Summary Table

| Derivation | Verdict | Key Issues |
|:---|:---|:---|
| **D1** (State-Specific Protest Lemma) | **PASS** | No issues. Clean and correct. |
| **D2** (Cutoff Location) | **PASS WITH CONCERNS** | Sign error in proposition statement (E1); existence condition overstatement (E6). Proof and numerics are correct. |
| **D3** (Prior Concentration in $t=2$) | **PASS** | Valid argument. LLN + injectivity gives perfect revelation. |
| **D4** ($R \times A$ Survival) | **PASS WITH CONCERNS** | Boundary case rigor (E7); endogenous v argument goes wrong direction. Core mechanism sound. |
| **D5.1** ($D \times R$: Stable) | **PASS WITH CONCERNS** | Self-confirmation logic is sound (not circular). Unspecified $\bar{\pi}_D^{\text{comp}}$ (E8). Equilibrium existence is tight (margin 0.003). |
| **D5.2** ($D \times T$: Falls) | **PASS WITH CONCERNS** | Inconsistent $v$ for $t=2$ (E2, E3). Result qualitatively robust. |
| **D5.3** ($A \times R$: Falls) | **PASS** | Inherits D4 boundary issue. Decisive fall in $t=2$. |
| **D5.4** ($A \times T$: Stable) | **PASS** | Correct. Knife-edge at $\bar{h} = \Omega$ identified. |

**Overall assessment**: The derivations are fundamentally sound. The crossed fragility result (DxR stable, DxT falls, AxR falls, AxT stable) holds under all reasonable parameter interpretations. The main issues are: (1) a sign error in the D2 proposition statement that does not propagate to computations, (2) an inconsistent treatment of whether $t=2$ is the last period, and (3) some hand-wavy arguments in D4 that go in the wrong direction quantitatively. None of these undermine the qualitative conclusions.
