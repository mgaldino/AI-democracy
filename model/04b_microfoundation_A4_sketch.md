# Microfoundation for A4: Repressive Effectiveness as Equilibrium Coordination

## Sketch — Global Games Approach

---

## 1. Motivation

Assumption A4 posits that repressive effectiveness depends on the trajectory of the automation shock: $\eta_R < 1$ under rapid displacement and $\eta_T = 1$ under threshold displacement. The main model takes this as primitive. This note sketches a microfoundation in which $\eta$ emerges endogenously from a coordination game among members of group $E$, where the *information structure* induced by the shock type selects the equilibrium participation rate, and thereby determines repressive effectiveness.

The approach follows the global games tradition (Carlsson & van Damme 1993; Morris & Shin 1998, 2003), adapted to a regime-change setting in the spirit of Edmond (2013) and Shadmehr & Bernhardt (2011).

---

## 2. Setup

### Players

A continuum of $E$-members indexed by $i \in [0,1]$, plus the autocrat $A$.

### Actions

Each $E$-member simultaneously chooses $a_i \in \{0, 1\}$: participate in revolt ($a_i = 1$) or abstain ($a_i = 0$).

### Regime change technology

Let $\pi \equiv \int_0^1 a_i \, di$ denote the mass of participants. The revolt succeeds (regime falls) if and only if:

$$\pi \geq \frac{\kappa_0}{\kappa_{\max}}$$

where $\kappa_0$ is the autocrat's repressive capacity and $\kappa_{\max}$ is a normalizing constant representing the maximum capacity needed to contain full participation. Define $\bar{\pi} \equiv \kappa_0 / \kappa_{\max} \in (0,1)$ as the critical mass. More repressive regimes require more participants to overthrow.

### Fundamental and signals

There is an underlying state $\omega$ representing the *severity of the automation shock as experienced by E*. In the main model, the relevant shock is $\ell_t = L$; what varies across trajectories is how $E$-members perceive this shock.

Each agent $i$ observes a private signal:

$$x_i = \omega + \sigma \varepsilon_i, \quad \varepsilon_i \sim \text{Uniform}[-1/2, 1/2]$$

where $\sigma > 0$ governs signal noise. The key distinction:

| Shock type | Signal precision | Interpretation |
|------------|-----------------|----------------|
| **Rapid** ($j = r$) | $\sigma_r \approx 0$ (very small) | Shared, visible experience. Everyone sees mass layoffs simultaneously. Near-common knowledge. |
| **Threshold** ($j = \tau$) | $\sigma_\tau \gg 0$ (large) | Sudden, disorienting. Unclear who else is affected, whether it is temporary, how widespread. Private, noisy information. |

### Payoffs

Agent $i$ with signal $x_i$ receives:

$$u_i(a_i = 1) = \begin{cases} \theta W - k & \text{if } \pi \geq \bar{\pi} \quad \text{(revolt succeeds)} \\ -c(j) & \text{if } \pi < \bar{\pi} \quad \text{(revolt fails, individual punished)} \end{cases}$$

$$u_i(a_i = 0) = w_E - L$$

where $c(j)$ is the personal cost of failed participation (punishment + coordination cost), which may also depend on shock type. For the main result, we can set $c(r) = c(\tau) = c > 0$; the information structure alone suffices to drive the result. But the mechanism is reinforced if $c(\tau) > c(r)$ (i.e., punishment is harsher when dissent is isolated and therefore more easily targeted).

Define the net benefit of successful revolt over the status quo:

$$B \equiv (\theta W - k) - (w_E - L) = \Delta + L = \bar{\kappa} > 0$$

which is positive by A2. So revolt is desirable *if it succeeds*.

---

## 3. Equilibrium Analysis

### 3.1 Near-common knowledge regime (rapid shock, $\sigma_r \to 0$)

When $\sigma_r$ is sufficiently small, signals are nearly identical across agents. The game approaches complete information. There are two (pure strategy) Nash equilibria:

- **Revolt equilibrium**: $a_i = 1$ for all $i$. Since $\pi = 1 > \bar{\pi}$, revolt succeeds. No individual wants to deviate: the payoff from participating in a successful revolt ($\theta W - k$) exceeds abstaining ($w_E - L$) by $B = \bar{\kappa} > 0$.

- **No-revolt equilibrium**: $a_i = 0$ for all $i$. Since $\pi = 0 < \bar{\pi}$, revolt fails. No individual wants to deviate: unilateral participation yields $-c < w_E - L$.

The standard refinement in global games (limit of unique equilibria as $\sigma \to 0$) selects the **risk-dominant** equilibrium. The revolt equilibrium is risk-dominant when:

$$B \cdot \Pr(\text{enough others participate}) > c \cdot \Pr(\text{not enough participate})$$

In the limit $\sigma \to 0$, the threshold signal $x^*$ below which agents revolt satisfies (from the standard global games characterization):

$$x^* \text{ solves: } B \cdot (1 - \bar{\pi}) = c \cdot \bar{\pi}$$

$$\Rightarrow x^* \text{ exists with } \pi^* = 1 \text{ when } \frac{B}{B + c} > \bar{\pi}$$

That is: if the critical mass $\bar{\pi}$ is not too large relative to the benefit-cost ratio, the unique equilibrium in the limit features full participation. Since $B = \bar{\kappa} > 0$ (by A2), this condition holds for autocracies that are not overwhelmingly repressive.

**Result under rapid shock**: Equilibrium participation $\pi^*_r$ is high (approaches 1 for moderate $\bar{\pi}$). Organized, coordinated opposition.

### 3.2 Noisy private information regime (threshold shock, $\sigma_\tau$ large)

When $\sigma_\tau$ is large, the global game has a unique Bayesian Nash equilibrium in threshold strategies: agent $i$ revolts if and only if $x_i \geq x^*$, where $x^*$ solves the indifference condition.

With high noise, agents face substantial *strategic uncertainty*: even an agent who receives a high signal $x_i$ (suggesting a severe shock) cannot be confident that others also received high signals. The probability that enough others participate to reach $\bar{\pi}$ is perceived as low.

The unique equilibrium threshold $x^*(\sigma_\tau)$ satisfies:

$$B \cdot \Pr\left(\pi \geq \bar{\pi} \mid x_i = x^*\right) = c \cdot \Pr\left(\pi < \bar{\pi} \mid x_i = x^*\right)$$

As $\sigma_\tau \to \infty$, each agent's posterior about the fraction of others who will participate becomes diffuse. In the standard uniform-prior global game, the equilibrium fraction of participants converges to:

$$\pi^*_\tau \to \bar{\pi} \cdot \frac{c}{B + c}$$

which is strictly less than $\bar{\pi}$ (the revolt threshold). The revolt **fails** in equilibrium.

**Intuition**: Under high noise, each agent effectively faces a private decision problem. Even though the shock is real and severe ($\omega$ is high), no agent can be confident that *enough others know it is severe* to make coordinated revolt viable. Strategic uncertainty destroys coordination.

**Result under threshold shock**: Equilibrium participation $\pi^*_\tau$ is low. Disorganized, uncoordinated dissent.

---

## 4. Mapping to $\eta$

### Linking participation to repressive effectiveness

The autocrat's repression is effective to the extent that opposition fails to coordinate. Define repressive effectiveness as:

$$\eta(j) \equiv 1 - \frac{\pi^*_j - \bar{\pi}}{\pi^*_j} \cdot \mathbf{1}[\pi^*_j > \bar{\pi}]$$

More directly: what matters for the main model is whether the autocrat can contain the threat. The *effective* repressive capacity experienced by E is $\kappa_0$ when opposition is disorganized (the autocrat can target individuals), but only $\kappa_0 \cdot \eta_R$ when opposition is organized (collective action shields participants, international attention constrains the autocrat, security forces face loyalty dilemmas against mass mobilization).

We can express this cleanly as follows. Let $\eta$ capture the *discount factor* on repressive capacity due to organized opposition:

$$\eta(j) = h(\pi^*_j) \quad \text{where } h: [0,1] \to (0,1] \text{ is decreasing, } h(0) = 1$$

A simple functional form: $h(\pi) = 1 - \alpha \pi$ for $\alpha \in (0,1)$, or a step function:

$$\eta(j) = \begin{cases} \eta_R < 1 & \text{if } \pi^*_j \text{ is high (organized opposition)} \\ 1 & \text{if } \pi^*_j \text{ is low (disorganized opposition)} \end{cases}$$

### The mapping

| Shock type | Signal noise | Eq. participation | Opposition structure | $\eta$ |
|------------|-------------|-------------------|---------------------|--------|
| Rapid ($r$) | $\sigma_r \approx 0$ | $\pi^*_r$ high | Organized | $\eta_R < 1$ |
| Threshold ($\tau$) | $\sigma_\tau$ large | $\pi^*_\tau$ low | Disorganized | $\eta_T = 1$ |

This recovers A4 as an equilibrium outcome rather than an assumption.

---

## 5. What $\eta_R$ depends on (comparative statics)

The equilibrium participation rate under the rapid shock -- and hence $\eta_R$ -- is not arbitrary. From the global game characterization:

- **$\bar{\pi}$ higher** (more repressive capacity $\kappa_0$) $\Rightarrow$ coordination harder even under rapid shock $\Rightarrow$ $\eta_R$ closer to 1. Heavily repressive autocracies can contain even organized opposition. This connects to the main model's Proposition 2(a): even under rapid, stability requires $\kappa_0 \geq \bar{\kappa}/\eta_R$.

- **$B$ higher** (larger shock $L$, higher $\theta$, lower $k$) $\Rightarrow$ revolt more attractive $\Rightarrow$ coordination easier $\Rightarrow$ $\eta_R$ lower. Larger shocks degrade repressive effectiveness more.

- **$c$ higher** (harsher punishment) $\Rightarrow$ coordination harder $\Rightarrow$ $\eta_R$ closer to 1. Totalitarian regimes with severe punishment maintain $\eta_R \approx 1$ even against rapid shocks.

These comparative statics align with the empirical discussion in Section 6.3 of the main model.

---

## 6. Discussion: What does this add?

### Beyond assuming A4

Three benefits of the microfoundation:

1. **Endogenous $\eta_R$**: Rather than treating $\eta_R$ as an exogenous parameter, we derive it from primitives (signal precision, punishment costs, critical mass). This allows us to say *which autocracies* have low vs. high $\eta_R$: those with severe punishment technology ($c$ high), ethnic/ideological cohesion in security forces ($\bar{\pi}$ effectively lower), or surveillance capacity ($\sigma_r$ increased -- the autocrat disrupts common knowledge even under rapid shocks).

2. **The mechanism is information, not preferences**: A4 might be read as saying that E "wants" to revolt more under rapid shocks. The microfoundation clarifies that the *desire* to revolt is the same under both shock types (both deliver the same loss $L$). What differs is the *capacity to coordinate*. This is a sharper and more defensible claim.

3. **Connection to the empirical literature**: The global games framework maps directly to known mechanisms:
   - Rapid shocks create *common knowledge of grievances* (Chwe 2001), enabling focal-point coordination.
   - Threshold shocks create *pluralistic ignorance* (Kuran 1991): each E-member is aggrieved but uncertain whether others are, and therefore reluctant to act.
   - Surveillance technology ($\sigma$ manipulation) and information control are strategies autocrats use to *prevent* the common-knowledge condition -- consistent with Edmond (2013) and the censorship literature (King, Pan & Roberts 2013).

### Limitations of the sketch

This is a conceptual blueprint, not a full proof. A complete treatment would need to:
- Specify the prior distribution on $\omega$ and derive the exact threshold $x^*$ in closed form.
- Verify the monotone-likelihood-ratio property for the chosen signal structure to ensure uniqueness.
- Formally embed the coordination subgame within the two-period structure of the main model (as a stage game in the period where $\ell_t = L$).
- Address the possibility that the autocrat strategically manipulates information (endogenous $\sigma$), which would connect to a literature on censorship as a regime-survival tool.

For the paper, A4 can be stated as an assumption in the main text with a footnote or appendix pointing to this microfoundation, noting that the assumption is consistent with standard coordination-failure models under incomplete information.

---

## References (for this sketch)

- Carlsson, H. & van Damme, E. (1993). Global games and equilibrium selection. *Econometrica* 61(5): 989-1018.
- Chwe, M. S.-Y. (2001). *Rational Ritual: Culture, Coordination, and Common Knowledge*. Princeton UP.
- Edmond, C. (2013). Information manipulation, coordination, and regime change. *Review of Economic Studies* 80(4): 1422-1458.
- King, G., Pan, J., & Roberts, M. E. (2013). How censorship in China allows government criticism but silences collective expression. *APSR* 107(2): 326-343.
- Kuran, T. (1991). Now out of never: The element of surprise in the East European revolution of 1989. *World Politics* 44(1): 7-48.
- Morris, S. & Shin, H. S. (1998). Unique equilibrium in a model of self-fulfilling currency attacks. *AER* 88(3): 587-597.
- Morris, S. & Shin, H. S. (2003). Global games: Theory and applications. In *Advances in Economics and Econometrics* (Eighth World Congress). Cambridge UP.
- Shadmehr, M. & Bernhardt, D. (2011). Collective action with uncertain payoffs: Coordination, public signals, and punishment dilemmas. *APSR* 105(4): 829-851.
