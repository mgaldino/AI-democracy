# Review: Formal Proofs of Propositions 1--3 (Crossed Fragility)

**Reviewer**: Analytical correctness review  
**Date**: 2026-05-02  
**Document reviewed**: `notes/formal_proofs_P1_P3.md`  
**Reference model**: `notes/analytical_formalization.md` (v5)  
**Grade**: **PASS WITH CONCERNS**

---

## 1. Expressive values $v$: Are they correctly derived?

### Verdict: CORRECT

All four cases of $v$ are correctly derived from the model primitives:

| Case | Formula | Value | Check |
|------|---------|-------|-------|
| Comp anticipated, $t=1$ | $v = 1 + \delta(1-B)$ | $1 + 0.9 \times 0.4 = 1.36$ | CORRECT |
| No comp, $t=1$ (forward-looking) | $v = 1 + \delta$ | $1 + 0.9 = 1.90$ | CORRECT |
| Compensated, $t=2$ (last period) | $v = 1 - B$ | $1 - 0.6 = 0.40$ | CORRECT |
| Uncompensated, $t=2$ (last period) | $v = 1$ | $1.00$ | CORRECT |

**Reasoning verified**: Displacement is absorbing, so a displaced worker in $t=1$ will be displaced in $t=2$ with certainty. The future loss $\delta \cdot (1 - B \cdot \varphi_2)$ is correctly conditioned on the compensation expectation. In $t=2$ (last period), the future-loss term is correctly set to zero.

**One subtlety correctly handled**: Under T$\times$D $t=1$, displaced workers anticipate no compensation (which is then verified by the trigger check), yielding $v = 1 + \delta = 1.9$. The document correctly identifies this as a dominant strategy case ($v > C_D$) and derives $\pi_1 = \omega_{T1} = 0.05$.

---

## 2. Single-state approximation $\pi^* = \bar{h} = 1 - v/C_x$

### Verdict: CORRECT, with one notation issue

**The core result is correct.** In the single-state global game with linear $h(\pi) = \pi$ and logistic noise:
- The indifference condition $\Omega \cdot \Lambda((\omega - s^*)/\sigma) = \bar{h}$ yields $\pi^* = \bar{h}$ at any interior equilibrium.
- This is independent of $\omega$ and $\sigma$, depending only on $v$ and $C_x$.

**Existence conditions correctly stated and applied:**

| Scenario | $\bar{h}$ | $\Omega$ | Type | $\pi^*$ | Correct? |
|----------|-----------|----------|------|---------|----------|
| R$\times$D $t=1$ (comp) | 0.0933 | 0.30 | Interior | 0.0933 | YES |
| R$\times$D $t=2$ (comp) | 0.7333 | 0.51 | No protest ($\bar{h} > \Omega$) | 0 | YES |
| T$\times$D $t=1$ | $-0.267$ | 0.05 | Dominant ($\bar{h} < 0$) | 0.05 | YES |
| T$\times$D $t=2$ | 0.3333 | 0.62 | Interior | 0.3333 | YES |
| R$\times$A $t=1$ | $-0.152$ | 0.30 | Dominant ($\bar{h} < 0$) | 0.30 | YES |
| R$\times$A $t=2$ | 0.3939 | 0.51 | Interior | 0.3939 | YES |
| T$\times$A $t=1$ | $-0.152$ | 0.05 | Dominant ($\bar{h} < 0$) | 0.05 | YES |
| T$\times$A $t=2$ (comp) | 0.7576 | 0.62 | No protest ($\bar{h} > \Omega$) | 0 | YES |

All eight cases are correctly classified and the existence conditions are properly checked.

**Approximation quality**: The document states $\sigma = 0.10$ with minimum state separation $\omega_R - \omega_{T1} = 0.25 = 2.5\sigma$. This is adequate for the single-state approximation. The document appropriately references numerical multi-state verification scripts. No error here.

---

## 3. Comparisons ($\pi^*$ vs. thresholds)

### Verdict: CORRECT

All comparisons between equilibrium protest and institutional thresholds are arithmetically correct:

| Comparison | Values | Holds? | Used for |
|------------|--------|--------|----------|
| $\pi_1^{*} > \bar{\pi}_D^{\text{comp}}$ (R$\times$D) | $0.0933 > 0.07$ | YES | Comp triggered |
| $\pi_1^{*} < \bar{\pi}_D^{\text{fall}}$ (R$\times$D) | $0.0933 < 0.20$ | YES | Survives $t=1$ |
| $\pi_2^{*} < \bar{\pi}_D^{\text{fall}}$ (R$\times$D) | $0 < 0.20$ | YES | Survives $t=2$ |
| $\pi_1 < \bar{\pi}_D^{\text{comp}}$ (T$\times$D) | $0.05 < 0.07$ | YES | No comp |
| $\pi_2^{*} > \bar{\pi}_D^{\text{fall}}$ (T$\times$D) | $0.333 > 0.20$ | YES | Falls |
| $\omega_R < \bar{\omega}_A$ (R$\times$A) | $0.30 < 0.40$ | YES | Elite blind |
| $\pi_2^{*} > \bar{\pi}_A^{\text{fall}}$ (R$\times$A) | $0.394 > 0.05$ | YES | Falls |
| $\omega_{T2} > \bar{\omega}_A$ (T$\times$A) | $0.60 > 0.40$ | YES | Elite sees crisis |
| $\pi_2^{*} < \bar{\pi}_A^{\text{fall}}$ (T$\times$A) | $0 < 0.05$ | YES | Survives |
| $\pi_1 \leq \bar{\pi}_A^{\text{fall}}$ (T$\times$A) | $0.05 \leq 0.05$ | BORDERLINE | See Section 6 below |

**All arithmetic is correct.** The only borderline case (T$\times$A $t=1$) is acknowledged and discussed in Section 7.6 of the proofs document.

---

## 4. Self-confirmation argument for R$\times$D

### Verdict: VALID

The argument proceeds in three steps:

1. **Candidate A** ($\varphi_2 = 1$ anticipated): $v = 1.36$, $\pi_1^* = 0.093 > \bar{\pi}_D^{\text{comp}} = 0.07$. Compensation IS triggered. This confirms $\varphi_2 = 1$. Self-confirming.

2. **Candidate B** ($\varphi_2 = 0$ anticipated): $v = 1.90 > C_D = 1.50$. Dominant strategy. $\pi_1 = 0.30 > \bar{\pi}_D^{\text{comp}} = 0.07$. Compensation IS triggered. But the candidate assumed $\varphi_2 = 0$. Contradiction. Not self-confirming.

3. **Uniqueness**: Only Candidate A survives. The unique self-confirming equilibrium has $\varphi_2 = 1$.

**This argument is logically sound.** The key insight is that both candidates generate protest exceeding the voice threshold, so compensation is triggered regardless of expectations. Only the comp-expected candidate is internally consistent.

**One implicit assumption worth noting**: The argument assumes that if $\pi > \bar{\pi}_D^{\text{comp}}$, compensation is triggered with certainty (not probabilistically). This is consistent with the voice trigger model but differs from the autocratic probabilistic trigger ($\tilde{\omega}_S$ includes noise). The asymmetry is intentional and well-motivated by the Hirschman voice/exit framework.

---

## 5. KEY ISSUE: $v = 1.9 > C_A = 1.65$ under R$\times$A $t=1$

### Verdict: GENUINE PROBLEM, but correctly identified and handled in the document

**The issue**: With $C_A = 1.65$ and $v = 1 + \delta = 1.9$, protesting is a **dominant strategy** for displaced workers under R$\times$A in $t=1$. This means $\pi_1 = \Omega_1(R) = 0.30$, which vastly exceeds $\bar{\pi}_A^{\text{fall}} = 0.05$. **The autocracy falls in $t=1$, not through accumulation in $t=2$.**

**Does this break the model narrative?**

The paper's narrative for R$\times$A is: "the autocrat represses moderate protest in $t=1$; displacement accumulates; protest overwhelms in $t=2$." But with these parameters, there is nothing to repress -- protest is dominant and massive from $t=1$.

**The document's handling**: The proofs document explicitly acknowledges this (Section 3, Step 3 and the Remark on Repression). It correctly notes that:
- With the given parameters, the autocracy falls in $t=1$ already.
- The $t=2$ accumulation story requires either (a) a higher $C_A$ or (b) a separate repression mechanism not currently modeled (i.e., the regime suppresses $\pi_1$ below the fall threshold through extra-model means, but displacement accumulates).
- The Alternative Derivation shows that even if repression suppresses $t=1$ protest, the $t=2$ result ($\pi_2 = 0.394 > 0.05$) ensures the fall.

**Assessment**: This is the most significant tension in the document. It is not a mathematical error -- the derivations are correct. It is a **model-narrative mismatch**: the parameters chosen produce a result ($t=1$ fall) that is stronger than the narrative claims ($t=2$ fall through accumulation). The document's solution -- presenting both paths and noting the result holds either way -- is honest and mathematically correct. However, for the paper, this needs resolution in one of two ways:

**(a) Raise $C_A$ so that $v < C_A$ in $t=1$**: This requires $C_A > 1.9$. But the review that recommended $C_A = 1.65$ showed that $C_A = 2.0$ is outside the sweet spot in the multi-state model. There may be no $C_A$ that simultaneously satisfies $v_{t=1} = 1.9 < C_A$ (interior equilibrium in $t=1$) AND produces sufficient protest in $t=2$ to overwhelm the regime. This is a parametric tension that deserves further investigation.

**(b) Add explicit repression mechanism**: Model $C_A$ as applying only to the cost of visible participation, while the regime can deploy additional repression that suppresses $\pi$ below $\bar{\pi}_A^{\text{fall}}$ in $t=1$ but cannot prevent displacement accumulation. This would require modeling repression separately from $C_A$.

**(c) Accept the $t=1$ fall**: The crossed fragility result holds regardless of WHEN the autocracy falls. The key claim is that autocracy is UNSTABLE under rapid, and it is -- whether in $t=1$ or $t=2$. The accumulation narrative is a refinement, not the core result.

**Severity**: MODERATE. The mathematical proofs are correct. The narrative needs adjustment or the parameters need recalibration. Option (c) is the simplest resolution.

---

## 6. Eight sufficient conditions for P3

### Verdict: CORRECT with one minor imprecision

The eight conditions (i)--(viii) correctly capture the necessary and sufficient parametric constraints for crossed fragility. I verify each:

**(i)** $1 - \frac{1+\delta(1-B)}{C_D} > \bar{\pi}_D^{\text{comp}}$

- This is $\bar{h}^{\text{comp}}(R \times D) > \bar{\pi}_D^{\text{comp}}$: the protest level under the comp-expected equilibrium exceeds the voice trigger. **Correct.**
- Numerically: $1 - 1.36/1.50 = 0.0933 > 0.07$. **Verified.**

**(ii)** $\omega_{T1} < \bar{\pi}_D^{\text{comp}}$

- Under T$\times$D $t=1$, with $v > C_D$ (dominant strategy), $\pi_1 = \omega_{T1}$. This must be below the voice trigger. **Correct.**
- Numerically: $0.05 < 0.07$. **Verified.**

**(iii)** $1 - \frac{1}{C_D} > \bar{\pi}_D^{\text{fall}}$

- This is $\bar{h}^{\text{no-comp}}(T \times D, t=2) > \bar{\pi}_D^{\text{fall}}$: uncompensated protest in $t=2$ exceeds the fall threshold. **Correct.** Note: this uses $v = 1$ (last period, uncompensated), which is correct.
- Numerically: $1 - 1/1.5 = 1/3 \approx 0.333 > 0.20$. **Verified.**
- The equivalent reformulation $C_D < 1/(1 - \bar{\pi}_D^{\text{fall}})$ is also correct: $1.5 < 1/(1-0.20) = 1.25$. **WAIT -- this is WRONG.** $1/(1-0.20) = 1/0.80 = 1.25$. But $C_D = 1.50 > 1.25$. The equivalent reformulation says $C_D < 1.25$, which is NOT satisfied by $C_D = 1.50$.

**ERROR FOUND**: The reformulation of condition (iii) is **algebraically incorrect**. The condition $1 - 1/C_D > \bar{\pi}_D^{\text{fall}}$ is equivalent to $1/C_D < 1 - \bar{\pi}_D^{\text{fall}}$, i.e., $C_D > 1/(1 - \bar{\pi}_D^{\text{fall}})$. The document writes $C_D < 1/(1 - \bar{\pi}_D^{\text{fall}})$, which reverses the inequality. The correct reformulation is:

$$C_D > \frac{1}{1 - \bar{\pi}_D^{\text{fall}}} = \frac{1}{0.80} = 1.25$$

And indeed $C_D = 1.50 > 1.25$, so the condition holds. **The original condition is correct; the "equivalent" reformulation has a sign error.** This does not affect any downstream computation since the verification table uses the correct original form ($0.3333 > 0.20$).

**(iv)** $\omega_R < \bar{\omega}_A$. Trivially correct. $0.30 < 0.40$.

**(v)** $\omega_{T2} > \bar{\omega}_A$. Trivially correct. $0.60 > 0.40$.

**(vi)** $1 - 1/C_A < \Omega_2(R)$

- Interior equilibrium exists for R$\times$A $t=2$: $\bar{h} < \Omega$. With $v = 1$: $\bar{h} = 1 - 1/C_A$. **Correct.**
- Numerically: $1 - 1/1.65 = 0.3939 < 0.51$. **Verified.**

**(vii)** $1 - 1/C_A > \bar{\pi}_A^{\text{fall}}$

- Protest exceeds the autocratic fall threshold: $\bar{h} > \bar{\pi}_A^{\text{fall}}$. **Correct.**
- Numerically: $0.3939 > 0.05$. **Verified.**

**(viii)** $1 - (1-B)/C_A > \Omega_2(T)$

- No interior equilibrium for T$\times$A with compensation: $\bar{h} > \Omega$. With $v = 1-B = 0.4$: $\bar{h} = 1 - 0.4/C_A$. **Correct.**
- Numerically: $1 - 0.4/1.65 = 0.7576 > 0.62$. **Verified.**

### Missing conditions

The eight conditions do not explicitly include:

**(a) Existence condition for R$\times$D $t=1$**: $0 < \bar{h}^{\text{comp}} < \Omega_1(R)$, i.e., $0 < 0.0933 < 0.30$. This is implicitly satisfied by (i) ($\bar{h} > 0.07 > 0$) and the fact that $\bar{h} < 1$ always holds for $v > 0$. Not a gap -- the condition is implied.

**(b) Existence condition for T$\times$D $t=2$**: $0 < 1 - 1/C_D < \Omega_2(T)$. Condition (iii) gives $\bar{h} > 0.20 > 0$. The upper bound $\bar{h} < \Omega_2(T)$ is not listed but is needed for the interior equilibrium. Numerically: $0.333 < 0.62$. **This is an unlisted condition.** However, it is automatically satisfied when $\Omega_2(T)$ is large (which it is, by design: $\omega_{T2} = 0.60$ is the defining feature of threshold automation). For generality, it should be stated.

**(c) $\bar{\pi}_D^{\text{comp}} < \bar{\pi}_D^{\text{fall}}$**: The voice trigger must be below the fall threshold (the "sweet spot" for democracy). This is $0.07 < 0.20$, obviously satisfied, but is a structural assumption that should be listed among the conditions.

**(d) T$\times$A $t=1$ survival**: $\omega_{T1} \leq \bar{\pi}_A^{\text{fall}}$. This is borderline ($0.05 = 0.05$), acknowledged in C5 of the proof. Should be strict: $\omega_{T1} < \bar{\pi}_A^{\text{fall}}$.

**Severity of missing conditions**: LOW. All are satisfied with comfortable margins under the chosen parameters. For a formal publication, conditions (b) and (c) should be added for completeness. The open set argument still holds since all conditions are strict inequalities with positive margins.

---

## 7. Gaps, errors, or circular reasoning

### 7.1 Parameter inconsistency between documents

**CONCERN**: The proofs file uses $C_A = 1.65$, while the authoritative analytical formalization (v5, Section 12 "Confirmed parameters") uses $C_A = 2.0$. The $C_A = 1.65$ value comes from a review recommendation (`notes/review_CA_sigmaA_v5_numerical.md`) that identified $C_A = 2.0$ as being outside the multi-state sweet spot. However, the analytical formalization has not been updated to reflect this change.

**Impact**: The proofs are internally consistent with $C_A = 1.65$. The analytical formalization is internally consistent with $C_A = 2.0$ in the single-state benchmark but inconsistent in the multi-state model. **Resolution needed**: update the confirmed parameters in `analytical_formalization.md` to $C_A = 1.65$, or explicitly document $C_A = 1.65$ as the corrected baseline.

### 7.2 Algebraic sign error in condition (iii) reformulation

As identified in Section 6 above, the "equivalently" reformulation of condition (iii) reverses the inequality direction. The original condition $1 - 1/C_D > \bar{\pi}_D^{\text{fall}}$ is correct; the reformulation $C_D < 1/(1 - \bar{\pi}_D^{\text{fall}})$ should read $C_D > 1/(1 - \bar{\pi}_D^{\text{fall}})$.

**Impact**: MINOR. No downstream computation depends on the reformulation; the verification table uses the correct original form.

### 7.3 No circular reasoning detected

The proof structure is clean:
- Expressive values $v$ are derived from primitives (displacement status, compensation expectations, discount factor).
- The single-state approximation $\pi^* = \bar{h}$ is a result of the global game, not assumed.
- Self-confirmation is checked sequentially: assume $\varphi$, compute $\pi$, check trigger, verify consistency.
- The autocratic trigger (elite assessment) is independent of $\pi$, breaking the self-fulfilling cycle correctly.
- At no point does the proof assume what it is trying to show.

### 7.4 Probabilistic vs. deterministic autocratic authorization

The proof for R$\times$A (Section 3) notes that the elite authorizes with probability 0.25 (not zero). The document handles this by conditioning on the modal outcome (no authorization, probability 0.75). This is not fully rigorous -- the proposition should hold for ALL realizations, or be stated as holding with high probability.

**Suggestion**: Add the parametric condition $\bar{\omega}_A \geq \omega_R + k \cdot \sigma_A$ for some $k > 0$ (e.g., $k = 1$ gives authorization probability < 16%). With $\bar{\omega}_A = 0.45$ instead of 0.40, the authorization probability drops to $\Phi(-1) = 0.159$. The proposition holds "with probability at least $1 - \Phi((\omega_R - \bar{\omega}_A)/\sigma_A)$." Currently the document states this but could be more precise about making it a formal condition.

Similarly for T$\times$A: authorization probability is 91%, not 100%. The proposition should state it holds with probability $\Phi((\omega_{T2} - \bar{\omega}_A)/\sigma_A)$ or require $\omega_{T2} - \bar{\omega}_A > k \cdot \sigma_A$ for a sufficiently high confidence level.

**Impact**: MODERATE for formal rigor. The results are overwhelmingly likely to hold (75% and 91% respectively), but a rigorous proof should either make the authorization deterministic (by taking $\sigma_A \to 0$ in the appropriate limit) or state the result as holding with high probability.

### 7.5 $\bar{\pi}_D^{\text{comp}} = 0.07$: derivation from primitives

The democratic compensation trigger $\bar{\pi}_D^{\text{comp}} = 0.07$ is treated as a free parameter that must lie in the interval $(0.05, 0.093)$. The analytical formalization (v5) discusses it as reflecting "minimum protest that generates legislative action" and cites Chenoweth & Stephan (2011) for the 3.5% mobilization threshold.

This is not circular, but the interval $(0.05, 0.093)$ is narrow (width 0.043). The document acknowledges this in Section 7.5 and argues that the prosperity trap ($Y^+$ blocking) provides a backup mechanism. **This is the weakest parametric link in the proof.** The result depends on $\bar{\pi}_D^{\text{comp}}$ falling in this specific interval. If $\bar{\pi}_D^{\text{comp}} < 0.05$, compensation would be triggered under T$\times$D $t=1$ (breaking T$\times$D falls). If $\bar{\pi}_D^{\text{comp}} > 0.093$, no compensation under R$\times$D (breaking R$\times$D stable).

**Not an error**, but a significant parametric sensitivity that should be prominently disclosed.

### 7.6 Condition (i) and the R$\times$D self-confirmation

Condition (i) requires $\bar{h}^{\text{comp}} > \bar{\pi}_D^{\text{comp}}$, which ensures that in the comp-expected equilibrium, protest is sufficient to trigger compensation. But the self-confirmation argument in Section 1 also requires ruling out the no-comp equilibrium. The document does this (Candidate B generates $\pi = 0.30 \gg 0.07$, triggering comp, contradicting the no-comp assumption). However, this ruling-out step relies on $v^{(B)} = 1.9 > C_D = 1.5$, which is NOT among the eight listed conditions. It follows from $\delta > 0$ and $B < 1$ (which ensures $v^{(B)} = 1 + \delta > 1$), plus $C_D < 1 + \delta$ (i.e., $C_D < 1.9$). This is satisfied for any $C_D < 1 + \delta$, which holds for all reasonable parameters ($C_D = 1.5 < 1.9$).

Formally, the self-confirmation argument requires: $v^{(B)} = 1 + \delta > C_D$ OR $\Omega_1(R) \cdot \Lambda(\cdot) > \bar{\pi}_D^{\text{comp}}$ even under the no-comp equilibrium. The dominant strategy condition $1 + \delta > C_D$ is sufficient and is generically satisfied ($\delta = 0.9$, $C_D = 1.5$). This should be listed as condition (ix) or noted as following from existing parameter constraints.

**Impact**: LOW. The condition $C_D < 1 + \delta$ is very mild and holds for any reasonable parameterization.

---

## 8. Summary Assessment

### What is correct

1. **All expressive values** are correctly derived from the model.
2. **The single-state approximation** is correctly applied, with existence conditions properly checked.
3. **All arithmetic** in the threshold comparisons is correct.
4. **The self-confirmation argument** for R$\times$D is logically valid.
5. **The eight sufficient conditions** are correctly verified numerically.
6. **The open set argument** is valid: the conditions are continuous, strict, and jointly satisfied.
7. **No circular reasoning** is present.

### What needs attention

| Issue | Severity | Description |
|-------|----------|-------------|
| **C_A parameter discrepancy** | MODERATE | $C_A = 1.65$ in proofs vs. $C_A = 2.0$ in analytical formalization. Documents must be synchronized. |
| **R$\times$A $t=1$ dominant strategy** | MODERATE | $v = 1.9 > C_A = 1.65$ means autocracy falls in $t=1$, not $t=2$. The accumulation narrative needs revision or $C_A$ needs recalibration. |
| **Condition (iii) sign error** | MINOR | Reformulation reverses inequality. Original form is correct. |
| **Probabilistic authorization** | MODERATE | Elite trigger is probabilistic (75% no-auth for R$\times$A, 91% auth for T$\times$A). Proposition should be stated as holding with high probability or deterministic limit taken. |
| **Missing conditions** | LOW | Conditions (b), (c), (d) from Section 6 should be listed for completeness. |
| **Narrow $\bar{\pi}_D^{\text{comp}}$ window** | LOW | Width 0.043. Not an error but a sensitivity. |
| **Self-confirmation implicit condition** | LOW | $C_D < 1 + \delta$ needed for ruling out no-comp equilibrium. Generically satisfied. |
| **T$\times$A $t=1$ borderline** | LOW | $\pi_1 = 0.05 = \bar{\pi}_A^{\text{fall}}$. Acknowledged. Use $\bar{\pi}_A^{\text{fall}} = 0.06$ or strict inequality. |

### Recommendations for resolution

1. **Synchronize parameters**: Update `analytical_formalization.md` to use $C_A = 1.65$ as the confirmed baseline, or add a note explaining the discrepancy.

2. **Address the $t=1$ fall issue**: Either (a) accept that R$\times$A falls in $t=1$ and adjust the narrative (simplest), (b) raise $C_A$ to $> 1.9$ and verify the sweet spot still holds (may be impossible with current $\omega_R$), or (c) model repression as a separate mechanism that delays the fall to $t=2$.

3. **Fix condition (iii) reformulation**: Change "$C_D < 1/(1 - \bar{\pi}_D^{\text{fall}})$" to "$C_D > 1/(1 - \bar{\pi}_D^{\text{fall}})$".

4. **Address probabilistic authorization**: Add a formal condition like $|\omega - \bar{\omega}_A| > k \cdot \sigma_A$ for $k \geq 1.5$ (giving confidence $\geq 93\%$), or state the proposition as holding "with probability at least $p$" for a specified $p$.

5. **Add missing conditions (b) and (c)** to the eight listed, making them ten.

---

## 9. Grade

### **PASS WITH CONCERNS**

**Rationale**: The mathematical derivations are correct throughout. The single-state approximation is properly applied. The existence conditions are checked. The self-confirmation argument is valid. The eight sufficient conditions are correctly stated (with one sign error in a reformulation that does not affect any computation). The open set argument is sound.

The concerns are:
- The parameter discrepancy between this document and the authoritative model ($C_A = 1.65$ vs. $C_A = 2.0$) must be resolved before the proofs can be considered authoritative.
- The dominant strategy issue in R$\times$A $t=1$ ($v = 1.9 > C_A = 1.65$) creates a tension between the mathematical result (autocracy falls in $t=1$) and the paper's narrative (accumulation through $t=2$). The proofs document handles this honestly but the model/narrative gap needs resolution.
- The probabilistic nature of the elite's authorization decision means the proposition holds with high probability, not with certainty, which should be formally acknowledged.

None of these concerns involve mathematical errors. The grade reflects the need for parameter synchronization and narrative alignment, not analytical incorrectness.
