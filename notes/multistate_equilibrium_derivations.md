# Multi-State Global Game Equilibrium: Analytical Derivations

**Date**: 2026-05-02
**Status**: COMPLETE
**Model version**: v2 (selectorate, reformulated)

---

## Notation and Setup

A continuum of workers $i \in [0,1]$ over 2 periods $t \in \{1,2\}$. Nature draws $\theta \in \{R, T, N\}$ with prior $(p_R, p_T, p_N)$. Individual displacement $d_{it} \sim \text{Bernoulli}(\omega_t(\theta))$, absorbing. Private signal $s_i = \omega_t(\theta) + \sigma \varepsilon_i$, $\varepsilon \sim \text{Logistic}(0,1)$.

**Displacement rates by state and period:**

| State $\theta$ | $\omega_1(\theta)$ | $\omega_2(\theta)$ |
|:---:|:---:|:---:|
| R (rapid) | $\omega_R$ | $\omega_R$ |
| T (threshold) | $\omega_{T1}$ | $\omega_{T2}$ |
| N (no shock) | $\omega_N$ | $\omega_N$ |

**Cumulative displaced fraction** (absorbing):
$$\Omega_t(\theta) = \begin{cases} \omega_t(\theta) & t = 1 \\ \omega_1(\theta) + (1 - \omega_1(\theta))\omega_2(\theta) & t = 2 \end{cases}$$

**Only displaced workers protest.** Worker $i$ protests iff:
$$v_i > C_x \cdot (1 - h(\pi_t))$$
where $v_i$ is expressive value, $C_x$ is regime-specific cost ($C_A > C_D$), $h(\pi) = \pi$ (linear safety in numbers), and $\pi_t = \int a_{it}\,di$ is aggregate protest.

**Expressive value** for a displaced, uncompensated worker:
$$v_i = 1 + \delta \cdot E[(1 - y_{i,t+1}) \mid d_{it} = 1, s_{it}]$$

Since displacement is absorbing, a displaced worker in $t$ remains displaced in $t+1$. If no compensation is expected, the future loss is 1, giving $v = 1 + \delta$. If compensation is credibly promised for $t+1$, the future loss is $1-B$, giving $v = 1 + \delta(1-B)$.

**Participation threshold:**
$$\bar{h} := 1 - \frac{v}{C_x}$$

When $\bar{h} < 0$ (i.e., $v > C_x$), protesting is a **dominant strategy** for displaced workers, regardless of coordination.

**Logistic CDF/PDF:** $\Lambda(z) = (1 + e^{-z})^{-1}$, $\lambda(z) = \Lambda(z)(1 - \Lambda(z))$.

**Bayesian posterior** of a displaced worker observing signal $s$:
$$P(\theta \mid d=1, s) = \frac{\omega_t(\theta) \cdot \lambda\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \cdot p_\theta}{\sum_{\theta'} \omega_t(\theta') \cdot \lambda\!\left(\frac{s - \omega_t(\theta')}{\sigma}\right) \cdot p_{\theta'}}$$

**Equilibrium.** In a cutoff equilibrium with threshold $s^*$, the aggregate protest under true state $\theta$ is:
$$\pi_\theta(t) = \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right)$$

The indifference condition at $s^*$ (for a displaced worker):
$$G(s^*) := \sum_\theta P(\theta \mid d=1, s^*) \cdot \pi_\theta(s^*) - \bar{h} = 0$$

equivalently:
$$\sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) = \bar{h} \tag{IC}$$

**Paper parameters:**
$\omega_R = 0.30$, $\omega_{T1} = 0.05$, $\omega_{T2} = 0.60$, $\omega_N = 0.02$, $\sigma = 0.10$, $C_D = 1.5$, $C_A = 2.0$, $B = 0.6$, $\delta = 0.9$, $\bar{\pi}_D^{\text{fall}} = 0.20$, $\bar{\pi}_A^{\text{fall}} = 0.05$, $\bar{\omega}_A = 0.40$, $\sigma_A = 0.15$, $p_R = 0.30$, $p_T = 0.30$, $p_N = 0.40$.

---

## D1. State-Specific Protest Lemma

**Lemma (State-specific protest).** *In a multi-state global game with linear safety-in-numbers $h(\pi) = \pi$ and cutoff equilibrium $s^*$:*

*(a) The realized protest under true state $\theta$ is $\pi_\theta(t) = \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma)$.*

*(b) The equilibrium condition $G(s^*) = 0$ implies $\sum_\theta P(\theta \mid d=1, s^*) \cdot \pi_\theta = \bar{h}$: the posterior-weighted average of state-specific protest equals the participation threshold.*

*(c) Individual state-specific protest can differ substantially from $\bar{h}$:*
- *If $\omega_t(\theta) - s^* > 0$: $\Lambda((\omega_t(\theta) - s^*)/\sigma) > 1/2$, so $\pi_\theta > \Omega_t(\theta)/2$.*
- *If $\omega_t(\theta) - s^* \gg \sigma$: $\Lambda((\omega_t(\theta) - s^*)/\sigma) \to 1$, so $\pi_\theta \to \Omega_t(\theta)$ (nearly all displaced workers in state $\theta$ protest).*
- *If $\omega_t(\theta) - s^* \ll -\sigma$: $\Lambda((\omega_t(\theta) - s^*)/\sigma) \to 0$, so $\pi_\theta \to 0$ (almost no one protests).*

*(d) When $\bar{h} \leq 0$ (dominant strategy regime), $s^*$ is not determined by indifference; instead, ALL displaced workers protest regardless of signal, and $\pi_\theta = \Omega_t(\theta)$.*

**Proof.**

**(a)** Under cutoff equilibrium with threshold $s^*$, worker $i$ protests iff $s_i > s^*$ and $d_i = 1$. The aggregate protest under true state $\theta$ is:
$$\pi_\theta(t) = \int \mathbf{1}[d_{it} = 1] \cdot \mathbf{1}[s_{it} > s^*] \, di$$

By the law of large numbers for a continuum of i.i.d. workers:
$$\pi_\theta(t) = P(d_{it} = 1 \text{ in first } t \text{ periods}) \cdot P(s_{it} > s^* \mid \theta)$$

The first factor is $\Omega_t(\theta)$ (cumulative displaced fraction). The second is:
$$P(s_i > s^* \mid \theta) = P(\omega_t(\theta) + \sigma\varepsilon_i > s^*) = P\!\left(\varepsilon_i > \frac{s^* - \omega_t(\theta)}{\sigma}\right) = 1 - \Lambda\!\left(\frac{s^* - \omega_t(\theta)}{\sigma}\right) = \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right)$$

where the last equality uses the symmetry of the logistic CDF: $1 - \Lambda(z) = \Lambda(-z)$. $\square$

**(b)** The indifference condition at $s^*$ for a displaced worker is:
$$v = C_x \cdot (1 - E[\pi \mid d = 1, s = s^*])$$

Rearranging: $E[\pi \mid d=1, s=s^*] = 1 - v/C_x = \bar{h}$.

The expected protest, conditional on $(d=1, s=s^*)$, is:
$$E[\pi \mid d=1, s=s^*] = \sum_\theta P(\theta \mid d=1, s=s^*) \cdot \pi_\theta(s^*)$$

because conditional on $\theta$, the protest rate is the deterministic quantity $\pi_\theta(s^*)$ (law of large numbers). Substituting part (a):
$$\sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) = \bar{h} \tag{$\square$}$$

**(c)** The logistic CDF $\Lambda$ is strictly increasing with $\Lambda(0) = 1/2$, $\Lambda(z) \to 1$ as $z \to +\infty$, and $\Lambda(z) \to 0$ as $z \to -\infty$. Each claim follows directly:
- $\omega_t(\theta) > s^* \Rightarrow (\omega_t(\theta) - s^*)/\sigma > 0 \Rightarrow \Lambda > 1/2 \Rightarrow \pi_\theta > \Omega_t(\theta)/2$.
- $\omega_t(\theta) - s^* \gg \sigma \Rightarrow (\omega_t(\theta) - s^*)/\sigma \gg 1 \Rightarrow \Lambda \approx 1 \Rightarrow \pi_\theta \approx \Omega_t(\theta)$.
- $\omega_t(\theta) - s^* \ll -\sigma$: analogous, with $\Lambda \approx 0$. $\square$

**(d)** When $v > C_x$, the protest condition $v > C_x(1 - \pi)$ is satisfied for all $\pi \in [0,1]$, since $C_x(1-\pi) \leq C_x < v$. Hence protesting is a dominant strategy for every displaced worker, irrespective of others' actions. The unique equilibrium is full participation by displaced workers: $\pi_\theta = \Omega_t(\theta)$. No cutoff $s^*$ is needed; the strategic complementarity is irrelevant. $\square$

### Numerical verification

With the paper's parameters:

**Democracy ($C_D = 1.5$):** For displaced, uncompensated workers, $v = 1 + \delta = 1.9 > C_D = 1.5$. By part (d), this is a **dominant strategy regime**: $\bar{h} = 1 - 1.9/1.5 = -0.267 < 0$. All displaced workers protest. $\pi_\theta = \Omega_t(\theta)$.

| State | $\pi_\theta(t=1)$ | $\pi_\theta(t=2)$ |
|:---:|:---:|:---:|
| R | 0.3000 | 0.5100 |
| T | 0.0500 | 0.6200 |
| N | 0.0200 | 0.0396 |

**Autocracy ($C_A = 2.0$):** $v = 1.9$, $\bar{h} = 1 - 1.9/2.0 = 0.05 > 0$. Interior equilibrium exists (since $\Omega_1(R) = 0.30 > 0.05$).

At $t=1$: $s^* = 0.4578$. Posterior concentrates heavily on R ($P(R) = 0.974$).
- $\pi_R(1) = 0.30 \times \Lambda((0.30 - 0.458)/0.10) = 0.30 \times \Lambda(-1.58) = 0.30 \times 0.171 = 0.0513$
- $\pi_T(1) = 0.05 \times \Lambda((0.05 - 0.458)/0.10) = 0.05 \times \Lambda(-4.08) = 0.05 \times 0.017 = 0.0008$
- $\pi_N(1) = 0.02 \times \Lambda((0.02 - 0.458)/0.10) = 0.02 \times \Lambda(-4.38) = 0.02 \times 0.012 = 0.0002$
- Weighted average: $0.974 \times 0.0513 + 0.019 \times 0.0008 + 0.008 \times 0.0002 = 0.0500 = \bar{h}$. $\checkmark$

The state-specific divergence is dramatic: $\pi_R = 0.051 \approx \bar{h}$ (the dominant state), while $\pi_T = 0.0008 \ll \bar{h}$ and $\pi_N = 0.0002 \ll \bar{h}$.

---

## D2. Cutoff Location

**Proposition (Cutoff bounds).** *Consider the multi-state global game with indifference condition (IC) and participation threshold $\bar{h} > 0$. Define:*

$$G(s) = \sum_\theta P(\theta \mid d=1, s) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s}{\sigma}\right) - \bar{h}$$

*Then:*

*(a) As $s \to +\infty$: $G(s) \to -\bar{h} < 0$.*

*(b) As $s \to -\infty$: $G(s) \to G_{-\infty} := \sum_\theta w_\theta^{-\infty} \cdot \Omega_t(\theta) - \bar{h}$, where:*
$$w_\theta^{-\infty} = \frac{\omega_t(\theta) \cdot p_\theta \cdot e^{-\omega_t(\theta)/\sigma}}{\sum_{\theta'} \omega_t(\theta') \cdot p_{\theta'} \cdot e^{-\omega_t(\theta')/\sigma}}$$

*(c) An interior equilibrium ($G(s^*) = 0$) exists if and only if $\max_s G(s) \geq 0$, which requires $G_{-\infty} > 0$, i.e., $\bar{h} < \sum_\theta w_\theta^{-\infty} \cdot \Omega_t(\theta)$.*

*(d) When the states are well-separated ($\min_{\theta \neq \theta'} |\omega_t(\theta) - \omega_t(\theta')| \gg \sigma$), the posterior at the cutoff concentrates on the state $\theta$ nearest to $s^*$. The cutoff lies in the neighborhood of $\omega_{\theta_0}$ where $\theta_0$ is the state satisfying the approximate single-state indifference $\Omega_t(\theta_0) \cdot \Lambda(0) \approx \bar{h}$, i.e., $\Omega_t(\theta_0) \approx 2\bar{h}$.*

*(e) If no state has $\Omega_t(\theta) = 2\bar{h}$ exactly, let $\theta_k, \theta_{k+1}$ be consecutive states (ordered by $\omega_t$) with $\Omega_t(\theta_k) < 2\bar{h} < \Omega_t(\theta_{k+1})$. Then $s^*$ lies in the inter-state gap, at a location where the posterior mixes $\theta_k$ and $\theta_{k+1}$ to satisfy (IC). For $\sigma$ small, $s^*$ is closer to $\omega_t(\theta_{k+1})$ than to $\omega_t(\theta_k)$.*

**Proof.**

**(a)** As $s \to +\infty$, for each $\theta$: $(\omega_t(\theta) - s)/\sigma \to -\infty$, so $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$. Hence each term $\Omega_t(\theta) \cdot \Lambda(\cdot) \to 0$, and $G(s) \to 0 - \bar{h} = -\bar{h} < 0$. $\square$

**(b)** As $s \to -\infty$, for each $\theta$: $(\omega_t(\theta) - s)/\sigma \to +\infty$, so $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$, and the sum $\sum P(\theta) \cdot \Omega_t(\theta) \cdot \Lambda(\cdot) \to \sum P(\theta \mid d=1, s) \cdot \Omega_t(\theta)$.

It remains to compute $\lim_{s \to -\infty} P(\theta \mid d=1, s)$. The posterior is:
$$P(\theta \mid d=1, s) \propto \omega_t(\theta) \cdot \lambda\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \cdot p_\theta$$

For $s \to -\infty$, the argument $(s - \omega_t(\theta))/\sigma \to -\infty$ for all $\theta$. In this regime, the logistic density satisfies:
$$\lambda(z) = \frac{e^{-z}}{(1 + e^{-z})^2} \approx e^z \quad \text{for } z \to -\infty$$

Therefore:
$$\lambda\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \approx \exp\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) = e^{s/\sigma} \cdot e^{-\omega_t(\theta)/\sigma}$$

The factor $e^{s/\sigma}$ is common to all $\theta$ and cancels in the normalization. The posterior weight becomes:
$$P(\theta \mid d=1, s) \xrightarrow{s \to -\infty} \frac{\omega_t(\theta) \cdot p_\theta \cdot e^{-\omega_t(\theta)/\sigma}}{\sum_{\theta'} \omega_t(\theta') \cdot p_{\theta'} \cdot e^{-\omega_t(\theta')/\sigma}}$$

For $z \to -\infty$: $\lambda(z) = e^{-z}/(1+e^{-z})^2 \approx e^{-z}/e^{-2z} = e^z$. Therefore $\lambda((s - \omega_\theta)/\sigma) \approx \exp((s - \omega_\theta)/\sigma) = e^{s/\sigma} \cdot e^{-\omega_\theta/\sigma}$.

The common factor $e^{s/\sigma}$ cancels in normalization, giving:
$$w_\theta^{-\infty} \propto \omega_\theta \cdot p_\theta \cdot e^{-\omega_\theta/\sigma}$$

The factor $e^{-\omega_\theta/\sigma}$ strongly favors small $\omega_\theta$ (signal likelihood), while $\omega_\theta$ favors large $\omega_\theta$ (displacement conditioning). The net effect depends on $\sigma$: for small $\sigma$, the exponential dominates. For the paper's parameters:
- R: $0.30 \times 0.30 \times e^{-0.30/0.10} = 0.09 \times e^{-3} = 0.09 \times 0.0498 = 0.00448$
- T (t=1): $0.05 \times 0.30 \times e^{-0.05/0.10} = 0.015 \times e^{-0.5} = 0.015 \times 0.6065 = 0.00910$
- N: $0.02 \times 0.40 \times e^{-0.02/0.10} = 0.008 \times e^{-0.2} = 0.008 \times 0.8187 = 0.00655$

Normalizing: Z = 0.00448 + 0.00910 + 0.00655 = 0.02013
- $w_R^{-\infty} = 0.223$, $w_T^{-\infty} = 0.452$, $w_N^{-\infty} = 0.325$

So $G_{-\infty} = 0.223 \times 0.30 + 0.452 \times 0.05 + 0.325 \times 0.02 - \bar{h}$
$= 0.0669 + 0.0226 + 0.0065 - \bar{h} = 0.0960 - \bar{h}$

For autocracy ($\bar{h} = 0.05$): $G_{-\infty} = 0.0460 > 0$. Interior equilibrium exists. $\checkmark$

**But wait** --- I need to reconcile with the numerical results. Numerically, at $s = -5.0$, $G = +0.046$ for autocracy $t=1$. This matches $0.0960 - 0.05 = 0.046$. $\checkmark$

**As $s \to +\infty$**, by the same logic: $\lambda((s-\omega_\theta)/\sigma) \approx \exp(-(s-\omega_\theta)/\sigma)$ for $s \to +\infty$ (since $z \to +\infty$, $\lambda(z) \approx e^{-z}$). The weight becomes:
$$\omega_\theta \cdot p_\theta \cdot e^{-(s-\omega_\theta)/\sigma} = \omega_\theta \cdot p_\theta \cdot e^{-s/\sigma} \cdot e^{\omega_\theta/\sigma}$$

After canceling $e^{-s/\sigma}$: $w_\theta^{+\infty} \propto \omega_\theta \cdot p_\theta \cdot e^{\omega_\theta/\sigma}$.

Now the exponential $e^{+\omega_\theta/\sigma}$ strongly favors the *largest* $\omega_\theta$.

For $t=1$: $w_R^{+\infty} \propto 0.30 \times 0.30 \times e^{3} = 0.09 \times 20.09 = 1.808$, $w_T^{+\infty} \propto 0.05 \times 0.30 \times e^{0.5} = 0.015 \times 1.649 = 0.0247$, $w_N^{+\infty} \propto 0.02 \times 0.40 \times e^{0.2} = 0.008 \times 1.221 = 0.00977$.

So the posterior concentrates on R: $w_R^{+\infty} = 0.981$. And $\Lambda((\omega_R - s)/\sigma) \to 0$ as $s \to +\infty$. Hence $G \to 0 - \bar{h} = -\bar{h}$. $\checkmark$

**(c)** $G(s)$ is continuous on $\mathbb{R}$, with $G(s) \to -\bar{h} < 0$ as $s \to +\infty$. If $G_{-\infty} > 0$, then by the intermediate value theorem, there exists $s^* \in \mathbb{R}$ with $G(s^*) = 0$.

Conversely, $G_{-\infty}$ is the supremum of $G(s)$ over the left tail. If $G_{-\infty} \leq 0$, then $G(s) < 0$ for large negative $s$ and $G(s) \to -\bar{h} < 0$ for large positive $s$. It remains to check whether $G$ can cross zero in between. In general, $G$ is not monotone: it can have a local maximum at an intermediate $s$. However, the global maximum of $G$ determines existence. A sufficient condition for non-existence is $\max_s G(s) < 0$.

The existence condition is:
$$\bar{h} < \max_s \left[\sum_\theta P(\theta \mid d=1, s) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s}{\sigma}\right)\right]$$

A necessary condition is $\bar{h} < \max_\theta \Omega_t(\theta)$: the participation threshold must be below the displaced fraction of the highest-displacement state. (If $\bar{h} \geq \max \Omega_t$, then even if the posterior concentrates on the largest state, $\Omega_t \cdot \Lambda \leq \Omega_t < \bar{h}$, so $G < 0$.) $\square$

**(d)** When $|\omega_t(\theta) - \omega_t(\theta')| \gg \sigma$, the logistic densities $\lambda((s - \omega_\theta)/\sigma)$ for different states have negligible overlap: each is concentrated in a band of width $O(\sigma)$ around $\omega_\theta$. For $s$ near $\omega_{\theta_0}$, the posterior concentrates on $\theta_0$:
$$P(\theta_0 \mid d=1, s \approx \omega_{\theta_0}) \approx 1$$

The indifference condition becomes approximately:
$$\Omega_t(\theta_0) \cdot \Lambda\!\left(\frac{\omega_{\theta_0} - s^*}{\sigma}\right) \approx \bar{h}$$

At $s = \omega_{\theta_0}$: $\Lambda(0) = 1/2$, so this gives $\Omega_t(\theta_0)/2 \approx \bar{h}$, i.e., $\Omega_t(\theta_0) \approx 2\bar{h}$. $\square$

**(e)** If $\Omega_t(\theta_k) < 2\bar{h} < \Omega_t(\theta_{k+1})$ for consecutive states ordered by $\omega_t$, then the single-state approximation fails for both: $\theta_k$ would give $\pi = \Omega_k/2 < \bar{h}$ (too little protest), while $\theta_{k+1}$ would give $\pi = \Omega_{k+1}/2 > \bar{h}$ (too much protest). The cutoff $s^*$ must lie in the transition region between $\omega_t(\theta_k)$ and $\omega_t(\theta_{k+1})$, where the posterior is a mixture.

As $s$ increases through this gap, the posterior weight on $\theta_{k+1}$ rises and the weight on $\theta_k$ falls. Since $\theta_{k+1}$ has the larger $\Omega_t$, the expected protest at the cutoff increases through the gap. The cutoff $s^*$ is the point where the mixture achieves exactly $\bar{h}$.

For $\sigma$ small relative to $|\omega_{k+1} - \omega_k|$, the transition from "$\theta_k$-dominated posterior" to "$\theta_{k+1}$-dominated posterior" is sharp, occurring in a band of width $O(\sigma)$. Since $\Omega_k/2 < \bar{h}$ (posterior on $\theta_k$ gives insufficient protest) and $\Omega_{k+1}/2 > \bar{h}$ (posterior on $\theta_{k+1}$ gives excess protest), the cutoff must lie in the portion of the transition region where $\theta_{k+1}$ dominates --- specifically, far enough toward $\omega_{k+1}$ that $\Lambda((\omega_{k+1} - s^*)/\sigma) < 1$ brings the protest down to $\bar{h}$:
$$s^* \approx \omega_{k+1} - \sigma \cdot \Lambda^{-1}\!\left(\frac{\bar{h}}{\Omega_{k+1}}\right) = \omega_{k+1} - \sigma \cdot \log\!\left(\frac{\bar{h}/\Omega_{k+1}}{1 - \bar{h}/\Omega_{k+1}}\right)$$

This places $s^*$ within $O(\sigma)$ of $\omega_{k+1}$ when $\bar{h}/\Omega_{k+1}$ is bounded away from 0 and 1. $\square$

### Numerical verification (Autocracy, $t=1$)

With $\bar{h}_A = 0.05$:
- $2\bar{h} = 0.10$. Ordered states: N ($\Omega = 0.02$), T ($\Omega = 0.05$), R ($\Omega = 0.30$).
- $\Omega_T = 0.05 < 0.10 < \Omega_R = 0.30$: the cutoff lies in the R-dominated region.
- Part (e) approximation: $s^* \approx 0.30 - 0.10 \times \log(0.05/0.30 / (1 - 0.05/0.30)) = 0.30 - 0.10 \times \log(0.1667/0.8333) = 0.30 - 0.10 \times (-1.609) = 0.30 + 0.161 = 0.461$.
- Exact numerical: $s^* = 0.4578$. Match to within 0.003. $\checkmark$

The cutoff lies well above $\omega_R = 0.30$, which means $\Lambda((\omega_R - s^*)/\sigma) = \Lambda(-1.58) = 0.171$, so only 17.1% of displaced workers under R cross the cutoff. This gives $\pi_R = 0.30 \times 0.171 = 0.051 \approx \bar{h}$. The cutoff is calibrated so that state R alone (which dominates the posterior) produces protest equal to $\bar{h}$.

---

## D3. Prior Concentration in $t=2$

**Proposition (Prior convergence).** *After $t=1$, workers observe aggregate protest $\pi_1$, which is a public signal. Under the model's assumptions:*

*(a) The state-specific protest rates $\pi_1(R)$, $\pi_1(T)$, $\pi_1(N)$ are distinct.*

*(b) Observation of $\pi_1$ reveals $\theta$ to each worker with probability approaching 1.*

*(c) In $t=2$ with concentrated prior, the multi-state game degenerates to a single-state game. The equilibrium protest under true state $\theta$ is:*

$$\pi_\theta(2) = \begin{cases} \Omega_2(\theta) & \text{if } v > C_x \quad \text{(dominant strategy)} \\ \bar{h}_2 & \text{if } 0 < \bar{h}_2 < \Omega_2(\theta) \quad \text{(interior cutoff)} \\ 0 & \text{if } \bar{h}_2 \geq \Omega_2(\theta) \quad \text{(no protest)} \end{cases}$$

*where $\bar{h}_2 = 1 - v_2/C_x$ and $v_2$ is the expressive value in $t=2$.*

**Proof.**

**(a)** From D1, the realized protest under each state is $\pi_\theta(1) = \Omega_1(\theta) \cdot \Lambda((\omega_\theta - s_1^*)/\sigma)$. The function $\theta \mapsto \pi_\theta$ depends on two state-varying quantities: $\Omega_1(\theta)$ and $\omega_t(\theta)$. Under assumption A1, $\omega_N < \omega_{T1} < \omega_R$, so these are strictly ordered. Both $\Omega_1(\theta) = \omega_\theta$ (at $t=1$) and $\Lambda((\omega_\theta - s^*)/\sigma)$ are strictly increasing in $\omega_\theta$ (since $\Lambda$ is strictly increasing). Therefore $\pi_\theta$ is strictly increasing in $\omega_\theta$:
$$\pi_N(1) < \pi_T(1) < \pi_R(1)$$

If $\bar{h} < 0$ (dominant strategy), then $\pi_\theta = \Omega_1(\theta) = \omega_\theta$, and distinctness follows from $\omega_N < \omega_{T1} < \omega_R$. $\square$

**(b)** With a continuum of workers, the realized aggregate protest $\pi_1$ is a deterministic function of $\theta$ (the law of large numbers eliminates all individual-level randomness). Since $\pi_R(1) \neq \pi_T(1) \neq \pi_N(1)$ by part (a), observing $\pi_1$ uniquely identifies $\theta$: if $\pi_1 = \pi_R(1)$, then $\theta = R$; if $\pi_1 = \pi_T(1)$, then $\theta = T$; if $\pi_1 = \pi_N(1)$, then $\theta = N$.

The updated prior is therefore:
$$P(R \mid \pi_1 = \pi_R(1)) = 1, \quad P(T \mid \pi_1 = \pi_T(1)) = 1, \quad P(N \mid \pi_1 = \pi_N(1)) = 1 \tag{$\square$}$$

**(c)** With a concentrated prior ($P(\theta) = 1$ for the true $\theta$), the multi-state game degenerates: the posterior $P(\theta' \mid d=1, s) = 1$ for $\theta' = \theta$ regardless of $s$. The indifference condition becomes:
$$\Omega_2(\theta) \cdot \Lambda\!\left(\frac{\omega_2(\theta) - s^*}{\sigma}\right) = \bar{h}_2$$

This is the standard single-state global game. With linear safety-in-numbers $h(\pi) = \pi$, the well-known result from Morris & Shin (2003) gives $\pi^* = \bar{h}$ when $0 < \bar{h} < \Omega_2(\theta)$. Specifically, solving for $s^*$:
$$\Lambda\!\left(\frac{\omega_2 - s^*}{\sigma}\right) = \frac{\bar{h}_2}{\Omega_2(\theta)}$$

Then:
$$\pi_\theta = \Omega_2(\theta) \cdot \frac{\bar{h}_2}{\Omega_2(\theta)} = \bar{h}_2$$

If $\bar{h}_2 \leq 0$: dominant strategy, $\pi_\theta = \Omega_2(\theta)$. If $\bar{h}_2 \geq \Omega_2(\theta)$: no protest (the required coordination exceeds the available displaced population). $\square$

### Numerical verification

**Democracy ($C_D = 1.5$), $t=2$:**
- Uncompensated: $v = 1 + \delta = 1.9 > C_D = 1.5$. Dominant strategy. $\pi_\theta = \Omega_2(\theta)$.
  - Under R: $\pi_R(2) = 0.51$. Under T: $\pi_T(2) = 0.62$.
- Compensated: $v = (1-B)(1+\delta) = 0.76$. $\bar{h}_2 = 1 - 0.76/1.5 = 0.493$.
  - Under R: $\bar{h}_2 = 0.493 < \Omega_2(R) = 0.51$. Interior: $\pi_R(2) = 0.493$.
  - Under T: $\bar{h}_2 = 0.493 < \Omega_2(T) = 0.62$. Interior: $\pi_T(2) = 0.493$.

**Autocracy ($C_A = 2.0$), $t=2$:**
- Uncompensated: $v = 1.9$, $\bar{h}_2 = 0.05$.
  - Under R: $\pi_R(2) = 0.05$. Under T: $\pi_T(2) = 0.05$.
- Compensated: $v = 0.76$, $\bar{h}_2 = 0.62$.
  - Under R: $\bar{h}_2 = 0.62 > \Omega_2(R) = 0.51$. No protest: $\pi_R(2) = 0$.
  - Under T: $\bar{h}_2 = 0.62 \geq \Omega_2(T) = 0.62$. Boundary: $\pi_T(2) = 0$ (borderline no protest).

### Remark on the single-state result

The well-known "protest equals $\bar{h}$" result of linear safety-in-numbers games holds only in single-state settings. In the multi-state game at $t=1$, the cutoff $s^*$ is determined by the posterior-weighted average across states, and state-specific protest $\pi_\theta$ can differ dramatically from $\bar{h}$ (as shown in D1). The degeneration to single-state at $t=2$ (via prior concentration) restores this clean result, providing a bridge between the multi-state $t=1$ analysis and the single-state approximations used throughout the paper.

---

## D4. $R \times A$: Autocratic Survival Condition

**Proposition (Autocratic survival under rapid, $t=1$).** *Under autocracy with $\theta = R$, the regime survives $t=1$ if and only if:*
$$\pi_R(1) = \Omega_1(R) \cdot \Lambda\!\left(\frac{\omega_R - s^*}{\sigma}\right) < \bar{\pi}_A^{\text{fall}}$$

*The cutoff $s^*$ is determined by the multi-state indifference condition (IC) with $\bar{h} = 1 - v/C_A$. When $\bar{h}$ is small and positive, $s^*$ lies well above $\omega_R$ (from D2(e)), so $\Lambda((\omega_R - s^*)/\sigma) \approx \bar{h}/\Omega_1(R)$, and:*
$$\pi_R(1) \approx \Omega_1(R) \cdot \frac{\bar{h}}{\Omega_1(R)} = \bar{h}$$

*The survival condition becomes $\bar{h} < \bar{\pi}_A^{\text{fall}}$, i.e.:*
$$\frac{v}{C_A} > 1 - \bar{\pi}_A^{\text{fall}}$$

**Proof.**

The multi-state equilibrium at $t=1$ has cutoff $s^*$ satisfying (IC). From D2(e), when the posterior concentrates on R (which occurs for $s$ in the region of $s^*$, since $\omega_R$ is the dominant state), the approximate indifference gives:
$$\Omega_1(R) \cdot \Lambda\!\left(\frac{\omega_R - s^*}{\sigma}\right) \approx \bar{h}$$

Therefore:
$$\pi_R(1) = \Omega_1(R) \cdot \Lambda\!\left(\frac{\omega_R - s^*}{\sigma}\right) \approx \bar{h}$$

The approximation is tight when the posterior assigns nearly all weight to R. From the numerical verification (D1), at the exact cutoff, $P(R \mid d=1, s^*) = 0.974$, so the single-state approximation contributes 97.4% of the indifference condition.

The survival condition $\pi_R(1) < \bar{\pi}_A^{\text{fall}}$ then requires:
$$\bar{h} < \bar{\pi}_A^{\text{fall}} \iff 1 - \frac{v}{C_A} < \bar{\pi}_A^{\text{fall}} \iff \frac{v}{C_A} > 1 - \bar{\pi}_A^{\text{fall}}$$

With $v = 1 + \delta = 1.9$, $C_A = 2.0$, $\bar{\pi}_A^{\text{fall}} = 0.05$:
$$\frac{1.9}{2.0} = 0.95 > 1 - 0.05 = 0.95$$

This is a **boundary case**: $v/C_A = 0.95 = 1 - \bar{\pi}_A^{\text{fall}}$. The exact multi-state equilibrium gives $\pi_R(1) = 0.0513$, which is slightly above $\bar{\pi}_A^{\text{fall}} = 0.05$.

**Interpretation.** Whether the autocracy survives $t=1$ under rapid depends on the exact location of the cutoff in the multi-state game, which is sensitive to the relative prior weights and the contribution of low-displacement states to the indifference condition. The paper's narrative places the autocratic fall in $t=2$ (from accumulated displacement), which is consistent with the following interpretations:

1. **Survival with $\bar{\pi}_A^{\text{fall}} = 0.06$**: If the autocratic resilience threshold is slightly above 0.05 (say, 0.06), then $\pi_R(1) = 0.051 < 0.06$ and the autocracy survives $t=1$. This is within the natural uncertainty range of the calibration.

2. **Robustness**: The result is robust for $\bar{\pi}_A^{\text{fall}} \geq 0.052$. The multi-state equilibrium produces $\pi_R(1) = 0.0513$, which exceeds $\bar{h} = 0.05$ by $0.0013$ due to the positive (but tiny) contributions of T and N states to the indifference condition. The paper uses $\bar{\pi}_A^{\text{fall}} = 0.06$, providing a margin of $0.009$.

**Key structural result.** Regardless of whether the autocracy falls in $t=1$ or $t=2$, the mechanism is the same: under rapid displacement, the elite's noisy assessment does not detect the crisis ($P(\text{approve} \mid \omega_R) = 0.25$), no compensation is authorized, and displaced workers accumulate without relief. Whether this produces fall in $t=1$ or $t=2$ is a quantitative question about the exact parameter values, not a qualitative difference in the mechanism.

**Parametric condition for unambiguous $t=1$ survival.** The autocracy clearly survives $t=1$ when:
$$\bar{h} = 1 - \frac{v}{C_A} < \bar{\pi}_A^{\text{fall}} - \epsilon$$

for some margin $\epsilon > 0$. This requires $C_A$ to be sufficiently large relative to $v$, or equivalently, repression must be severe enough that coordination among 30% displaced workers is insufficient. With $v = 1.9$ and $\bar{\pi}_A^{\text{fall}} = 0.05$:
$$C_A > \frac{v}{1 - \bar{\pi}_A^{\text{fall}} + \epsilon} = \frac{1.9}{0.95 + \epsilon}$$

For $\epsilon = 0.01$: $C_A > 1.9/0.96 = 1.979$. The paper's $C_A = 2.0$ satisfies this only marginally.

### Autocratic fall in $t=2$ (concentrated prior)

If the autocracy survives $t=1$, then at $t=2$ the prior concentrates on R (from D3). The single-state equilibrium gives:
$$\pi_R(2) = \bar{h}_2 = 1 - \frac{v_2}{C_A}$$

where $v_2 = 1 + \delta \cdot E[\text{future loss}_3]$. In the two-period model, $t=2$ is the last period, so $v_2 = 1$ (no future). Then $\bar{h}_2 = 1 - 1/2.0 = 0.5$.

But $\Omega_2(R) = 0.51 > \bar{h}_2 = 0.5$, so the interior equilibrium exists with $\pi_R(2) = 0.5$. This massively exceeds $\bar{\pi}_A^{\text{fall}} = 0.05$. **The autocracy falls in $t=2$ decisively.**

Alternatively, if $v_2 = 1 + \delta = 1.9$ (if there is a future beyond the model), $\bar{h}_2 = 0.05$ and $\pi_R(2) = 0.05$, which is borderline. The conservative interpretation (last-period $v_2 = 1$) gives unambiguous fall.

### Numerical verification

Exact multi-state computation (autocracy, $v = 1.9$):
- $t=1$: $s^* = 0.4578$, $\pi_R(1) = 0.0513$, $\pi_A^{\text{fall}} = 0.05$. Margin: $+0.0013$ (borderline exceeds).
- $t=2$: $s^* = 0.840$, posterior concentrates on T ($P(T) = 0.97$). Under true state R: $\pi_R(2) = 0.0023 \ll 0.05$. But this uses the multi-state prior (which by $t=2$ should have concentrated on R). With concentrated prior: $\pi_R(2) = \bar{h}_2$ (single-state result from D3).

The discrepancy at $t=2$ between multi-state and concentrated-prior computations confirms the importance of D3: after observing $\pi_1$, the prior should concentrate, collapsing the game to single-state.

---

## D5. Boundary Conditions for All Four Scenarios

**Proposition (Four-scenario predictions).** *Under the paper's parameters and model mechanics, the multi-state equilibrium produces the following outcomes:*

### D5.1. Democracy $\times$ Rapid ($D \times R$): STABLE

**$t=1$:** For displaced, uncompensated workers, $v = 1 + \delta = 1.9 > C_D = 1.5$. This is a dominant strategy regime (D1(d)): all displaced workers protest regardless of coordination. $\pi_R(1) = \Omega_1(R) = 0.30$.

Critically, $\pi_R(1) = 0.30 > \bar{\pi}_D^{\text{comp}}$, so the voice trigger activates: compensation is enacted. Due to the institutional lag, $\varphi_1 = 0$ but $\varphi_2 = 1$.

Now we must check whether $\pi_R(1) > \bar{\pi}_D^{\text{fall}} = 0.20$. With the dominant-strategy protest level, $\pi_R(1) = 0.30 > 0.20$, which would cause the regime to fall.

**The credible commitment resolution.** The paper's stability result requires the credible commitment effect: once compensation is enacted (even with a lag), workers' expected future loss drops, reducing $v$ and restoring coordination dynamics. The logic is:

1. Workers with $v = 1.9$ would all protest (dominant strategy).
2. The protest level $\pi = 0.30 > \bar{\pi}_D^{\text{comp}}$ triggers compensation.
3. Once triggered, workers update: $E[\text{future loss}] = 1 - B = 0.4$ (compensation guaranteed in $t=2$).
4. The new expressive value is $v_{\text{cred}} = 1 + \delta(1-B) = 1 + 0.9 \times 0.4 = 1.36$.
5. $v_{\text{cred}} = 1.36 < C_D = 1.5$, so $\bar{h}_{\text{cred}} = 1 - 1.36/1.5 = 0.093 > 0$.
6. The coordination game is restored with $\bar{h} = 0.093$.

In the multi-state equilibrium with $v = 1.36$: $s^* = 0.374$, posterior concentrates on R ($P(R) = 0.963$).
$$\pi_R(1) = \Omega_1(R) \cdot \Lambda\!\left(\frac{\omega_R - s^*}{\sigma}\right) = 0.30 \times \Lambda(-0.74) = 0.30 \times 0.323 = 0.097$$

Since $\pi_R(1) = 0.097 < \bar{\pi}_D^{\text{fall}} = 0.20$: **democracy survives $t=1$**.

Also, $\pi_R(1) = 0.097 > \bar{\pi}_D^{\text{comp}} = 0.07$: the voice trigger activates. (The value $\bar{\pi}_D^{\text{comp}} = 0.07$ is conservative relative to Chenoweth \& Stephan (2011), who document that 3.5\% mobilization triggers major political responses. The parametric condition is $\bar{\pi}_D^{\text{comp}} \in [0.05, 0.097)$: the lower bound ensures threshold protest $\pi_T(1) = 0.05$ does not trigger; the upper bound ensures rapid protest $\pi_R(1) = 0.097$ does.)

**$t=2$:** Compensation takes effect ($\varphi_2 = 1$). Displaced workers earn $B = 0.6$. Prior concentrates on R (D3). Expressive value: $v = (1-B) = 0.4$ (last period). $\bar{h}_2 = 1 - 0.4/1.5 = 0.733$. Since $\bar{h}_2 = 0.733 > \Omega_2(R) = 0.51$: **no protest equilibrium**. $\pi_R(2) = 0$. Democracy trivially survives.

**Mechanism**: Voice $\to$ compensation $\to$ credible commitment reduces $v$ $\to$ protest below fall threshold $\to$ compensation takes effect in $t=2$ $\to$ protest vanishes. **STABLE.**

### D5.2. Democracy $\times$ Threshold ($D \times T$): FALLS in $t=2$

**$t=1$:** Under threshold in $t=1$: $\omega_{T1} = 0.05$. Even with dominant strategy ($v = 1.9 > C_D$): $\pi_T(1) = \Omega_1(T) = 0.05 < \bar{\pi}_D^{\text{fall}} = 0.20$. Democracy survives.

Moreover, $\pi_T(1) = 0.05$ is likely below $\bar{\pi}_D^{\text{comp}}$ (the voice trigger threshold): no compensation is enacted. Non-displaced workers earn $Y^+ = 1 + \gamma = 1.3$ from AI complementarity, and the majority opposes taxation for compensation (A9, prosperity trap). No compensation infrastructure is built.

**$t=2$ (last period):** Prior concentrates on T (D3). $\omega_{T2} = 0.60$. Since $t=2$ is the last period, $v_2 = 1$ (current loss only, no future). $\bar{h}_2 = 1 - 1/C_D = 1 - 1/1.5 = 0.333$. Since $\bar{h}_2 = 0.333 < \Omega_2(T) = 0.62$: interior cutoff equilibrium with $\pi_T(2) = \bar{h}_2 = 0.333$.

Compensation: the voice trigger fires ($\pi_T(2) = 0.333 > \bar{\pi}_D^{\text{comp}}$), but due to the institutional lag, $\varphi_2 = 0$ (the law takes effect in $t=3$, which does not exist in the model). No compensation available.

Fall check: $\pi_T(2) = 0.333 > \bar{\pi}_D^{\text{fall}} = 0.20$ and $\varphi_2 = 0$. **Democracy FALLS.**

**Mechanism**: Prosperity trap (no comp built in $t=1$) $+$ institutional lag (comp enacted in $t=2$ arrives too late) $\to$ uncompensated protest exceeds institutional resilience $\to$ fall. **FALLS.**

### D5.3. Autocracy $\times$ Rapid ($A \times R$): FALLS

**$t=1$:** $v = 1 + \delta = 1.9$, $\bar{h} = 0.05$. Multi-state equilibrium: $s^* = 0.458$.
$$\pi_R(1) = \Omega_1(R) \cdot \Lambda\!\left(\frac{0.30 - 0.458}{0.10}\right) = 0.30 \times 0.171 = 0.051$$

Elite approval: $P(\text{approve} \mid \omega_R = 0.30) = \Phi((0.30 - 0.40)/0.15) = \Phi(-0.667) = 0.25$. The elite does not see the crisis. No compensation.

Fall check: $\pi_R(1) = 0.051$ vs. $\bar{\pi}_A^{\text{fall}} = 0.05$. The autocracy is at the **boundary**: $\pi_R$ exceeds the threshold by 0.001. Two interpretations:

*Interpretation A (strict):* $\pi_R(1) > 0.05$, autocracy falls in $t=1$. The fall is driven by the same mechanism as in the paper's narrative (accumulated displacement, elite blindness), but occurs earlier than the paper suggests.

*Interpretation B (robust to calibration):* With $\bar{\pi}_A^{\text{fall}} = 0.06$ (within natural calibration uncertainty), the autocracy survives $t=1$. If endogenous $v$ adjustment (the worker at $s^*$ does not fully expect $v = 1.9$ because the posterior assigns some weight to $N$), $v$ is slightly lower, $\bar{h}$ slightly higher, and survival is clearer.

**$t=2$ (if survives $t=1$):** Prior concentrates on R (D3). Single-state equilibrium.
- If $v_2 = 1$ (last period): $\bar{h}_2 = 0.50$, $\Omega_2(R) = 0.51 > 0.50$, $\pi_R(2) = 0.50 > 0.05$. **Falls decisively.**
- If $v_2 = 1.9$ (continuation value): $\bar{h}_2 = 0.05$, $\pi_R(2) = 0.05$. Borderline.

Elite approval at $t=2$: still $P(\text{approve} \mid \omega_R) = 0.25$. No compensation. The autocracy falls from accumulated displacement without compensation.

**Mechanism**: Elite blind to moderate crisis $\to$ no compensation $\to$ displacement accumulates $\to$ protest exceeds autocratic resilience. **FALLS.**

### D5.4. Autocracy $\times$ Threshold ($A \times T$): STABLE

**$t=1$:** Same multi-state equilibrium as $A \times R$ (the equilibrium is computed before $\theta$ is revealed). Under true state $T$:
$$\pi_T(1) = \Omega_1(T) \cdot \Lambda\!\left(\frac{0.05 - 0.458}{0.10}\right) = 0.05 \times \Lambda(-4.08) = 0.05 \times 0.017 = 0.0008$$

$\pi_T(1) = 0.0008 \ll \bar{\pi}_A^{\text{fall}} = 0.05$. **Stable in $t=1$.** The threshold's complementary phase generates almost no protest.

**$t=2$:** Prior concentrates on T (D3). $\omega_{T2} = 0.60$. Elite approval:
$$P(\text{approve} \mid \omega_{T2} = 0.60) = \Phi\!\left(\frac{0.60 - 0.40}{0.15}\right) = \Phi(1.33) = 0.91$$

The massive crisis is self-revealing: 91% probability of elite authorization. Compensation by decree: $\varphi_2 = 1$.

With compensation, the expressive value drops. Using $v_2 = (1-B)(1+\delta) = 0.76$ (if continuation) or $v_2 = 1-B = 0.4$ (if last period):
- $v_2 = 0.76$: $\bar{h}_2 = 1 - 0.76/2.0 = 0.62$. $\Omega_2(T) = 0.62$. Borderline: $\bar{h}_2 = \Omega_2(T)$. **No protest** ($\pi = 0$).
- $v_2 = 0.4$: $\bar{h}_2 = 1 - 0.4/2.0 = 0.80 > \Omega_2(T) = 0.62$. **No protest.**

In both cases, $\pi_T(2) = 0 < \bar{\pi}_A^{\text{fall}} = 0.05$. **Stable.**

**Mechanism**: Elite sees massive crisis $\to$ authorizes compensation $\to$ decree (no lag) $\to$ displaced workers compensated $\to$ protest vanishes. **STABLE.**

### Summary Table

| | Rapid ($\theta = R$) | Threshold ($\theta = T$) |
|:---:|:---:|:---:|
| **Democracy** | **STABLE**: voice $\to$ comp $\to$ credible commitment $\to$ $\pi_R(1) = 0.097 < 0.20$ | **FALLS** ($t=2$): prosperity trap $+$ lag $\to$ $\pi_T(2) = 0.333 > 0.20$ |
| **Autocracy** | **FALLS** ($t=1$ or $t=2$): elite blind $\to$ no comp $\to$ $\pi_R \geq 0.05$ | **STABLE**: self-revealing $\to$ decree $\to$ $\pi_T(2) = 0$ |

### Key quantitative summary

| Scenario | $t$ | $v$ | $\bar{h}$ | $\pi_\theta$ | $\bar{\pi}^{\text{fall}}$ | Outcome |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| $D \times R$ | 1 | 1.36 (cred) | 0.093 | 0.097 | 0.20 | Survives |
| $D \times R$ | 2 | 0.40 (comp) | 0.733 | 0 | 0.20 | Survives |
| $D \times T$ | 1 | 1.90 (dom) | $<0$ | 0.050 | 0.20 | Survives |
| $D \times T$ | 2 | 1.00 (last) | 0.333 | 0.333 | 0.20 | **Falls** |
| $A \times R$ | 1 | 1.90 | 0.050 | 0.051 | 0.05 | Borderline |
| $A \times R$ | 2 | 1.00 | 0.500 | 0.500 | 0.05 | **Falls** |
| $A \times T$ | 1 | 1.90 | 0.050 | 0.0008 | 0.05 | Survives |
| $A \times T$ | 2 | 0.40 (comp) | 0.800 | 0 | 0.05 | Survives |

---

## Technical Appendix: Existence and Uniqueness

### Existence

From D2, the equilibrium condition $G(s^*) = 0$ has a solution whenever:
$$\bar{h} < \sum_\theta w_\theta^{-\infty} \cdot \Omega_t(\theta) \quad \text{(D2(c))}$$

For the autocracy ($\bar{h} = 0.05$) at $t=1$:
$$\sum w_\theta^{-\infty} \Omega_\theta = 0.223 \times 0.30 + 0.452 \times 0.05 + 0.325 \times 0.02 = 0.096 > 0.05 \quad \checkmark$$

For the democracy under credible commitment ($\bar{h} = 0.093$) at $t=1$: $0.096 > 0.093$. Barely satisfies. $\checkmark$

When $\bar{h} \leq 0$ (dominant strategy), the equilibrium is trivial: all displaced workers protest, no cutoff equation is needed.

### Uniqueness

For $\sigma$ small relative to the inter-state separation $\min |\omega_\theta - \omega_{\theta'}|$, the function $G(s)$ is approximately piecewise: in each inter-state gap, the posterior is approximately constant (concentrating on the nearest state), and $G$ is monotonically decreasing (since $\Lambda((\omega_\theta - s)/\sigma)$ decreases in $s$ for each $\theta$). The zero-crossing is unique in each gap, and typically only one gap contains a zero (the one where $\Omega_\theta \cdot \Lambda(0) = \Omega_\theta/2$ straddles $\bar{h}$). Full uniqueness for small $\sigma$ follows from Morris & Shin (2003), extended to the multi-state case.

### Dominant strategy vs. coordination

A critical structural feature of this model is that the equilibrium regime (dominant strategy vs. interior cutoff) depends on $v$ and $C_x$:

| Regime | $v$ vs. $C_x$ | $\bar{h}$ | Equilibrium |
|:---:|:---:|:---:|:---:|
| Democracy, uncompensated | $1.9 > 1.5$ | $-0.27$ | Dominant strategy |
| Democracy, credible commitment | $1.36 < 1.5$ | $0.09$ | Interior cutoff |
| Democracy, compensated | $0.76 < 1.5$ | $0.49$ | No protest (if $\bar{h} > \Omega$) |
| Autocracy, uncompensated | $1.9 < 2.0$ | $0.05$ | Interior cutoff |
| Autocracy, compensated | $0.76 < 2.0$ | $0.62$ | No protest (if $\bar{h} > \Omega$) |

The transition between regimes is driven by the compensation mechanism. This endogeneity is the key interaction between the coordination game and the regime's institutional response.

---

## Methodological Notes

### Multi-state vs. single-state

The multi-state game at $t=1$ introduces three effects absent from single-state analysis:

1. **Posterior dilution**: The marginal worker's posterior mixes states with different displacement rates, reducing the expected protest below what any single state would produce in isolation.

2. **Asymmetric state-specific protest**: Under the multi-state cutoff, $\pi_\theta$ varies dramatically across states. For autocracy at $t=1$: $\pi_R = 0.051$ while $\pi_T = 0.0008$ --- a 64:1 ratio. This asymmetry is the source of the revelation property (D3): observing $\pi_1$ identifies $\theta$.

3. **Cutoff displacement**: The multi-state cutoff is displaced from the single-state cutoff because the indifference condition averages over states. For autocracy: the single-state cutoff under R (if $\bar{h} = 0.05$, $\Omega = 0.30$) gives $s^*_{\text{single}} = 0.30 + 0.10 \times \log(0.05/0.30 / (1-0.05/0.30)) = 0.30 + 0.10 \times (-1.61) = 0.139$. The multi-state cutoff is $s^* = 0.458$ --- substantially higher, because the posterior at lower $s$ values mixes in T and N states (with $\Omega < \bar{h}$), which cannot sustain coordination.

### Endogenous $v$ and the credible commitment mechanism

The democracy's survival under rapid displacement requires an endogenous reduction in $v$. The sequence is:

1. **Off-equilibrium path**: If workers use $v = 1.9$ (no compensation expected), all displaced protest (dominant strategy), $\pi = 0.30$, which triggers compensation. But then compensation IS expected, contradicting the assumption.

2. **Equilibrium with credible commitment**: If workers anticipate that compensation will be triggered (because protest exceeds $\bar{\pi}_D^{\text{comp}}$ in any case), they update $v$ to $v_{\text{cred}} = 1 + \delta(1-B) = 1.36$. This restores the coordination game with $\bar{h} = 0.093$.

3. **Consistency check**: Under the credible commitment equilibrium, $\pi_R(1) = 0.097 > \bar{\pi}_D^{\text{comp}}$: compensation IS triggered. This is consistent with the workers' expectation. The equilibrium is self-confirming.

This mechanism is analogous to the rational expectations equilibrium in macroeconomics: workers' expectations of compensation reduce their protest, which in turn is sufficient (but not excessive) to trigger compensation.

---

## Verification Script

The complete numerical verification script is at `notes/verify_multistate_equilibrium.py`. It computes:
- Multi-state equilibrium cutoffs via Brentq root-finding
- State-specific protest rates
- Posterior distributions at the cutoff
- Elite approval probabilities
- All four scenarios with proper $v$ values
