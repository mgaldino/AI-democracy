# Microfoundation for A3: A Voting Model of Reactive Compensation

---

## 1. Setup

### Players

Two groups within the democratic polity:

- **E** (exposed to automation): mass $\mu_E$. These are the potential losers from AI displacement.
- **N** (non-exposed): mass $\mu_N > \mu_E$. N is the **majority** and the decisive voter under majority rule.

### Timing within period $t$

The main model has two periods $t \in \{1,2\}$. We now expand the *within-period* sequence:

1. **Nature** reveals the automation loss $\ell_t \in \{0, L\}$ to both groups.
2. **E** announces a political stance: $a_E \in \{M, R\}$, where $R$ denotes a credible threat to pursue regime change (radical action).
3. **N** votes on a tax rate $\tau_t \in [0,1]$. The tax finances compensation $\varphi_t = \tau_t$ for E. (We normalize units so that $\tau = \varphi$; equivalently, one unit of tax on N buys one unit of compensation for E.)
4. **E** takes its final action: $M$ (moderate) or $R$ (revolt), given the enacted $\tau_t$.

### Payoffs

**Group E** (per member, as in the main model):

$$u_E(M \mid D, t) = w_E - \ell_t(1 - \varphi_t)$$

$$u_E(R \mid D, t) = \theta W - k$$

E chooses $R$ iff $u_E(R) > u_E(M)$, i.e., iff:

$$\ell_t(1 - \varphi_t) > |\Delta| \quad \text{where } \Delta \equiv \theta W - k - w_E < 0 \text{ (by A1)}$$

**Group N** (per member):

$$u_N(\text{status quo maintained}) = w_N - \tau_t \cdot c$$

$$u_N(\text{regime change via } R) = \alpha \cdot w_N - \tau_t \cdot c$$

where:

- $c > 0$: per-unit cost of taxation to N (deadweight loss, political cost, etc.)
- $\alpha \in (0,1)$: the fraction of N's income preserved under regime change $R$. Since $R$ is disruptive (institutional breakdown, expropriation, violence), $\alpha < 1$ captures the fact that instability destroys value for *everyone*, including N.

The expected payoff to N of a given $\tau_t$ is:

$$U_N(\tau_t) = w_N - \tau_t \cdot c - (1 - \alpha) \cdot w_N \cdot \mathbb{1}[R \text{ occurs}]$$

The key term is $(1-\alpha) \cdot w_N$: the cost N suffers if E revolts. Call this $\gamma \equiv (1-\alpha) \cdot w_N > 0$.

---

## 2. N's Decision Problem

N is the decisive voter (majority). N observes $\ell_t$ and anticipates E's best response to any $\tau_t$.

### E's threat is credible iff losses are positive

**Case 1: $\ell_t = 0$.**

E's payoff from $R$ is $\theta W - k = w_E + \Delta < w_E = u_E(M \mid \varphi_t = 0)$. By A1, $\Delta < 0$, so E strictly prefers $M$ regardless of $\tau_t$. *E has no credible threat.* For any $\tau_t$, revolt does not occur.

N's problem reduces to:

$$\max_{\tau_t} \; w_N - \tau_t \cdot c$$

which is trivially solved by $\tau_t^* = 0$.

**Case 2: $\ell_t = L > 0$.**

E revolts iff $u_E(R) > u_E(M \mid \varphi_t)$, i.e., iff:

$$L(1 - \varphi_t) > |\Delta| \quad \Leftrightarrow \quad \varphi_t < 1 - \frac{|\Delta|}{L} = \bar{\varphi}$$

So: if $\tau_t \geq \bar{\varphi}$, E is pacified (chooses $M$). If $\tau_t < \bar{\varphi}$, E revolts.

N chooses $\tau_t$ to maximize:

$$U_N(\tau_t) = \begin{cases} w_N - \tau_t \cdot c & \text{if } \tau_t \geq \bar{\varphi} \quad \text{(E pacified)} \\ w_N - \tau_t \cdot c - \gamma & \text{if } \tau_t < \bar{\varphi} \quad \text{(E revolts)} \end{cases}$$

N compares the best option in each region:

- **Pacify E at minimum cost**: set $\tau_t = \bar{\varphi}$, yielding $U_N^{\text{pac}} = w_N - \bar{\varphi} \cdot c$.
- **Let E revolt**: set $\tau_t = 0$ (no point taxing yourself if revolt happens anyway), yielding $U_N^{\text{rev}} = w_N - \gamma$.

N pacifies iff $U_N^{\text{pac}} \geq U_N^{\text{rev}}$:

$$w_N - \bar{\varphi} \cdot c \geq w_N - \gamma$$

$$\gamma \geq \bar{\varphi} \cdot c$$

**Parameter restriction (P-R):**

$$\frac{\gamma}{c} \geq \bar{\varphi} = 1 - \frac{|\Delta|}{L}$$

This holds when the cost of instability to N ($\gamma$) is large relative to the per-unit cost of taxation ($c$) and the required compensation level ($\bar{\varphi}$). It is a *joint* condition on how much N fears regime change and how expensive compensation is.

---

## 3. Equilibrium Characterization

**Proposition (Microfoundation of A3).** *Under A1, A2, and parameter restriction (P-R), the unique subgame-perfect equilibrium of the within-period voting game yields:*

$$\varphi_t^* = \begin{cases} \bar{\varphi} & \text{if } \ell_t = L \\ 0 & \text{if } \ell_t = 0 \end{cases}$$

*Proof sketch.*

**(i) $\ell_t = 0$.** By A1, E cannot credibly threaten $R$. N's dominant strategy is $\tau_t = 0$. E plays $M$. Hence $\varphi_t^* = 0$.

**(ii) $\ell_t = L$.** E credibly threatens $R$ if $\varphi_t < \bar{\varphi}$ (by A2, the threat is real: $\Delta + L > 0$). N anticipates this and compares $U_N^{\text{pac}}$ vs. $U_N^{\text{rev}}$. Under (P-R), $\gamma \geq \bar{\varphi} \cdot c$, so N prefers to pacify. N sets $\tau_t = \bar{\varphi}$. E, now compensated, plays $M$. Hence $\varphi_t^* = \bar{\varphi}$.

*In both cases, E plays $M$ on the equilibrium path. The revolt threat is never executed --- it disciplines the majority's vote.* $\square$

### What if (P-R) fails?

If $\gamma < \bar{\varphi} \cdot c$ --- instability is cheap for N relative to the tax burden --- then N prefers to let E revolt even when $\ell_t = L$. This corresponds to a democracy that *cannot* stabilize: compensation is too expensive or N doesn't fear regime change enough. This is a knife-edge case the main model excludes by assuming compensation is feasible; (P-R) gives the exact condition.

---

## 4. Discussion: What the Microfoundation Adds

**A3 as stated is a behavioral shortcut.** It posits that democracy compensates reactively without saying *why*. The voting model shows the mechanism:

1. **No crisis, no threat.** When $\ell_t = 0$, E's outside option ($R$) is dominated (by A1). N faces zero risk of instability and rationally refuses any positive tax. Compensation is not a public good that N values intrinsically --- it is *insurance against revolt*, and with no revolt risk, insurance has zero value.

2. **Crisis activates the threat.** When $\ell_t = L$, A2 ensures E can credibly threaten $R$. The threat converts N's fear of instability into willingness to pay. The equilibrium tax is *exactly* the minimum that pacifies E ($\bar{\varphi}$) --- N never over-compensates.

3. **The majority veto is the bottleneck.** Because $\mu_N > \mu_E$, compensation requires N's consent. N consents only when threatened. This is the structural reason democratic compensation is reactive rather than precautionary: the group that pays for insurance is not the group that needs it, and the payer only agrees under duress.

**Connection to the literature.** The logic is a simplified version of the redistribution-under-threat models of Acemoglu and Robinson (2006) and Boix (2003), adapted to a setting where the threat is endogenous to an economic shock (automation) rather than to inequality per se. The key difference: in the standard models, the poor always prefer redistribution; here, E prefers $M$ when $\ell_t = 0$, so the threat is *activated* by the automation shock, not permanent.

**What is gained.** The microfoundation makes explicit that A3 rests on three primitives: (i) majority rule ($\mu_N > \mu_E$), (ii) E's outside option is shock-contingent ($\ell_t$ activates the $R$ threat), and (iii) N values stability ($\gamma > 0$). Any of these failing would break the result. This clarifies the scope conditions of the main model's "crossed fragility" finding: it applies to democracies where the non-exposed majority controls fiscal policy and fears institutional instability enough to buy off the losers --- but only when the losses are visible.

---

## 5. Summary Table

| Condition | E's threat | N's vote | $\varphi_t^*$ |
|-----------|-----------|----------|:-----------:|
| $\ell_t = 0$ | Not credible (A1) | $\tau = 0$ (no reason to tax) | $0$ |
| $\ell_t = L$, (P-R) holds | Credible (A2) | $\tau = \bar{\varphi}$ (buy stability) | $\bar{\varphi}$ |
| $\ell_t = L$, (P-R) fails | Credible (A2) | $\tau = 0$ (too expensive) | $0$ (instability) |

The main model's A3 corresponds to the first two rows. The third row identifies when democracy fails to compensate even under crisis --- a boundary case the main model rules out but the microfoundation makes explicit.
