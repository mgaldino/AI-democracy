# Mathematical Review: Analytical Formalization v5 — New Derivations

**Reviewer**: Mathematical reviewer (Claude Opus 4.6, 1M context)
**Date**: 2026-05-01
**Document**: `notes/analytical_formalization.md` (v5)
**Scope**: Sections 2, 6, 7.3, 7.4 — new derivations only

---

## 1. Equilibrium Definition (Section 2)

### Verdict: CONDITIONAL PASS

### 1.1 Is the tuple $(s^*, \text{comp}_t, \varphi_t)$ well-defined?

**Yes, modulo one ambiguity.** The three components are:
- $s^* \in \mathbb{R}$: cutoff signal (scalar)
- $\text{comp}_t \in \{0,1\}$: binary compensation decision
- $\varphi_t \in \{0,1\}$: binary compensation availability

These are well-defined objects. However, the tuple is **period-specific** but the notation does not index it by $t$. This creates ambiguity: in a two-period model, the equilibrium is really a pair of tuples $(s_1^*, \text{comp}_1, \varphi_1)$ and $(s_2^*, \text{comp}_2, \varphi_2)$ linked by backward induction (workers in $t=1$ anticipate the $t=2$ outcome). The document says "equilibrium of the game in period $t$" — this suggests a period-by-period definition, which works for $t=2$ (terminal) but for $t=1$ requires specifying what workers expect about $t=2$. The forward-looking $v$ in condition (i) implicitly encodes this, but it should be stated explicitly.

**Recommendation**: State that the equilibrium concept is a **Bayesian Nash equilibrium of the full two-period game**, solved by backward induction: first solve the $t=2$ equilibrium for each possible $(\theta, \varphi_2)$, then plug $t=2$ outcomes into $t=1$ expected values.

### 1.2 Are the four conditions sufficient for a fixed point?

**Mostly yes, with a gap.** The four conditions are:

**(i) Worker optimization**: $G(s^*) = 0$. This is the standard global-game indifference condition. Well-formulated.

**(ii) Selectorate approval**: This determines $\text{comp}_t$. Well-defined once the selectorate's information and decision rule are specified (Sections 7.3-7.4).

**(iii) Regime speed**: Mechanical mapping from $(\text{comp}_t, x)$ to $\varphi$. Correct.

**(iv) Consistency**: Workers' expectation of $\varphi$ matches actual $\varphi$. This is the fixed-point condition.

**The gap**: Conditions (i)-(iv) are necessary but the document does not verify that a fixed point exists. In principle, the mapping could cycle: workers anticipate comp $\to$ low protest $\to$ selectorate doesn't see crisis $\to$ no comp $\to$ workers' anticipation was wrong. The Remark after condition (iv) argues that this circularity is broken because the selectorate's decision is based on $\tilde{\omega}_S$ (economic assessment), not on $\pi$ (protest). **This is the key structural claim and it is correct for autocracy** (elite observes $\tilde{\omega}_S$ independent of protest). **For democracy, there is a subtlety**: the majority vote depends on $\hat{P}_{it}$ (future displacement probability) and $\hat{\omega}_t$ (tax rate), which depend on workers' posteriors, which depend on signals — NOT on the protest level $\pi_t$. So the democratic selectorate's vote is also independent of the protest outcome. **This breaks the circularity in both regimes.**

However, there remains a more subtle channel: $\varphi$ enters $v$, which enters $\bar{h}$, which enters $G(s^*)$. Workers who expect comp have lower $v$, hence higher $\bar{h}$, hence less protest. The selectorate's decision doesn't depend on protest, but workers' decision depends on the selectorate's anticipated decision. So the fixed point is: there exist at most two candidate equilibria — one with comp (workers anticipate $\varphi = 1$, compute $s^*_{\text{comp}}$, the selectorate approves given $\omega$) and one without comp (workers anticipate $\varphi = 0$, compute $s^*_{\text{no}}$, the selectorate rejects given $\omega$). For each $(\theta, t)$, one checks whether each candidate is self-consistent. **This is a finite check (2 candidates), not a fixed-point theorem.** The document should make this explicit.

### 1.3 Could no consistent equilibrium exist?

**Yes, this is possible and unaddressed.** Consider: workers anticipate comp $\to$ $v$ low $\to$ little protest. But the selectorate approves based on $\omega$, which is exogenous. So the selectorate's approval is deterministic given $\omega$. If the selectorate approves at $\omega$, then the comp equilibrium exists (workers anticipate comp, comp happens). If the selectorate rejects at $\omega$, then the no-comp equilibrium exists (workers anticipate no comp, no comp happens). **Both candidates are self-consistent whenever the selectorate's decision is independent of workers' expectations.** Since the selectorate decides based on $\tilde{\omega}_S$ (autocracy) or individual cost-benefit (democracy), and these do not depend on $\pi$: **exactly one equilibrium exists for each $(\theta, t, x)$** — the one consistent with the selectorate's actual decision at the true $\omega$.

**However**: if the selectorate's decision depends on worker behavior (e.g., in an extension where the democratic vote incorporates protest information), multiple equilibria or non-existence could arise. The current formulation avoids this, which is a strength.

**Final assessment**: The equilibrium definition is sound in the sense that (a) the fixed-point problem reduces to a finite check over {comp, no-comp}, and (b) exactly one candidate is self-consistent given the selectorate's exogenous-to-protest decision rule. But this reasoning should be stated explicitly in the paper, not left implicit.

---

## 2. Lemma 0 Proofs (Section 6)

### Verdict: Part (a) CONDITIONAL PASS, Part (b) FAIL

### 2.1 Part (a): Existence via IVT

**Claim**: $G(s) \to -\bar{h} < 0$ as $s \to +\infty$.

**Check**: As $s \to +\infty$, $(\omega_t(\theta) - s)/\sigma \to -\infty$ for all $\theta$, so $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$. The sum is $\sum_\theta P(\theta | d=1, s) \cdot \Omega_t(\theta) \cdot 0 = 0$. So $G(s) \to 0 - \bar{h} = -\bar{h} < 0$. **CORRECT.**

**Claim**: $G(s) \to \Omega_t(\theta^*) - \bar{h} > 0$ as $s \to -\infty$.

**Check**: As $s \to -\infty$:
- $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$ for all $\theta$. **Correct.**
- The posterior $P(\theta | d=1, s)$: The signal likelihood is $\lambda((s - \omega_t(\theta))/\sigma)/\sigma$. For the logistic distribution, $\lambda(z) = e^z/(1+e^z)^2$. As $s \to -\infty$, $z = (s - \omega)/\sigma \to -\infty$, so $\lambda(z) \approx e^z = e^{(s-\omega)/\sigma}$. The ratio of likelihoods for two states $\theta_1, \theta_2$ is:

$$\frac{\lambda((s-\omega_1)/\sigma)}{\lambda((s-\omega_2)/\sigma)} \approx \frac{e^{(s-\omega_1)/\sigma}}{e^{(s-\omega_2)/\sigma}} = e^{(\omega_2 - \omega_1)/\sigma}$$

Wait — this ratio does NOT depend on $s$ as $s \to -\infty$. Let me redo this more carefully. The logistic density is $\lambda(z) = e^{-z}/(1+e^{-z})^2$. For $z \to -\infty$ (i.e., $s \to -\infty$), $e^{-z} \to +\infty$, so $\lambda(z) \approx e^{-z}/e^{-2z} = e^z$. So:

$$\frac{P(\theta_1 | d=1, s)}{P(\theta_2 | d=1, s)} \propto \frac{\omega_1^{d}(1-\omega_1)^{1-d} \cdot e^{(s-\omega_1)/\sigma}}{\omega_2^{d}(1-\omega_2)^{1-d} \cdot e^{(s-\omega_2)/\sigma}} = \frac{\omega_1^{d}(1-\omega_1)^{1-d}}{\omega_2^{d}(1-\omega_2)^{1-d}} \cdot e^{(\omega_2 - \omega_1)/\sigma}$$

This is a **constant** (independent of $s$). So as $s \to -\infty$, the posterior does NOT concentrate on any single state — it converges to a **fixed mixture** determined by the Bernoulli likelihoods and the logistic tail ratios. The document claims the posterior "concentrates on the state $\theta^*$ with the highest $\omega_t$" and says this happens "because $\lambda((s-\omega)/\sigma) \propto e^{(s-\omega)/\sigma}$ decays slowest for the largest $\omega$." But the ratio of logistic densities at $s \to -\infty$ converges to a constant $e^{(\omega_2 - \omega_1)/\sigma}$, not to infinity.

**CORRECTION**: Let me reconsider. The document writes $\lambda((s-\omega)/\sigma)$ as the signal likelihood. For the logistic PDF $\lambda(z) = e^{-z}/(1+e^{-z})^2$. As $s \to -\infty$, $z = (s-\omega)/\sigma \to -\infty$, and $\lambda(z) \to 0$. The rate of decay is $\lambda(z) \sim e^z = e^{(s-\omega)/\sigma}$ as $z \to -\infty$. So the logistic density for state with $\omega = \omega_1$ decays as $e^{(s-\omega_1)/\sigma}$, and for $\omega_2 > \omega_1$, it decays as $e^{(s-\omega_2)/\sigma}$. The ratio is $e^{(\omega_1-\omega_2)/\sigma}$, which is a constant $< 1$ when $\omega_2 > \omega_1$. So state $\theta_2$ (larger $\omega$) has LOWER density at extreme negative $s$... wait, that can't be right.

Let me be very precise. If $s \to -\infty$, a very low signal, what does that tell us about $\omega$? With $s = \omega + \sigma\varepsilon$, a very negative $s$ is explained by either (a) very negative $\varepsilon$ (any $\omega$) or (b) low $\omega$. Under the logistic distribution, extremely negative $\varepsilon$ values are possible but unlikely. The likelihood of observing $s$ under state $\omega$ is $\frac{1}{\sigma}\lambda\left(\frac{s-\omega}{\sigma}\right)$. For $s \ll \omega$, this means $(s-\omega)/\sigma \ll 0$, and $\lambda(z) \approx e^z$ for $z \ll 0$. So $\lambda((s-\omega)/\sigma) \approx e^{(s-\omega)/\sigma}$. The state with the **smallest** $\omega$ has the **largest** likelihood (because $(s-\omega)/\sigma$ is least negative when $\omega$ is smallest).

**Therefore**: As $s \to -\infty$, the posterior concentrates on the state with the **smallest** $\omega_t$, which is $\theta = N$ (with $\omega_N$). The limit is $G(s) \to \Omega_t(N) \cdot 1 - \bar{h} = \Omega_t(N) - \bar{h}$.

**PROBLEM**: The document claims $G(s) \to \Omega_t(\theta^*) - \bar{h} > 0$ where $\theta^*$ has the highest $\omega_t$. **This is backwards.** The posterior concentrates on the state with the LOWEST $\omega_t$ as $s \to -\infty$.

**But wait** — the posterior also includes the Bernoulli factor $\omega^d(1-\omega)^{1-d}$. For displaced workers ($d=1$), the factor is $\omega_t(\theta)$, which favors higher $\omega$. Let me redo the full calculation:

$$P(\theta | d=1, s) \propto p_\theta \cdot \omega_t(\theta) \cdot \frac{1}{\sigma}\lambda\left(\frac{s - \omega_t(\theta)}{\sigma}\right)$$

As $s \to -\infty$:

$$P(\theta | d=1, s) \propto p_\theta \cdot \omega_t(\theta) \cdot e^{(s - \omega_t(\theta))/\sigma} = p_\theta \cdot \omega_t(\theta) \cdot e^{s/\sigma} \cdot e^{-\omega_t(\theta)/\sigma}$$

The $e^{s/\sigma}$ cancels in the ratio. So:

$$P(\theta | d=1, s) \propto p_\theta \cdot \omega_t(\theta) \cdot e^{-\omega_t(\theta)/\sigma}$$

This is a **constant** (independent of $s$). The function $\omega \cdot e^{-\omega/\sigma}$ is maximized at $\omega = \sigma$ and decreasing for $\omega > \sigma$. With $\sigma = 0.10$ and $\omega_R = 0.30$, $\omega_{T2} = 0.60$: all $\omega > \sigma$, so the smallest $\omega$ (closest to $\sigma$) gets the most weight. The posterior does NOT concentrate on a single state — it converges to a fixed mixture.

**Consequence for the IVT argument**: $G(s) \to \sum_\theta w_\theta \cdot \Omega_t(\theta) - \bar{h}$ as $s \to -\infty$, where $w_\theta = \lim_{s\to -\infty} P(\theta | d=1, s)$ is a fixed probability vector. The claim that this limit exceeds zero requires $\sum_\theta w_\theta \cdot \Omega_t(\theta) > \bar{h}$, which is a weighted average of $\Omega_t$ values. This weighted average is **NOT** necessarily $\Omega_t(\theta^*)$ — it could be smaller.

**Is the IVT argument salvageable?** Yes, but by considering the OTHER limit. As $s \to +\infty$, the posterior concentrates on the state with the **highest** $\omega_t$ (because the Bernoulli factor $\omega^d$ and the signal likelihood $e^{(s-\omega)/\sigma}$ both favor high $\omega$ when $s$ is large). But $\Lambda((\omega - s)/\sigma) \to 0$, so this product goes to zero. The IVT argument needs to find a point where $G > 0$.

**Alternative approach**: Consider $s$ near $\omega_t(\theta^*)$ where $\theta^* = \arg\max \Omega_t(\theta)$. At $s = \omega_t(\theta^*)$, $\Lambda(0) = 1/2$, and the posterior places significant weight on $\theta^*$. So $G(\omega_t(\theta^*)) \approx P(\theta^* | d=1, \omega_t(\theta^*)) \cdot \Omega_t(\theta^*) \cdot 1/2 + \ldots - \bar{h}$. For $\bar{h}$ small enough (i.e., $v$ close to $C_x$), this is positive. But the existence proof should not depend on parameter restrictions beyond those stated.

**A cleaner IVT argument**: Note that $\Lambda((\omega_t(\theta) - s)/\sigma)$ is a CDF evaluated at $(\omega_t(\theta) - s)/\sigma$. It equals $1/2$ at $s = \omega_t(\theta)$. Consider $s^- = \min_\theta \omega_t(\theta) - K\sigma$ for large $K$. Then $\Lambda((\omega_t(\theta) - s^-)/\sigma) \geq \Lambda(K)$ which is close to 1 for all $\theta$. So $G(s^-) \geq \sum_\theta P(\theta|d=1,s^-) \cdot \Omega_t(\theta) \cdot \Lambda(K) - \bar{h}$. The sum $\sum_\theta P(\theta|d=1,s^-) \cdot \Omega_t(\theta) \geq \min_\theta \Omega_t(\theta) \cdot \Lambda(K)$. For this to exceed $\bar{h}$, we need $\min_\theta \Omega_t(\theta) > \bar{h}$ (approximately). The stated condition $v \in (0, C_x)$ means $\bar{h} \in (0,1)$, and $\Omega_t(\theta^*)$ could be less than 1 but $\min_\theta \Omega_t(\theta)$ could be very small (e.g., $\Omega_1(N) = \omega_N = 0.02$). So the argument requires $\bar{h} < \min_\theta \Omega_t(\theta)$, which may fail.

**The correct existence condition**: The IVT requires $G(s) > 0$ for some $s$. A sufficient condition is: $\exists \theta$ with $P(\theta|d=1,s) > 0$ and $\Omega_t(\theta) > \bar{h}$, such that for signals near $\omega_t(\theta)$, the contribution of $\theta$ to $G$ makes $G$ positive. A rigorous version: at $s = \omega_t(\theta^*)$ (where $\theta^* = \arg\max \Omega_t$), with $\sigma$ small, $P(\theta^*|d=1,s) \to 1$ (because the signal strongly identifies the state) and $\Lambda(0) = 1/2$. So $G \approx \Omega_t(\theta^*) \cdot 1/2 - \bar{h}$. This is positive iff $\Omega_t(\theta^*) > 2\bar{h}$.

**Bottom line on Part (a)**: The direction-of-concentration claim as $s \to -\infty$ is **incorrect** (posterior does NOT concentrate on highest-$\omega$ state; it converges to a fixed non-degenerate mixture). The IVT conclusion can be salvaged but requires either (1) a different argument (e.g., evaluate $G$ at $s = \omega_t(\theta^*)$ with $\sigma$ small) or (2) an explicit parameter restriction ($\Omega_t(\theta^*) > 2\bar{h}$ or similar).

### 2.2 Part (b): Uniqueness via IFT

**Claim**: For $\sigma \to 0$, $G(s)$ becomes a step function, and IFT perturbs each zero uniquely.

**Issues**:

1. **Step function characterization**: As $\sigma \to 0$, $\Lambda((\omega_t(\theta) - s)/\sigma)$ becomes a step function: $= 1$ if $s < \omega_t(\theta)$ and $= 0$ if $s > \omega_t(\theta)$. The posterior $P(\theta|d=1,s)$ also changes discontinuously at $s = \omega_t(\theta)$ (because the signal likelihood becomes a point mass). So $G(s)$ is piecewise constant with jumps at each $\omega_t(\theta)$. This part is correct.

2. **"Between jumps, $G$ is monotone"**: Between two consecutive $\omega$ values, $G$ is constant (not just monotone), because the step functions and posteriors are all constant between jumps. **Monotonicity within an interval is trivially true but for the wrong reason** — $G$ is flat, so there is no zero-crossing within an interval (either $G > 0$ or $G < 0$ throughout). The zero-crossings can only occur AT the jump points $\omega_t(\theta)$.

3. **IFT at a discontinuity**: The IFT requires that $G$ is $C^1$ and $G'(s^*) \neq 0$ at the zero. But the step function $G$ has discontinuities, not smooth zero-crossings. **The IFT does not apply to step functions.** For $\sigma > 0$ but small, $G$ is smooth (the logistic CDF smooths the step). The correct argument is:

   - For $\sigma = 0$: identify parameter values at which $G$ changes sign at a jump point $\omega_t(\theta)$ (i.e., $G$ transitions from positive to negative). This requires checking the values of $G$ on either side of $\omega_t(\theta)$.
   
   - For $\sigma > 0$ small: the smooth $G_\sigma$ is close to the step function $G_0$. By the IVT, each sign change of $G_0$ generates at least one zero of $G_\sigma$ nearby. For uniqueness, one needs $G_\sigma'(s^*) < 0$ at the zero (strict monotonicity through the crossing). This follows if the smoothing creates a steep negative slope near the sign change.

   - The claim "each zero perturbs uniquely" via IFT is the right idea but poorly stated. The IFT perturbs a smooth zero ($G_\sigma(s^*) = 0$, $G_\sigma'(s^*) \neq 0$) under parameter changes. Here one would use it to say: for $\sigma_1 > 0$ small, there exists a zero; for $\sigma_2$ near $\sigma_1$, the zero persists and is unique nearby. But the transition from $\sigma = 0$ (discontinuous) to $\sigma > 0$ (smooth) is NOT covered by the IFT — it is a **singular perturbation**.

4. **"If the step function has a single zero (generic)"**: The step function does not have "zeros" in the usual sense — it has **sign changes at jump points**. The genericity claim requires that $\bar{h}$ falls in exactly one interval $(\Omega_t^{-}(\theta), \Omega_t^{+}(\theta))$ where $\Omega_t^{-}$ and $\Omega_t^{+}$ are the left and right limits of $G + \bar{h}$ at the jump. With three states, there are three jump points and four intervals — the claim that generically only one interval boundary is crossed is plausible but not proven.

**Bottom line on Part (b)**: The intuition is correct (small noise $\to$ approximate step function $\to$ generically one zero), but the proof as written has two errors: (a) the IFT cannot be applied at a discontinuity, and (b) the transition from $\sigma = 0$ to $\sigma > 0$ is a singular perturbation that requires separate treatment (e.g., Berge's maximum theorem or a dedicated smoothing argument). The uniqueness claim is **likely true** but **not proven** as stated.

---

## 3. Lemma 1 Proof (Section 7.3)

### Verdict: FAIL

### 3.1 Channel (i): Normal-Normal shrinkage with discrete prior

**The formula used**:
$$\hat{\omega}_S = \frac{\sigma_0^2}{\sigma_0^2 + \sigma_A^2}\tilde{\omega}_S + \frac{\sigma_A^2}{\sigma_0^2 + \sigma_A^2}\mu_0$$

This is the Bayesian posterior mean for a Normal-Normal conjugate model: prior $\omega \sim N(\mu_0, \sigma_0^2)$, signal $\tilde{\omega}_S = \omega + \sigma_A \zeta$ with $\zeta \sim N(0,1)$.

**Problem**: The model has $\theta \in \{R, T, N\}$ discrete, and $\omega_t(\theta)$ takes **discrete values** $\{\omega_R, \omega_{T1}, \omega_{T2}, \omega_N\}$. There is no Normal prior on $\omega$. The prior over $\omega$ is a three-point (or four-point) discrete distribution. The Normal-Normal shrinkage formula **does not apply** to a discrete prior.

The correct Bayesian update for the elite is:
$$P(\theta | \tilde{\omega}_S) \propto p_\theta \cdot \phi\left(\frac{\tilde{\omega}_S - \omega_t(\theta)}{\sigma_A}\right)$$
where $\phi$ is the Normal density (assuming $\zeta \sim N(0,1)$). The posterior is a **mixture of point masses** on $\{\omega_R, \omega_{T1}, \omega_{T2}, \omega_N\}$, NOT a Normal distribution.

**Does the qualitative conclusion survive?** The claim is that higher $\sigma_A$ makes the elite's assessment less responsive to the true $\omega$. With the discrete prior, higher $\sigma_A$ means the Normal likelihood $\phi((\tilde{\omega}_S - \omega)/\sigma_A)$ is flatter, so the posterior weights are more uniform (closer to the prior). This is qualitatively the same as "shrinkage toward the prior mean." So the **direction** of the result ($\bar{\omega}_A > \bar{\omega}_D$) is preserved, but the specific formula is wrong and should not appear in a published paper.

**Recommendation**: Replace the Normal-Normal formula with a correct discrete-prior Bayesian update. State the result qualitatively: "Higher $\sigma_A$ flattens the likelihood, making the posterior closer to the prior. For $\omega > \mu_0$ (crisis), the posterior mean is pulled down, requiring a higher true $\omega$ to trigger the same posterior assessment." This is correct and does not require the conjugate formula.

### 3.2 Channel (ii): Broader interests argument

**Claim**: In democracy, displaced workers always vote YES, creating a built-in pro-compensation constituency. In autocracy, elites are not displaced and approve only via indirect (regime-survival) motive.

**Assessment**: This is verbal and **correct as stated** for the model. It follows directly from the voting condition in Section 7.4 (Case 1: displaced always vote YES). In autocracy, the elite's decision rule is $P(\text{falls} | \text{no comp}, \tilde{\omega}_S) > \tau_{\text{elite}}$, which is an indirect stake. The claim that the indirect threshold is higher than the direct benefit threshold is intuitive but not formally proven.

**Is it formalizable from model primitives?** Partially. The model specifies the democratic voting rule (Section 7.4) but the autocratic approval rule is stated verbally as "$P(\text{falls}) > \tau_{\text{elite}}$" without specifying what $\tau_{\text{elite}}$ is in terms of primitives. If $\tau_{\text{elite}}$ were derived from the elite's utility (e.g., cost of taxation vs. probability of losing power), the comparison could be made formal. Currently, $\tau_{\text{elite}}$ is an unspecified parameter, so the claim "$\bar{\omega}_A > \bar{\omega}_D$" partially rests on assuming $\tau_{\text{elite}}$ is high enough.

**Recommendation**: Either (a) derive $\tau_{\text{elite}}$ from the elite's utility function (e.g., elite values power at $V$ and loses $\tau$ from taxation, so approves iff $V \cdot P(\text{falls}) > \tau$), or (b) state explicitly that the result requires both channels (i) and (ii) jointly, and that channel (ii) alone is an assumption about elite preferences.

### 3.3 IFT application: $f_x(\omega) = P(\text{selectorate approves} | \omega)$

**Claim**: $f_D(\omega) > f_A(\omega)$ for all $\omega$ in the relevant range, and the IFT applied to $f_x(\bar{\omega}_x) = 1/2$ gives $\bar{\omega}_A > \bar{\omega}_D$.

**Issues**:

1. **Is $f_x(\omega)$ well-defined?** For democracy, $f_D(\omega)$ = probability that majority votes YES at displacement rate $\omega$. This depends on the distribution of signals, which depends on $\sigma$ (worker signal noise). For a given $\omega$, the fraction of displaced workers is $\omega$ (deterministic in the continuum limit), and the fraction of employed who vote YES depends on their signal distribution. So $f_D(\omega)$ is well-defined. For autocracy, $f_A(\omega) = P(\tilde{\omega}_S > \text{some threshold})$ where $\tilde{\omega}_S \sim N(\omega, \sigma_A^2)$ (approximately). Also well-defined.

2. **Is $f_x(\omega)$ differentiable?** For democracy, $f_D$ involves a majority condition that depends on the fraction of employed who vote YES — a smooth function of $\omega$ (via the signal distribution). So $f_D$ is smooth. For autocracy, $f_A(\omega) = \Phi((\omega - \text{threshold})/\sigma_A)$ (Normal CDF) if we simplify, which is smooth. **Yes, differentiable.**

3. **Does the IFT apply?** The IFT at $f_x(\bar{\omega}_x) = 1/2$ requires $f_x'(\bar{\omega}_x) \neq 0$. Since both $f_D$ and $f_A$ are increasing in $\omega$ (higher displacement $\to$ more approval), this holds. The IFT gives: for a perturbation from $f_D$ to $f_A$ (with $f_A < f_D$ pointwise), the crossing point $\bar{\omega}$ moves right. **The logic is correct**, but strictly speaking this is not an IFT argument — it is a simple comparison: if $f_A(\omega) < f_D(\omega)$ for all $\omega$, and both cross $1/2$, then $f_A$ crosses later (at higher $\omega$). This follows from $f_A < f_D$ and monotonicity; no IFT needed.

4. **The claim $f_D(\omega) > f_A(\omega)$**: This is the substantive claim, and it rests on channels (i) and (ii). As noted above, channel (i) has the wrong formula (Normal-Normal applied to discrete prior), and channel (ii) is partially an assumption. So $f_D > f_A$ is asserted but not rigorously derived from primitives.

**Bottom line**: The proof of Lemma 1 fails because (a) the shrinkage formula is wrong for the discrete prior, (b) the autocratic approval threshold $\tau_{\text{elite}}$ is unspecified, and (c) the "IFT" invocation is overcomplicated for what is really a monotone-comparison argument. The result ($\bar{\omega}_A > \bar{\omega}_D$) is almost certainly true under reasonable specifications, but the current proof does not establish it from primitives.

---

## 4. Majority Condition (Section 7.4)

### Verdict: CONDITIONAL PASS (with errors in specifics)

### 4.1 Voting condition

**Formula**: $d_{it} \cdot B + (1-d_{it}) \cdot \delta \cdot P(d_{i,t+1}=1 | s_{it}) \cdot B > \hat{\omega}_t \cdot B \cdot Y_{it}$

Simplification: $d_{it} + (1-d_{it}) \cdot \delta \cdot \hat{P}_{it} > \hat{\omega}_t \cdot Y_{it}$

**Check**: The LHS has two components:
- If displaced ($d_{it} = 1$): receives $B$ now (benefit = $B$). After dividing by $B$: LHS $= 1$.
- If employed ($d_{it} = 0$): receives insurance value $\delta \cdot P(\text{displaced next period}) \cdot B$. After dividing by $B$: LHS $= \delta \cdot \hat{P}_{it}$.

The RHS is the tax cost: $\hat{\omega}_t \cdot B \cdot Y_{it}$. After dividing by $B$: RHS $= \hat{\omega}_t \cdot Y_{it}$.

**Issue 1**: The tax formula $\tau = \hat{\omega}_t \cdot B$ means the per-capita tax equals the expected per-capita cost of compensation. This is a balanced-budget assumption. It is reasonable but should be stated.

**Issue 2**: The benefit for displaced workers should be $B$ (direct compensation), but the tax cost for displaced workers is $\hat{\omega}_t \cdot B \cdot Y_{it} = \hat{\omega}_t \cdot B \cdot 0 = 0$ (since $Y_{it} = 0$ for displaced). So the net benefit for displaced is $B - 0 = B > 0$, and they always vote YES. **This is correct** (Case 1).

**Issue 3**: The insurance value $\delta \cdot \hat{P}_{it} \cdot B$ assumes that compensation, if voted in now, will be available next period. But under democratic lag, a law passed in $t$ takes effect in $t+1$. So the insurance value should be: $P(\text{I am displaced in } t+1) \cdot B$ (I will be compensated in $t+1$ if the law passes now). Multiplied by $\delta$ for discounting. **This is what the formula says, and it is correct.**

**Issue 4 (subtle)**: The RHS uses $\hat{\omega}_t$ (estimated current displacement rate) as the tax base. But the cost of future compensation (if the law is for $t+1$) should be based on $\hat{\omega}_{t+1}$, not $\hat{\omega}_t$. If the law passes in $t=1$ and takes effect in $t=2$, the fiscal cost in $t=2$ is $\omega_2 \cdot B$, not $\omega_1 \cdot B$. The tax cost in $t=1$ (when the law is voted on) depends on whether the tax is collected immediately or in $t+1$. The document is ambiguous about when the tax is collected. If collected in $t+1$: the present-value tax cost is $\delta \cdot \hat{\omega}_{t+1} \cdot B \cdot Y_{i,t+1}$, and the comparison becomes entirely about $t+1$ quantities, discounted. If collected in $t=1$: the tax cost is $\hat{\omega}_? \cdot B \cdot Y_{i1}$. **This ambiguity affects the numerical thresholds but not the qualitative result.**

**Assessment of the voting formula**: Correct in structure, with the caveat that the tax timing is ambiguous.

### 4.2 Case 2: Employed under rapid

**Claim**: Under certainty ($\theta = R$ known), the condition is $\delta \cdot \omega_R > \omega_R$, i.e., $\delta > 1$, which fails.

**Check**: $\hat{P}_{it} = \omega_R$ (probability of displacement next period, given currently employed, given $\theta = R$). Actually, $\hat{P}_{it} = P(d_{i2} = 1 | d_{i1} = 0, \theta = R) = \omega_R$ (since displacement is iid conditional on $\theta$). Tax cost: $\hat{\omega}_t \cdot Y_i = \omega_R \cdot 1 = \omega_R$. So the condition is $\delta \cdot \omega_R > \omega_R$, i.e., $\delta > 1$. **Correct.** This means under certainty about $\theta = R$, no employed worker votes YES (pure insurance is always uneconomical with $\delta < 1$ and proportional tax equal to risk).

**The uncertainty case**: The condition becomes $\delta \cdot E[\omega_2 | s, d=0] > E[\omega_1 | s, d=0]$.

**Wait** — this is wrong. The tax is based on the CURRENT period's estimated displacement, $\hat{\omega}_t = E[\omega_1 | s, d=0]$. The insurance benefit is about FUTURE displacement: $\hat{P}_{it} = E[\omega_2 | s, d=0]$. (Actually, for a currently employed worker in $t=1$, $P(d_{i2} = 1 | d_{i1} = 0, s) = E[\omega_2(\theta) | s, d=0]$.) So the condition is:

$$\delta \cdot E[\omega_2(\theta) | s, d=0] > E[\omega_1(\theta) | s, d=0]$$

Under rapid ($\theta = R$): $\omega_2 = \omega_R = \omega_1$, so both expectations are $\omega_R$ weighted by posterior on $R$ plus other states. For worker with high signal (posterior concentrates on $R$): both sides $\approx \omega_R$, condition is $\delta > 1$ — fails. For worker with low signal (posterior mixes $T$ and $N$): $E[\omega_2]$ includes $p_T' \omega_{T2} + p_N' \omega_N$, while $E[\omega_1]$ includes $p_T' \omega_{T1} + p_N' \omega_N$. With $\omega_{T2} \gg \omega_{T1}$: $E[\omega_2]$ can substantially exceed $E[\omega_1]$, so $\delta \cdot E[\omega_2] > E[\omega_1]$ may hold.

**This analysis is correct.** The insight — that employed workers under rapid who vote YES are those with LOW signals (who fear a threshold trajectory) — is novel and interesting.

**One concern**: The document says $\hat{\omega}_t \approx \omega_R$ "since rapid is detectable." But $\hat{\omega}_t = E[\omega_1 | s, d=0]$, which for employed workers with low signals is NOT $\omega_R$ — it is a weighted average closer to $\omega_{T1}$ or $\omega_N$. The certainty simplification ($\hat{\omega}_t = \omega_R$) is used for the benchmark but the general case correctly accounts for uncertainty.

### 4.3 Majority condition thresholds

**Under rapid $t=1$**:
$$\omega_R + (1-\omega_R) \cdot \Phi_R > 1/2$$

With $\omega_R = 0.30$: $\Phi_R > 0.20/0.70 = 2/7 \approx 0.286$.

**Check**: $0.30 + 0.70 \cdot \Phi_R > 0.50 \iff 0.70 \cdot \Phi_R > 0.20 \iff \Phi_R > 2/7 \approx 0.2857$. **Correct.**

**Under threshold $t=1$**:
$$\omega_{T1} + (1-\omega_{T1}) \cdot \Phi_T > 1/2$$

With $\omega_{T1} = 0.05$: $\Phi_T > 0.45/0.95 = 9/19 \approx 0.474$.

**Check**: $0.05 + 0.95 \cdot \Phi_T > 0.50 \iff 0.95 \cdot \Phi_T > 0.45 \iff \Phi_T > 9/19 \approx 0.4737$. **Correct.**

### 4.4 Majority Reversal Proposition

**Claim**: $\exists \gamma^*$ such that for $\gamma > \gamma^*$: $\Phi_R > 0.286$ (majority passes under rapid) but $\Phi_T < 0.474$ (majority blocks under threshold).

**Proof by continuity**:

1. "$\Phi_R$ does not depend on $\gamma$": Under rapid, employed workers earn $Y = 1$ (no complementarity bonus). **Correct** — $\gamma$ affects only threshold-employed income $Y^+ = 1 + \gamma$.

2. "$\Phi_T$ is strictly decreasing in $\gamma$": Under threshold $t=1$, employed workers earn $Y^+ = 1+\gamma$. Their voting condition is $\delta \cdot \hat{P}_{it} > \hat{\omega}_t \cdot (1+\gamma)$. As $\gamma$ increases, the RHS increases, so fewer workers satisfy the condition. **Correct** — $\Phi_T$ is decreasing in $\gamma$.

3. "$\Phi_T \to 0$ as $\gamma \to \infty$": As $\gamma \to \infty$, the condition $\delta \cdot \hat{P}_{it} > \hat{\omega}_t \cdot (1+\gamma)$ requires $\hat{P}_{it} \to \infty$, which is impossible ($\hat{P}_{it} \leq 1$). So no employed worker votes YES. **Correct.**

4. "$\Phi_T = \Phi_R$ when $\gamma = 0$": With $\gamma = 0$, $Y^+ = 1 = Y$. But the voting conditions STILL differ because $\hat{P}_{it}$ and $\hat{\omega}_t$ depend on the TRUE state $\theta$: under rapid, $\omega_1 = \omega_R$ (higher displacement, different posteriors); under threshold, $\omega_1 = \omega_{T1}$ (lower displacement). So even with $\gamma = 0$, $\Phi_T \neq \Phi_R$ in general.

**ERROR**: The claim "$\Phi_T = \Phi_R$ when $\gamma = 0$" is false. $\Phi_R$ is the fraction of employed who vote YES when they are in a rapid trajectory (experiencing $\omega_R$ displacement around them, receiving signals centered on $\omega_R$). $\Phi_T$ at $\gamma = 0$ is the fraction of employed who vote YES when they are in a threshold trajectory (experiencing $\omega_{T1}$ displacement, receiving signals centered on $\omega_{T1}$). These are different because the underlying state is different.

**However, does this affect the proposition?** No. The proposition assumes $\Phi_R > 0.286$ (a parametric condition). It shows $\Phi_T(\gamma) \to 0 < 0.474$ as $\gamma \to \infty$. By continuity and the intermediate value theorem, there exists $\gamma^*$ such that $\Phi_T(\gamma^*) = 0.474$, and for $\gamma > \gamma^*$, $\Phi_T < 0.474$. **The proof is valid** despite the error in the $\gamma = 0$ claim — the error appears in a non-load-bearing remark about the limiting case.

**A more careful statement**: "Since $\Phi_R > 0.286$ (by assumption, independent of $\gamma$) and $\Phi_T(\gamma) \to 0$ (by the above), there exists $\gamma^*$ such that for $\gamma > \gamma^*$, $\Phi_T < 0.474$ while $\Phi_R > 0.286$ unchanged." **This is correct.**

### 4.5 Does $\Phi_R$ really not depend on $\gamma$?

$\Phi_R$ is the fraction of employed workers under rapid who vote YES. Under rapid, non-displaced workers earn $Y = 1$ (not $Y^+ = 1 + \gamma$, because $\gamma$ is the complementarity bonus that exists only under threshold). **Correct** — $\Phi_R$ is independent of $\gamma$.

### 4.6 Numerical thresholds: $\Phi_R > 0.286$ and $\Phi_T < 0.474$

As verified above, $\Phi_R > 2/7 \approx 0.2857$ and $\Phi_T > 9/19 \approx 0.4737$, given $\omega_R = 0.30$ and $\omega_{T1} = 0.05$. **Correct.**

Note that $0.286$ is a rounded version of $2/7 = 0.28571...$, and $0.474$ is a rounded version of $9/19 = 0.47368...$. The document says "$\geq 29\%$" for the first, which rounds up from $28.57\%$ — acceptable. For the second, "$\geq 47\%$" rounds down from $47.37\%$ — also acceptable.

---

## Summary Table

| Item | Verdict | Key Issue |
|------|---------|-----------|
| **1. Equilibrium definition** | **CONDITIONAL PASS** | Well-defined tuple; fixed-point reduces to finite check (2 candidates); should be stated explicitly. No existence issue in current formulation. |
| **2a. Lemma 0 existence** | **CONDITIONAL PASS** | Direction of posterior concentration as $s \to -\infty$ is **wrong** (concentrates on lowest $\omega$, not highest). IVT conclusion salvageable with corrected argument. Need explicit condition $\Omega_t(\theta^*) > \bar{h}$ (or stronger). |
| **2b. Lemma 0 uniqueness** | **FAIL** | IFT cannot be applied at a discontinuity (step function). Singular perturbation from $\sigma = 0$ to $\sigma > 0$ requires different technique. Result likely true but proof invalid. |
| **3. Lemma 1 proof** | **FAIL** | (a) Normal-Normal shrinkage formula incorrect for discrete prior. (b) $\tau_{\text{elite}}$ unspecified. (c) IFT invocation unnecessary. Qualitative result ($\bar{\omega}_A > \bar{\omega}_D$) almost certainly correct but proof does not establish it from primitives. |
| **4. Majority Condition** | **CONDITIONAL PASS** | Voting formula structurally correct (tax timing ambiguity noted). Case analysis correct. Numerical thresholds correct. Majority Reversal Proposition valid (error in $\gamma = 0$ remark is non-load-bearing). |

---

## Actionable Recommendations

### Priority 1 (must fix before paper)

1. **Lemma 0(a)**: Fix the posterior-concentration argument. As $s \to -\infty$, the posterior converges to a fixed non-degenerate mixture (not concentration on highest-$\omega$ state). Rewrite: show $G(s^0) > 0$ at some finite $s^0$ (e.g., $s^0 = \omega_t(\theta^*) - K\sigma$ for appropriate $K$), or add the explicit condition $\max_\theta \Omega_t(\theta) > \bar{h}$.

2. **Lemma 0(b)**: Replace the IFT-at-discontinuity argument. Option A: prove $G_\sigma'(s^*) < 0$ directly for small $\sigma > 0$ (compute the derivative, show it is negative at the unique zero). Option B: use a dominance/monotonicity argument specific to the logistic case. Option C: state uniqueness as a numerical finding and relegate the proof to an appendix.

3. **Lemma 1, Channel (i)**: Remove the Normal-Normal conjugate formula. Replace with the correct discrete-prior Bayesian update. State the attenuation result qualitatively or derive it from the flattening of the Normal likelihood as $\sigma_A$ increases.

### Priority 2 (strengthen before publication)

4. **Lemma 1, Channel (ii)**: Derive $\tau_{\text{elite}}$ from the elite's utility function. This makes $\bar{\omega}_A > \bar{\omega}_D$ a theorem rather than a partially-assumed result.

5. **Equilibrium definition**: Add a brief remark explaining why the fixed-point problem reduces to checking two candidates (comp vs. no-comp), and why exactly one is self-consistent.

6. **Majority Reversal Proposition**: Remove the claim "$\Phi_T = \Phi_R$ when $\gamma = 0$" (it is false since the underlying states differ). The proof does not need this claim.

7. **Tax timing**: Clarify whether the tax for compensation is collected in $t$ or $t+1$, and adjust the voting condition accordingly.
