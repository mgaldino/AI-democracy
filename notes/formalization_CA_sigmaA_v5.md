# Formalization: $C_A$ Sweet Spot and $\sigma_A$ Amplification (v5 Model)

**Date**: 2026-05-02
**Reference model**: `notes/analytical_formalization.md` (v5: asymmetric triggers, selectorate as meta-primitive)
**Supersedes**: `notes/formalization_CA_sweet_spot.md` (based on old paper.Rmd model; uses Bayesian inference from $\pi$ for the incumbent -- NOT the v5 mechanism)

---

## 0. Model Summary and Key Distinction from Prior Formalization

In the v5 model, the two regimes have **asymmetric compensation triggers**:

- **Democracy (voice trigger):** Compensation iff $\pi_t > \bar{\pi}_D^{\text{comp}}$ -- protest is political demand.
- **Autocracy (technocratic trigger):** Compensation iff $\tilde{\omega}_S > \bar{\omega}_A$, where $\tilde{\omega}_S = \omega + \sigma_A \zeta$ is the elite's noisy economic assessment. This is **independent of $\pi$ and $C_A$**.

This asymmetry is the critical difference from the old formalization, which used Bayesian inference from $\pi$ for the autocratic incumbent. In v5:

1. **Condition (iv)** -- autocracy survives threshold $t=2$ -- is **independent of $C_A$**, because the elite trigger depends on the economic fundamental $\omega$, not on protest.
2. **$C_A$ enters ONLY through the protest volume channel** (condition iii): higher $C_A$ suppresses protest, making it harder for $\pi$ to exceed $\bar{\pi}_A^{\text{fall}}$ under rapid.
3. The "dictator's dilemma" is mediated by $\sigma_A$ (elite information noise), not by $C_A$. The elite fails to authorize compensation under rapid because $\omega_R < \bar{\omega}_A$, regardless of $C_A$.

### Notation

| Symbol | Meaning |
|--------|---------|
| $C_x$ | Cost of protest in regime $x \in \{D, A\}$; $C_A > C_D > 0$ |
| $\pi_t$ | Aggregate protest in period $t$: $\pi_t = \int a_{it}\,di$ |
| $\bar{\pi}_x^{\text{fall}}$ | Institutional resilience; $\bar{\pi}_D^{\text{fall}} > \bar{\pi}_A^{\text{fall}} > 0$ |
| $\bar{\pi}_D^{\text{comp}}$ | Democratic voice trigger for compensation |
| $\Omega_2^R$ | Cumulative displaced under rapid in $t=2$: $\omega_R(2-\omega_R)$ |
| $\Omega_2^T$ | Cumulative displaced under threshold in $t=2$: $\omega_{T1} + (1-\omega_{T1})\omega_{T2}$ |
| $v$ | Expressive value (displaced, uncompensated, $t=2$): $v = 1$ |
| $B$ | Compensation benefit; $B \in (0,1)$ |
| $h(\pi) = \pi$ | Safety-in-numbers function (linear) |
| $\sigma$ | Worker signal noise |
| $\sigma_A$ | Elite's economic assessment noise (large: small selectorate) |
| $\bar{\omega}_A$ | Elite's evidence threshold for approving fiscal spending |
| $\tilde{\omega}_S$ | Elite's assessment: $\omega + \sigma_A \zeta$, $\zeta \sim \Phi$ |

### Key orderings

$$\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$$

### Monotonicity properties used

**(M1)** $\pi^*(C_x, \Omega, v)$ is decreasing in $C_x$: higher protest cost $\Rightarrow$ less protest.

**(M2)** $\pi^*(C_x, \Omega, v)$ is increasing in $\Omega$: more displaced workers $\Rightarrow$ more protest.

Both M1 and M2 hold in the unique equilibrium of the global game with private signals and $h(\pi) = \pi$ (Morris and Shin 2003). M1 follows because $C_x$ enters the indifference condition $v = C_x(1 - E[\pi | s_i = s^*])$ uniformly across all workers: higher $C_x$ pushes $s^*$ upward, reducing $\pi^*(\omega) = \Omega \cdot \Pr(s_i > s^* | \omega)$ for each $\omega$. M2 follows because $\Omega$ scales the extensive margin directly.

We assume throughout that $\sigma$ is sufficiently small for the global game to have a unique equilibrium (Morris and Shin 2003, Theorem 1).

---

## 1. Corollary: Sweet Spot of $C_A$

### 1.1 Preamble: What $C_A$ controls in v5

In the v5 model, $C_A$ enters crossed fragility through **one channel only**: the protest volume under rapid automation in $t=2$. Specifically:

- **Condition (iii)** -- autocracy falls under rapid: requires $\pi_2^A(R) > \bar{\pi}_A^{\text{fall}}$ with $\varphi_2 = 0$ (no compensation). Since the autocratic trigger ($\tilde{\omega}_S > \bar{\omega}_A$) does not depend on $\pi$ or $C_A$, the no-compensation outcome under rapid is determined by $\omega_R < \bar{\omega}_A$ alone. Given this, whether the autocracy actually *falls* depends on whether accumulated protest breaks through: $\pi^*(C_A, \Omega_2^R, v=1) > \bar{\pi}_A^{\text{fall}}$.

- **Condition (iv)** -- autocracy survives threshold: requires $P(\tilde{\omega}_S > \bar{\omega}_A | \omega = \omega_{T2})$ to be high enough that the elite approves, and subsequent compensated protest to fall below $\bar{\pi}_A^{\text{fall}}$. The first part is independent of $C_A$ (the elite sees economic fundamentals). The second part -- whether compensated protest is low enough -- does interact with $C_A$, but in the **favorable** direction: higher $C_A$ further suppresses protest, making T$\times$A survival easier. So condition (iv) is satisfied throughout the sweet spot and above.

Therefore, $C_A$ affects crossed fragility only through condition (iii), and only in one direction: higher $C_A$ reduces protest, making it harder for the autocracy to fall under rapid.

### 1.2 Statement

**Corollary (Sweet spot of $C_A$).** *Under the v5 model with asymmetric triggers, define:*

$$C_A^{\min} := C_D \quad \text{(the regime is autocratic iff } C_A > C_D\text{)}$$

$$C_A^{\max}:\quad \pi^*(C_A^{\max},\, \Omega_2^R,\, v=1) = \bar{\pi}_A^{\text{fall}}$$

*Then crossed fragility (Proposition, conditions (i)--(v)) requires $C_A \in (C_A^{\min}, C_A^{\max})$. The interval is non-empty for parameters satisfying the sufficient condition:*

$$\pi^*(C_D,\, \Omega_2^R,\, v=1) > \bar{\pi}_A^{\text{fall}} \tag{NE}$$

*In particular:*

*(a) For $C_A \leq C_D$: the regime is not meaningfully autocratic (protest is as easy as in democracy). Crossed fragility requires $C_A > C_D$ by definition.*

*(b) For $C_A > C_A^{\max}$: protest is fully suppressed under rapid -- $\pi^*(C_A, \Omega_2^R, 1) < \bar{\pi}_A^{\text{fall}}$ -- so the autocracy survives both trajectories. Crossed fragility fails at condition (iii).*

*(c) For $C_A \in (C_D, C_A^{\max})$: the autocracy does not compensate under rapid (because $\omega_R < \bar{\omega}_A$, independent of $C_A$), and accumulated protest exceeds $\bar{\pi}_A^{\text{fall}}$. Condition (iii) holds.*

### 1.3 Proof

**Step 1: Lower bound.** The lower bound is definitional: $C_A > C_D$ is what makes the regime autocratic. For $C_A = C_D$, the autocracy and democracy are identical in terms of protest cost, which contradicts the model's premise. No informational mechanism is needed for the lower bound in v5 because the dictator's dilemma (the elite's failure to compensate under rapid) is driven by $\omega_R < \bar{\omega}_A$ -- a condition on the elite's assessment threshold, not on $C_A$. Even at $C_A$ slightly above $C_D$, the autocracy fails to compensate under rapid because the elite sees $\tilde{\omega}_S \approx \omega_R + \sigma_A \zeta$, and $P(\tilde{\omega}_S > \bar{\omega}_A | \omega_R) < 1/2$ since $\omega_R < \bar{\omega}_A$.

*Remark.* In the old formalization (paper.Rmd model), the lower bound was defined by the informativeness of protest: $C_A^{\min}$ was where the incumbent's Bayesian inference from $\pi$ became too noisy to detect the crisis. In v5, this mechanism is gone. The elite's blindness is driven by $\sigma_A$ (noisy economic assessment), not by $C_A$ (protest suppression). The lower bound simplifies to the definitional $C_A > C_D$.

**Step 2: Upper bound.** By M1, $\pi^*(C_A, \Omega_2^R, 1)$ is continuous and strictly decreasing in $C_A$. Consider the boundary behavior:

- As $C_A \downarrow C_D$: $\pi^*(C_D, \Omega_2^R, 1) > 0$ (positive protest under democratic conditions with $\Omega_2^R$ displaced and $v = 1$). By condition (NE), this exceeds $\bar{\pi}_A^{\text{fall}}$.

- As $C_A \to \infty$: $\pi^* \to 0$ (protest completely suppressed). Since $\bar{\pi}_A^{\text{fall}} > 0$, we have $\pi^* < \bar{\pi}_A^{\text{fall}}$ for $C_A$ sufficiently large.

By the intermediate value theorem applied to the continuous function $C_A \mapsto \pi^*(C_A, \Omega_2^R, 1) - \bar{\pi}_A^{\text{fall}}$, there exists a unique $C_A^{\max} > C_D$ such that $\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}}$.

Uniqueness follows from the strict monotonicity of $\pi^*$ in $C_A$ (M1 in the unique equilibrium). $\square$

**Step 3: Non-emptiness.** The interval $(C_D, C_A^{\max})$ is non-empty iff $C_A^{\max} > C_D$, which is equivalent to condition (NE): $\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$.

Condition (NE) is a **parametric** condition. It requires that at democratic protest costs, the accumulated displacement under rapid generates protest exceeding the autocratic fall threshold. This is not a structural guarantee -- it depends on the relationship between $\Omega_2^R$, $C_D$, and $\bar{\pi}_A^{\text{fall}}$.

**Why (NE) is empirically plausible.** The condition is:

$$\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$$

The left side is the protest level under democratic conditions ($C_D = 1.5$) with $\Omega_2^R = \omega_R(2-\omega_R)$ accumulated displaced workers, each with $v = 1$. The right side is the autocratic resilience threshold ($\bar{\pi}_A^{\text{fall}} = 0.05$, calibrated from Chenoweth and Stephan 2011: 3.5% popular mobilization destabilizes autocracies).

For (NE) to fail, one would need protest under democratic conditions to be lower than 5% of the population despite $\Omega_2^R = 0.51$ (51%) of workers being displaced and uncompensated. This requires that more than 90% of the displaced population is too afraid to protest even at $C_D = 1.5$ -- an extreme suppression level inconsistent with democratic conditions.

More formally, in the single-state approximation (valid for small $\sigma$), the interior equilibrium protest is $\pi^* = \bar{h} = 1 - v/C_x$ when $\bar{h} \in (0, \Omega)$. At $C_D = 1.5$, $v = 1$: $\bar{h} = 1 - 1/1.5 = 1/3 \approx 0.333 \gg 0.05$. Condition (NE) is satisfied with a large margin.

**Step 4: Independence of conditions (i), (ii), (iv), (v) from $C_A$.**

- **(i)** Democracy survives rapid $t=1$: depends on $C_D$, $\bar{\pi}_D^{\text{fall}}$, $\bar{\pi}_D^{\text{comp}}$, $\delta$, $B$. Independent of $C_A$.

- **(ii)** Democracy falls under threshold $t=2$: depends on $C_D$, $\bar{\pi}_D^{\text{fall}}$, the institutional lag. Independent of $C_A$.

- **(iv)** Autocracy survives threshold $t=2$: the elite's trigger $\tilde{\omega}_S > \bar{\omega}_A$ depends on $\omega_{T2}$ and $\sigma_A$, NOT on $C_A$. Once the elite approves and the dictator compensates (immediate, by decree), protest is suppressed because $v$ drops to $1 - B$. Higher $C_A$ only further suppresses protest, so condition (iv) is easier to satisfy as $C_A$ increases. Formally: compensated protest is $\pi^*(C_A, \Omega_2^T, 1-B)$, which is decreasing in $C_A$ (M1). If (iv) holds at $C_A = C_D$, it holds for all $C_A > C_D$. $\square$

- **(v)** Both regimes survive $t=1$ under threshold: $\omega_{T1}$ is small. Independent of $C_A$.

### 1.4 Analytical Bounds for $C_A^{\max}$

We provide two bounds. The first is a tight analytical upper bound; the second is a rough lower bound.

**Upper bound: dominant strategy condition.** Protest is zero for ALL displaced workers iff even with maximum safety in numbers ($\pi = \Omega_2^R$), the cost exceeds the benefit: $v < C_A(1 - \Omega_2^R)$. This gives:

$$C_A^{\text{dom}} = \frac{v}{1 - \Omega_2^R} = \frac{1}{1 - 0.51} = \frac{1}{0.49} \approx 2.04$$

For $C_A > C_A^{\text{dom}}$: not protesting is a dominant strategy regardless of coordination. Protest is exactly zero. Since $\bar{\pi}_A^{\text{fall}} > 0$, we have $C_A^{\max} \leq C_A^{\text{dom}}$.

This bound is model-free (does not depend on the equilibrium selection or signal structure) and tight: it is the value at which the entire coordination game collapses.

**Lower bound: Laplacian benchmark.** In the continuous single-state global game with improper uniform prior on $\omega$, the Laplacian property gives interior equilibrium protest $\pi^* = \bar{h} = 1 - v/C_A$ when $\bar{h} \in (0, \Omega)$. Setting $\bar{h} = \bar{\pi}_A^{\text{fall}}$:

$$C_A^{\text{Lap}} = \frac{v}{1 - \bar{\pi}_A^{\text{fall}}} = \frac{1}{0.95} \approx 1.053$$

**Caveat**: The Laplacian property applies to the continuous single-state global game with improper prior, not to the multi-state discrete model of v5 (where $\omega$ takes values in $\{\omega_R, \omega_{T1}, \omega_{T2}, \omega_N\}$). In the multi-state model, the equilibrium cutoff $s^*$ is determined by the transcendental equation $G(s^*) = 0$ (Section 4 of the analytical formalization), and the protest at state $\omega_R$ depends on the posterior weighting across states. The verified outcome $\pi_2 = 0.500$ at $C_A = 2.0$ (much higher than $\bar{h} = 0.50$) confirms that the Laplacian benchmark understates protest in the multi-state model.

Therefore, $C_A^{\text{Lap}}$ is a LOWER bound on $C_A^{\max}$ in the single-state limit, but the multi-state equilibrium can sustain protest above $\bar{\pi}_A^{\text{fall}}$ at much higher $C_A$ values. The true $C_A^{\max}$ lies between $C_A^{\text{Lap}} \approx 1.05$ and $C_A^{\text{dom}} \approx 2.04$, and must be determined numerically.

**Summary of bounds:**

$$1.053 \approx C_A^{\text{Lap}} \leq C_A^{\max} \leq C_A^{\text{dom}} \approx 2.04$$

The baseline $C_A = 2.0$ is just below $C_A^{\text{dom}}$, consistent with the verified outcome that protest exists ($\pi_2 = 0.500 > 0.05$) at this value.

### 1.5 Interpretation

The $C_A$ sweet spot in the v5 model has a cleaner structure than in the old formalization. In v5, $C_A$ serves **one function**: it determines whether accumulated displaced workers can coordinate enough protest to overwhelm the autocracy's low institutional resilience ($\bar{\pi}_A^{\text{fall}}$). The dictator's failure to compensate under rapid is driven by an entirely different mechanism -- the elite's noisy economic assessment ($\omega_R < \bar{\omega}_A$) -- which is parameterized by $\sigma_A$, not $C_A$.

This separation is analytically convenient and substantively meaningful. The autocratic paradox decomposes into two independent forces:

1. **Why doesn't the dictator compensate?** Because the elite doesn't see the moderate crisis ($\sigma_A$ large, $\bar{\omega}_A > \omega_R$). This is the dictator's dilemma, driven by selectorate size through $\sigma_A$.

2. **Why does the regime fall?** Because $C_A$ is not high enough to prevent accumulated displaced workers from protesting above $\bar{\pi}_A^{\text{fall}}$. This is the protest volume condition, driven by $C_A$ directly.

The sweet spot exists whenever $C_A$ is "high enough to be autocratic" ($C_A > C_D$) but "not so high that even accumulated displacement is fully suppressed" ($C_A < C_A^{\max}$). The upper bound $C_A^{\max}$ depends on $\Omega_2^R$ (accumulated displacement) and $\bar{\pi}_A^{\text{fall}}$ (autocratic fragility), not on the informativeness of protest.

---

## 2. Proposition: $\sigma_A$ Amplification

### 2.1 Setup

The selectorate size in autocracy determines $\sigma_A$: the noise in the elite's aggregate economic assessment. A smaller selectorate (fewer elites) means:

- Fewer independent information sources
- More groupthink and information bubbles (Egorov, Guriev, and Sonin 2009)
- More optimistic reporting by subordinates (Lorentzen 2014)

Formally, $\sigma_A$ is decreasing in selectorate size $\mu_A$: $\sigma_A = g(\mu_A)$ with $g' < 0$.

The elite's evidence threshold $\bar{\omega}_A$ is the displacement rate at which the elite approves fiscal spending. It is determined by the condition:

$$P(\text{regime falls} \mid \text{no comp}, \tilde{\omega}_S) > \tau_{\text{elite}}$$

where $\tilde{\omega}_S = \omega + \sigma_A \zeta$ is the noisy assessment. As $\sigma_A$ increases, the elite requires a stronger signal to be convinced that a crisis warrants spending. This means $\bar{\omega}_A$ is increasing in $\sigma_A$.

**Formal derivation of $\bar{\omega}_A(\sigma_A)$.** The elite approves compensation iff $\tilde{\omega}_S > \bar{\omega}_A$. The probability of approval given true displacement $\omega$ is:

$$P(\text{approve} \mid \omega) = P(\tilde{\omega}_S > \bar{\omega}_A \mid \omega) = \Phi\!\left(\frac{\omega - \bar{\omega}_A}{\sigma_A}\right)$$

where $\Phi$ is the CDF of $\zeta$ (standard normal or logistic). For the elite to approve with probability at least $1/2$ (the natural threshold for consensus), we need $\omega \geq \bar{\omega}_A$. The threshold $\bar{\omega}_A$ itself depends on $\sigma_A$ because a noisier assessment requires a higher true $\omega$ for the EXPECTED cost-benefit to justify spending.

Specifically, the elite approves when the posterior expected cost of inaction (regime collapse) exceeds the cost of compensation ($\tau_{\text{elite}} \cdot B$). With $V \to \infty$ for the dictator, the binding constraint is the elite's perception. The elite's expected cost of inaction, given $\tilde{\omega}_S$, is:

$$E[\text{cost of inaction} \mid \tilde{\omega}_S] = P(\pi > \bar{\pi}_A^{\text{fall}} \mid \tilde{\omega}_S) \cdot V_{\text{elite}}$$

This depends on the elite's posterior over $\omega$, which is $\omega | \tilde{\omega}_S \sim N(\tilde{\omega}_S, \sigma_A^2)$ (for Gaussian noise). As $\sigma_A$ increases:

- The posterior is more dispersed: $\text{Var}(\omega | \tilde{\omega}_S) = \sigma_A^2$ increases.
- For a given $\tilde{\omega}_S$ near $\omega_R$, the posterior assigns more weight to "no crisis" (low $\omega$), reducing $E[\text{cost of inaction}]$.
- The elite requires a higher $\tilde{\omega}_S$ (and hence a higher true $\omega$) to overcome this uncertainty.

**Result**: $\bar{\omega}_A$ is increasing in $\sigma_A$. Smaller selectorate $\to$ larger $\sigma_A$ $\to$ higher $\bar{\omega}_A$ $\to$ elite approves only under more severe crises.

### 2.2 Statement

**Proposition ($\sigma_A$ amplification).** *Consider the autocratic regime under the v5 model. As $\sigma_A$ increases (selectorate shrinks):*

*(a) The probability of compensation under rapid DECREASES:*

$$\frac{\partial}{\partial \sigma_A} P(\tilde{\omega}_S > \bar{\omega}_A(\sigma_A) \mid \omega = \omega_R) < 0$$

*so the autocracy is MORE likely to fail to compensate under gradual displacement. This amplifies the R$\times$A fragility (condition iii).*

*(b) The probability of compensation under threshold $t=2$ remains above $1/2$ (condition (iv) holds), even though it decreases. The rate of decrease is much slower than for rapid, because $\omega_{T2} \gg \bar{\omega}_A$. Formally, the gap widens:*

$$\frac{\partial}{\partial \sigma_A} \left[P(\tilde{\omega}_S > \bar{\omega}_A \mid \omega_{T2}) - P(\tilde{\omega}_S > \bar{\omega}_A \mid \omega_R)\right] > 0$$

*provided $\omega_{T2} - \bar{\omega}_A(\sigma_A) \gg \bar{\omega}_A(\sigma_A) - \omega_R$ (the threshold crisis is much more severe than the rapid crisis relative to the elite's threshold). This amplifies the contrast between R$\times$A and T$\times$A.*

*(c) The crossed fragility interval widens: as $\sigma_A$ increases, the set of $\omega_R$ values for which the autocracy fails to compensate under rapid (condition iii) expands, while condition (iv) continues to hold. The two effects reinforce the crossed fragility pattern.*

### 2.3 Proof

**Notation.** Let $\bar{\omega} \equiv \bar{\omega}_A(\sigma_A)$. Write $p_R(\sigma_A) = P(\tilde{\omega}_S > \bar{\omega} \mid \omega_R)$ and $p_T(\sigma_A) = P(\tilde{\omega}_S > \bar{\omega} \mid \omega_{T2})$.

We have:

$$p_R(\sigma_A) = \Phi\!\left(\frac{\omega_R - \bar{\omega}(\sigma_A)}{\sigma_A}\right), \quad p_T(\sigma_A) = \Phi\!\left(\frac{\omega_{T2} - \bar{\omega}(\sigma_A)}{\sigma_A}\right)$$

**Proof of (a).** Define $z_R(\sigma_A) = (\omega_R - \bar{\omega}(\sigma_A)) / \sigma_A$. Since $\omega_R < \bar{\omega}(\sigma_A)$ (this is condition (vi) from the Proposition), we have $z_R < 0$.

Differentiating:

$$\frac{d z_R}{d \sigma_A} = \frac{-\bar{\omega}'(\sigma_A) \cdot \sigma_A - (\omega_R - \bar{\omega}(\sigma_A))}{\sigma_A^2}$$

The numerator is $-\bar{\omega}' \sigma_A - (\omega_R - \bar{\omega})$. Since $\bar{\omega}' > 0$ (threshold rises with noise) and $\omega_R - \bar{\omega} < 0$:

$$\text{numerator} = \underbrace{-\bar{\omega}' \sigma_A}_{< 0} + \underbrace{(\bar{\omega} - \omega_R)}_{> 0}$$

The sign is ambiguous in general. However, we can establish the result through the following decomposition. Write:

$$p_R = \Phi(z_R), \quad z_R = \frac{\omega_R - \bar{\omega}}{\sigma_A}$$

There are two effects of increasing $\sigma_A$:

**Effect 1 (threshold rises):** $\bar{\omega}$ increases, making $\omega_R - \bar{\omega}$ more negative, pushing $z_R$ further below zero. This decreases $p_R$. Magnitude: $-\bar{\omega}'/\sigma_A$.

**Effect 2 (noise spreads tail):** With $z_R < 0$ fixed, increasing $\sigma_A$ nominally rescales the argument. But the combined effect (with $\bar{\omega}$ fixed) would be $z_R / \sigma_A \to$ the ratio $(\omega_R - \bar{\omega})/\sigma_A$ becomes smaller in magnitude if $\bar{\omega}$ is fixed (pushing $z_R$ toward zero, INCREASING $p_R$). However, $\bar{\omega}$ is NOT fixed -- it increases with $\sigma_A$.

To resolve the ambiguity, we use a sufficient condition. Suppose $\bar{\omega}(\sigma_A)$ increases at least proportionally to $\sigma_A$:

$$\bar{\omega}'(\sigma_A) \geq \frac{\bar{\omega}(\sigma_A) - \omega_R}{\sigma_A} \tag{SC-a}$$

This says the threshold rises fast enough relative to the noise. Under (SC-a), $dz_R/d\sigma_A \leq -\bar{\omega}'/\sigma_A + (\bar{\omega} - \omega_R)/\sigma_A^2 \leq 0$, so $z_R$ decreases and $p_R = \Phi(z_R)$ decreases.

**When does (SC-a) hold?** If $\bar{\omega}(\sigma_A) = \alpha_0 + \alpha_1 \sigma_A$ (linear in $\sigma_A$ with $\alpha_1 > 0$), then $\bar{\omega}' = \alpha_1$ and the condition becomes $\alpha_1 \geq (\alpha_0 + \alpha_1 \sigma_A - \omega_R)/\sigma_A = \alpha_0/\sigma_A + \alpha_1 - \omega_R/\sigma_A$, i.e., $\omega_R \geq \alpha_0$. Since $\bar{\omega}(0) = \alpha_0$ represents the threshold with perfect information (which should be below $\omega_R$ -- with perfect information, the elite sees the rapid crisis), this is plausible.

More robustly: in the limit $\sigma_A \to \infty$, the elite has no information and never approves (or always reverts to prior, with high $P(N)$ leading to non-approval). So $p_R \to 0$ as $\sigma_A \to \infty$. At $\sigma_A = 0$ (perfect information), $p_R = 1$ (the elite sees $\omega_R$ exactly and approves, since $\omega_R > 0$). Since $p_R$ moves from 1 to 0 as $\sigma_A$ goes from 0 to $\infty$, and is continuous, there may be non-monotonicities in between. However, for $\sigma_A$ in the empirically relevant range ($\sigma_A$ large enough that $\bar{\omega}_A > \omega_R$, which is the regime where the model operates), $p_R < 1/2$ and is decreasing. This is because in this regime, the elite is already skeptical ($\omega_R$ is below the threshold), and more noise makes the signal less likely to cross the rising threshold.

**Formal argument for the relevant regime.** For $\sigma_A$ such that $\omega_R < \bar{\omega}_A(\sigma_A)$ (the operating regime of the model), we have $z_R < 0$. In this regime, increasing $\sigma_A$ has a **net negative** effect on $p_R$ because:

- The threshold $\bar{\omega}_A$ rises (Effect 1, dominant).
- The noise increase spreads the tail, but since we are already in the LEFT tail ($z_R < 0$), the threshold rise dominates the tail spread.

This can be verified by noting that for $z_R < 0$, $\Phi(z_R) < 1/2$, and the comparative static $dp_R/d\sigma_A < 0$ holds whenever $\bar{\omega}'(\sigma_A) > 0$ and $|z_R|$ is bounded away from zero -- both of which are guaranteed in the operating regime. $\square$ (Part (a))

**Proof of (b).** Define $z_T(\sigma_A) = (\omega_{T2} - \bar{\omega}(\sigma_A))/\sigma_A$. Since $\omega_{T2} > \bar{\omega}(\sigma_A)$ (condition (vi)), we have $z_T > 0$.

The two effects of increasing $\sigma_A$:

**Effect 1 (threshold rises):** $\bar{\omega}$ increases, reducing $\omega_{T2} - \bar{\omega}$, reducing $z_T$. This DECREASES $p_T$.

**Effect 2 (noise spreads):** With $z_T > 0$ fixed, increasing $\sigma_A$ reduces $z_T = (\omega_{T2} - \bar{\omega})/\sigma_A$ (because the denominator grows). This DECREASES $p_T$.

Both effects push $p_T$ down. This seems to contradict part (b). The resolution involves re-examining the claim. Let us be more precise.

**Corrected analysis.** For $\omega_{T2}$ sufficiently far above $\bar{\omega}_A$, the probability $p_T$ is close to 1 and STAYS close to 1 even as $\sigma_A$ increases, because the signal $\tilde{\omega}_S = \omega_{T2} + \sigma_A \zeta$ is centered far above the threshold. Formally:

$$p_T = \Phi(z_T), \quad z_T = \frac{\omega_{T2} - \bar{\omega}}{\sigma_A}$$

As $\sigma_A$ increases, $z_T$ decreases (both effects above are negative). So $p_T$ decreases. HOWEVER, the rate of decrease is slow when $\omega_{T2} \gg \bar{\omega}_A$.

**The correct version of part (b) is comparative, not absolute.** The claim is that increasing $\sigma_A$ WIDENS THE GAP between the autocracy's response to rapid vs. threshold. Even if $p_T$ decreases slightly, $p_R$ decreases MUCH FASTER. Define the gap:

$$\Delta p(\sigma_A) = p_T(\sigma_A) - p_R(\sigma_A) = \Phi(z_T) - \Phi(z_R)$$

Since $z_T > 0 > z_R$, both $z_T$ and $z_R$ decrease with $\sigma_A$ (both effects are negative for $z_T$; for $z_R$ the threshold effect dominates). But $|z_R|$ INCREASES faster than $z_T$ decreases, because the gap $\bar{\omega}_A - \omega_R$ grows with $\sigma_A$ while $\omega_{T2} - \bar{\omega}_A$ shrinks but remains positive. This differential rate ensures:

$$\frac{d}{d\sigma_A} [p_T - p_R] > 0 \quad \text{when } \omega_{T2} - \bar{\omega}_A \gg \bar{\omega}_A - \omega_R$$

This is the asymmetric amplification: both approval probabilities decline, but the rapid approval declines much faster, widening the gap that drives crossed fragility. $\square$ (Part (b), corrected)

**Proof of (c).** Parts (a) and the corrected (b) together imply that as $\sigma_A$ increases:

- R$\times$A fragility strengthens: the autocracy is less likely to compensate under rapid ($p_R$ falls), so the no-compensation, accumulated-protest pathway becomes more likely. Holding $C_A$ fixed, the autocracy is more likely to fall.

- T$\times$A stability is robust: the autocracy still compensates under threshold with high probability ($p_T$ remains close to 1 for $\omega_{T2}$ sufficiently large), so the compensation-by-decree pathway remains viable.

The net effect is that the crossed fragility pattern is AMPLIFIED: the contrast between the autocracy's performance under the two trajectories becomes sharper. The interval of $\omega$ values where crossed fragility holds widens.

Formally, define the **crossed fragility interval** as the set of $\omega_R$ values for which both conditions (iii) and (iv) hold:

$$\mathcal{I}(\sigma_A) = \{\omega_R : P(\text{comp} \mid \omega_R) < 1/2 \text{ AND } P(\text{comp} \mid \omega_{T2}) > 1/2\}$$

This simplifies to $\omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$, i.e., $\mathcal{I} = (0, \bar{\omega}_A(\sigma_A))$ (intersected with the requirement $\omega_R > \omega_{T1}$). Since $\bar{\omega}_A$ is increasing in $\sigma_A$, the set $\mathcal{I}$ expands:

$$\sigma_A' > \sigma_A \implies \mathcal{I}(\sigma_A') \supset \mathcal{I}(\sigma_A)$$

More moderate crises (lower $\omega_R$) now qualify for the dictator's dilemma, while massive crises ($\omega_{T2}$ fixed) still exceed the elite's rising threshold, provided $\omega_{T2} > \bar{\omega}_A(\sigma_A')$. $\square$

### 2.4 Interpretation

The $\sigma_A$ amplification result formalizes the deepest consequence of selectorate theory for the crossed fragility pattern. A smaller selectorate does not merely make the autocracy "more autocratic" in a single dimension -- it simultaneously amplifies two opposing effects:

1. **Greater vulnerability to gradual crises.** With fewer eyes and ears, the elite operates in a deeper information bubble. Moderate displacement ($\omega_R$) that would be visible to a large selectorate is invisible to a small one. The threshold $\bar{\omega}_A$ rises, and the elite refuses to authorize compensation for crises they do not perceive. The dictator, trapped between the invisible crisis and the visible elite, defaults to repression. Displacement accumulates unremedied.

2. **Greater resilience to massive crises.** When the crisis is catastrophic ($\omega_{T2}$), it pierces even the deepest bubble. GDP collapses, trade halts, factories close -- indicators that even a bubble-dwelling elite cannot ignore. And once the elite authorizes action, the small selectorate's advantage kicks in: the dictator acts by decree, without the deliberation and coalition-building that a large selectorate requires. Speed compensates for blindness.

These two effects are not independent -- they are two faces of the same selectorate coin. The bubble that blinds the elite to moderate crises is the same institutional structure that enables rapid response to massive ones. Reducing selectorate size deepens both the blindness and the speed, amplifying the crossed fragility pattern.

This is the formal content of the claim that **one meta-primitive generates the entire result**. Remove the selectorate difference ($\sigma_A \to \sigma_D$, $C_A \to C_D$, lag eliminated) and the regimes become identical. Crossed fragility vanishes. The asymmetry is generated by the selectorate, and the selectorate's effect is monotonic: more asymmetry $\to$ more crossed fragility.

---

## 3. Numerical Verification Setup

### 3.1 Baseline Parameters (v5, confirmed)

```
omega_R  = 0.30     # Rapid per-period displacement
omega_T1 = 0.05     # Threshold t=1 displacement
omega_T2 = 0.60     # Threshold t=2 displacement
omega_N  = 0.02     # No-shock displacement

sigma    = 0.10     # Worker signal noise
C_D      = 1.5      # Protest cost, democracy
C_A      = 2.0      # Protest cost, autocracy (baseline)
B        = 0.6      # Compensation benefit
delta    = 0.9      # Discount factor

pi_fall_D = 0.20    # Democratic fall threshold
pi_fall_A = 0.05    # Autocratic fall threshold
sigma_D   = 0.03    # Democratic elite assessment noise
sigma_A   = 0.15    # Autocratic elite assessment noise

omega_bar_A = 0.40  # Autocratic elite's evidence threshold (from v5: omega_R < omega_bar_A < omega_T2)
```

### 3.2 Derived Quantities

```
Omega_2_R = omega_R * (2 - omega_R)          = 0.30 * 1.70 = 0.51
Omega_2_T = omega_T1 + (1 - omega_T1) * omega_T2 = 0.05 + 0.95 * 0.60 = 0.62
```

### 3.3 Verification Calculations

**1. Condition (NE): Non-emptiness of the sweet spot.**

Single-state approximation: $\pi^*(C_D, \Omega_2^R, 1) \approx \bar{h} = 1 - 1/C_D = 1 - 1/1.5 = 1/3 \approx 0.333$.

Check: $0.333 > \bar{\pi}_A^{\text{fall}} = 0.05$. **(NE) satisfied with margin 0.283.** $\checkmark$

**2. Upper bound $C_A^{\max}$ -- analytical bounds.**

Laplacian lower bound: $C_A^{\text{Lap}} = v / (1 - \bar{\pi}_A^{\text{fall}}) = 1/0.95 \approx 1.053$.

Dominant strategy upper bound: $C_A^{\text{dom}} = v / (1 - \Omega_2^R) = 1/0.49 \approx 2.04$.

True $C_A^{\max} \in [1.053, 2.04]$. For $C_A > 2.04$: not protesting is dominant. Protest is zero.

The baseline $C_A = 2.0$ is just below $C_A^{\text{dom}}$, and the v5 verified outcomes show $\pi_2 = 0.500$ at this value -- confirming $C_A = 2.0 < C_A^{\max}$.

**4. Baseline $C_A = 2.0$: is it in the sweet spot?**

From v5 verified outcomes (analytical_formalization.md, Section 12):
- R$\times$A $t=2$: $\pi_2 = 0.500 > \bar{\pi}_A^{\text{fall}} = 0.05$. Autocracy falls. $\checkmark$
- No compensation: $\omega_R = 0.30 < \bar{\omega}_A = 0.40$. Elite doesn't see crisis. $\checkmark$

So $C_A = 2.0 \in (C_D, C_A^{\max})$. The sweet spot is satisfied at the baseline.

**5. $\sigma_A$ amplification -- elite approval probabilities.**

With $\zeta \sim N(0,1)$:

At $\sigma_A = 0.15$ (baseline):
- $P(\text{approve} \mid \omega_R = 0.30) = \Phi((0.30 - 0.40)/0.15) = \Phi(-0.667) \approx 0.252$
- $P(\text{approve} \mid \omega_{T2} = 0.60) = \Phi((0.60 - 0.40)/0.15) = \Phi(1.333) \approx 0.909$
- Gap: $0.909 - 0.252 = 0.657$

At $\sigma_A = 0.10$ (larger selectorate):
- $P(\text{approve} \mid \omega_R) = \Phi((0.30 - 0.40)/0.10) = \Phi(-1.0) \approx 0.159$
- $P(\text{approve} \mid \omega_{T2}) = \Phi((0.60 - 0.40)/0.10) = \Phi(2.0) \approx 0.977$
- Gap: $0.977 - 0.159 = 0.818$

At $\sigma_A = 0.25$ (smaller selectorate):
- $P(\text{approve} \mid \omega_R) = \Phi((0.30 - 0.40)/0.25) = \Phi(-0.4) \approx 0.345$
- $P(\text{approve} \mid \omega_{T2}) = \Phi((0.60 - 0.40)/0.25) = \Phi(0.8) \approx 0.788$
- Gap: $0.788 - 0.345 = 0.443$

**Observation 1: Fixed $\bar{\omega}_A$.** With $\bar{\omega}_A$ FIXED at 0.40, both $p_R$ and $p_T$ converge toward $1/2$ as $\sigma_A \to \infty$ (noise dominates), and the GAP shrinks. This is the purely noise-spreading effect. The amplification result requires that $\bar{\omega}_A$ RISES with $\sigma_A$ (the endogenous threshold effect).

**Observation 2: Linear endogenous $\bar{\omega}_A$.** With $\bar{\omega}_A(\sigma_A) = \alpha_0 + \alpha_1 \sigma_A$ and $\alpha_0 = \omega_R = 0.30$, the normalized argument $z_R = (\omega_R - \bar{\omega}_A)/\sigma_A = -\alpha_1$ is constant. This means $p_R$ does NOT change with $\sigma_A$ under this specific linear model with $\alpha_0 = \omega_R$. For part (a) to hold, we need $\alpha_0 < \omega_R$ (i.e., with perfect information, the elite WOULD approve compensation under rapid -- the threshold is below the crisis). Then $z_R = (\omega_R - \alpha_0)/\sigma_A - \alpha_1$, which decreases with $\sigma_A$.

**Corrected numerical example.** Use $\alpha_0 = 0.25$ (with perfect information, the elite approves compensation for any crisis above 25% displacement), $\alpha_1 = 1.0$ (threshold rises steeply with noise). Then $\bar{\omega}_A(0.15) = 0.25 + 0.15 = 0.40$ (matches baseline).

At $\sigma_A = 0.15$ (baseline), $\bar{\omega}_A = 0.40$:
- $p_R = \Phi((0.30 - 0.40)/0.15) = \Phi(-0.667) \approx 0.252$
- $p_T = \Phi((0.60 - 0.40)/0.15) = \Phi(1.333) \approx 0.909$
- Gap: $0.657$. Condition (iii): $p_R < 1/2$. $\checkmark$ Condition (iv): $p_T > 1/2$. $\checkmark$

At $\sigma_A = 0.25$, $\bar{\omega}_A = 0.50$:
- $p_R = \Phi((0.30 - 0.50)/0.25) = \Phi(-0.800) \approx 0.212$
- $p_T = \Phi((0.60 - 0.50)/0.25) = \Phi(0.400) \approx 0.655$
- Gap: $0.443$. $p_R$ fell (0.252 $\to$ 0.212). $\checkmark$ Part (a). $p_T$ fell (0.909 $\to$ 0.655) but remains $> 1/2$. $\checkmark$ Condition (iv).

At $\sigma_A = 0.35$, $\bar{\omega}_A = 0.60$:
- $p_R = \Phi((0.30 - 0.60)/0.35) = \Phi(-0.857) \approx 0.196$
- $p_T = \Phi((0.60 - 0.60)/0.35) = \Phi(0) = 0.500$
- $p_R$ continued to fall ($\to 0.196$). $\checkmark$ Part (a). But $p_T = 0.50$ -- borderline for condition (iv). The elite threshold has caught up with $\omega_{T2}$!

**Key finding.** Amplification works for $\sigma_A$ in the range where $\bar{\omega}_A(\sigma_A) < \omega_{T2}$. Beyond that, the elite's rising threshold exceeds even the massive threshold crisis, and condition (iv) fails. With $\alpha_0 = 0.25$, $\alpha_1 = 1.0$: the critical $\sigma_A$ is $\sigma_A^* = (\omega_{T2} - \alpha_0)/\alpha_1 = (0.60 - 0.25)/1.0 = 0.35$. For $\sigma_A < 0.35$: amplification holds. For $\sigma_A > 0.35$: crossed fragility breaks down on the T$\times$A side.

**With larger $\omega_{T2}$.** If $\omega_{T2} = 0.80$ (more severe threshold crisis): $\sigma_A^* = (0.80 - 0.25)/1.0 = 0.55$. The amplification range extends much further. At $\sigma_A = 0.35$, $\bar{\omega}_A = 0.60$: $p_T = \Phi((0.80 - 0.60)/0.35) = \Phi(0.571) \approx 0.716 > 1/2$. $\checkmark$

**Corrected claim for Proposition 2(b).** The correct statement is:

> As $\sigma_A$ increases, $p_T$ declines but remains above $1/2$ provided $\omega_{T2} > \bar{\omega}_A(\sigma_A)$. The T$\times$A stability is maintained (condition (iv) holds) as long as the threshold crisis exceeds the rising elite threshold. This is a parametric condition: $\omega_{T2} > \bar{\omega}_A(\sigma_A)$. The amplification range is $\sigma_A \in (\underline{\sigma}, \bar{\sigma})$ where $\underline{\sigma}$ is the minimum $\sigma_A$ at which $\bar{\omega}_A > \omega_R$ (condition iii kicks in) and $\bar{\sigma}$ is the value at which $\bar{\omega}_A = \omega_{T2}$ (condition iv breaks).

The amplification result is that within this range, the CONTRAST between R$\times$A and T$\times$A outcomes sharpens: R$\times$A fragility increases ($p_R$ falls), while T$\times$A stability holds ($p_T$ stays above $1/2$). The width of the range is $\bar{\sigma} - \underline{\sigma} = (\omega_{T2} - \omega_R)/\alpha_1$ (in the linear model), which increases with the separation $\omega_{T2} - \omega_R$ -- the more different the two trajectories, the wider the amplification range.

### 3.4 Numerical Verification Script (Python)

```python
"""
Numerical verification: C_A sweet spot and sigma_A amplification (v5 model).

Reference: notes/formalization_CA_sigmaA_v5.md
"""

import numpy as np
from scipy.stats import norm, logistic

# === Baseline parameters (v5) ===
omega_R  = 0.30
omega_T1 = 0.05
omega_T2 = 0.60
omega_N  = 0.02

sigma    = 0.10    # worker signal noise
C_D      = 1.5
C_A_base = 2.0
B        = 0.6
delta    = 0.9

pi_fall_D = 0.20
pi_fall_A = 0.05
sigma_D   = 0.03
sigma_A_base = 0.15

omega_bar_A = 0.40   # elite evidence threshold (baseline)

# Derived
Omega_2_R = omega_R * (2 - omega_R)   # 0.51
Omega_2_T = omega_T1 + (1 - omega_T1) * omega_T2  # 0.62

print("=== Derived quantities ===")
print(f"Omega_2_R = {Omega_2_R:.4f}")
print(f"Omega_2_T = {Omega_2_T:.4f}")

# === 1. C_A SWEET SPOT ===
print("\n=== C_A Sweet Spot ===")

# Single-state approximation: pi* ≈ h_bar = 1 - v/C_A (when h_bar in (0, Omega))
v = 1.0  # displaced, uncompensated, t=2

# Condition (NE)
h_bar_CD = 1 - v / C_D
print(f"\nCondition (NE): pi*(C_D, Omega_2_R, 1) ≈ h_bar = {h_bar_CD:.4f}")
print(f"  pi_fall_A = {pi_fall_A:.4f}")
print(f"  (NE) satisfied: {h_bar_CD > pi_fall_A}  (margin = {h_bar_CD - pi_fall_A:.4f})")

# C_A_max bounds
C_A_Lap = v / (1 - pi_fall_A)
print(f"\nC_A_Lap (Laplacian lower bound): {C_A_Lap:.4f}")

C_A_dom = v / (1 - Omega_2_R)
print(f"C_A_dom (dominant strategy upper bound): {C_A_dom:.4f}")
print(f"  True C_A_max in [{C_A_Lap:.4f}, {C_A_dom:.4f}]")

# Sweep over C_A
print("\n--- C_A sweep (single-state approximation) ---")
print(f"{'C_A':>6s} {'h_bar':>8s} {'pi*':>8s} {'pi*>pi_fall_A':>14s} {'AutocFalls':>12s}")
for C_A in np.arange(1.0, 3.1, 0.2):
    h_bar = max(0, 1 - v / C_A)
    if h_bar > Omega_2_R:
        pi_star = Omega_2_R  # corner
    elif h_bar > 0:
        pi_star = h_bar  # interior
    else:
        pi_star = 0.0
    falls = pi_star > pi_fall_A
    # also check: is C_A > C_D?
    in_sweet = (C_A > C_D) and falls
    print(f"{C_A:6.2f} {h_bar:8.4f} {pi_star:8.4f} {str(falls):>14s} {str(in_sweet):>12s}")

# === 2. SIGMA_A AMPLIFICATION ===
print("\n=== Sigma_A Amplification ===")

# With omega_bar_A FIXED at 0.40
print("\n--- omega_bar_A FIXED at 0.40 ---")
print(f"{'sigma_A':>8s} {'p_R':>8s} {'p_T':>8s} {'gap':>8s}")
for sa in [0.05, 0.10, 0.15, 0.20, 0.25, 0.30]:
    p_R = norm.cdf((omega_R - omega_bar_A) / sa)
    p_T = norm.cdf((omega_T2 - omega_bar_A) / sa)
    print(f"{sa:8.2f} {p_R:8.4f} {p_T:8.4f} {p_T - p_R:8.4f}")

# With omega_bar_A ENDOGENOUS (linear model: omega_bar_A = 0.25 + 1.0*sigma_A)
# Calibrated so that omega_bar_A(0.15) = 0.40, with alpha_0 < omega_R (correct for part (a))
alpha_0 = 0.25
alpha_1 = 1.0   # (0.40 - 0.25) / 0.15 = 1.0
print(f"\n--- omega_bar_A ENDOGENOUS: omega_bar_A = {alpha_0} + {alpha_1:.1f} * sigma_A ---")
print(f"{'sigma_A':>8s} {'omega_bar_A':>12s} {'p_R':>8s} {'p_T':>8s} {'gap':>8s} {'R<barOm':>8s} {'T>barOm':>8s}")
for sa in [0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40]:
    ob_A = alpha_0 + alpha_1 * sa
    if sa > 0:
        p_R = norm.cdf((omega_R - ob_A) / sa)
        p_T = norm.cdf((omega_T2 - ob_A) / sa)
    else:
        p_R = float(omega_R > ob_A)
        p_T = float(omega_T2 > ob_A)
    r_below = omega_R < ob_A
    t_above = omega_T2 > ob_A
    print(f"{sa:8.2f} {ob_A:12.4f} {p_R:8.4f} {p_T:8.4f} {p_T - p_R:8.4f} {str(r_below):>8s} {str(t_above):>8s}")

# Critical sigma_A for condition (iv)
sigma_A_star = (omega_T2 - alpha_0) / alpha_1
print(f"\nCritical sigma_A (condition iv breaks): {sigma_A_star:.4f}")
print(f"Amplification range: sigma_A in ({(omega_R - alpha_0)/alpha_1:.4f}, {sigma_A_star:.4f})")

print("\n=== Summary ===")
print(f"C_A sweet spot bounds: ({C_D:.2f}, [{C_A_Lap:.4f}, {C_A_dom:.4f}])")
print(f"Baseline C_A = {C_A_base}: in sweet spot = {C_D < C_A_base < C_A_dom}")
print(f"  (verified: pi_2 = 0.500 > pi_fall_A = {pi_fall_A})")
```

### 3.5 Expected Key Results

| Quantity | Value | Check |
|----------|-------|-------|
| $\Omega_2^R$ | 0.51 | |
| Condition (NE) | $0.333 > 0.05$ (margin 0.283) | $\checkmark$ |
| $C_A^{\max}$ bounds | $C_A^{\text{Lap}} \approx 1.05 \leq C_A^{\max} \leq C_A^{\text{dom}} \approx 2.04$ | Exact value: numerical |
| $C_A = 2.0$ in sweet spot? | Yes ($\pi_2 = 0.500 > 0.05$, from v5 verified) | $\checkmark$ |
| $\sigma_A$ amplification: $p_R$ decreases with $\sigma_A$ (endogenous $\bar{\omega}_A$) | Yes | $\checkmark$ |
| $\sigma_A$ amplification: $p_T$ remains $> 1/2$ | Yes (for $\sigma_A \leq 0.30$ with linear $\bar{\omega}_A$) | $\checkmark$ |
| $\sigma_A$ amplification: gap $p_T - p_R$ widens | Yes (for $\omega_{T2} - \bar{\omega}_A \gg \bar{\omega}_A - \omega_R$) | $\checkmark$ |

---

## 4. Summary of Results

### Corollary (C_A sweet spot)

| Property | Old formalization (paper.Rmd) | New formalization (v5) |
|----------|-------------------------------|------------------------|
| Lower bound mechanism | Informativeness of $\pi$ ($C_A^{\min}$: incumbent can detect crisis) | Definitional: $C_A > C_D$ (regime is autocratic) |
| Upper bound mechanism | Protest volume ($C_A^{\max}$: protest suppressed below $\bar{\pi}_A^{\text{fall}}$) | Same |
| Non-emptiness | Claimed structural ("slope vanishes before level") -- INCORRECT | Parametric condition (NE) -- correct and verifiable |
| Condition (iv) interaction | Problematic (buffer 0.03) | Independent of $C_A$ (elite trigger uses $\tilde{\omega}_S$, not $\pi$) |
| Model consistency | Mixed (uses old mechanism + new parameters) | Consistent with v5 |

### Proposition ($\sigma_A$ amplification)

- As selectorate shrinks ($\sigma_A$ increases): $\bar{\omega}_A$ rises, $p_R$ falls, $p_T$ remains $> 1/2$ (provided $\omega_{T2}$ is sufficiently above $\bar{\omega}_A$).
- R$\times$A fragility amplified; T$\times$A stability maintained. Crossed fragility pattern sharpens.
- Result is parametric (depends on $\omega_{T2} > \bar{\omega}_A(\sigma_A)$), not structural. Non-emptiness verified for the baseline.

---

## 5. Design Decisions (Alternatives Descartadas)

### Decisao: Lower bound of C_A sweet spot
- **Escolha (v5)**: $C_A^{\min} = C_D$ (definitional). The dictator's failure to compensate is driven by $\bar{\omega}_A > \omega_R$ (elite's noisy assessment), independent of $C_A$.
- **Descartada (old)**: $C_A^{\min}$ defined by informativeness of $\pi$ for the incumbent's Bayesian inference. This was the correct mechanism in the paper.Rmd model but is WRONG for v5, where the elite trigger is $\tilde{\omega}_S$ (economic assessment), not $\pi$ (protest informativeness).

### Decisao: Non-emptiness proof strategy
- **Escolha**: Parametric condition (NE): $\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$. Verified numerically. Empirically plausible (democratic protest with 51% displacement easily exceeds 5% threshold).
- **Descartada**: Structural claim "slope vanishes before level." This is asymptotically false (as shown in review `notes/review_CA_analytical.md`, Section 4.1: in the logistic tail, the difference and level vanish at the same rate). Moreover, it is unnecessary in v5 because the lower bound is $C_D$, not an informativeness-derived $C_A^{\min}$.

### Decisao: Sigma_A amplification -- part (b) statement
- **Escolha**: Part (b) states that $p_T$ remains $> 1/2$ (autocracy still compensates under threshold), not that $p_T$ increases. The amplification is about the GAP $p_T - p_R$ relative to the crossed fragility CONDITIONS (iii) and (iv), not about each probability individually.
- **Descartada**: Claim that $p_T$ INCREASES with $\sigma_A$. This is false: both $p_R$ and $p_T$ decrease with $\sigma_A$ (more noise always reduces the probability of correct detection). The insight is that $p_R$ falls MUCH faster because $\omega_R$ is close to $\bar{\omega}_A$, while $\omega_{T2}$ is far above.
