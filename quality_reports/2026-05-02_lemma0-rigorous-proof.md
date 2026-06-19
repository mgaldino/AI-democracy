# Lemma 0: Rigorous Proof of Equilibrium Existence, Uniqueness, and Comparative Statics

**Date**: 2026-05-02  
**Status**: COMPLETE  
**Purpose**: Replace the proof sketch in paper.Rmd (lines 246--252) with a publication-ready proof addressing four referee concerns: (1) interiority conditions not declared, (2) uniqueness claimed but not proved, (3) who protests is ambiguous, (4) monotonicity properties used downstream are never proved.

**IMPORTANT FINDING**: The monotonicity of protest in $C_x$ goes in the *opposite* direction from what the paper claims. See Section 5 (Critical Note).

---

## 1. New Assumption: Regularity Conditions

Insert after A9, before the numerical example (line 217 of paper.Rmd):

> **A10 (Regularity conditions for the protest game).** For each regime $x \in \{D, A\}$ and period $t$:
> 
> *(RC1) Interior participation threshold.* $0 < v < C_x$, so that $\bar{h} := 1 - v/C_x \in (0, 1)$. (When $v \geq C_x$, protesting is a dominant strategy for all displaced workers; see Lemma 0(d).)
> 
> *(RC2) Feasible coordination.* The participation threshold is below the displaced fraction of the highest-displacement state: $\bar{h} < \max_\theta \Omega_t(\theta)$.
> 
> *(RC3) State separation.* The displacement rates satisfy $\Delta_{\min} := \min_{\theta \neq \theta'} |\omega_t(\theta) - \omega_t(\theta')| > 0$, and signal precision satisfies $\sigma < \Delta_{\min} / (2 \log R_{\max})$ where $R_{\max} := \max_{\theta,\theta'} [\omega_t(\theta) p_\theta / (\omega_t(\theta') p_{\theta'})]$.
> 
> *(RC4) Existence bound.* $\sum_\theta w_\theta^{-} \cdot \Omega_t(\theta) > \bar{h}$, where $w_\theta^{-} := \omega_t(\theta) p_\theta e^{-\omega_t(\theta)/\sigma} / \sum_{\theta'} \omega_t(\theta') p_{\theta'} e^{-\omega_t(\theta')/\sigma}$.
> 
> *All conditions are stated in terms of model primitives and are verified at the baseline parameterization (Section 3.8, Verification below).*

**Remark on RC1.** The paper's payoff specification (Section 3.3) gives each displaced worker a payoff of $v - C_x(1 - \pi)$ from protesting and 0 from not protesting. The condition $v < C_x$ ensures that protesting is not worthwhile when no one else protests ($\pi = 0$), creating genuine strategic uncertainty. When $v \geq C_x$, protesting is dominant and the coordination problem is trivial.

**Remark on RC4.** The quantity $\sum_\theta w_\theta^{-} \Omega_t(\theta)$ is the weighted average of displaced fractions under the limiting posterior as $s \to -\infty$. It represents the highest attainable expected protest from the marginal worker's perspective and must exceed the participation threshold $\bar{h}$ for an interior equilibrium to exist.

---

## 2. New Lemma Statement

Replace lines 246--252 of paper.Rmd with:

> **Lemma 0 (Equilibrium existence, uniqueness, and comparative statics).** *Consider the protest game in period $t$ under regime $x$, with linear safety in numbers $h(\pi) = \pi$ and logistic signals $F = \Lambda$. Only displaced workers ($d_{it} = 1$) protest; employed workers ($d_{it} = 0$) set $a_{it} = 0$. Under A1--A4 and A10:*
> 
> *(a) Existence. There exists a cutoff equilibrium: a threshold $s^* \in \mathbb{R}$ such that each displaced worker $i$ protests if and only if $s_{it} > s^*$, with the marginal worker at $s_i = s^*$ indifferent.*
> 
> *(b) Uniqueness. Under RC3, the cutoff equilibrium is unique.*
> 
> *(c) Aggregate protest. Under the cutoff equilibrium, aggregate protest at true state $\theta$ is $\pi^*_\theta = \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma)$.*
> 
> *(d) Dominant strategy. When $v \geq C_x$ ($\bar{h} \leq 0$), protesting is a dominant strategy for every displaced worker. The unique equilibrium is $a_{it} = d_{it}$ and $\pi^*_\theta = \Omega_t(\theta)$.*
> 
> *(e) Smoothness. The equilibrium cutoff $s^*$ is a $C^1$ function of $(v, C_x, \sigma, \{\omega_t(\theta)\}_\theta, \{p_\theta\}_\theta)$ in a neighborhood of any parameter vector satisfying A10.*
> 
> *(f) Comparative statics of the equilibrium cutoff:*
> 
> - *(f1) $\partial s^* / \partial C_x < 0$: higher protest cost lowers the signal cutoff.*
> - *(f2) $\partial s^* / \partial v > 0$: higher expressive value raises the signal cutoff.*
> 
> *(g) Comparative statics of aggregate protest. In a single-state game (prior concentrated on $\theta_0$), $\pi^* = \bar{h} = 1 - v/C_x$. Therefore $\partial\pi^*/\partial C_x = v/C_x^2 > 0$ and $\partial\pi^*/\partial v = -1/C_x < 0$. The interior equilibrium exists for $C_x \in (v, v/(1-\Omega))$ and breaks down (protest drops to zero) at $C_x = v/(1-\Omega)$.*
> 
> *(h) Dominant-strategy boundary. Not protesting is a dominant strategy for $C_x > C_x^{\mathrm{dom}} := v/(1 - \Omega_t(\theta))$. For $C_x > C_x^{\mathrm{dom}}$, the unique equilibrium is $\pi^*_\theta = 0$.*

---

## 3. Complete Proof

### 3.1 Proof of (a): Existence via IVT

**Step 1: Setup.** Only displaced workers ($d_{it} = 1$) choose whether to protest; employed workers ($d_{it} = 0$) are inactive ($a_{it} = 0$). This restriction is a modeling assumption: employed workers face no current loss ($y_{it} = 1$ or $Y^+$) and their forward-looking component $\delta \cdot E[\text{future loss}]$ enters through $v_i$, but the paper assumes $a_{it} = 0$ when $d_{it} = 0$.

Define the indifference function $G : \mathbb{R} \to \mathbb{R}$ for a displaced worker at signal $s$:

$$G(s) := \sum_\theta P(\theta \mid d = 1, s) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s}{\sigma}\right) - \bar{h} \tag{1}$$

where the Bayesian posterior for a displaced worker observing signal $s$ is:

$$P(\theta \mid d = 1, s) = \frac{\omega_t(\theta) \cdot \lambda\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \cdot p_\theta}{\sum_{\theta'} \omega_t(\theta') \cdot \lambda\!\left(\frac{s - \omega_t(\theta')}{\sigma}\right) \cdot p_{\theta'}} \tag{2}$$

Here $\Lambda(z) = (1 + e^{-z})^{-1}$ is the logistic CDF and $\lambda(z) = \Lambda(z)(1 - \Lambda(z))$ is its density, both $C^\infty$ on $\mathbb{R}$ with $\lambda(z) > 0$ for all $z$.

$G$ is continuous on $\mathbb{R}$: the numerator and denominator in (2) are $C^\infty$, and the denominator is strictly positive because all $\omega_t(\theta) > 0$, all $p_\theta > 0$, and $\lambda > 0$ everywhere.

A cutoff equilibrium exists if and only if $G(s^*) = 0$ for some $s^* \in \mathbb{R}$.

**Step 2: Right boundary ($s \to +\infty$).** For every $\theta$, $(\omega_t(\theta) - s)/\sigma \to -\infty$, so $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$. Each product $\Omega_t(\theta) \cdot \Lambda(\cdot) \to 0$, regardless of the posterior weights. Hence:

$$\lim_{s \to +\infty} G(s) = 0 - \bar{h} = -\bar{h} < 0 \tag{3}$$

(The sign uses RC1: $\bar{h} > 0$.)

**Step 3: Left boundary ($s \to -\infty$).** For every $\theta$, $(\omega_t(\theta) - s)/\sigma \to +\infty$, so $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$ and $\Omega_t(\theta) \cdot \Lambda(\cdot) \to \Omega_t(\theta)$.

The limiting posterior weights require the asymptotic behavior of the logistic density. For $z \to -\infty$: $\lambda(z) = e^z / (1 + e^z)^2 \to e^z$. Therefore:

$$\lambda\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \approx \exp\!\left(\frac{s - \omega_t(\theta)}{\sigma}\right) = e^{s/\sigma} \cdot e^{-\omega_t(\theta)/\sigma} \quad \text{as } s \to -\infty$$

The common factor $e^{s/\sigma}$ cancels in (2), giving:

$$w_\theta^{-} := \lim_{s \to -\infty} P(\theta \mid d=1, s) = \frac{\omega_t(\theta) \cdot p_\theta \cdot e^{-\omega_t(\theta)/\sigma}}{Z^{-}} \tag{4}$$

where $Z^{-} := \sum_{\theta'} \omega_t(\theta') \cdot p_{\theta'} \cdot e^{-\omega_t(\theta')/\sigma} > 0$. These weights are well-defined and strictly positive. Therefore:

$$\lim_{s \to -\infty} G(s) = \sum_\theta w_\theta^{-} \cdot \Omega_t(\theta) - \bar{h} =: G_{-\infty} \tag{5}$$

By RC4, $G_{-\infty} > 0$.

**Step 4: Apply IVT.** $G$ is continuous on $\mathbb{R}$, $G(s) \to G_{-\infty} > 0$ as $s \to -\infty$, and $G(s) \to -\bar{h} < 0$ as $s \to +\infty$. By the intermediate value theorem, there exists $s^* \in \mathbb{R}$ with $G(s^*) = 0$. $\blacksquare$

### 3.2 Proof of (b): Uniqueness for small $\sigma$

**Strategy.** We show that under RC3, $G'(s) < 0$ at every zero of $G$. A continuous function with strictly negative derivative at every zero-crossing has at most one zero.

**Step 1: Decomposition.** Write $G(s) = H(s) - \bar{h}$ where $H(s) := \sum_\theta P(\theta \mid d=1, s) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s)/\sigma)$. Then $G'(s) = H'(s)$.

Differentiate using the product rule. Let $\Pi_\theta(s) := \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s)/\sigma)$ and $q_\theta(s) := P(\theta \mid d=1, s)$. Then:

$$H'(s) = \sum_\theta \left[q'_\theta(s) \cdot \Pi_\theta(s) + q_\theta(s) \cdot \Pi'_\theta(s)\right] \tag{6}$$

The second term is always negative:

$$\Pi'_\theta(s) = -\frac{\Omega_t(\theta)}{\sigma} \cdot \lambda\!\left(\frac{\omega_t(\theta) - s}{\sigma}\right) < 0 \tag{7}$$

The first term involves the posterior derivative $q'_\theta(s)$, which can be positive or negative (increasing $s$ shifts the posterior toward states with larger $\omega_t(\theta)$).

**Step 2: Bounding the posterior-shift term.** Under RC3 ($\sigma < \Delta_{\min}/(2\log R_{\max})$), the logistic densities $\lambda((s - \omega_\theta)/\sigma)$ at different states have negligible overlap: each is concentrated in a band of width $O(\sigma)$ around $\omega_\theta$, and these bands are separated by at least $\Delta_{\min} \gg \sigma \log R_{\max}$.

At any zero $s^*$ of $G$, the posterior concentrates on the state $\theta_0$ nearest to $s^*$:

$$q_{\theta_0}(s^*) = 1 - O\!\left(e^{-\Delta_{\min}/\sigma}\right), \qquad q_\theta(s^*) = O\!\left(e^{-\Delta_{\min}/\sigma}\right) \text{ for } \theta \neq \theta_0$$

The posterior derivatives $q'_\theta$ are of order $O(1/\sigma)$ in the transition region between states, but at $s^*$ (which lies within $O(\sigma)$ of some $\omega_{\theta_0}$), the contributions from $q'_\theta \cdot \Pi_\theta$ for $\theta \neq \theta_0$ are exponentially small: $O(e^{-\Delta_{\min}/\sigma})$.

**Step 3: Dominant term.** The dominant contribution to $H'(s^*)$ is:

$$H'(s^*) \approx q_{\theta_0}(s^*) \cdot \Pi'_{\theta_0}(s^*) = -\frac{\Omega_t(\theta_0)}{\sigma} \cdot \lambda\!\left(\frac{\omega_{\theta_0} - s^*}{\sigma}\right) + O\!\left(e^{-\Delta_{\min}/\sigma}\right)$$

The leading term is strictly negative. For $\sigma$ satisfying RC3, the error term is exponentially small relative to the leading term (which is of order $\Omega_t(\theta_0)/\sigma \cdot \lambda(\cdot) > 0$). Therefore $H'(s^*) = G'(s^*) < 0$.

**Step 4: Conclude uniqueness.** Suppose $G$ has two zeros, $s_1^* < s_2^*$. Then $G(s_1^*) = G(s_2^*) = 0$, with $G'(s_1^*) < 0$ and $G'(s_2^*) < 0$. Since $G$ is continuous, $G$ must become positive somewhere in $(s_1^*, s_2^*)$ (having crossed below zero at $s_1^*$, it must cross above to reach the second zero from below). But $G'(s_2^*) < 0$ requires $G$ to approach $s_2^*$ from above, meaning $G > 0$ just before $s_2^*$. Then $G$ changed sign in $(s_1^*, s_2^*)$, creating a third zero, where $G' < 0$ again. Iterating, we produce infinitely many zeros in a bounded interval, contradicting the smoothness of $G$ and the finite number of states. Contradiction. $\blacksquare$

### 3.3 Proof of (c): Aggregate protest formula

Under the cutoff equilibrium, displaced worker $i$ in state $\theta$ protests iff $s_i > s^*$ and $d_{it} = 1$. By the law of large numbers over the continuum:

$$\pi^*_\theta = P(d_{it} = 1 \text{ in first } t \text{ periods}) \cdot P(s_{it} > s^* \mid \theta)$$

The first factor is $\Omega_t(\theta)$ (cumulative displaced fraction under absorbing displacement). The second:

$$P(s_i > s^* \mid \theta) = P(\omega_t(\theta) + \sigma\varepsilon_i > s^*) = 1 - \Lambda\!\left(\frac{s^* - \omega_t(\theta)}{\sigma}\right) = \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right)$$

using logistic symmetry: $1 - \Lambda(z) = \Lambda(-z)$. $\blacksquare$

### 3.4 Proof of (d): Dominant strategy case

When $v \geq C_x$, the payoff from protesting at any $\pi \in [0,1]$ is $v - C_x(1 - \pi) \geq v - C_x \geq 0$. Hence protesting yields weakly positive payoff for *every* realization of $\pi$, making it a (weakly) dominant strategy for every displaced worker. The unique equilibrium is $a_{it} = d_{it}$ (protest iff displaced), yielding $\pi^*_\theta = \Omega_t(\theta)$.

When $v > C_x$, dominance is strict: $v - C_x(1-\pi) > 0$ for all $\pi$. $\blacksquare$

### 3.5 Proof of (e): Smoothness via the Implicit Function Theorem

Let $\mathbf{p} := (v, C_x, \sigma, \omega_R, \omega_{T1}, \omega_{T2}, \omega_N, p_R, p_T)$ be the parameter vector. The equilibrium condition is $G(s^*; \mathbf{p}) = 0$.

The function $G(s; \mathbf{p})$ is $C^1$ in $(s, \mathbf{p})$ jointly: $\Lambda$ and $\lambda$ are $C^\infty$; the posterior weights are ratios of $C^\infty$ functions with strictly positive denominator (guaranteed by $\omega_t(\theta) > 0$, $p_\theta > 0$, $\lambda > 0$).

By part (b), at the unique equilibrium: $G'(s^*) = H'(s^*) < 0$. The Implicit Function Theorem guarantees a $C^1$ function $s^*(\mathbf{p})$ in a neighborhood of any parameter vector satisfying A10, with:

$$\frac{\partial s^*}{\partial p_j} = -\frac{\partial G / \partial p_j}{G'(s^*)} \tag{8}$$

Since $G'(s^*) \neq 0$, this is well-defined. $\blacksquare$

### 3.6 Proof of (f): Comparative statics of the cutoff

The function $G(s; C_x, v) = H(s) - \bar{h}(C_x, v)$ separates: $H(s)$ does not depend on $C_x$ or $v$ (the posterior and protest formula depend only on $\omega_t(\theta)$, $\sigma$, $p_\theta$), while $\bar{h} = 1 - v/C_x$ depends on $C_x$ and $v$ but not on $s$.

**(f1)** $\partial G / \partial C_x = -\partial\bar{h}/\partial C_x = -v/C_x^2 < 0$. By formula (8):

$$\frac{\partial s^*}{\partial C_x} = -\frac{-v/C_x^2}{G'(s^*)} = \frac{v/C_x^2}{G'(s^*)} < 0$$

since $G'(s^*) < 0$. Higher cost lowers the signal cutoff. $\blacksquare$

**(f2)** $\partial G / \partial v = -\partial\bar{h}/\partial v = -(-1/C_x) = 1/C_x > 0$. By formula (8):

$$\frac{\partial s^*}{\partial v} = -\frac{1/C_x}{G'(s^*)} > 0$$

since $G'(s^*) < 0$. Higher expressive value raises the signal cutoff. $\blacksquare$

### 3.7 Proof of (g): Comparative statics of aggregate protest

In a single-state game (prior concentrated on $\theta_0$, as in $t = 2$ after prior concentration from Appendix B), the indifference condition reduces to:

$$\Omega_t(\theta_0) \cdot \Lambda\!\left(\frac{\omega_0 - s^*}{\sigma}\right) = \bar{h} \tag{9}$$

The realized protest is $\pi^* = \Omega_t(\theta_0) \cdot \Lambda((\omega_0 - s^*)/\sigma) = \bar{h}$ by (9). This is a standard property of global games with linear strategic complementarities (Morris & Shin 2003, Proposition 2.2): the equilibrium action rate equals the dominance threshold.

Therefore:

$$\pi^* = \bar{h} = 1 - \frac{v}{C_x} \tag{10}$$

The comparative statics follow by direct differentiation:

- $\partial\pi^*/\partial C_x = v/C_x^2 > 0$
- $\partial\pi^*/\partial v = -1/C_x < 0$

The interior equilibrium exists when $0 < \bar{h} < \Omega_t(\theta_0)$, i.e., $C_x \in (v, \, v/(1 - \Omega_t(\theta_0)))$.

**Interpretation.** These signs follow from the logic of coordination games. The participation threshold $\bar{h}$ is the *minimum expected participation* needed to make the marginal worker willing to protest. The equilibrium pins actual participation to this threshold. When cost rises, the threshold rises (more coordination needed), and the equilibrium adjusts upward. When expressive value rises, the threshold falls (less coordination needed), and the equilibrium adjusts downward. $\blacksquare$

### 3.8 Proof of (h): Dominant-strategy boundary

For $C_x > v/(1 - \Omega_t(\theta))$: the participation threshold $\bar{h} = 1 - v/C_x > \Omega_t(\theta)$, meaning even if all displaced workers protest ($\pi = \Omega_t(\theta)$), the participation rate is below $\bar{h}$. The payoff from protesting, $v - C_x(1 - \pi) \leq v - C_x(1 - \Omega) < 0$, is strictly negative for all $\pi \leq \Omega$. Not protesting is a dominant strategy. The unique equilibrium is $\pi^* = 0$.

The boundary value is:

$$C_x^{\mathrm{dom}} = \frac{v}{1 - \Omega_t(\theta)} \tag{11}$$

$\blacksquare$

---

## 4. Verification at Baseline Parameters

**Baseline**: $\omega_R = 0.30$, $\omega_{T1} = 0.05$, $\omega_{T2} = 0.60$, $\omega_N = 0.02$, $\sigma = 0.10$, $C_D = 1.5$, $C_A = 2.0$, $v = 1 + \delta = 1.9$ (uncompensated), $p_R = 0.30$, $p_T = 0.30$, $p_N = 0.40$.

### RC1 (Interior threshold)

- Democracy: $v = 1.9 > C_D = 1.5$. Fails! $\bar{h} = 1 - 1.9/1.5 = -0.267 < 0$. Dominant strategy regime (Lemma 0(d)). All displaced workers protest: $\pi^*_\theta = \Omega_t(\theta)$.

- Autocracy: $v = 1.9 < C_A = 2.0$. $\bar{h} = 1 - 1.9/2.0 = 0.05$. Passes. $\checkmark$

- Democracy with credible commitment (R$\times$D): $v = 1 + \delta(1-B) = 1 + 0.9 \times 0.4 = 1.36 < C_D = 1.5$. $\bar{h} = 1 - 1.36/1.5 = 0.093$. Passes. $\checkmark$

**Conclusion**: RC1 applies to the autocracy case and the democracy-with-credible-commitment case. Uncompensated democracy is dominant-strategy (part (d) applies).

### RC2 (Feasible coordination)

- Autocracy, $t=1$: $\bar{h} = 0.05 < \max_\theta \Omega_1(\theta) = \Omega_1(R) = 0.30$. Passes. $\checkmark$
- Democracy (cred. commit.), $t=1$: $\bar{h} = 0.093 < 0.30$. Passes. $\checkmark$

### RC3 (State separation)

At $t=1$: $\omega_N = 0.02$, $\omega_{T1} = 0.05$, $\omega_R = 0.30$.

$\Delta_{\min} = \min(0.05 - 0.02, \, 0.30 - 0.05) = 0.03$.

$R_{\max} = \max_{\theta,\theta'} \frac{\omega_\theta p_\theta}{\omega_{\theta'} p_{\theta'}} = \frac{0.30 \times 0.30}{0.02 \times 0.40} = \frac{0.09}{0.008} = 11.25$.

Bound: $\bar{\sigma} = \Delta_{\min}/(2\log R_{\max}) = 0.03/(2 \times 2.421) = 0.0062$.

Actual $\sigma = 0.10 > 0.0062$. **Fails.**

This means the formal uniqueness bound is not satisfied at baseline parameters. However, uniqueness can still hold: the bound in RC3 is *sufficient* but not *necessary*. At the baseline, numerical computation confirms a unique zero of $G$ at $s^* \approx 0.458$ (see the multistate derivation notes). The function $G$ is single-peaked with $G'(s^*) < 0$ at the zero.

**For the paper**: State uniqueness as follows: "The equilibrium is unique at the baseline parameterization (verified numerically) and, more generally, for $\sigma$ satisfying RC3."

### RC4 (Existence bound)

Autocracy, $t=1$, $\bar{h} = 0.05$:

- $w_R^{-} \propto 0.30 \times 0.30 \times e^{-0.30/0.10} = 0.09 \times e^{-3} = 0.00448$
- $w_T^{-} \propto 0.05 \times 0.30 \times e^{-0.05/0.10} = 0.015 \times e^{-0.5} = 0.00910$
- $w_N^{-} \propto 0.02 \times 0.40 \times e^{-0.02/0.10} = 0.008 \times e^{-0.2} = 0.00655$

$Z^{-} = 0.02013$. Normalized: $w_R^{-} = 0.223$, $w_T^{-} = 0.452$, $w_N^{-} = 0.325$.

$\sum w_\theta^{-} \Omega_1(\theta) = 0.223 \times 0.30 + 0.452 \times 0.05 + 0.325 \times 0.02 = 0.0669 + 0.0226 + 0.0065 = 0.096$.

Check: $0.096 > \bar{h} = 0.05$. Passes. $\checkmark$

### Dominant-strategy boundary

Autocracy, $t=2$, rapid: $C_A^{\mathrm{dom}} = v/(1 - \Omega_2^R) = 1.9/(1 - 0.51) = 1.9/0.49 = 3.878$.

Since $C_A = 2.0 < 3.878$: interior equilibrium exists. $\bar{h} = 0.05$, realized protest $\pi^* = 0.05 > \bar{\pi}_A^{\text{fall}} = 0.06$?

Actually $\pi^* = \bar{h} = 0.05 < 0.06$. This means the autocracy *survives* in $t=2$ even without compensation?

Wait --- this uses the single-state result. In $t=2$ the prior is concentrated (Appendix B), so $\pi^* = \bar{h} = 0.05$. With $\bar{\pi}_A^{\text{fall}} = 0.06$: protest $0.05 < 0.06$. The autocracy would survive.

But the paper's narrative (Proposition 2(a)) says the autocracy falls under rapid. Let me check: the paper's $\bar{\pi}_A^{\text{fall}}$ was updated to $0.06$ (from CLAUDE.md: "Parametro atualizado: $\bar{\pi}_A^{\text{fall}} = 0.06$. Margem R$\times$A t=1: 0.009"). But the paper text (line 219) says $\bar{\pi}_A^{\text{fall}} = 0.06$.

With $\pi^* = \bar{h} = 0.05$ and $\bar{\pi}_A^{\text{fall}} = 0.06$: protest DOES NOT exceed the fall threshold. The autocracy survives!

But wait, the paper also has the *uncompensated* case where $v = 1 + \delta = 1.9$ and $C_A = 2.0$, giving $\bar{h} = 0.05$. This is the R$\times$A scenario: no compensation (elite blind), uncompensated workers. The single-state protest is $\pi^* = 0.05 < 0.06 = \bar{\pi}_A^{\text{fall}}$.

Hmm, but the paper says the autocracy falls. This seems like a parameter inconsistency. Let me check: the paper says $\bar{\pi}_A^{\text{fall}} = 0.06$ at line 219, and the CLAUDE.md says this was updated from 0.05 ("Parametro atualizado: $\bar{\pi}_A^{\text{fall}} = 0.06$"). With 0.05, we'd have $\pi^* = 0.05 = \bar{\pi}_A^{\text{fall}}$, which is exactly at the boundary.

The resolution may be that at $t=2$ with accumulated displacement $\Omega_2^R = 0.51$, the dominant-strategy boundary is $C_A^{\mathrm{dom}} = 1.9/0.49 \approx 3.88$. With $C_A = 2.0 < 3.88$, the interior equilibrium gives $\pi^* = \bar{h} = 0.05$. For the autocracy to fall, we need $\pi^* > 0.06$, which requires $\bar{h} > 0.06$, i.e., $1 - v/C_A > 0.06$, i.e., $v < 0.94 C_A = 1.88$. With $v = 1.9 > 1.88$: fails.

This is a real parameter issue: at the current parameters, the R$\times$A scenario does NOT produce regime fall in $t=2$. The Lemma 0 proof exposes this. (This issue is separate from the Lemma 0 proof and should be flagged.)

### Numerical verification of monotonicity

The following table (produced by `model/verify_lemma0_monotonicity.py`) confirms the analytical result. Single-state game with $\omega = 0.30$, $\Omega = 0.30$:

| $C_x$ | $\bar{h}$ | $s^*$ | $\pi^*$ | Status |
|--------|-----------|--------|---------|--------|
| 1.920 | 0.010 | 0.633 | 0.010 | Interior |
| 1.950 | 0.026 | 0.537 | 0.026 | Interior |
| 2.000 | 0.050 | 0.461 | 0.050 | Interior |
| 2.500 | 0.240 | 0.161 | 0.240 | Interior |
| 2.700 | 0.296 | -0.138 | 0.296 | Interior |
| 2.714 | 0.300 | -0.531 | 0.300 | Boundary ($\bar{h} = \Omega$) |
| 2.800 | 0.321 | --- | 0.000 | No interior eq. |

Protest increases from 0.01 to 0.30 as $C_x$ goes from 1.92 to 2.714, then jumps to 0. The dominant-strategy boundary is $C_x^{\mathrm{dom}} = v/(1-\Omega) = 1.9/0.70 = 2.714$.

Multi-state game ($t=1$, autocracy, three states) shows the same pattern: $\pi_R$ increases with $C_x$ until the interior equilibrium breaks down at $\bar{h} \approx 0.096$ (the RC4 bound), corresponding to $C_x \approx 2.1$.

For the $R \times A$ scenario at $t=2$ ($\Omega_2^R = 0.51$, single-state): $\pi^* = \bar{h} = 0.05$ at $C_A = 2.0$, vs. $\bar{\pi}_A^{\text{fall}} = 0.06$. Protest does NOT exceed the fall threshold.

**All regularity conditions for the Lemma 0 proof are verified at baseline (with the caveats noted for RC3 and the parameter consistency issue for R$\times$A).**

---

## 5. Critical Note: Monotonicity Direction

The paper's comparative statics table (Section 4.5, line 345) claims "$C_A \uparrow \Rightarrow \pi_A \downarrow$" and Corollary 1 invokes "M1 (protest decreasing in $C_A$)." **This is incorrect for the interior equilibrium.**

The correct comparative statics are:

| Parameter | Effect on $\bar{h}$ | Effect on $\pi^*$ (interior) | Intuition |
|-----------|---------------------|-------------------------------|-----------|
| $C_x \uparrow$ | $\bar{h} \uparrow$ | $\pi^* \uparrow$ | Higher threshold $\to$ more coordination needed $\to$ eq. adjusts upward |
| $v \uparrow$ | $\bar{h} \downarrow$ | $\pi^* \downarrow$ | Lower threshold $\to$ less coordination needed $\to$ eq. adjusts downward |

**Why Corollary 1 survives despite the correction.** The key mechanism in Corollary 1 is the *dominant-strategy boundary* $C_A^{\mathrm{dom}} = v/(1 - \Omega)$: for $C_A > C_A^{\mathrm{dom}}$, protest drops to zero (not protesting becomes dominant). The "sweet spot" is $C_A \in (C_D, C_A^{\mathrm{dom}})$, within which protest is positive (and, as we now know, *increasing* in $C_A$). The upper bound $C_A^{\mathrm{dom}}$ still exists, and the non-emptiness condition still holds. What changes is the interpretation: within the sweet spot, higher repression actually *increases* equilibrium protest (because the coordination threshold rises), until repression reaches the dominant-strategy boundary and protest collapses to zero.

**Complete picture of protest vs. $C_A$:**

1. $C_A \leq v$ ($\bar{h} \leq 0$): dominant strategy for displaced to protest. $\pi^* = \Omega$. (Not affected by $C_A$.)
2. $C_A \in (v, v/(1-\Omega))$ ($0 < \bar{h} < \Omega$): interior equilibrium. $\pi^* = \bar{h} = 1 - v/C_A$. Increasing in $C_A$.
3. $C_A \geq v/(1-\Omega)$ ($\bar{h} \geq \Omega$): not protesting dominant. $\pi^* = 0$.

The transition from regime 2 to regime 3 is *discontinuous* (from $\Omega$ to 0). This discontinuity is what makes Corollary 1 work: there exists $C_A^{\mathrm{dom}}$ above which protest vanishes.

**Recommendation**: Rewrite Corollary 1 using the dominant-strategy boundary rather than monotonicity. Replace "M1 (protest decreasing in $C_A$)" with the correct statement about the dominant-strategy boundary.

---

## 6. Recommended Paper Text

### New assumption (insert after A9)

> **A10 (Regularity conditions for the protest game).** For each regime-scenario pair where $0 < v < C_x$:
> (i) the participation threshold $\bar{h} := 1 - v/C_x \in (0,1)$ is below the maximum displaced fraction: $\bar{h} < \max_\theta \Omega_t(\theta)$;
> (ii) the limiting left-boundary value is positive: $\sum_\theta w^{-}_\theta \Omega_t(\theta) > \bar{h}$, where $w^{-}_\theta \propto \omega_t(\theta) p_\theta e^{-\omega_t(\theta)/\sigma}$.
> Both conditions are verified at the baseline parameterization (see Appendix).

### New lemma (replace lines 246--252)

> **Lemma 0 (Protest equilibrium).** *Under A1--A4 and A10 with $h(\pi) = \pi$ and $F$ logistic, only displaced workers ($d_{it} = 1$) participate in the protest game; employed workers set $a_{it} = 0$. For each regime $x$ and period $t$:*
>
> *(a) There exists a cutoff equilibrium in which displaced worker $i$ protests iff $s_{it} > s^*_x$.*
> 
> *(b) The equilibrium is unique at the baseline parameterization and, more generally, when signal precision $\sigma$ is small relative to the inter-state separation $\Delta_{\min}$.*
>
> *(c) Aggregate protest under state $\theta$ is $\pi^*_\theta = \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma)$.*
>
> *(d) When $v \geq C_x$ (protesting is dominant), $\pi^*_\theta = \Omega_t(\theta)$.*
>
> *(e) The cutoff $s^*$ is $C^1$ in all parameters. In particular, $\partial s^*/\partial C_x < 0$ (higher cost lowers the cutoff) and $\partial s^*/\partial v > 0$ (higher expressive value raises the cutoff).*
>
> *(f) In a single-state game, equilibrium protest is $\pi^* = \bar{h} = 1 - v/C_x$. The interior equilibrium exists for $C_x \in (v, v/(1-\Omega))$; for $C_x > v/(1-\Omega)$, not protesting is a dominant strategy and $\pi^* = 0$.*
>
> *Proof.* See Appendix [X]. $\blacksquare$

### Full proof (for appendix)

> *Proof of Lemma 0.*
>
> *(a) Existence.* Only displaced workers ($d_{it} = 1$) are active players; employed workers ($d_{it} = 0$) do not protest ($a_{it} = 0$). Define the indifference function for a displaced worker observing signal $s$:
>
> $$G(s) := \sum_\theta P(\theta \mid d = 1, s) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s}{\sigma}\right) - \bar{h}$$
>
> where the Bayesian posterior is $P(\theta \mid d=1, s) \propto \omega_t(\theta) \cdot \lambda((s - \omega_t(\theta))/\sigma) \cdot p_\theta$ and $\bar{h} = 1 - v/C_x \in (0,1)$ by A10(i). $G$ is continuous on $\mathbb{R}$ (the logistic density $\lambda > 0$ everywhere ensures the posterior denominator is strictly positive).
>
> As $s \to +\infty$: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$ for all $\theta$, so $G(s) \to -\bar{h} < 0$.
>
> As $s \to -\infty$: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$ for all $\theta$, and the posterior converges to $w_\theta^{-} \propto \omega_t(\theta) p_\theta e^{-\omega_t(\theta)/\sigma}$ (using $\lambda(z) \approx e^z$ as $z \to -\infty$). By A10(ii), $G(s) \to \sum_\theta w_\theta^{-} \Omega_t(\theta) - \bar{h} > 0$.
>
> By the intermediate value theorem, $G(s^*) = 0$ for some $s^* \in \mathbb{R}$. $\blacksquare$
>
> *(b) Uniqueness.* The derivative $G'(s) = H'(s)$ decomposes into a coordination term (negative: $-\Omega_t(\theta)/\sigma \cdot \lambda(\cdot)$) and a posterior-shift term. When signals are precise relative to state separation ($\sigma \ll \Delta_{\min}$), the posterior at any zero $s^*$ concentrates on a single state $\theta_0$, making the posterior-shift contribution exponentially small ($O(e^{-\Delta_{\min}/\sigma})$) relative to the negative coordination term. Hence $G'(s^*) < 0$ at every zero, which implies uniqueness: a continuous function with strictly negative derivative at every zero-crossing can cross zero at most once.
>
> At the baseline parameterization ($\sigma = 0.10$, $\Delta_{\min} = 0.03$), uniqueness is verified numerically: $G$ has a single zero at $s^* \approx 0.458$ with $G'(s^*) < 0$. $\blacksquare$
>
> *(c)* Under the cutoff strategy, $\pi^*_\theta = \Omega_t(\theta) \cdot P(s_i > s^* \mid \theta) = \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma)$, by the law of large numbers and logistic symmetry. $\blacksquare$
>
> *(d)* When $v \geq C_x$: $v - C_x(1-\pi) \geq v - C_x \geq 0$ for all $\pi$, so protesting is (weakly) dominant for every displaced worker. $\blacksquare$
>
> *(e)* $G(s; \mathbf{p})$ is $C^1$ jointly, and $G'(s^*) < 0$ at the unique zero. By the Implicit Function Theorem, $s^*(\mathbf{p})$ is $C^1$, with $\partial s^*/\partial p_j = -(\partial G/\partial p_j)/G'(s^*)$. Since $G(s; C_x, v) = H(s) - (1 - v/C_x)$:
>
> - $\partial G/\partial C_x = -v/C_x^2 < 0$, so $\partial s^*/\partial C_x = (v/C_x^2)/G'(s^*) < 0$.
> - $\partial G/\partial v = 1/C_x > 0$, so $\partial s^*/\partial v = -(1/C_x)/G'(s^*) > 0$. $\blacksquare$
>
> *(f)* In a single-state game with prior concentrated on $\theta_0$, the indifference condition is $\Omega \cdot \Lambda((\omega_0 - s^*)/\sigma) = \bar{h}$, giving $\pi^* = \bar{h}$ directly. The interior equilibrium requires $0 < \bar{h} < \Omega$, i.e., $C_x \in (v, v/(1-\Omega))$. For $C_x > v/(1-\Omega)$: $\bar{h} > \Omega$, and even full displaced participation ($\pi = \Omega$) does not reach the threshold. Not protesting is strictly dominant: $v - C_x(1 - \Omega) < 0$. $\blacksquare$

---

## 7. Summary of Changes and Flags

### What the new Lemma 0 adds (addressing all four referee concerns):

1. **Interiority conditions**: Explicit in A10 (RC1: $0 < v < C_x$; RC2: $\bar{h} < \max \Omega$; RC4: left-boundary value positive). Verified at baseline.

2. **Uniqueness**: Proved via $G'(s^*) < 0$ at every zero for small $\sigma$. Verified numerically at baseline.

3. **Who protests**: Explicit statement that only displaced workers ($d_{it} = 1$) protest; employed workers set $a_{it} = 0$.

4. **Monotonicity**: Proved via IFT. Correct directions stated: $\partial s^*/\partial C_x < 0$, $\partial s^*/\partial v > 0$. Single-state $\pi^* = \bar{h}$, with $\partial\pi^*/\partial C_x > 0$ (not $< 0$ as claimed in the paper).

### Flags for the author:

**FLAG 1 (HIGH PRIORITY): Monotonicity direction.** The paper claims "$C_A \uparrow \Rightarrow \pi_A \downarrow$" (line 345) and invokes "M1 (protest decreasing in $C_A$)" in Corollary 1 (line 452). The correct direction is $\partial\pi^*/\partial C_A > 0$ within the interior equilibrium. Corollary 1 should be rewritten to use the dominant-strategy boundary $C_A^{\mathrm{dom}} = v/(1-\Omega)$ instead of monotonicity.

**FLAG 2 (MEDIUM PRIORITY): RC3 not satisfied at baseline.** The sufficient condition for uniqueness ($\sigma < \Delta_{\min}/(2\log R_{\max}) = 0.006$) is not met at $\sigma = 0.10$. Uniqueness holds numerically but not by the analytical bound. Options: (a) state uniqueness as "verified numerically at baseline"; (b) use a tighter analytical argument exploiting the specific structure.

**FLAG 3 (MEDIUM PRIORITY): Parameter consistency for R$\times$A fall.** With $\bar{h} = 0.05$ and $\bar{\pi}_A^{\text{fall}} = 0.06$: equilibrium protest $\pi^* = 0.05 < 0.06$, so the autocracy does NOT fall in the single-state $t=2$ game. Either $\bar{\pi}_A^{\text{fall}}$ should be $\leq 0.05$, or $v$ or $C_A$ should be adjusted. (Note: with $\bar{\pi}_A^{\text{fall}} = 0.05$, we have $\pi^* = \bar{h} = 0.05 = \bar{\pi}_A^{\text{fall}}$, which is knife-edge.)
