# AI Automation, Regime Type, and Crossed Fragility

---

## Abstract

How does AI-driven automation affect the stability of democracies versus autocracies? We develop a formal model showing that the *trajectory* of automation — not just its magnitude — determines which regime type is more fragile. We compare two stylized trajectories borrowed from the O-Ring automation framework (Gans and Goldfarb 2026): rapid displacement (immediate job loss) and threshold automation (initial complementarity followed by sudden substitution). We find a *crossed fragility* result: democracies are stable under rapid displacement but fragile under threshold automation, while autocracies exhibit the opposite pattern. The mechanism operates through the coordination capacity of affected workers, which has opposite effects on each regime's stabilization instrument. Rapid shocks create common knowledge of grievance, enabling coordinated opposition that overwhelms autocratic repression but channels into democratic compensation. Threshold shocks produce disorientation and strategic uncertainty, paralyzing democratic response (no observable crisis to trigger investment in social protection) while preserving repressive effectiveness against dispersed dissent. We further show that comprehensive social insurance achieves the same institutional resilience as repressive capacity — without the human cost. Welfare states function as the democratic equivalent of standing repressive apparatus: both provide insurance against delayed shocks, but only the former compensates the affected. The model generates a five-type regime typology with clear empirical mapping and testable predictions about which countries are most vulnerable to which automation trajectory.

---

## 1. Introduction

We show that comprehensive social insurance achieves the same institutional resilience as repressive capacity — without the human cost. This is not a normative aspiration. It is a formal result of a model that asks a question at the intersection of two literatures that rarely speak to each other: the economics of AI automation and the comparative politics of regime stability.

The mechanism operates through worker coordination. Consider two sectors: in one, AI automates assembly-line jobs overnight — workers are displaced immediately and visibly. In another, AI first augments radiologists' productivity for years, then abruptly replaces them once diagnostic accuracy crosses a threshold. In the first case, shared, visible job loss creates common knowledge of grievance, enabling collective action; in the second, sudden displacement after a period of apparent prosperity produces disorientation and strategic uncertainty. We show that these two trajectories interact with regime-specific stabilization mechanisms in opposite ways: democracies channel coordination into compensatory policy but cannot respond to shocks they have not yet observed; autocracies contain disoriented dissent through standing repression but cannot suppress organized, visible opposition.

We borrow the distinction between these trajectories from Gans and Goldfarb (2026), who formalize two paths of AI automation: rapid displacement and threshold substitution (where complementary tasks follow an O-Ring structure; see also Autor, Levy, and Murnane 2003; Acemoglu and Restrepo 2020). The regime stability literature has not explored how trajectory shape interacts with regime type. Acemoglu and Robinson (2006) show that transitory shocks can trigger regime transitions but treat transitoriness as binary. Boix (2003) links inequality to democratization without distinguishing shock trajectories. Przeworski (2005, 2006) models democracy as self-enforcing but is comparative-static in income. Svolik (2012) analyzes authoritarian stability as an agency problem between autocrat and elite, complementary to our focus on autocrat-mass containment. The empirical asymmetry — democracies fragile under crises, autocracies resilient (Przeworski et al. 2000) — lacks a formal model specifying when this pattern reverses.

This paper fills that gap. We build a two-period model in the Open Economy Politics tradition (Lake 2009): the economics of automation is taken as given (from Gans and Goldfarb 2026), and we derive the political-institutional implications. The model produces three main results.

First, we establish a *crossed fragility* pattern (Proposition 3): for autocracies with moderate repressive capacity, democracies are stable under rapid displacement but unstable under threshold automation, while autocracies exhibit the opposite pattern. Each regime type has a comparative advantage in processing one type of shock.

Second, autocratic stability comes at a welfare cost equal to the repressive threshold: when autocracies survive threshold shocks, their citizens absorb the full automation loss, while democratic survival under rapid shocks comes with compensation (Proposition 4).

Third, we show that the welfare state functions as institutional insurance against delayed shocks (Propositions 7-8). Democracies with comprehensive social protection survive threshold automation through the same logic by which autocracies with standing repressive capacity survive: both represent permanent institutional capacity that does not require crisis-triggered activation. The welfare state achieves this resilience while compensating affected workers, whereas repression leaves them to absorb the full cost. The welfare gap between surviving democratic and autocratic regimes is exactly the repressive threshold.

Section 2 presents the model. Section 3 derives Propositions 1-4 and comparative statics. Section 4 develops the welfare state extension (Propositions 7-8) and a five-type regime typology. Section 5 discusses limitations. Three appendices provide microfoundations and an extension to populist platform choice.

---

## 2. The Model

### 2.1 Environment

We consider a polity over two periods $t \in \{1, 2\}$ with a group of workers $E$ exposed to AI-driven automation. The remainder of the economy is captured by the parameter $W > w_E$, representing total per capita output. The polity operates under one of two regime types $i \in \{D, A\}$: democracy or autocracy.

**Automation trajectories.** Following Gans and Goldfarb (2026), we distinguish two stylized trajectories of automation. Under *rapid displacement* ($j = r$), automation causes immediate job loss: $\ell_1 = L$, $\ell_2 = 0$, where $L > 0$ is the magnitude of the shock. Under *threshold automation* ($j = \tau$), automation initially complements labor and only later becomes substitutive: $\ell_1 = 0$, $\ell_2 = L$. These trajectories are exogenous to the political model — they represent the economic premise imported from the automation literature.

**Preferences.** In each period, each member of $E$ chooses between $M$ (moderate — accept the status quo) and $R$ (radical — pursue regime change). Payoffs depend on the regime type.

Under democracy:
$$u_E(M \mid D, t) = w_E - \ell_t(1 - \varphi_t)$$
$$u_E(R \mid D, t) = \theta W - k$$

Under autocracy:
$$u_E(M \mid A, t) = w_E - \ell_t$$
$$u_E(R \mid A, t) = \theta W - k - \kappa_0 \cdot \eta_j$$

where $\varphi_t \in [0,1]$ is the compensatory capacity of the democracy, $\kappa_0 > 0$ is the autocracy's standing repressive capacity, $\eta_j \in (0,1]$ is repressive effectiveness (indexed by trajectory $j$, not by period), $\theta \in (0,1)$ is the share of total output captured by $E$ under regime change, and $k > 0$ is the cost of transition (violence, uncertainty, capital destruction).

The key structural asymmetry: democracy stabilizes by making $M$ more attractive (compensation reduces losses), while autocracy stabilizes by making $R$ more costly (repression raises the price of revolt).

**Timing and equilibrium.** Within each period: (1) nature reveals $\ell_t$; (2) the regime responds — in democracy, $\varphi_t$ is determined by A3; in autocracy, $\kappa_0 \cdot \eta_j$ is always active; (3) each member of $E$ chooses $M$ or $R$. In the baseline model, each member of $E$ has a strictly dominant action given the parameters, so the equilibrium concept is dominance. Appendix A uses subgame-perfect equilibrium; Appendix B uses Bayesian Nash equilibrium.

### 2.2 Assumptions

Define the auxiliary variable $\Delta \equiv \theta W - k - w_E$, which represents the net attractiveness of revolt absent automation: how much $E$ would gain (if $\Delta > 0$) or lose (if $\Delta < 0$) from regime change when fully employed.

**A1 (Stability without automation).** $\Delta < 0$. Without automation, $E$ prefers $M$ under both regimes. The regime is inherently stable.

**A2 (Automation can destabilize).** $\Delta + L > 0$, equivalently $L > |\Delta|$. The automation shock is large enough to potentially trigger regime change.

**A3 (Democratic compensation is reactive).**
$$\varphi_t = \begin{cases} \bar{\varphi} & \text{if } \ell_t > 0 \\ 0 & \text{if } \ell_t = 0 \end{cases}$$
where $\bar{\varphi} \equiv 1 - |\Delta|/L \in (0,1)$.

Democratic compensation requires political legitimacy — legislative authorization and fiscal mobilization — that emerges only under observable crisis. This pattern is historically robust: major social insurance programs are created after crises (the New Deal after the Great Depression, the welfare state after World War II), not before. Appendix A provides a formal microfoundation: in a voting game, the non-exposed majority vetoes taxation when no crisis is observed (the threat of regime change is not credible) and approves it when losses are visible (the threat becomes credible).^[The result holds for any investment rule $\varphi(\ell)$ satisfying $\varphi(0) = 0$ and $\varphi(L) \geq \bar{\varphi}$. The specific functional form of A3 is not required.]

**A4 (Repressive effectiveness depends on shock type).**
$$\eta_r \in (0,1) \quad \text{(rapid: degraded repression)}$$
$$\eta_\tau = 1 \quad \text{(threshold: full repression)}$$

Rapid shocks are visible and shared, creating near-common knowledge of grievance among affected workers. This facilitates coordination: organized opposition degrades repressive effectiveness through security force defection, international pressure, and the moral legitimacy of the cause. Threshold shocks are sudden and disorienting, producing strategic uncertainty that impedes coordination: dispersed dissent is easily contained by standing repressive apparatus. Appendix B provides a formal microfoundation via global games (Morris and Shin 2003): under rapid shocks, high signal precision yields an equilibrium with high participation in collective action; under threshold shocks, noisy private signals destroy coordination.^[The mechanism is informational, not preferential: $E$ desires revolt equally under both shock types ($u_E(R)$ is the same). What differs is the capacity to coordinate, determined by the information structure of the shock.]

**A5 (Institutional capacity requires lead time).** Compensatory capacity built in $t=1$ persists to $t=2$. No new compensatory capacity can be built in $t=2$.

Building social insurance infrastructure — legislative frameworks, administrative agencies, fiscal instruments — requires institutional investment that cannot be improvised under crisis. Welfare states are built during periods of relative stability (the post-war settlement in Western Europe, the Great Society programs in the United States), not during the crises they are designed to address. Even the New Deal, an apparent counterexample, required years of legislative design and was enabled by prior Progressive-era institutional groundwork. In our two-period framework, A5 is the minimal expression of this lag: the window for building capacity closes before the delayed shock arrives.

Note that A5 binds only under threshold automation. Under rapid displacement, the shock arrives in $t=1$ and A3 activates compensation immediately — A5 is irrelevant. A5 matters precisely when the shock is delayed: the polity cannot build capacity in response to a shock it has not yet observed. Combined with A3, this produces the democratic tragedy: reactive institutions require a signal to mobilize, but delayed shocks provide no signal until it is too late to act.

---

## 3. Results

### 3.1 Stability conditions

**Definition.** Regime $i$ is *stable under trajectory $j$* if $u_E(M \mid i, t) \geq u_E(R \mid i, t)$ for all $t$.

**Democracy.** When $\ell_t = 0$: stable by A1. When $\ell_t = L$ and $\varphi_t = \bar{\varphi}$: $u_E(M) = w_E + \Delta = u_E(R)$, stable. When $\ell_t = L$ and $\varphi_t = 0$: stability requires $\Delta + L \leq 0$, contradicting A2. *Unstable.*

The *compensatory threshold* is $\bar{\varphi} = 1 - |\Delta|/L$.

**Autocracy.** When $\ell_t = 0$: stable. When $\ell_t = L$: stable iff $\kappa_0 \cdot \eta_j \geq \Delta + L \equiv \bar{\kappa}$.

The *repressive threshold* is $\bar{\kappa} = L - |\Delta|$.

Since $\eta_r < 1$: the autocracy needs $\kappa_0 \geq \bar{\kappa}/\eta_r$ to survive rapid shocks but only $\kappa_0 \geq \bar{\kappa}$ to survive threshold shocks. Rapid displacement is *harder* for autocracies to contain.

### 3.2 Main propositions

**Proposition 1 (Democratic fragility pattern).** *Under A1-A3 and A5: (a) democracy is stable under rapid displacement; (b) democracy is unstable under threshold automation.*

*Proof.* The logic follows from the mismatch between when the shock arrives and when compensation can be built. Under rapid displacement, the crisis arrives in period 1 — observable distress triggers compensation by A3, and $\bar{\varphi}$ is calibrated to exactly offset the destabilizing force. Under threshold automation, period 1 is calm, so no compensation is built; when the shock finally arrives in period 2, it is too late.

Formally: (a) Rapid: $\ell_1 = L > 0 \Rightarrow \varphi_1 = \bar{\varphi}$ by A3; stable by construction of $\bar{\varphi}$. In period 2, $\ell_2 = 0$: stable by A1. (b) Threshold: $\ell_1 = 0 \Rightarrow \varphi_1 = 0$ by A3. At $t=2$, $\ell_2 = L$ but $\varphi_2 = 0$ by A5: unstable since $\Delta + L > 0$ (A2). $\blacksquare$

**Proposition 2 (Autocratic fragility pattern).** *Under A1, A2, A4: (a) autocracy is stable under rapid displacement iff $\kappa_0 \geq \bar{\kappa}/\eta_r$; (b) autocracy is stable under threshold automation iff $\kappa_0 \geq \bar{\kappa}$.*

*Proof.* Autocratic stability depends on whether standing repressive capacity, adjusted for its effectiveness against the type of shock, exceeds the destabilizing force. Under rapid displacement, organized opposition degrades repression (A4), so the autocracy needs more raw capacity to survive. Under threshold automation, repression operates at full effectiveness against disoriented dissent.

Formally: (a) Rapid: $\ell_1 = L$, $\eta = \eta_r$: stable iff $\kappa_0 \eta_r \geq \bar{\kappa}$, i.e., $\kappa_0 \geq \bar{\kappa}/\eta_r$. In period 2, $\ell_2 = 0$: stable by A1. (b) Threshold: $\ell_1 = 0$: stable by A1. At $t=2$, $\ell_2 = L$, $\eta = 1$: stable iff $\kappa_0 \geq \bar{\kappa}$. $\blacksquare$

**Proposition 3 (Crossed fragility).** *Under A1-A5, if $\kappa_0 \in [\bar{\kappa}, \bar{\kappa}/\eta_r)$: (a) under rapid displacement, democracy is stable and autocracy is unstable; (b) under threshold automation, democracy is unstable and autocracy is stable.*

*Proof.* The crossed pattern arises because the two regimes have opposite comparative advantages. The interval $[\bar{\kappa}, \bar{\kappa}/\eta_r)$ is nonempty since $\eta_r < 1$: degraded repression under rapid shocks creates a wedge between what autocracies can survive under each trajectory. For autocracies in this interval, capacity suffices against disoriented dissent ($\kappa_0 \geq \bar{\kappa}$) but falls short against organized opposition ($\kappa_0 < \bar{\kappa}/\eta_r$).

Combining with P1: (a) under rapid, democracy is stable by P1(a) and autocracy is unstable by P2(a); (b) under threshold, democracy is unstable by P1(b) and autocracy is stable by P2(b). $\blacksquare$

Proposition 3 is the paper's central result. Each regime has *differential institutional resilience* for one type of shock: democracies process observable shocks better (coordination channels into compensation); autocracies process delayed shocks better (repression contains disoriented opposition).

![Regime stability under two automation trajectories. The crossed fragility pattern (Proposition 3) applies to the comparison between weak democracies and moderate autocracies: green cells are stable, red cells are unstable.](figures/fig_crossed_fragility.pdf){width=85%}

**Illustrative example.** Let $w_E = 1$, $W = 2$, $L = 1$ (full displacement of exposed workers' income), $\theta = 0.5$, $k = 0.4$, $\kappa_0 = 0.8$, and $\eta_r = 0.5$. Then $\Delta = -0.4$, $\bar{\varphi} = 0.6$, $\bar{\kappa} = 0.6$, and $\kappa_0 = 0.8 \in [0.6,\; 1.2) = [\bar{\kappa},\; \bar{\kappa}/\eta_r)$, so the crossed pattern obtains:

- *Rapid + democracy*: crisis at $t=1$ triggers $\varphi_1 = 0.6$. Workers earn $u_E(M) = 1 - 1(1 - 0.6) = 0.6$, equal to $u_E(R) = 0.5 \times 2 - 0.4 = 0.6$. *Stable.*
- *Rapid + autocracy*: organized opposition degrades repression to $\kappa_0 \eta_r = 0.4 < 0.6 = \bar{\kappa}$. Workers prefer revolt: $u_E(R) = 0.6 - 0.4 = 0.2 > 0 = u_E(M)$. *Unstable.*
- *Threshold + democracy*: no crisis at $t=1$, so $\varphi_1 = 0$. At $t=2$, $\varphi_2 = 0$ (A5) and $u_E(R) = 0.6 > 0 = u_E(M)$. *Unstable.*
- *Threshold + autocracy*: sudden shock, no coordination. $\kappa_0 \eta_\tau = 0.8 > 0.6 = \bar{\kappa}$. Workers prefer moderation: $u_E(R) = 0.6 - 0.8 = -0.2 < 0 = u_E(M)$. *Stable.*

Note the welfare asymmetry: when democracy survives (rapid), workers earn $0.6$; when autocracy survives (threshold), workers earn $0$. The regime survives but citizens absorb the full shock.

**Proposition 4 (Welfare cost of autocratic stability).** *Conditional on regime survival, $E$'s welfare is strictly higher under democracy:*
$$u_E(M \mid D, \text{stable}) - u_E(M \mid A, \text{stable}) = \bar{\kappa} > 0$$

*Proof.* Compare welfare in each regime's survival scenario — the trajectory under which it is stable. When democracy survives (rapid, $t=1$), compensation offsets part of the shock: $u_E = w_E - L(1-\bar{\varphi}) = w_E + \Delta$. When autocracy survives (threshold, $t=2$), workers receive no compensation and absorb the full shock: $u_E = w_E - L$. The difference is $\Delta + L = \bar{\kappa} > 0$ by A2. $\blacksquare$

Autocratic stability is "stability without welfare." The regime survives but affected workers absorb the full automation shock. The welfare gap is exactly the repressive threshold $\bar{\kappa}$.

**Remark 1 (Threshold of thresholds).** *Define $L^* \equiv \kappa_0 + |\Delta|$. For $L > L^*$, autocracy is unstable under threshold automation.*

*Proof.* Even standing repressive capacity has limits. Stability under threshold requires $\kappa_0 \geq \bar{\kappa} = L - |\Delta|$. When the shock exceeds $L^* = \kappa_0 + |\Delta|$, the repressive threshold surpasses standing capacity: $L > L^* \Rightarrow \bar{\kappa} > \kappa_0$. $\blacksquare$

Sufficiently large shocks overwhelm even standing repressive capacity. The "threshold of thresholds" is the point where automation exceeds repression.

**Remark 2 (Width of the crossed interval).** *The set of $\kappa_0$ values generating the crossed pattern has width $\bar{\kappa}(1-\eta_r)/\eta_r$, which is increasing in $\bar{\kappa}$, decreasing in $\eta_r$, and zero when $\eta_r = 1$.*

*Proof.* The crossed fragility interval $[\bar{\kappa}, \bar{\kappa}/\eta_r)$ has width $\bar{\kappa}/\eta_r - \bar{\kappa} = \bar{\kappa}(1-\eta_r)/\eta_r$. This width grows with $\bar{\kappa}$ (larger shocks widen the interval) and shrinks with $\eta_r$ (more effective repression narrows it). When $\eta_r = 1$, the interval collapses to zero: trajectory ceases to differentiate autocratic stability. $\blacksquare$

The parameter $\eta_r$ governs everything. It captures how vulnerable autocratic repression is to organized opposition. When $\eta_r = 1$ (repression is equally effective regardless of coordination), the crossed pattern vanishes; the model collapses to one where trajectory does not matter for autocracies. The crossed fragility result is a consequence of $\eta_r < 1$ — the empirically grounded assumption that repression degrades against organized, visible, legitimate opposition.

**Corollary 1 (Autocratic typology).**

| Type | Condition | Rapid | Threshold |
|------|-----------|:-----:|:---------:|
| Democracy | (by A3) | Stable | Unstable |
| Weak autocracy | $\kappa_0 < \bar{\kappa}$ | Unstable | Unstable |
| Moderate autocracy | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_r$ | Unstable | Stable |
| Strong autocracy | $\kappa_0 \geq \bar{\kappa}/\eta_r$ | Stable | Stable |

---

## 4. Extension: The Welfare State as Institutional Insurance

The baseline model (Propositions 1-4) assumes that democracies have no standing compensatory capacity ($\varphi_0 = 0$). But some democracies maintain comprehensive social insurance — what Moene and Wallerstein (2001) model as insurance against income risk — that does not require crisis activation. We now ask: does standing compensatory capacity protect democracies against threshold automation, in the same way that standing repressive capacity protects autocracies?

**Generalized A3.** Allow standing compensatory capacity $\varphi_0 \geq 0$:
$$\varphi_t = \max\left(\varphi_0, \; \bar{\varphi} \cdot \mathbf{1}[\ell_t > 0]\right)$$

**Proposition 7 (Welfare state as insurance against delayed shocks).** *(a) Democracy is stable under threshold automation iff $\varphi_0 \geq \bar{\varphi}$. (b) For $\varphi_0 < \bar{\varphi}$, Proposition 1 holds unchanged. (c) For $\varphi_0 \geq \bar{\varphi}$, democracy is stable under both trajectories.*

*Proof.* Standing compensatory capacity functions as pre-built insurance that does not require crisis activation. (a) Under threshold at $t=2$: $\ell_2 = L$ and $\varphi_2 = \varphi_0$. Stability requires $\varphi_0 \geq \bar{\varphi}$. (b) When $\varphi_0 < \bar{\varphi}$: threshold remains unstable (same logic as P1b), while rapid is still stable since A3 triggers $\varphi_1 = \bar{\varphi}$. Identical to P1. (c) When $\varphi_0 \geq \bar{\varphi}$: in any period with $\ell_t = L$, compensation is at least $\varphi_0 \geq \bar{\varphi}$, ensuring stability regardless of trajectory. $\blacksquare$

The parameter $\varphi_0$ is the democratic analogue of $\kappa_0$. Both represent *permanent institutional capacity* functioning as insurance against delayed shocks: $\kappa_0$ through repression, $\varphi_0$ through social protection. Democracies with comprehensive welfare states ($\varphi_0 \geq \bar{\varphi}$) are functionally equivalent to strong autocracies ($\kappa_0 \geq \bar{\kappa}/\eta_r$) in terms of resilience — but with strictly superior welfare outcomes.

**Proposition 8 (Functional equivalence with welfare gap).** *Both strong democracies ($\varphi_0 \geq \bar{\varphi}$) and strong autocracies ($\kappa_0 \geq \bar{\kappa}/\eta_r$) are stable under both trajectories. But under threshold automation, $E$'s welfare differs:*
$$u_E(M \mid D\text{-strong}) - u_E(M \mid A\text{-strong}) \geq \bar{\kappa} > 0$$

*Proof.* Both strong democracies and strong autocracies survive threshold automation, but with different welfare outcomes. Strong democracy at $t=2$: $u_E = w_E - L(1-\varphi_0) \geq w_E - L(1-\bar{\varphi}) = w_E + \Delta$. Strong autocracy at $t=2$: workers receive no compensation, so $u_E = w_E - L$. The welfare gap is at least $\Delta + L = \bar{\kappa} > 0$ by A2. The regime survives in both cases, but only the democracy compensates its citizens. $\blacksquare$

This result formalizes a precise claim: the welfare state and repressive apparatus are functionally equivalent as *stabilization* mechanisms but not as *welfare* mechanisms. A strong democracy stabilizes *and* compensates. A strong autocracy stabilizes but leaves workers to bear the full cost of automation. The normative argument for comprehensive social insurance is that it purchases the same institutional resilience as repression — without the human cost.

This connects to the class compromise tradition. Przeworski and Wallerstein (1982) modeled the bargain sustaining democratic capitalism: workers consent to private profit in exchange for social protection. Our P7-P8 formalize a specific implication: when this compromise is institutionalized as a standing welfare state, it insures the regime itself — not just individual workers — against technological disruption. The authoritarian alternative, welfare spending as a substitute for (or complement to) repression to prevent insurrection (Desai, Olofsgard, and Yousef 2009), achieves stabilization but at the cost of leaving citizens uncompensated.

**Corollary 2 (Complete regime typology).**

| Type | Condition | Rapid | Threshold |
|------|-----------|:-----:|:---------:|
| Strong democracy | $\varphi_0 \geq \bar{\varphi}$ | Stable | Stable |
| Weak democracy | $\varphi_0 < \bar{\varphi}$ | Stable | Unstable |
| Weak autocracy | $\kappa_0 < \bar{\kappa}$ | Unstable | Unstable |
| Moderate autocracy | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_r$ | Unstable | Stable |
| Strong autocracy | $\kappa_0 \geq \bar{\kappa}/\eta_r$ | Stable | Stable |

The crossed fragility pattern (Proposition 3) applies to the comparison between *weak democracies* and *moderate autocracies*.

![Stability regions as a function of institutional capacity. Panel A: autocracies along $\kappa_0$, with the crossed fragility interval $[\bar{\kappa}, \bar{\kappa}/\eta_r)$ in amber. Panel B: democracies along $\varphi_0$, with the threshold $\bar{\varphi}$ separating weak from strong.](figures/fig_parametric_space.pdf){width=90%}

**Empirical mapping.**

| Theoretical type | Candidate examples |
|-----------------|-------------------|
| Strong democracy ($\varphi_0 \geq \bar{\varphi}$) | Scandinavia, Germany (comprehensive welfare state) |
| Weak democracy ($\varphi_0 < \bar{\varphi}$) | United States, United Kingdom (residual welfare state) |
| Moderate autocracy ($\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_r$) | China, Russia, Iran |
| Strong autocracy ($\kappa_0 \geq \bar{\kappa}/\eta_r$) | North Korea, Saudi Arabia |
| Weak autocracy ($\kappa_0 < \bar{\kappa}$) | Competitive autocracies pre-Arab Spring |

**Empirical proxies and rough calibration.** The model's parameters can be approximated with available data. For democratic resilience, $\varphi_0$ maps to public social spending as a share of GDP (OECD SOCX database): Scandinavian countries spend 26-30% of GDP (Denmark 28%, Sweden 26%), Germany 26%, while the United States spends 19% and the United Kingdom 21%. For repressive capacity, $\kappa_0$ maps to combined military and internal security spending as a share of GDP, supplemented by indices of state coercive capacity (e.g., V-Dem's Physical Violence Index): Saudi Arabia allocates 6-7% of GDP to defense, Russia approximately 4%, China roughly 2% on defense alone (internal security spending is not reported). For repressive effectiveness, $\eta_r$ is harder to observe directly but should correlate with security force professionalization, ethnic cohesion of the military, degree of international isolation, and — increasingly — surveillance technology deployment.

A back-of-the-envelope exercise illustrates that the crossed fragility interval is empirically relevant. If $\eta_r = 0.5$ (repression loses half its effectiveness against organized opposition), the crossed interval $[\bar{\kappa}, \bar{\kappa}/\eta_r)$ spans a factor of 2 in $\kappa_0$: any autocracy whose repressive capacity is sufficient to contain disoriented dissent but insufficient to contain organized opposition at full force falls in the crossed range. By Remark 2, the interval width is $\bar{\kappa}/\eta_r$, which for $\eta_r = 0.5$ equals $\bar{\kappa}$ itself. This suggests that a substantial fraction of real-world autocracies — those with moderate but not overwhelming coercive capacity — should exhibit the crossed pattern. Systematic measurement of $\varphi_0$, $\kappa_0$, and $\eta_r$ remains a task for empirical work, but the theoretical prediction is that the crossed fragility region is wide, not a knife-edge.

---

## 5. Discussion

### Two symmetric tragedies

The model reveals a structural irony at the heart of each regime type.

*The tragedy of democratic responsiveness.* The same property that makes democracies good for citizens — responsiveness to political demands, leading to compensatory policy — makes them fragile to delayed shocks. Without observable distress, there is no political demand; without demand, there is no action. Responsiveness is both the source of democratic strength and the mechanism of democratic fragility.

*The tragedy of autocratic repression.* The same property that makes autocracies resilient to delayed shocks — standing repressive capacity maintained independently of economic conditions — makes them (i) vulnerable to visible shocks, where organized opposition degrades repressive effectiveness, and (ii) unable to benefit citizens even when stability is preserved, since repression contains discontent without addressing its cause.

### Comparative statics

| Parameter | Effect on stability | Interpretation |
|-----------|-------------------|---------------|
| $L \uparrow$ | $\bar{\varphi} \uparrow$, $\bar{\kappa} \uparrow$ | Larger shocks destabilize both |
| $\eta_r \downarrow$ | Crossed interval widens | More autocracies exhibit the crossed pattern |
| $\theta \uparrow$ | $\Delta \uparrow$, both thresholds rise | Regime change more attractive |
| $k \uparrow$ | $\Delta \downarrow$, both thresholds fall | Regime change costlier, more stability |
| $\kappa_0 \uparrow$ | Autocracy more stable | Moves from weak to moderate to strong |
| $\varphi_0 \uparrow$ | Democracy more stable under threshold | Welfare state as insurance |

### Populism as endogenous democratic failure

The baseline model treats democratic instability under threshold automation as a consequence of reactive compensation (A3): no observable crisis, no political mobilization. But this leaves open *how* instability manifests. Even without the full multiplicity result, the model's payoff structure already reveals a structural vulnerability: because compensation is type-dependent ($u_i(C)$ varies with $x_i$) while regime change is pooling ($u_i(R)$ is identical for all), any within-group heterogeneity created by the complementary phase generates a positive base of support for radical platforms among exposed workers. Under rapid automation ($\sigma_E = 0$), this base is empty and compensation dominates. In Appendix C, we show that when campaign dynamics amplify this base, weak democracies can admit two equilibria — compromise and populist — with the welfare state ($\varphi_0 \geq \bar{\varphi}$) functioning as an equilibrium selector that eliminates the populist path.

### Limitations

The model assumes regime-specific instruments: democracies compensate, autocracies repress. In practice, regimes use mixed strategies — autocracies also redistribute (Knutsen and Rasmussen 2018) and democracies also coerce. An extension showing that instrument specialization emerges endogenously from cost advantages would strengthen the argument.

The parameter $\eta_r$ is assumed, not estimated. Empirically, $\eta_r$ should correlate with security force professionalization, ethnic cohesion of the military, international isolation, and surveillance technology. Systematic measurement remains a task for future research.

The two-period structure captures timing but not richer dynamics. A multi-period extension with learning and adjustment would allow for intermediate scenarios (partially gradual shocks) and adaptive institutional responses.

---

## 6. Conclusion

We have shown that the trajectory of AI automation — rapid displacement versus threshold substitution — produces systematically different fragility patterns across regime types. The key mechanism is the coordination capacity of affected workers, which has opposite effects on democracies (enables compensation) and autocracies (degrades repression).

Three results stand out. First, the crossed fragility pattern: each regime has comparative advantage in processing one type of shock (Proposition 3). Second, the welfare cost of autocratic resilience: when autocracies survive, their citizens bear the full cost of disruption (Proposition 4). Third, the functional equivalence of social insurance and repressive capacity as institutional insurance, with the former strictly dominating in welfare (Propositions 7-8).

The crossed fragility logic is not specific to AI: it applies whenever economic shocks differ in observability, including financial crises (slow-building versus sudden crashes), climate change (gradual warming versus extreme events), and demographic transitions.

The policy implication is direct. Democracies facing AI automation with potential threshold dynamics — sectors where automation initially complements and later substitutes — should invest in standing social insurance *before* the crisis materializes. This is not merely a humanitarian argument. It is a regime-stability argument: the welfare state is the democratic substitute for the repressive apparatus that autocracies maintain as a matter of course. The difference is that social insurance protects both the regime and its citizens, while repression protects only the regime.

---

## References

Acemoglu, D., and J. A. Robinson. 2006. *Economic Origins of Dictatorship and Democracy*. Cambridge University Press.

Acemoglu, D., and P. Restrepo. 2020. "Robots and Jobs: Evidence from US Labor Markets." *Journal of Political Economy* 128(6): 2188-2244.

Autor, D. H., F. Levy, and R. J. Murnane. 2003. "The Skill Content of Recent Technological Change: An Empirical Exploration." *Quarterly Journal of Economics* 118(4): 1279-1333.

Boix, C. 2003. *Democracy and Redistribution*. Cambridge University Press.

Chwe, M. S.-Y. 2001. *Rational Ritual: Culture, Coordination, and Common Knowledge*. Princeton University Press.

Desai, R. M., A. Olofsgard, and T. M. Yousef. 2009. "The Logic of Authoritarian Bargains." *Economics and Politics* 21(1): 93-125.

Edmond, C. 2013. "Information Manipulation, Coordination, and Regime Change." *Review of Economic Studies* 80(4): 1422-1458.

Gans, J. S., and A. Goldfarb. 2026. "O-Ring Automation." Working paper.

Knutsen, C. H., and M. Rasmussen. 2018. "The Autocratic Welfare State: Old-Age Pensions, Credible Commitments, and Regime Survival." *Comparative Political Studies* 51(5): 659-695.

Kuran, T. 1991. "Now Out of Never: The Element of Surprise in the East European Revolution of 1989." *World Politics* 44(1): 7-48.

Lake, D. A. 2009. "Open Economy Politics: A Critical Review." *Review of International Organizations* 4(3): 219-244.

Moene, K. O., and M. Wallerstein. 2001. "Inequality, Social Insurance, and Redistribution." *American Political Science Review* 95(4): 859-874.

Morris, S., and H. S. Shin. 2003. "Global Games: Theory and Applications." In *Advances in Economics and Econometrics*, edited by M. Dewatripont, L. P. Hansen, and S. J. Turnovsky. Cambridge University Press.

Przeworski, A. 2005. "Democracy as an Equilibrium." *Public Choice* 123: 253-273.

Przeworski, A. 2006. "Self-Enforcing Democracy." In *Oxford Handbook of Political Economy*, edited by B. R. Weingast and D. A. Wittman. Oxford University Press.

Przeworski, A., and F. Limongi. 1997. "Modernization: Theories and Facts." *World Politics* 49(2): 155-183.

Przeworski, A., M. E. Alvarez, J. A. Cheibub, and F. Limongi. 2000. *Democracy and Development: Political Institutions and Well-Being in the World, 1950-1990*. Cambridge University Press.

Przeworski, A., and M. Wallerstein. 1982. "The Structure of Class Conflict in Democratic Capitalist Societies." *American Political Science Review* 76(2): 215-238.

Svolik, M. W. 2012. *The Politics of Authoritarian Rule*. Cambridge University Press.

Bonomi, G., N. Gennaioli, and G. Tabellini. 2021. "Identity, Beliefs, and Political Conflict." *Quarterly Journal of Economics* 136(4): 2259-2313.

---

## Appendix A: Microfoundation of A3 — A Voting Model of Reactive Compensation

### Setup

Two groups within the democracy: $E$ (exposed, mass $\mu_E$) and $N$ (non-exposed, mass $\mu_N > \mu_E$). Within each period, after $\ell_t$ is revealed: (1) $E$ announces political stance ($M$ or $R$); (2) $N$ votes on a tax rate $\tau_t$ financing compensation $\varphi_t$; (3) $E$ takes final action.

$N$'s payoff: $U_N = w_N - \tau_t c - \gamma \cdot \mathbf{1}[R \text{ occurs}]$, where $c > 0$ is the per-unit cost of taxation, $\alpha \in (0,1)$ is the fraction of $N$'s income preserved under regime change, and $\gamma \equiv (1-\alpha)w_N > 0$ is the cost $N$ bears under regime change.

### Equilibrium

**When $\ell_t = 0$:** By A1, $E$ cannot credibly threaten $R$ (revolt is dominated even without compensation). $N$'s optimal tax is $\tau^* = 0$.

**When $\ell_t = L$:** $E$'s threat is credible (by A2). $N$ compares pacification ($\tau = \bar{\varphi}$, payoff $w_N - \bar{\varphi} c$) versus instability ($\tau = 0$, payoff $w_N - \gamma$). $N$ pacifies iff $\gamma \geq \bar{\varphi} c$.

**Parameter restriction (P-R):** $\gamma / c \geq \bar{\varphi}$. Under (P-R), the unique subgame-perfect equilibrium yields $\varphi^*(0) = 0$ and $\varphi^*(L) = \bar{\varphi}$, recovering A3 as an equilibrium result.

The microfoundation rests on three primitives: majority rule ($\mu_N > \mu_E$), shock-contingent outside option (automation activates $E$'s threat), and $N$'s fear of instability ($\gamma > 0$). The non-exposed majority is the bottleneck: it funds social insurance only under duress.

---

## Appendix B: Microfoundation of A4 — Coordination as Global Game

### Setup

A continuum of $E$-members indexed by $i$, each choosing $a_i \in \{0,1\}$ (participate in revolt or abstain). Revolt succeeds iff participation $\pi \equiv \int a_i \, di \geq \bar{\pi} \equiv \kappa_0/\kappa_{\max}$. Each agent observes a private signal $s_i = \omega + \sigma \varepsilon_i$ about shock severity, where signal noise $\sigma$ depends on the trajectory:

- Rapid ($\sigma_r \approx 0$): visible, shared experience. Near-common knowledge.
- Threshold ($\sigma_\tau \gg 0$): sudden, disorienting. Noisy private signals.

Net benefit of successful revolt: $G = \theta W - k - (w_E - L) = \bar{\kappa} > 0$ (by A2). Cost of failed participation: $d > 0$.

### Equilibrium

**Rapid shock ($\sigma \to 0$):** The game approaches complete information. The risk-dominant equilibrium features high participation when $G/(G+d) > \bar{\pi}$, which holds for moderately repressive autocracies. Organized opposition.

**Threshold shock ($\sigma$ large):** Strategic uncertainty dominates. Each agent's posterior about others' participation is diffuse. The unique Bayesian Nash equilibrium features low participation: $\pi^*_\tau < \bar{\pi}$. Revolt fails. Disorganized dissent.

### Mapping to $\eta$

Define $\eta(j) = h(\pi^*_j)$ where $h$ is decreasing, $h(0) = 1$. Under rapid: $\pi^*$ high $\Rightarrow$ $\eta_r < 1$ (organized opposition degrades repression). Under threshold: $\pi^*$ low $\Rightarrow$ $\eta_\tau = 1$ (repression fully effective). This recovers A4 as an equilibrium outcome.

The mechanism is informational: $E$ desires revolt equally under both shocks, but can only coordinate under rapid. Common knowledge enables collective action (Chwe 2001); strategic uncertainty prevents it (Kuran 1991).^[Przeworski and Limongi (1997) established the empirical precursor: economic development does not cause transitions to democracy, but existing democracies at higher income levels survive longer. Our model provides a mechanism for why economic disruptions differentially affect regime survival depending on both the trajectory of the disruption and the type of regime.]

---

## Appendix C: Endogenous Platform Choice and Populism under Threshold Automation

### Setup

This appendix refines the democratic instability result (Proposition 1b) by endogenizing the political response to threshold shocks. The baseline model shows that weak democracies are unstable under threshold automation because compensation cannot be activated without observable crisis (A3). But *how* does instability manifest politically? We show that the complementary phase preceding the threshold shock creates conditions for populist platform choice.

Focus on democracy at $t = 2$ after a threshold trajectory: $\ell_1 = 0$, $\ell_2 = L$, with $\varphi_0 < \bar{\varphi}$.

Insert one agenda-setting stage before the voting game of Appendix A. After the threshold shock is revealed, an agenda-setter inside $E$ chooses which platform to organize:

- $C$: a compensatory demand that sends the game to Appendix A, where $N$ decides whether to finance $\bar{\varphi}$
- $R$: a populist demand for democratic backsliding, delivering the regime-change payoff already in the baseline model

The agenda-setter maximizes political control of $E$, not $E$'s welfare. This is a model of elite capture: populism emerges when a political entrepreneur finds it profitable to organize grievance rather than compensation, not because affected workers are irrational.

### Heterogeneity from complementarity

Under threshold automation, the complementary phase ($\ell_1 = 0$) generates unequal gains within $E$: some workers benefit more from AI complementarity than others. Let exposed worker $i$ have type $x_i \sim F_{\sigma}$, centered at $w_E$, with dispersion $\sigma_E$ representing within-group heterogeneity created by the complementary phase.

Under rapid automation, there is no complementary phase, so $\sigma_E = 0$ and all workers have $x_i = w_E$.

### Material payoffs

If the agenda-setter offers compensation and the compensatory platform is implemented, worker $i$ receives:

$$u_i(C) = x_i - L(1 - \bar{\varphi})$$

If the agenda-setter offers populism, worker $i$ receives the regime-change payoff:

$$u_i(R) = \theta W - k = w_E + \Delta$$

The central asymmetry: $u_i(C)$ is type-dependent (payoff varies with $x_i$), while $u_i(R)$ is pooling (payoff identical for every type). Under heterogeneity, uniform compensation does not satisfy all exposed workers equally. That is the opening for populism.

### Platform payoffs

The agenda-setter values political control of the exposed bloc by $B > 0$. Offering $R$ requires a fixed mobilization cost $f > 0$. Let $s_C(\sigma_E)$ denote support for $C$ inside $E$, and $s_R^0(\sigma_E)$, $s_R^1(\sigma_E)$ denote support for $R$ absent and with campaign momentum, respectively, with $s_R^1 > s_R^0$ for all $\sigma_E > 0$.

Define platform payoffs:

$$\Pi_C = B \, s_C(\sigma_E)$$
$$\Pi_R^0 = B \, s_R^0(\sigma_E) - f$$
$$\Pi_R^1 = B \, s_R^1(\sigma_E) - f$$

The difference between $s_R^0$ and $s_R^1$ captures campaign amplification: entry itself activates an identity-based cleavage that fragments $E$'s compensatory coalition, increasing support for $R$ beyond its material baseline. We model this amplification in reduced form; the mechanism is that populist campaigns offer a message-simple platform (shared grievance against elites) while compensatory platforms require message-complex coordination (each worker's type determines their benefit). Under the strategic uncertainty of threshold shocks, the simpler message is focal (cf. Bonomi, Gennaioli, and Tabellini 2021 on endogenous salience of identity cleavages).^[A full microfoundation of campaign amplification via informational complexity — where $R$ is focal because it requires no private information about $x_i$ while $C$ requires each worker to assess their own type — is left for future work.]

### Equilibrium

A *compromise equilibrium* exists whenever $\Pi_C \geq \Pi_R^0$ (the agenda-setter prefers $C$ when no populist momentum is expected). A *populist equilibrium* exists whenever $\Pi_R^1 \geq \Pi_C$ (the agenda-setter prefers $R$ when entry triggers momentum). Both equilibria coexist when $\Pi_R^0 \leq \Pi_C \leq \Pi_R^1$.

**Proposition 9 (Endogenous populist platform choice).** *Suppose democracy faces threshold automation, $\varphi_0 < \bar{\varphi}$, and exposed workers have types $x_i \sim F_{\sigma}$ centered at $w_E$. An agenda-setter inside $E$ chooses between organizing compensation ($C$) and organizing populism ($R$). Then:*

1. *Under rapid automation ($\sigma_E = 0$), only the compensatory equilibrium exists.*
2. *Under threshold automation, a compromise equilibrium exists if $\Pi_C \geq \Pi_R^0$.*
3. *Under threshold automation, a populist equilibrium exists if $\Pi_R^1 \geq \Pi_C$.*
4. *Hence weak democracies admit two equilibria whenever $\Pi_R^0 \leq \Pi_C \leq \Pi_R^1$.*
5. *If $\varphi_0 \geq \bar{\varphi}$, only the compensatory equilibrium exists.*

*Proof sketch.* Under rapid automation, $\sigma_E = 0$, so all exposed workers have the same type and populism has no pooling advantage: $s_C = 1$, $s_R^0 = s_R^1 = 0$, so $\Pi_C > \Pi_R^1$. Under threshold automation, heterogeneity makes compensation politically incomplete because $u_i(C)$ depends on $x_i$ while $u_i(R)$ does not. If the agenda-setter expects no populist momentum, $R$ yields only $\Pi_R^0$, so compensation survives whenever $\Pi_C \geq \Pi_R^0$. If the agenda-setter expects populist entry to activate an identity-based cleavage, $R$ yields $\Pi_R^1$, so populism is viable whenever $\Pi_R^1 \geq \Pi_C$. Both inequalities can hold simultaneously, generating two equilibria. Finally, if $\varphi_0 \geq \bar{\varphi}$, compensation is automatic and the agenda-setting margin disappears. $\blacksquare$

### Uniform example

Take $x_i \sim \text{Uniform}[w_E - \sigma_E, \, w_E + \sigma_E]$ and let $\psi(\sigma_E) = \rho \, \sigma_E^2$ with $\rho > 0$. Then $s_C = 1/2$, $s_R^0 = 1/2$, and $s_R^1 = 1/2 + \rho \, \sigma_E / 2$. The compromise equilibrium always exists. The populist equilibrium exists iff:

$$\sigma_E \geq \bar{\sigma} \equiv \frac{2f}{B\rho}$$

Greater heterogeneity, lower mobilization costs, higher value of political control, and stronger campaign amplification all expand the region where populism is viable.

### Interpretation

Proposition 9 does not replace Appendix A. It sits one step before it. Appendix A explains when $N$ pays for compensation once a compensatory demand exists. Proposition 9 explains when such a demand exists in the first place. The contribution is that threshold automation can fail democratically not because the shock is unseen, but because the complementary phase has already fragmented the exposed bloc before the majority decides whether to compensate it.

This also deepens Proposition 7: the welfare state ($\varphi_0 \geq \bar{\varphi}$) does not only insure against delayed shocks mechanically — it shuts down the political profitability of populist platform choice by making the agenda-setting stage irrelevant.
