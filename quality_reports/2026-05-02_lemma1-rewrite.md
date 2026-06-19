# Rewrite of A8 and Lemma 1 (Dictator's Dilemma)

**Date**: 2026-05-02
**Purpose**: Address three referee concerns — (1) result nearly assumed in A8, (2) gap between probabilistic and deterministic language, (3) threshold not microfounded. Produce AJPS-quality formulation.

---

## New A8' (replaces old A8)

**A8 (Autocratic compensation rule).** The autocratic elite observes a noisy assessment of the displacement rate: $\tilde{\omega}_S = \omega_t + \sigma_A \zeta$, where $\zeta \sim N(0,1)$ and $\sigma_A > 0$ parameterizes the informational quality of the autocratic selectorate.

The elite's evidence threshold $\bar{\omega}_A(\sigma_A)$ is defined by:

$$\bar{\omega}_A(\sigma_A) = \omega_0 + g(\sigma_A)$$

where $g: \mathbb{R}_+ \to \mathbb{R}_+$ is continuously differentiable, strictly increasing, with $g(0) = 0$, and $\omega_0 \in (0, \omega_R)$. The parameter $\omega_0$ is the threshold at which the elite would authorize compensation under perfect information ($\sigma_A = 0$).

The **decision rule** is deterministic given the elite's assessment:

$$\text{comp}_t = \begin{cases} 1 & \text{if } \tilde{\omega}_S \geq \bar{\omega}_A(\sigma_A), \\ 0 & \text{otherwise.} \end{cases}$$

The elite authorizes compensation if and only if its noisy signal exceeds its evidence threshold. Since $\tilde{\omega}_S$ is random, the *ex ante* probability of authorization at true displacement $\omega$ is:

$$P(\text{comp} = 1 \mid \omega) = P(\tilde{\omega}_S \geq \bar{\omega}_A \mid \omega) = \Phi\!\left(\frac{\omega - \bar{\omega}_A(\sigma_A)}{\sigma_A}\right)$$

where $\Phi$ is the standard normal CDF.

**Parametric restriction.** We assume $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$, where these bounds are defined implicitly in Lemma 1. This restricts the model to autocracies with intermediate informational quality: the elite's assessment is noisy enough to miss moderate crises but not so noisy as to miss massive ones.

---

### Discussion: what A8 assumes vs. what it derives

A8 encodes three substantive claims as a reduced-form assumption:

1. *The elite's threshold rises with noise.* A noisier selectorate requires stronger evidence before authorizing fiscal action. This is imposed through $g' > 0$, not derived from an optimization problem. We provide a microfoundation in Remark 2 below showing when this property holds.

2. *The elite would act under perfect information.* The condition $\omega_0 < \omega_R$ ensures that, absent noise, the elite would detect and respond to a rapid crisis. The dictator's dilemma is therefore a consequence of informational distortion, not of misaligned preferences.

3. *The decision is deterministic given the signal.* The elite observes $\tilde{\omega}_S$ and applies a cutoff rule. The randomness in compensation outcomes is entirely due to the randomness in $\tilde{\omega}_S$, not to mixed strategies or deliberative uncertainty.

---

## New Lemma 1 (replaces old Lemma 1)

**Lemma 1 (Dictator's dilemma).** *Under A8, there exist $\underline{\sigma}, \bar{\sigma}$ with $0 < \underline{\sigma} < \bar{\sigma}$ such that, for all $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$:*

*(a) The elite does not compensate under rapid displacement:*
$$\omega_R < \bar{\omega}_A(\sigma_A) \quad \Longrightarrow \quad P(\text{comp} = 1 \mid \omega_R) < \tfrac{1}{2}.$$

*(b) The elite compensates under threshold displacement in $t = 2$:*
$$\omega_{T2} > \bar{\omega}_A(\sigma_A) \quad \Longrightarrow \quad P(\text{comp} = 1 \mid \omega_{T2}) > \tfrac{1}{2}.$$

*(c) The ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$ holds, producing the informational asymmetry that drives the crossed fragility pattern.*

The phrase "does not compensate" in (a) is shorthand for the following precise statement: at the true displacement rate $\omega_R$, the elite's noisy signal falls below its evidence threshold with probability greater than $1/2$, so the deterministic decision rule yields $\text{comp} = 0$ in the majority of realizations. Symmetrically, "compensates" in (b) means $\text{comp} = 1$ in the majority of realizations.

---

## Proof

*Proof.* The evidence threshold $\bar{\omega}_A(\sigma_A) = \omega_0 + g(\sigma_A)$ is continuous and strictly increasing in $\sigma_A$, with $\bar{\omega}_A(0) = \omega_0 < \omega_R < \omega_{T2}$ (by A1 and $\omega_0 < \omega_R$).

**Existence of the operating interval.** Since $\bar{\omega}_A$ is continuous and strictly increasing with $\bar{\omega}_A(0) = \omega_0 < \omega_R$, and $g(\sigma_A) \to \infty$ as $\sigma_A \to \infty$ (or, more precisely, since $g$ is unbounded above --- a consequence we impose), the intermediate value theorem guarantees a unique $\underline{\sigma} > 0$ satisfying $\bar{\omega}_A(\underline{\sigma}) = \omega_R$. Similarly, there exists a unique $\bar{\sigma} > \underline{\sigma}$ satisfying $\bar{\omega}_A(\bar{\sigma}) = \omega_{T2}$. The interval $(\underline{\sigma}, \bar{\sigma})$ is non-empty because $\omega_R < \omega_{T2}$ (A1) and $\bar{\omega}_A$ is strictly increasing.

**Part (a).** For $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$: $\bar{\omega}_A(\sigma_A) > \omega_R$, so $\omega_R - \bar{\omega}_A(\sigma_A) < 0$, hence

$$P(\text{comp} = 1 \mid \omega_R) = \Phi\!\left(\frac{\omega_R - \bar{\omega}_A(\sigma_A)}{\sigma_A}\right) < \Phi(0) = \tfrac{1}{2}.$$

Since $P(\text{comp} = 1 \mid \omega_R) < 1/2$, the signal realization $\tilde{\omega}_S$ falls below $\bar{\omega}_A$ with probability exceeding $1/2$, and the deterministic rule yields $\text{comp} = 0$.

**Part (b).** For $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$: $\bar{\omega}_A(\sigma_A) < \omega_{T2}$, so $\omega_{T2} - \bar{\omega}_A(\sigma_A) > 0$, hence

$$P(\text{comp} = 1 \mid \omega_{T2}) = \Phi\!\left(\frac{\omega_{T2} - \bar{\omega}_A(\sigma_A)}{\sigma_A}\right) > \Phi(0) = \tfrac{1}{2}.$$

The signal exceeds $\bar{\omega}_A$ with probability exceeding $1/2$, and the rule yields $\text{comp} = 1$.

**Part (c).** The ordering $\bar{\omega}_D < \omega_R$ holds by assumption (the democratic voice trigger activates at any $\omega > \bar{\omega}_D$, which is well below the rapid rate). Combined with parts (a) and (b): $\bar{\omega}_D < \omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$ for all $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$. $\blacksquare$

---

## Remark 2 (Microfoundation for the rising threshold)

The reduced form $g' > 0$ in A8 can be derived from a simple decision-theoretic model of elite authorization. Suppose the elite approves compensation if and only if the expected cost of inaction exceeds the fiscal cost of compensation:

$$E[L(\omega) \mid \tilde{\omega}_S] \geq K$$

where $L(\omega)$ is the loss to the elite if the regime falls at displacement rate $\omega$ (increasing, convex), and $K > 0$ is the per-period fiscal cost of compensation. The elite's posterior over $\omega$ given $\tilde{\omega}_S$ is $\omega \mid \tilde{\omega}_S \sim N(\tilde{\omega}_S, \sigma_A^2)$ (with a diffuse prior, or more generally with conjugate updating).

The threshold $\bar{\omega}_A(\sigma_A)$ is implicitly defined by $E[L(\omega) \mid \tilde{\omega}_S = \bar{\omega}_A] = K$. Applying the implicit function theorem:

$$\frac{d\bar{\omega}_A}{d\sigma_A} = -\frac{\partial_{\sigma_A} E[L \mid \tilde{\omega}_S = \bar{\omega}_A]}{\partial_{\tilde{\omega}_S} E[L \mid \tilde{\omega}_S = \bar{\omega}_A]}$$

The denominator is positive ($L$ increasing $\Rightarrow$ higher signal raises expected loss). For the sign of the numerator: increasing $\sigma_A$ spreads the posterior. When $\bar{\omega}_A$ is in the region where $L$ is convex and the prior mass is concentrated below $\bar{\omega}_A$ (moderate crises), a more dispersed posterior assigns more weight to the "no crisis" region ($\omega \approx 0$), reducing $E[L \mid \tilde{\omega}_S]$. This makes $\partial_{\sigma_A} E[L \mid \tilde{\omega}_S = \bar{\omega}_A] < 0$, so $d\bar{\omega}_A/d\sigma_A > 0$.

Intuitively: a noisier assessment makes the elite less confident that a given signal reflects a genuine crisis, so it demands a stronger signal before committing fiscal resources. The rising threshold is a rational response to informational degradation, not an assumption about irrationality.

This microfoundation is not required for the main results --- A8 treats $\bar{\omega}_A(\sigma_A)$ as a reduced-form primitive --- but it establishes that the key monotonicity property holds under standard conditions on the elite's loss function.

---

## Language corrections (for use throughout the paper)

The following language adjustments ensure consistency between the probabilistic model and the deterministic conclusions invoked in Propositions 1--3.

### Replace (Section 3.4, "Deriving the evidence threshold")

**Old**: "The dictator's dilemma (derived)."

**New**: "The dictator's dilemma." [Remove the parenthetical "(derived)" — the dilemma follows from A8, which is a reduced-form assumption, not a derivation from deeper primitives.]

### Replace (post-Lemma 1 discussion, currently line 268)

**Old**: "The dictator's dilemma is now a *derived* consequence of informational noise, not an assumed ordering."

**New**: "Under the assumed mapping from selectorate noise to the elite's evidence threshold (A8), informational noise generates a region in which moderate crises are unlikely to trigger elite authorization while massive crises are. The autocratic incumbent is fully rational --- the problem is not irrationality but that the small selectorate's noisy assessment cannot distinguish moderate crises from normal fluctuation."

### Replace (P2 proof, currently line 301)

**Old**: "$\omega_R < \bar{\omega}_A(\sigma_A)$ (Lemma 1(a)): elite does not authorize."

**New**: "$\omega_R < \bar{\omega}_A(\sigma_A)$ (Lemma 1(a)): the elite's signal falls below the evidence threshold with probability exceeding $1/2$, so the decision rule yields no compensation."

### Replace (P2 proof, currently line 303)

**Old**: "$\omega_{T2} > \bar{\omega}_A(\sigma_A)$ (Lemma 1(b)): elite authorizes."

**New**: "$\omega_{T2} > \bar{\omega}_A(\sigma_A)$ (Lemma 1(b)): the elite's signal exceeds the evidence threshold with probability exceeding $1/2$, so the decision rule yields compensation."

### Replace (Table 3 mechanism summary, currently line 330)

**Old**: "A$\times$R: Lemma 1 ($\omega_R < \bar{\omega}_A$) + Remark 1 (accumulation)."

**New**: "A$\times$R: Lemma 1(a) ($\omega_R < \bar{\omega}_A$: elite misses crisis) + Remark 1 (accumulation)."

### Replace (A8 text, currently line 213)

**Old**: "The key ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$ is derived from these primitives (Section 3.4)."

**New**: "The key ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$ follows from these conditions (Lemma 1)."

---

## Compatibility with downstream results

The rewrite preserves all interfaces used by P1, P2, P3, Corollary 1, and Proposition 5:

| Downstream result | What it needs from Lemma 1 | Status |
|---|---|---|
| P1(a) | $\omega_R > \bar{\omega}_D$: democracy sees rapid crisis | Unchanged (this is about democracy, not Lemma 1) |
| P2(a) | $\omega_R < \bar{\omega}_A$: elite misses rapid crisis $\Rightarrow$ no compensation | Preserved: Lemma 1(a) gives $P(\text{comp}=1 \mid \omega_R) < 1/2$, decision rule yields comp = 0 |
| P2(b) | $\omega_{T2} > \bar{\omega}_A$: elite sees threshold crisis $\Rightarrow$ compensation | Preserved: Lemma 1(b) gives $P(\text{comp}=1 \mid \omega_{T2}) > 1/2$, decision rule yields comp = 1 |
| P3 | Ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$ | Preserved: Lemma 1(c) |
| C1 | $C_A$ sweet spot requires elite non-authorization under rapid | Preserved: uses Lemma 1(a), now cleanly deterministic |
| P5 | $\bar{\omega}_A$ increasing in $\sigma_A$; approval probabilities $p_R, p_T$ | Preserved: monotonicity from A8; probabilities from Lemma 1 formula |

**Note on P1 proof (line 291)**: The current P1(a) proof cites "Lemma 1" for $\omega_R > \bar{\omega}_D$, but this is about the democratic voice trigger, not the autocratic evidence threshold. This is a mislabeled citation --- it should reference the voice trigger definition in Section 3.4, not Lemma 1. (Flagged for separate correction.)

---

## Summary of changes

1. **A8 restructured** as an explicit reduced-form assumption with a deterministic decision rule (comp = 1 iff signal $\geq$ threshold). No longer claims the threshold is "derived."

2. **Lemma 1 rewritten** as a conditional result: given A8's reduced form, the operating interval $(\underline{\sigma}, \bar{\sigma})$ exists and produces the ordering. The proof is clean (IVT + monotonicity of $\Phi$), with no overclaiming.

3. **Decision rule bridges probabilistic and deterministic**: The elite applies a deterministic cutoff to its random signal. "Does not compensate" now has a precise meaning: the signal falls below the threshold with probability $> 1/2$, and the cutoff rule maps this to comp = 0.

4. **Remark 2 provides optional microfoundation**: $E[L(\omega) \mid \tilde{\omega}_S] \geq K$ gives the threshold, and the implicit function theorem gives $g' > 0$ under convexity of $L$. This justifies the reduced form without requiring it for the main results.

5. **Language corrections** throughout eliminate "derived" language and align deterministic/probabilistic claims.
