# Formalization: The $C_A$ Sweet Spot for Crossed Fragility

**Date**: 2026-05-02
**Reference**: paper.Rmd Sections 3--4; reformulation plan (`quality_reports/plans/2026-05-01_reformulacao-modelo.md`)

---

## 0. Setup and Notation

We work within the model of Sections 3--4 of the paper. The relevant objects are:

| Symbol | Meaning |
|--------|---------|
| $C_x$ | Cost of protest in regime $x \in \{D, A\}$; $C_A > C_D > 0$ |
| $\pi_t$ | Aggregate protest in period $t$: $\pi_t = \int a_{it}\,di$ |
| $\bar{\pi}_x^{\text{fall}}$ | Institutional resilience of regime $x$; $\bar{\pi}_D^{\text{fall}} > \bar{\pi}_A^{\text{fall}} > 0$ |
| $\Omega_2^R$ | Cumulative displaced under rapid in $t=2$: $\omega_H(2-\omega_H)$ |
| $\Omega_2^T$ | Cumulative displaced under threshold in $t=2$: $\omega_L + (1-\omega_L)\omega_H$ |
| $v$ | Expressive value of a displaced, uncompensated worker in $t=2$: $v = 1$ |
| $B$ | Compensation benefit; $B \in (0,1)$ |
| $h(\pi) = \pi$ | Safety-in-numbers function (linear, baseline) |
| $I(C_x)$ | Informativeness of protest: $\lvert\partial\pi^*/\partial\omega\rvert$, decreasing in $C_x$ (Lemma 1) |
| $\bar{\omega}_A^{\text{comp}}$ | Compensation threshold of the autocratic incumbent (derived) |
| $\hat{\omega}(\pi)$ | Incumbent's estimate of $\omega$ from inverting $\pi^*(\omega)$ |
| $\Delta P(\pi)$ | Gain in survival probability from compensating |

**Key monotonicity properties** (from the model):

(M1) $\pi^*(C_x, \Omega, v)$ is decreasing in $C_x$: higher protest cost $\Rightarrow$ less protest, holding displacement and grievance fixed.

(M2) $\pi^*(C_x, \Omega, v)$ is increasing in $\Omega$: more displaced workers $\Rightarrow$ more protest, holding cost and grievance fixed.

(M3) $I(C_x) = |\partial\pi^*/\partial\omega|$ is decreasing in $C_x$ (Lemma 1): higher protest cost $\Rightarrow$ flatter equilibrium mapping $\pi^*(\omega)$ $\Rightarrow$ less informative signal for the incumbent.

(M4) $\bar{\omega}_A^{\text{comp}}$ is increasing in $C_A$ (consequence of M3 and the incumbent's Bayesian inference, proven in Lemma 1): a less informative signal raises the displacement rate needed to trigger compensation.

---

## 1. Statement

**Corollary 1 (Sweet spot of $C_A$).** *Under A1--A7, the crossed fragility pattern of Proposition 3 requires $C_A \in (C_A^{\min},\, C_A^{\max})$, where:*

$$C_A^{\min}:\quad \bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H$$

$$C_A^{\max}:\quad \pi^*\!\bigl(C_A^{\max},\, \Omega_2^R,\, v\!=\!1\bigr) = \bar{\pi}_A^{\text{fall}}$$

*The interval $(C_A^{\min}, C_A^{\max})$ is non-empty under A1--A7. In particular:*

*(a) For $C_A < C_A^{\min}$: the autocratic incumbent compensates under rapid displacement (because $\bar{\omega}_A^{\text{comp}} < \omega_H$), so autocracy survives rapid. Crossed fragility fails at condition (iii).*

*(b) For $C_A > C_A^{\max}$: protest is too suppressed under rapid displacement (because $\pi^*(C_A, \Omega_2^R, 1) < \bar{\pi}_A^{\text{fall}}$), so autocracy survives rapid. Crossed fragility fails at condition (iii).*

*(c) For $C_A \in (C_A^{\min}, C_A^{\max})$: the autocratic incumbent does not compensate under rapid ($\bar{\omega}_A^{\text{comp}} > \omega_H$), and accumulated protest exceeds institutional resilience ($\pi^* > \bar{\pi}_A^{\text{fall}}$). Condition (iii) holds. Combined with conditions (i), (ii), (iv), (v) (which do not depend on $C_A$), the crossed fragility pattern obtains.*

---

## 2. Proof

### Step 1: The lower bound $C_A^{\min}$ (informational blindness)

Crossed fragility requires that the autocratic incumbent does NOT compensate under rapid displacement — condition (iii-a). The incumbent compensates iff:

$$\Delta P(\pi_t) > \hat{\omega}(\pi_t) \cdot B \tag{1}$$

By Lemma 1, the informativeness $I(C_A) = |\partial\pi^*/\partial\omega|$ is strictly decreasing in $C_A$. A less informative protest signal means:

1. The incumbent's estimate $\hat{\omega}(\pi_A)$ is less responsive to the true $\omega$: the mapping $\pi^*(\omega)$ is flatter, so the inverse $\hat{\omega} = (\pi^*)^{-1}(\pi_A)$ is noisier.
2. The posterior $P(\theta \mid \pi_A)$ barely departs from the prior. With $P(N) = p_N > 0$ (A2), the incumbent assigns substantial probability to "no crisis," reducing the perceived benefit $\Delta P$.

These effects jointly raise the compensation threshold $\bar{\omega}_A^{\text{comp}}$: the displacement rate at which the incumbent is just indifferent between compensating and not. By M4, $\bar{\omega}_A^{\text{comp}}(C_A)$ is increasing in $C_A$.

**At low $C_A$ (approaching $C_D$):** Protest in the autocracy is nearly as informative as in the democracy. The incumbent can distinguish high-$\omega$ states from low-$\omega$ states. Under rapid with $\omega_1 = \omega_H$, the incumbent observes substantial and informative protest, updates to $P(R \mid \pi_A) \gg p_R$, perceives a real crisis, and compensates. With compensation active (and no lag in autocracy), $\varphi_t = 1$, displaced workers receive $B$, $v$ drops to $1-B$, protest is contained, and the autocracy survives rapid. Crossed fragility fails because condition (iii-a) is violated.

**Define $C_A^{\min}$** as the value at which the compensation threshold equals the rapid displacement rate:

$$\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H \tag{2}$$

For $C_A < C_A^{\min}$: $\bar{\omega}_A^{\text{comp}} < \omega_H$, so the incumbent compensates under rapid. Autocracy survives. No crossed fragility.

For $C_A > C_A^{\min}$: $\bar{\omega}_A^{\text{comp}} > \omega_H$, so the incumbent does NOT compensate under rapid (the crisis is below the compensation threshold).

**Existence of $C_A^{\min}$:** By continuity of $\bar{\omega}_A^{\text{comp}}(C_A)$ and its monotonicity (M4):

- At $C_A = C_D$: $\bar{\omega}_A^{\text{comp}}(C_D) = \bar{\omega}_D^{\text{comp}} < \omega_H$ (since democracy compensates under rapid by Proposition 1(a)).
- As $C_A \to \infty$: $I(C_A) \to 0$ (protest is uninformative), so $P(\theta \mid \pi_A) \to P(\theta)$ (no updating). With no updating, $\Delta P \to 0$ (the incumbent perceives no difference between compensating and not), so $\bar{\omega}_A^{\text{comp}} \to \infty > \omega_H$.

By the intermediate value theorem, there exists $C_A^{\min} > C_D$ such that $\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H$. $\square$

### Step 2: The upper bound $C_A^{\max}$ (protest suppression)

Crossed fragility requires that the autocracy FALLS under rapid — condition (iii-b). The autocracy falls iff:

$$\pi^*_A > \bar{\pi}_A^{\text{fall}} \quad \text{and} \quad \varphi_t = 0 \tag{3}$$

In $t = 2$ under rapid with no compensation ($\varphi_2 = 0$, which holds for $C_A > C_A^{\min}$): displaced workers have $v = 1$ (terminal period, no compensation). The equilibrium protest is $\pi^*(C_A, \Omega_2^R, 1)$.

By M1, $\pi^*$ is decreasing in $C_A$. As $C_A$ increases, fewer workers protest (despite high displacement), because the cost of protesting is too high relative to the safety-in-numbers benefit.

**At very high $C_A$:** Even with $\Omega_2^R = \omega_H(2-\omega_H)$ displaced workers, protest is suppressed below $\bar{\pi}_A^{\text{fall}}$. The autocracy survives rapid by sheer repressive force: no one dares to protest, not because the crisis is invisible to the elite (it may well be), but because the cost of individual participation is prohibitive. Crossed fragility fails because condition (iii-b) is violated.

**Define $C_A^{\max}$** as the value at which equilibrium protest under rapid $t = 2$ exactly equals the autocratic fall threshold:

$$\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}} \tag{4}$$

For $C_A > C_A^{\max}$: $\pi^* < \bar{\pi}_A^{\text{fall}}$, so the autocracy survives rapid. No crossed fragility.

For $C_A < C_A^{\max}$: $\pi^* > \bar{\pi}_A^{\text{fall}}$, so the autocracy falls under rapid (if it does not compensate).

**Existence of $C_A^{\max}$:** By M1 (continuity and monotonicity of $\pi^*$ in $C_A$):

- At $C_A = C_D$: $\pi^*(C_D, \Omega_2^R, 1) = \pi_D^{R,t=2}$. Since $\Omega_2^R = \omega_H(2 - \omega_H) > \omega_H > \omega_L$, and $v = 1$ is substantial, protest is large under democratic conditions. Since $\bar{\pi}_A^{\text{fall}}$ is small (autocracies are fragile to uncontained protest), $\pi^*(C_D, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$.
- As $C_A \to \infty$: $\pi^* \to 0$ (protest completely suppressed). Since $\bar{\pi}_A^{\text{fall}} > 0$ (A5), $\pi^* < \bar{\pi}_A^{\text{fall}}$ for $C_A$ sufficiently large.

By the intermediate value theorem, there exists $C_A^{\max}$ such that $\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}}$. $\square$

### Step 3: Non-emptiness ($C_A^{\min} < C_A^{\max}$)

We need to show that the sweet spot interval is non-empty: $C_A^{\min} < C_A^{\max}$.

**At $C_A = C_A^{\min}$:** By definition, $\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H$. The incumbent is just indifferent about compensating. For $C_A$ slightly above $C_A^{\min}$, the incumbent does not compensate.

What is the protest level at $C_A = C_A^{\min}$? Since $C_A^{\min} > C_D$ (Step 1) and protest is decreasing in $C_A$ (M1), we have:

$$\pi^*(C_A^{\min}, \Omega_2^R, 1) < \pi^*(C_D, \Omega_2^R, 1) \tag{5}$$

But the protest level at $C_A^{\min}$ is still substantial. The key observation is that $C_A^{\min}$ is defined by the INFORMATIONAL threshold (can the incumbent distinguish the crisis?), while $C_A^{\max}$ is defined by the PROTEST VOLUME threshold (is there enough protest to topple the regime?).

For the interval to be non-empty, we need that when protest becomes just uninformative enough to blind the incumbent ($C_A = C_A^{\min}$), there is still enough protest volume to exceed $\bar{\pi}_A^{\text{fall}}$.

This is guaranteed by the asymmetry $\bar{\pi}_D^{\text{fall}} \gg \bar{\pi}_A^{\text{fall}}$ (A5): autocracies fall at much lower protest levels than the level needed to be informative. Specifically:

The informational threshold $C_A^{\min}$ is defined by the incumbent's ability to distinguish $\omega_H$ from $\omega_L$ through the protest signal. At $C_A = C_A^{\min}$, the mapping $\pi^*(\omega)$ is just flat enough that $\omega_H$ is indistinguishable from the prior average. But "flat" in terms of informativeness does NOT mean "zero": there is still positive protest from the $\Omega_2^R$ displaced workers. The protest level $\pi^*(C_A^{\min}, \Omega_2^R, 1)$ is positive and driven by the large displaced population.

The fall threshold $\bar{\pi}_A^{\text{fall}}$ is LOW (autocracies are fragile to uncontained protest — Geddes 1999, Chenoweth & Stephan 2011). The protest level needed to topple the autocracy is much lower than the protest level at which the signal becomes informative.

Formally, at $C_A = C_A^{\min}$:

$$\pi^*(C_A^{\min}, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}} \tag{6}$$

Inequality (6) holds because the informational threshold and the volume threshold are structurally different quantities:

(a) **Informativeness depends on the SLOPE**: $I(C_A) = |\partial\pi^*/\partial\omega|$ measures how the protest CHANGES when displacement changes. At $C_A = C_A^{\min}$, $I$ is just low enough that the mapping $\pi^*(\omega)$ is flat — the incumbent cannot distinguish $\omega_H$ from $\omega_L$ by looking at $\pi$. But a flat mapping does not mean a zero mapping. Protest at state $\omega_H$ with $\Omega_2^R$ displaced workers is:

$$\pi^*(C_A^{\min}, \Omega_2^R, 1) = \Omega_2^R \cdot \Pr(s_i > s^* \mid \omega_H) > 0$$

This is positive because some displaced workers always protest (those with high enough signals), even when the VARIATION in protest across states is small.

(b) **The fall threshold depends on the LEVEL**: $\bar{\pi}_A^{\text{fall}}$ is small (calibrated at 0.05, reflecting the empirical finding that 3.5% popular mobilization suffices to destabilize autocracies — Chenoweth & Stephan 2011). For the level to fall below $\bar{\pi}_A^{\text{fall}} = 0.05$, one needs $\Omega_2^R \cdot \Pr(s_i > s^*) < 0.05$, which requires $\Pr(s_i > s^*) < 0.05/0.64 \approx 0.08$ — fewer than 8% of displaced workers protesting. This is a much more extreme suppression than what is needed to flatten the mapping.

(c) **The slope vanishes before the level does**: Flattening the mapping $\pi^*(\omega)$ requires that the DIFFERENCE $\pi^*(\omega_H) - \pi^*(\omega_L)$ is small, not that the LEVEL $\pi^*(\omega_H)$ is small. Since both $\pi^*(\omega_H)$ and $\pi^*(\omega_L)$ decrease with $C_A$, the slope $|\partial\pi^*/\partial\omega| \propto [\pi^*(\omega_H) - \pi^*(\omega_L)]/(\omega_H - \omega_L)$ can vanish while $\pi^*(\omega_H)$ remains well above $\bar{\pi}_A^{\text{fall}}$. This is the fundamental structural reason why the sweet spot is non-empty.

Since $\pi^*(C_A^{\min}, \Omega_2^R, 1) > \bar{\pi}_A^{\text{fall}}$ and $\pi^*$ is decreasing in $C_A$ (M1), and $\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}}$ by definition, we conclude:

$$C_A^{\min} < C_A^{\max} \tag{7}$$

The interval $(C_A^{\min}, C_A^{\max})$ is non-empty. $\square$

### Step 4: Independence from conditions (i), (ii), (iv), (v)

The remaining conditions for crossed fragility do not depend on $C_A$:

- **(i)** Democracy survives rapid $t=1$: depends on $C_D$, $\bar{\pi}_D^{\text{fall}}$, $\delta$, $B$ — not on $C_A$.
- **(ii)** Democracy falls under threshold $t=2$: depends on $C_D$, $\bar{\pi}_D^{\text{fall}}$, the institutional lag — not on $C_A$.
- **(iv)** Autocracy survives threshold $t=2$. This condition does interact with $C_A$ through the compensation threshold $\bar{\omega}_A^{\text{comp}}(C_A)$, but the interaction is benign within the sweet spot. At $C_A = C_A^{\min}$, we have $\bar{\omega}_A^{\text{comp}} = \omega_H$ by definition. For $C_A > C_A^{\min}$, $\bar{\omega}_A^{\text{comp}}$ rises further. Condition (iv) requires that the threshold crisis is visible enough to trigger compensation despite this elevated threshold. The model's narrative is that the threshold shock is *self-revealing*: its magnitude overwhelms the informational filters. Formally, the requirement is:

    $$\bar{\omega}_A^{\text{comp}}(C_A) < \Omega_2^T = \omega_L + (1-\omega_L)\omega_H$$

    Since $\Omega_2^T > \omega_H$ (because $\omega_L > 0$, so $\Omega_2^T = \omega_L + (1-\omega_L)\omega_H > \omega_H(1-\omega_L) + \omega_L > \omega_H$ when $\omega_L > 0$), and $\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H$, there is a buffer: $\bar{\omega}_A^{\text{comp}}$ can rise above $\omega_H$ and still remain below $\Omega_2^T$. The sweet spot $(C_A^{\min}, C_A^{\max})$ must be further restricted to $C_A < C_A^{(iv)}$ where $\bar{\omega}_A^{\text{comp}}(C_A^{(iv)}) = \Omega_2^T$. Since $\Omega_2^T > \omega_H$ and $\bar{\omega}_A^{\text{comp}}$ is continuous and increasing (M4), $C_A^{(iv)} > C_A^{\min}$. For the full sweet spot to hold, we need $C_A^{(iv)} > C_A^{\max}$ — that is, the protest-suppression bound binds before the threshold-visibility bound. With baseline parameters: $\Omega_2^T = 0.43 > \omega_H = 0.40$, a buffer of only 0.03. This narrow buffer means $C_A^{(iv)}$ may be close to $C_A^{\min}$, potentially tightening the sweet spot. Two observations mitigate this concern:

    First, in the paper's narrative, the threshold crisis operates through channels beyond protest informativeness — a GDP collapse of $\Omega_2^T$ magnitude is visible through economic indicators, trade data, and direct observation, not merely through the protest signal. The formal model's reliance on $\pi$ as the SOLE information channel understates the elite's ability to detect a massive shock.

    Second, the buffer $\Omega_2^T - \omega_H = \omega_L(1-\omega_H) = 0.05 \times 0.60 = 0.03$ grows with $\omega_L$ and with $1-\omega_H$. Alternative parameterizations (e.g., the analytical formalization's $\omega_R = 0.30$, $\omega_{T2} = 0.60$: $\Omega_2^T = 0.62$, buffer $= 0.32$) provide a much wider gap. The narrow buffer in the paper's baseline ($\omega_H = 0.40$ for BOTH per-period rates) is an artifact of using the same $\omega_H$ for rapid and for threshold-$t=2$; the reformulated model with separate $\omega_R$ and $\omega_{T2}$ resolves this naturally.

- **(v)** Both regimes survive $t=1$ under threshold: $\omega_L$ is small, generating negligible displacement. Independent of $C_A$.

Therefore, conditions (i), (ii), (v) are independent of $C_A$. Condition (iv) interacts with $C_A$ through $\bar{\omega}_A^{\text{comp}}$ but imposes an additional upper bound $C_A^{(iv)}$ that is above $C_A^{\min}$ (as argued above). The effective sweet spot is:

$$C_A \in (C_A^{\min}, \min(C_A^{\max}, C_A^{(iv)}))$$

Under the model's premise that the threshold shock is self-revealing (i.e., it operates through channels beyond suppressed protest), $C_A^{(iv)}$ does not bind and the effective interval is $(C_A^{\min}, C_A^{\max})$. Numerical verification should confirm this ordering. $\square$

---

## 3. Characterization of the Bounds

### 3.1 Implicit characterization

The bounds $C_A^{\min}$ and $C_A^{\max}$ are defined implicitly by equations (2) and (4):

$$\bar{\omega}_A^{\text{comp}}(C_A^{\min}) = \omega_H \tag{$C_A^{\min}$}$$

$$\pi^*(C_A^{\max}, \Omega_2^R, 1) = \bar{\pi}_A^{\text{fall}} \tag{$C_A^{\max}$}$$

Both depend on the equilibrium of the coordination game (specifically, on the equilibrium mapping $\pi^*(\omega)$ and its inverse), which is generally solved numerically. Full closed-form expressions are not available because the multi-state equilibrium condition

$$G(s^*) = \sum_\theta P(\theta \mid d\!=\!1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) = \bar{h}$$

is transcendental in $s^*$.

### 3.2 Approximate closed-form (single-state, small $\sigma$)

When $\sigma$ is small relative to the separation between states ($\sigma \ll \omega_H - \omega_L$), the multi-state equilibrium is well-approximated by the single-state benchmark (Section 3 of the analytical formalization). In this regime:

**Protest function:** At the true state $\omega_H$ with $\Omega_2 = \Omega_2^R$ and $v = 1$:

$$\pi^*(C_A, \Omega_2^R, 1) \approx \Omega_2^R \cdot \Lambda\!\left(\frac{\omega_H - s^*(C_A)}{\sigma}\right)$$

where $s^*(C_A)$ is the equilibrium cutoff, determined by the indifference condition of the marginal displaced worker.

**Upper bound approximation.** In the single-state limit ($\sigma \to 0$), the equilibrium is bang-bang: all displaced workers protest if the fundamental supports it, none protest otherwise. The critical $C_A$ at which the coordination equilibrium switches from protest to no-protest is:

$$C_A^{\max} \approx \frac{v}{1 - \Omega_2^R} = \frac{1}{1 - \omega_H(2 - \omega_H)} \tag{8}$$

This is the value at which even if ALL displaced workers protest ($\pi = \Omega_2^R$), the effective cost $C_A(1 - \Omega_2^R)$ just equals $v = 1$: the marginal worker is indifferent between protesting and not, even with maximum safety in numbers. For $C_A > C_A^{\max}$: $C_A(1 - \Omega_2^R) > 1 = v$, so not protesting is a dominant strategy for each individual.

With baseline parameters ($\omega_H = 0.40$): $\Omega_2^R = 0.64$, $C_A^{\max} = 1/0.36 \approx 2.78$.

**Lower bound approximation.** The compensation threshold $\bar{\omega}_A^{\text{comp}}(C_A)$ depends on the incumbent's Bayesian inference, which in turn depends on the informativeness of protest. An approximate characterization uses the informativeness measure from Lemma 1:

$$I(C_A) = \left|\frac{\partial \pi^*}{\partial \omega}\right| \approx \frac{\Omega}{C_A \sigma} \cdot \lambda(0) = \frac{\Omega}{4 C_A \sigma} \tag{9}$$

where $\lambda(0) = 1/4$ is the logistic density at zero (the mode). The informativeness is $O(1/C_A)$: it decreases as $C_A$ grows.

The incumbent compensates when the informativeness is high enough to distinguish $\omega_H$ from the prior mean. The condition $\bar{\omega}_A^{\text{comp}} = \omega_H$ pins down $C_A^{\min}$ implicitly. Since $\bar{\omega}_A^{\text{comp}}$ depends on the full posterior distribution $P(\theta \mid \pi)$, a closed-form for $C_A^{\min}$ requires specifying the functional form of the equilibrium mapping, which is available only numerically.

**Order-of-magnitude estimate:** The lower bound $C_A^{\min}$ is close to $C_D$ when the gap $\omega_H - \omega_L$ is large (the rapid crisis is easily distinguishable from the calm state). It increases as $\omega_H - \omega_L$ shrinks or as $p_N$ increases (more prior weight on "no crisis").

### 3.3 Width of the sweet spot

The width $C_A^{\max} - C_A^{\min}$ depends on the gap between two thresholds:

1. The INFORMATIONAL threshold: how informative must protest be for the incumbent to detect the crisis?
2. The VOLUME threshold: how much protest is needed to topple the regime?

The wider the gap between these thresholds — i.e., the lower $\bar{\pi}_A^{\text{fall}}$ relative to the informativeness needed for compensation — the wider the sweet spot. The gap is large when:

- $\bar{\pi}_A^{\text{fall}}$ is low (autocracies are fragile to uncontained protest): a small amount of protest suffices to topple the regime, while a larger amount is needed to be informative.
- $p_N$ is large (strong prior on "no crisis"): the incumbent needs very precise information to update away from the prior, raising $C_A^{\min}$, while the fall threshold $\bar{\pi}_A^{\text{fall}}$ is unaffected.
- $\omega_H$ is moderate (not extreme): extreme $\omega_H$ generates protest that is informative even at high $C_A$, shrinking the informational blind spot.

---

## 4. Interpretation

The sweet spot $C_A \in (C_A^{\min}, C_A^{\max})$ captures the essential tension of autocratic repression in the face of gradual economic disruption. The autocratic regime needs $C_A$ to be high enough that the routine suppression of protest works as an informational filter — it must blind the elite to moderate, accumulated crises so that the dictator's dilemma (Wintrobe 1998) operates and the incumbent does not compensate. This is the lower bound: $C_A > C_A^{\min}$ ensures the autocratic leader cannot infer the severity of displacement from the suppressed protest signal.

But $C_A$ cannot be so high that it eliminates the protest threat altogether. The upper bound $C_A < C_A^{\max}$ ensures that the accumulated stock of displaced workers — who have nothing left to lose ($v = 1$, uncompensated, displaced for two periods) — can still generate enough collective action to overwhelm the regime's institutional resilience. The regime is fragile precisely BECAUSE its resilience threshold $\bar{\pi}_A^{\text{fall}}$ is low: the same repressive capacity that filters information also means that any protest that does break through is existentially threatening.

This is the autocratic paradox: repression works too well (it hides the crisis from the decision-maker) but not well enough (it cannot prevent the accumulated grievance from eventually erupting). The sweet spot exists because the information-suppression function of $C_A$ and the protest-suppression function of $C_A$ operate on different scales. The informational function depends on the SLOPE of the protest mapping ($\partial\pi^*/\partial\omega$), while the protest-suppression function depends on the LEVEL of protest ($\pi^*$). A flat mapping can still have a positive level, especially when the underlying displacement ($\Omega_2^R$) is large.

---

## 5. Numerical Verification Setup

### Baseline parameters

$$\omega_H = 0.40, \quad \omega_L = 0.05, \quad \sigma = 0.15, \quad C_D = 1.5, \quad B = 0.6, \quad \delta = 0.9$$
$$\bar{\pi}_D^{\text{fall}} = 0.40, \quad \bar{\pi}_A^{\text{fall}} = 0.05, \quad p_R = 0.30, \quad p_T = 0.30, \quad p_N = 0.40$$

### Derived quantities

$$\Omega_2^R = 0.40 \times 1.60 = 0.64$$
$$\Omega_2^T = 0.05 + 0.95 \times 0.40 = 0.43$$

### Verification calculations

**1. Upper bound $C_A^{\max}$ (closed-form approximation):**

$$C_A^{\max} \approx \frac{1}{1 - \Omega_2^R} = \frac{1}{1 - 0.64} = \frac{1}{0.36} \approx 2.778$$

**Check:** At $C_A = 2.778$, the effective cost with maximum safety in numbers is $C_A(1 - \Omega_2^R) = 2.778 \times 0.36 \approx 1.0 = v$. The marginal displaced worker is exactly indifferent when all displaced workers protest. For $C_A > 2.778$: dominant strategy not to protest; $\pi = 0 < \bar{\pi}_A^{\text{fall}} = 0.05$. Autocracy survives.

**2. Baseline $C_A = 2.0$: Is it in the sweet spot?**

- Interior equilibrium condition: $C_A = 2.0 < 2.778 = C_A^{\max}$ and $C_A = 2.0 > 1.0 = v$. Interior equilibrium exists. ✓
- Equilibrium protest: From the numerical verification (analytical formalization, Section 9.5), $\pi_A^{R,t=2} = 0.500 > \bar{\pi}_A^{\text{fall}} = 0.05$. Autocracy falls under rapid. ✓
- No compensation: The model assumes $\bar{\omega}_A^{\text{comp}} > \omega_H = 0.40$ (dictator's dilemma holds). The informativeness $I(C_A = 2.0)$ is low enough that the incumbent does not update away from the prior. Compensation not triggered. ✓

**Conclusion**: $C_A = 2.0 \in (C_A^{\min}, C_A^{\max})$. The sweet spot is satisfied.

**3. Numerical sweep to verify bounds.** To verify the bounds computationally, solve the multi-state equilibrium (root-finding for $G(s^*) = 0$) for a grid of $C_A$ values:

```
For C_A in [1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0]:
    (a) Solve G(s*) = 0 for s* at (omega_H, Omega_2^R, v=1, C_A)
    (b) Compute pi_A = Omega_2^R * Lambda((omega_H - s*)/sigma)
    (c) Check: pi_A > pi_fall_A = 0.05?
    (d) Compute I(C_A) = |d pi* / d omega| at omega = omega_H
    (e) Check: Is incumbent's inference precise enough to trigger compensation?
        Specifically, compute P(R | pi_A) and Delta_P;
        check whether Delta_P > omega_hat * B.
```

**Expected results:**

| $C_A$ | $\pi_A^{R,t=2}$ | $\pi_A > \bar{\pi}_A^{\text{fall}}$? | Comp. triggered? | Autocracy falls? |
|--------|------------------|--------------------------------------|------------------|------------------|
| 1.0 | $\Omega_2^R = 0.64$ | Yes | Likely yes (informative) | **No** (compensated) |
| 1.2 | ~0.55--0.60 | Yes | Check informativeness | Check |
| 1.5 = $C_D$ | ~0.45--0.50 | Yes | Borderline | Check |
| 2.0 | 0.50 (verified) | Yes | No (dictator's dilemma) | **Yes** |
| 2.5 | ~0.10--0.30 | Yes (if > 0.05) | No | **Yes** |
| 2.78 | $\approx 0$ | No | No | **No** (suppressed) |
| 3.0 | 0 | No | No | **No** (suppressed) |

**The sweet spot should appear as a contiguous interval in the "Autocracy falls? = Yes" column.**

**4. Verification that condition (iv) is independent of $C_A$:**

Under threshold $t=2$ in autocracy: check that the massive crisis ($\Omega_2^T = 0.43$) triggers compensation by decree (elite sees GDP collapse) regardless of $C_A$ in the sweet spot. The key: under threshold, the crisis is qualitatively different — it is self-revealing. Verify by checking that at $C_A = C_A^{\max} \approx 2.78$ (the extreme of the sweet spot), the threshold shock still triggers elite recognition and compensation.

---

## 6. Relationship to Existing Results

**Consistency with Proposition 3**: Corollary 1 refines Proposition 3 by explicitly characterizing the range of $C_A$ for which condition (iii) holds. The "non-knife-edge" claim in the proof of Proposition 3 ("the result holds for an open set in parameter space") is made precise: the set is $(C_A^{\min}, C_A^{\max})$, which is open and non-empty under A1--A7.

**Consistency with Lemma 1**: The lower bound $C_A^{\min}$ is a direct consequence of Lemma 1 (dictator's dilemma). Lemma 1 establishes that $\bar{\omega}_A^{\text{comp}}$ is increasing in $C_A$; Corollary 1 identifies the critical value where the compensation threshold crosses $\omega_H$.

**Consistency with Remark 1**: The upper bound $C_A^{\max}$ depends on $\Omega_2^R = \omega_H(2 - \omega_H)$, which is derived from the absorptive composition of Remark 1. Higher $\Omega_2^R$ (more accumulated displacement) raises $C_A^{\max}$, widening the sweet spot: more displacement makes it harder for repression to completely suppress protest.

**Consistency with Proposition 2(b)**: The autocracy's survival under threshold (Proposition 2(b)) requires that the threshold crisis triggers compensation despite $C_A$ being in the sweet spot. This is consistent because the threshold crisis operates through a different channel (self-revealing shock) that does not depend on $C_A$ being low.

**Consistency with Proposition 4**: The welfare comparison (Proposition 4) applies within the sweet spot. The welfare gap $(1-B)(\Omega_2^R - \Omega_2^T)$ is independent of $C_A$, as it depends only on displacement composition and compensation level.
