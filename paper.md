# AI Automation, Regime Type, and Crossed Fragility

---

## Abstract

How does AI-driven automation affect the stability of democracies versus autocracies? We develop a formal model showing that the *trajectory* of automation — not just its magnitude — determines which regime type is more fragile. We compare two stylized trajectories borrowed from the O-Ring automation framework (Gans and Goldfarb 2026): rapid displacement (immediate job loss) and threshold automation (initial complementarity followed by sudden substitution). We find a *crossed fragility* result: democracies are stable under rapid displacement but fragile under threshold automation, while autocracies exhibit the opposite pattern. The mechanism operates through the coordination capacity of affected workers, which has opposite effects on each regime's stabilization instrument. Rapid shocks create common knowledge of grievance, enabling coordinated opposition that overwhelms autocratic repression but channels into democratic compensation. Threshold shocks produce disorientation and strategic uncertainty, paralyzing democratic response (no observable crisis to trigger investment in social protection) while preserving repressive effectiveness against dispersed dissent. We further show that comprehensive social insurance achieves the same institutional resilience as repressive capacity — without the human cost. Welfare states function as the democratic equivalent of standing repressive apparatus: both provide insurance against delayed shocks, but only the former compensates the affected. The model generates a five-type regime typology with clear empirical mapping and testable predictions about which countries are most vulnerable to which automation trajectory.

---

## 1. Introduction

We show that comprehensive social insurance achieves the same institutional resilience as repressive capacity — without the human cost. This is not a normative aspiration. It is a formal result of a model that asks a question at the intersection of two literatures that rarely speak to each other: the economics of AI automation and the comparative politics of regime stability.

Recent advances in artificial intelligence have renewed concerns about large-scale labor market disruption. A growing economic literature emphasizes that the impact of automation depends on the structure of tasks within jobs and the response of demand (Autor, Levy, and Murnane 2003; Acemoglu and Restrepo 2020). Gans and Goldfarb (2026) formalize a key distinction: when production relies on complementary tasks (O-Ring structure), partial automation may initially increase worker productivity, and only after certain thresholds are crossed does automation become strongly substitutive. This implies that automation may follow qualitatively different trajectories — rapid displacement in some sectors and delayed, nonlinear substitution in others.

The political implications of this distinction have not been explored. The regime stability literature models economic shocks as uniform: a given magnitude of disruption either threatens the regime or does not. Acemoglu and Robinson (2006) show that *transitory* shocks can trigger regime transitions by opening windows of opportunity, but treat transitoriness as binary. Przeworski (2005, 2006) models democracy as a self-enforcing equilibrium where both factions prefer continued elections to rebellion, but the model is comparative-static in income — it does not address what happens when income is suddenly disrupted, let alone how the *shape* of that disruption matters. The empirical record suggests an asymmetry: democracies are fragile under economic crises while autocracies prove resilient (Przeworski et al. 2000), but no formal model explains *why* or specifies the conditions under which this pattern reverses.

This paper fills that gap. We build a two-period model in the Open Economy Politics tradition (Lake 2009): the economics of automation is taken as given (from Gans and Goldfarb 2026), and we derive the political-institutional implications. The model produces three main results.

**First**, we establish a *crossed fragility* pattern (Proposition 3): for autocracies with moderate repressive capacity, democracies are stable under rapid displacement but unstable under threshold automation, while autocracies exhibit the opposite pattern. Each regime type has a comparative advantage in processing one type of shock.

**Second**, we identify the mechanism: the *coordination capacity* of affected workers is the mediating variable. Rapid shocks create visible, shared experiences that generate near-common knowledge of grievance (Chwe 2001), enabling collective action. This coordination benefits democracies — political pressure channels into compensatory policy — but threatens autocracies, whose repression degrades against organized, legitimate opposition (Kuran 1991; Edmond 2013). Threshold shocks produce sudden, disorienting losses that impede coordination through strategic uncertainty. This paralyzes democracies — no observable crisis means no political demand for protection — but preserves repressive effectiveness, since dispersed dissent is easily contained.

**Third**, we show that the welfare state functions as institutional insurance against delayed shocks (Propositions 7-8). Democracies with comprehensive social protection survive threshold automation through the same logic by which autocracies with standing repressive capacity survive: both represent permanent institutional capacity that does not require crisis-triggered activation. But the welfare state achieves this resilience while compensating affected workers, whereas repression achieves it while leaving them to absorb the full cost. The welfare gap between surviving democratic and autocratic regimes is exactly the repression threshold — a formal expression of the idea that social insurance is a more humane functional equivalent of coercion.

This last result connects to a long tradition. Przeworski and Wallerstein (1982) modeled the class compromise that sustains democratic capitalism: workers consent to private profit in exchange for social protection. Our model formalizes a specific implication: this compromise, when institutionalized as a welfare state, provides insurance not just for individuals against income loss, but for the regime itself against technological disruption. The authoritarian alternative — repression as regime insurance (Desai, Olofsgard, and Yousef 2009) — is functionally equivalent in stabilization but strictly inferior in welfare.

The paper proceeds as follows. Section 2 presents the model. Section 3 derives the main results (Propositions 1-6). Section 4 develops the welfare state extension (Propositions 7-8) and the complete regime typology. Section 5 discusses implications, limitations, and avenues for future research. Appendix A provides a game-theoretic microfoundation for the assumption of reactive democratic compensation. Appendix B provides a global-games microfoundation for the assumption of variable repressive effectiveness.

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
$$u_E(R \mid A, t) = \theta W - k - \kappa_0 \cdot \eta_t$$

where $\varphi_t \in [0,1]$ is the compensatory capacity of the democracy, $\kappa_0 > 0$ is the autocracy's standing repressive capacity, $\eta_t \in (0,1]$ is repressive effectiveness, $\theta \in (0,1)$ is the share of total output captured by $E$ under regime change, and $k > 0$ is the cost of transition (violence, uncertainty, capital destruction).

The key structural asymmetry: democracy stabilizes by making $M$ more attractive (compensation reduces losses), while autocracy stabilizes by making $R$ more costly (repression raises the price of revolt).

### 2.2 Assumptions

Define the auxiliary variable $\Delta \equiv \theta W - k - w_E$.

**A1 (Stability without automation).** $\Delta < 0$. Without automation, $E$ prefers $M$ under both regimes. The regime is inherently stable.

**A2 (Automation can destabilize).** $\Delta + L > 0$, equivalently $L > |\Delta|$. The automation shock is large enough to potentially trigger regime change.

**A3 (Democratic compensation is reactive).**
$$\varphi_t = \begin{cases} \bar{\varphi} & \text{if } \ell_t > 0 \\ 0 & \text{if } \ell_t = 0 \end{cases}$$
where $\bar{\varphi} \equiv 1 - |\Delta|/L \in (0,1)$.

Democratic compensation requires political legitimacy — legislative authorization and fiscal mobilization — that emerges only under observable crisis. This pattern is historically robust: major social insurance programs are created after crises (the New Deal after the Great Depression, the welfare state after World War II), not before. Appendix A provides a formal microfoundation: in a voting game, the non-exposed majority vetoes taxation when no crisis is observed (the threat of regime change is not credible) and approves it when losses are visible (the threat becomes credible).^[The result holds for any investment rule $\varphi(\ell)$ satisfying $\varphi(0) = 0$ and $\varphi(L) \geq \bar{\varphi}$. The specific functional form of A3 is not required.]

**A4 (Repressive effectiveness depends on shock type).**
$$\eta(r) = \eta_R \in (0,1) \quad \text{(rapid: degraded repression)}$$
$$\eta(\tau) = 1 \quad \text{(threshold: full repression)}$$

Rapid shocks are visible and shared, creating near-common knowledge of grievance among affected workers. This facilitates coordination: organized opposition degrades repressive effectiveness through security force defection, international pressure, and the moral legitimacy of the cause. Threshold shocks are sudden and disorienting, producing strategic uncertainty that impedes coordination: dispersed dissent is easily contained by standing repressive apparatus. Appendix B provides a formal microfoundation via global games (Morris and Shin 2003): under rapid shocks, high signal precision yields an equilibrium with high participation in collective action; under threshold shocks, noisy private signals destroy coordination.^[The mechanism is informational, not preferential: $E$ desires revolt equally under both shock types ($u_E(R)$ is the same). What differs is the capacity to coordinate, determined by the information structure of the shock.]

**A5 (Capacity is a stock).** Capacity built in $t=1$ persists to $t=2$. No new capacity can be built in $t=2$.

---

## 3. Results

### 3.1 Stability conditions

**Definition.** Regime $i$ is *stable under trajectory $j$* if $u_E(M \mid i, t) \geq u_E(R \mid i, t)$ for all $t$.

**Democracy.** When $\ell_t = 0$: stable by A1. When $\ell_t = L$ and $\varphi_t = \bar{\varphi}$: $u_E(M) = w_E + \Delta = u_E(R)$, stable. When $\ell_t = L$ and $\varphi_t = 0$: stability requires $\Delta + L \leq 0$, contradicting A2. *Unstable.*

The *compensatory threshold* is $\bar{\varphi} = 1 - |\Delta|/L$.

**Autocracy.** When $\ell_t = 0$: stable. When $\ell_t = L$: stable iff $\kappa_0 \cdot \eta_t \geq \Delta + L \equiv \bar{\kappa}$.

The *repressive threshold* is $\bar{\kappa} = L - |\Delta|$.

Since $\eta_R < 1$: the autocracy needs $\kappa_0 \geq \bar{\kappa}/\eta_R$ to survive rapid shocks but only $\kappa_0 \geq \bar{\kappa}$ to survive threshold shocks. Rapid displacement is *harder* for autocracies to contain.

### 3.2 Main propositions

**Proposition 1 (Democratic fragility pattern).** *Under A1-A3 and A5: (a) democracy is stable under rapid displacement; (b) democracy is unstable under threshold automation.*

*Proof.* (a) Rapid: $\ell_1 = L > 0 \Rightarrow \varphi_1 = \bar{\varphi}$ by A3; stable by construction of $\bar{\varphi}$. $\ell_2 = 0$: stable by A1. (b) Threshold: $\ell_1 = 0 \Rightarrow \varphi_1 = 0$ by A3. $\ell_2 = L$ with $\varphi_2 = 0$ by A5: unstable since $\Delta + L > 0$ (A2). $\blacksquare$

**Proposition 2 (Autocratic fragility pattern).** *Under A1, A2, A4: (a) autocracy is stable under rapid displacement iff $\kappa_0 \geq \bar{\kappa}/\eta_R$; (b) autocracy is stable under threshold automation iff $\kappa_0 \geq \bar{\kappa}$.*

*Proof.* (a) $\ell_1 = L$, $\eta = \eta_R$: stable iff $\kappa_0 \eta_R \geq \bar{\kappa}$. $\ell_2 = 0$: stable. (b) $\ell_1 = 0$: stable. $\ell_2 = L$, $\eta = 1$: stable iff $\kappa_0 \geq \bar{\kappa}$. $\blacksquare$

**Proposition 3 (Crossed fragility).** *Under A1-A5, if $\kappa_0 \in [\bar{\kappa}, \bar{\kappa}/\eta_R)$: (a) under rapid displacement, democracy is stable and autocracy is unstable; (b) under threshold automation, democracy is unstable and autocracy is stable.*

*Proof.* The interval is nonempty since $\eta_R < 1$. (a) Democracy stable by P1(a); autocracy: $\kappa_0 < \bar{\kappa}/\eta_R$, unstable by P2(a). (b) Democracy unstable by P1(b); autocracy: $\kappa_0 \geq \bar{\kappa}$, stable by P2(b). $\blacksquare$

Proposition 3 is the paper's central result. Each regime has *differential institutional resilience* for one type of shock: democracies process observable shocks better (coordination channels into compensation); autocracies process delayed shocks better (repression contains disoriented opposition).

**Proposition 4 (Welfare cost of autocratic stability).** *Conditional on regime survival, $E$'s welfare is strictly higher under democracy:*
$$u_E(M \mid D, \text{stable}) - u_E(M \mid A, \text{stable}) = \bar{\kappa} > 0$$

*Proof.* Democracy stable (rapid, $t=1$): $u_E = w_E + \Delta$. Autocracy stable (threshold, $t=2$): $u_E = w_E - L$. Difference: $\Delta + L = \bar{\kappa} > 0$. $\blacksquare$

Autocratic stability is "stability without welfare." The regime survives but affected workers absorb the full automation shock. The welfare gap is exactly the repressive threshold $\bar{\kappa}$.

**Proposition 5 (Threshold of thresholds).** *Define $L^* \equiv \kappa_0 + |\Delta|$. For $L > L^*$, autocracy is unstable under threshold automation.*

*Proof.* Stability requires $\kappa_0 \geq \bar{\kappa} = L - |\Delta|$. $L > \kappa_0 + |\Delta| \Rightarrow \bar{\kappa} > \kappa_0$. $\blacksquare$

Sufficiently large shocks overwhelm even standing repressive capacity. The "threshold of thresholds" is the point where automation exceeds repression.

**Proposition 6 (Width of the crossed interval).** *The set of $\kappa_0$ values generating the crossed pattern has width $\bar{\kappa}(1-\eta_R)/\eta_R$, which is increasing in $\bar{\kappa}$, decreasing in $\eta_R$, and zero when $\eta_R = 1$.*

*Proof.* $|\bar{\kappa}/\eta_R - \bar{\kappa}| = \bar{\kappa}(1-\eta_R)/\eta_R$. Derivatives are immediate. $\blacksquare$

The parameter $\eta_R$ governs everything. It captures how vulnerable autocratic repression is to organized opposition. When $\eta_R = 1$ (repression is equally effective regardless of coordination), the crossed pattern vanishes; the model collapses to one where trajectory does not matter for autocracies. The crossed fragility result is a consequence of $\eta_R < 1$ — the empirically grounded assumption that repression degrades against organized, visible, legitimate opposition.

**Corollary 1 (Autocratic typology).**

| Type | Condition | Rapid | Threshold |
|------|-----------|:-----:|:---------:|
| Democracy | (by A3) | Stable | Unstable |
| Weak autocracy | $\kappa_0 < \bar{\kappa}$ | Unstable | Unstable |
| Moderate autocracy | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$ | Unstable | Stable |
| Strong autocracy | $\kappa_0 \geq \bar{\kappa}/\eta_R$ | Stable | Stable |

---

## 4. Extension: The Welfare State as Institutional Insurance

The baseline model (Propositions 1-6) assumes that democracies have no standing compensatory capacity ($\varphi_0 = 0$). But some democracies maintain comprehensive social insurance that does not require crisis activation. We now ask: does standing compensatory capacity protect democracies against threshold automation, in the same way that standing repressive capacity protects autocracies?

**Generalized A3.** Allow standing compensatory capacity $\varphi_0 \geq 0$:
$$\varphi_t = \max\left(\varphi_0, \; \bar{\varphi} \cdot \mathbf{1}[\ell_t > 0]\right)$$

**Proposition 7 (Welfare state as insurance against delayed shocks).** *(a) Democracy is stable under threshold automation iff $\varphi_0 \geq \bar{\varphi}$. (b) For $\varphi_0 < \bar{\varphi}$, Proposition 1 holds unchanged. (c) For $\varphi_0 \geq \bar{\varphi}$, democracy is stable under both trajectories.*

*Proof.* (a) Threshold, $t=2$: $\ell_2 = L$, $\varphi_2 = \varphi_0$. Stable iff $\varphi_0 \geq \bar{\varphi}$. (b) $\varphi_0 < \bar{\varphi}$: threshold $t=2$ has $\varphi_2 = \varphi_0 < \bar{\varphi}$, unstable; rapid $t=1$ has $\varphi_1 = \bar{\varphi}$, stable. Identical to P1. (c) $\varphi_0 \geq \bar{\varphi}$: in any period with $\ell_t = L$, $\varphi_t \geq \varphi_0 \geq \bar{\varphi}$, stable. $\blacksquare$

The parameter $\varphi_0$ is the democratic analogue of $\kappa_0$. Both represent *permanent institutional capacity* functioning as insurance against delayed shocks: $\kappa_0$ through repression, $\varphi_0$ through social protection. Democracies with comprehensive welfare states ($\varphi_0 \geq \bar{\varphi}$) are functionally equivalent to strong autocracies ($\kappa_0 \geq \bar{\kappa}/\eta_R$) in terms of resilience — but with strictly superior welfare outcomes.

**Proposition 8 (Functional equivalence with welfare gap).** *Both strong democracies ($\varphi_0 \geq \bar{\varphi}$) and strong autocracies ($\kappa_0 \geq \bar{\kappa}/\eta_R$) are stable under both trajectories. But under threshold automation, $E$'s welfare differs:*
$$u_E(M \mid D\text{-strong}) - u_E(M \mid A\text{-strong}) \geq \bar{\kappa} > 0$$

*Proof.* Strong democracy, threshold $t=2$: $u_E = w_E - L(1-\varphi_0) \geq w_E - L(1-\bar{\varphi}) = w_E + \Delta$. Strong autocracy, threshold $t=2$: $u_E = w_E - L$. Difference $\geq \bar{\kappa} > 0$ by A2. $\blacksquare$

This result formalizes a precise claim: the welfare state and repressive apparatus are functionally equivalent as *stabilization* mechanisms but not as *welfare* mechanisms. A strong democracy stabilizes *and* compensates. A strong autocracy stabilizes but leaves workers to bear the full cost of automation. The normative argument for comprehensive social insurance is that it purchases the same institutional resilience as repression — without the human cost.

This connects to the class compromise tradition. Przeworski and Wallerstein (1982) modeled the bargain sustaining democratic capitalism: workers consent to private profit in exchange for social protection. Our P7-P8 formalize a specific implication: when this compromise is institutionalized as a standing welfare state, it insures the regime itself — not just individual workers — against technological disruption. The authoritarian alternative, welfare spending as a substitute for (or complement to) repression to prevent insurrection (Desai, Olofsgard, and Yousef 2009), achieves stabilization but at the cost of leaving citizens uncompensated.

**Corollary 2 (Complete regime typology).**

| Type | Condition | Rapid | Threshold |
|------|-----------|:-----:|:---------:|
| Strong democracy | $\varphi_0 \geq \bar{\varphi}$ | Stable | Stable |
| Weak democracy | $\varphi_0 < \bar{\varphi}$ | Stable | Unstable |
| Weak autocracy | $\kappa_0 < \bar{\kappa}$ | Unstable | Unstable |
| Moderate autocracy | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$ | Unstable | Stable |
| Strong autocracy | $\kappa_0 \geq \bar{\kappa}/\eta_R$ | Stable | Stable |

The crossed fragility pattern (Proposition 3) applies to the comparison between *weak democracies* and *moderate autocracies*.

**Empirical mapping.**

| Theoretical type | Candidate examples |
|-----------------|-------------------|
| Strong democracy ($\varphi_0 \geq \bar{\varphi}$) | Scandinavia, Germany (comprehensive welfare state) |
| Weak democracy ($\varphi_0 < \bar{\varphi}$) | United States, United Kingdom (residual welfare state) |
| Moderate autocracy ($\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$) | China, Russia, Iran |
| Strong autocracy ($\kappa_0 \geq \bar{\kappa}/\eta_R$) | North Korea, Saudi Arabia |
| Weak autocracy ($\kappa_0 < \bar{\kappa}$) | Competitive autocracies pre-Arab Spring |

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
| $\eta_R \downarrow$ | Crossed interval widens | More autocracies exhibit the crossed pattern |
| $\theta \uparrow$ | $\Delta \uparrow$, both thresholds rise | Regime change more attractive |
| $k \uparrow$ | $\Delta \downarrow$, both thresholds fall | Regime change costlier, more stability |
| $\kappa_0 \uparrow$ | Autocracy more stable | Moves from weak to moderate to strong |
| $\varphi_0 \uparrow$ | Democracy more stable under threshold | Welfare state as insurance |

### Transferability

The crossed fragility result generalizes beyond AI automation. For any economic shock with two possible trajectories — observable versus delayed — the model predicts that responsive institutions process observable shocks better and permanent-capacity institutions process delayed shocks better. The coordination of affected populations is the mediating variable: observable shocks facilitate it (benefiting institutions that channel coordination); delayed shocks impede it (benefiting institutions that operate independently of coordination). Applications include climate change (gradual warming versus sudden extreme events), financial crises (slow-building versus sudden crashes), and demographic transitions (gradual aging versus sudden labor force contraction).

### Limitations

The model assumes regime-specific instruments: democracies compensate, autocracies repress. In practice, regimes use mixed strategies — autocracies also redistribute (Knutsen and Rasmussen 2018) and democracies also coerce. An extension showing that instrument specialization emerges endogenously from cost advantages would strengthen the argument.

The parameter $\eta_R$ is assumed, not estimated. Empirically, $\eta_R$ should correlate with security force professionalization, ethnic cohesion of the military, international isolation, and surveillance technology. Systematic measurement remains a task for future research.

The two-period structure captures timing but not richer dynamics. A multi-period extension with learning and adjustment would allow for intermediate scenarios (partially gradual shocks) and adaptive institutional responses.

---

## 6. Conclusion

We have shown that the trajectory of AI automation — rapid displacement versus threshold substitution — produces systematically different fragility patterns across regime types. The key mechanism is the coordination capacity of affected workers, which has opposite effects on democracies (enables compensation) and autocracies (degrades repression).

Three results stand out. First, the crossed fragility pattern: each regime has comparative advantage in processing one type of shock (Proposition 3). Second, the welfare cost of autocratic resilience: when autocracies survive, their citizens bear the full cost of disruption (Proposition 4). Third, the functional equivalence of social insurance and repressive capacity as institutional insurance, with the former strictly dominating in welfare (Propositions 7-8).

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

Kuran, T. 1991. "Now Out of Never: The Element of Surprise in the East European Revolution of 1989." *World Politics* 44(1): 7-48.

Lake, D. A. 2009. "Open Economy Politics: A Critical Review." *Review of International Organizations* 4(3): 219-244.

Moene, K. O., and M. Wallerstein. 2001. "Inequality, Social Insurance, and Redistribution." *American Political Science Review* 95(4): 859-874.

Morris, S., and H. S. Shin. 2003. "Global Games: Theory and Applications." In *Advances in Economics and Econometrics*, edited by M. Dewatripont, L. P. Hansen, and S. J. Turnovsky. Cambridge University Press.

Przeworski, A. 2005. "Democracy as an Equilibrium." *Public Choice* 123: 253-273.

Przeworski, A. 2006. "Self-Enforcing Democracy." In *Oxford Handbook of Political Economy*, edited by B. R. Weingast and D. A. Wittman. Oxford University Press.

Przeworski, A., M. E. Alvarez, J. A. Cheibub, and F. Limongi. 2000. *Democracy and Development: Political Institutions and Well-Being in the World, 1950-1990*. Cambridge University Press.

Przeworski, A., and M. Wallerstein. 1982. "The Structure of Class Conflict in Democratic Capitalist Societies." *American Political Science Review* 76(2): 215-238.

Svolik, M. W. 2012. *The Politics of Authoritarian Rule*. Cambridge University Press.

---

## Appendix A: Microfoundation of A3 — A Voting Model of Reactive Compensation

### Setup

Two groups within the democracy: $E$ (exposed, mass $\mu_E$) and $N$ (non-exposed, mass $\mu_N > \mu_E$). Within each period, after $\ell_t$ is revealed: (1) $E$ announces political stance ($M$ or $R$); (2) $N$ votes on a tax rate $\tau_t$ financing compensation $\varphi_t$; (3) $E$ takes final action.

$N$'s payoff: $U_N = w_N - \tau_t c - \gamma \cdot \mathbf{1}[R \text{ occurs}]$, where $c > 0$ is the per-unit cost of taxation and $\gamma \equiv (1-\alpha)w_N > 0$ is the cost $N$ bears under regime change.

### Equilibrium

**When $\ell_t = 0$:** By A1, $E$ cannot credibly threaten $R$ (revolt is dominated even without compensation). $N$'s optimal tax is $\tau^* = 0$.

**When $\ell_t = L$:** $E$'s threat is credible (by A2). $N$ compares pacification ($\tau = \bar{\varphi}$, payoff $w_N - \bar{\varphi} c$) versus instability ($\tau = 0$, payoff $w_N - \gamma$). $N$ pacifies iff $\gamma \geq \bar{\varphi} c$.

**Parameter restriction (P-R):** $\gamma / c \geq \bar{\varphi}$. Under (P-R), the unique subgame-perfect equilibrium yields $\varphi^*(0) = 0$ and $\varphi^*(L) = \bar{\varphi}$, recovering A3 as an equilibrium result.

The microfoundation rests on three primitives: majority rule ($\mu_N > \mu_E$), shock-contingent outside option (automation activates $E$'s threat), and $N$'s fear of instability ($\gamma > 0$). The non-exposed majority is the bottleneck: it funds social insurance only under duress.

---

## Appendix B: Microfoundation of A4 — Coordination as Global Game

### Setup

A continuum of $E$-members indexed by $i$, each choosing $a_i \in \{0,1\}$ (participate in revolt or abstain). Revolt succeeds iff participation $\pi \equiv \int a_i \, di \geq \bar{\pi} \equiv \kappa_0/\kappa_{\max}$. Each agent observes a private signal $x_i = \omega + \sigma \varepsilon_i$ about shock severity, where signal noise $\sigma$ depends on the trajectory:

- Rapid ($\sigma_r \approx 0$): visible, shared experience. Near-common knowledge.
- Threshold ($\sigma_\tau \gg 0$): sudden, disorienting. Noisy private signals.

Net benefit of successful revolt: $B = \theta W - k - (w_E - L) = \bar{\kappa} > 0$ (by A2). Cost of failed participation: $c > 0$.

### Equilibrium

**Rapid shock ($\sigma \to 0$):** The game approaches complete information. The risk-dominant equilibrium features high participation when $B/(B+c) > \bar{\pi}$, which holds for moderately repressive autocracies. Organized opposition.

**Threshold shock ($\sigma$ large):** Strategic uncertainty dominates. Each agent's posterior about others' participation is diffuse. The unique Bayesian Nash equilibrium features low participation: $\pi^*_\tau < \bar{\pi}$. Revolt fails. Disorganized dissent.

### Mapping to $\eta$

Define $\eta(j) = h(\pi^*_j)$ where $h$ is decreasing, $h(0) = 1$. Under rapid: $\pi^*$ high $\Rightarrow$ $\eta_R < 1$ (organized opposition degrades repression). Under threshold: $\pi^*$ low $\Rightarrow$ $\eta_T = 1$ (repression fully effective). This recovers A4 as an equilibrium outcome.

The mechanism is informational: $E$ desires revolt equally under both shocks, but can only coordinate under rapid. Common knowledge enables collective action (Chwe 2001); strategic uncertainty prevents it (Kuran 1991).^[Przeworski and Limongi (1997) established the empirical precursor: economic development does not cause transitions to democracy, but existing democracies at higher income levels survive longer. Our model provides a mechanism for why economic disruptions differentially affect regime survival depending on both the trajectory of the disruption and the type of regime.]
