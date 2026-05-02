# Analytical Formalization: Reformulated Model (v5)

**Working document — derivations for "AI and Regime Stability"**
**Date**: 2026-05-01 (v5: selectorate as meta-primitive, Y+ formal, voting/approval)
**Reference**: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`

---

## 0. The Mechanism in One Page: 2×2 Benchmark

### One meta-primitive: selectorate size

Democracy and autocracy differ in the **size of the group whose support the incumbent needs** (Bueno de Mesquita et al. 2003). Everything else follows.

| | Democracy (large selectorate) | Autocracy (small selectorate) |
|--|------|------|
| **Information** | Many diverse observers → aggregate assessment is precise | Few elites in same bubble → assessment is noisy |
| **Speed** | Many people to convince → legislation, debate → lag | Few people to convince → decree → immediate |
| **Comp. approval** | Requires majority vote → blocked when majority opposes | Requires elite approval → blocked when elite doesn't see crisis |

### The key ordering

$$\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$$

where $\bar{\omega}_x$ is the threshold above which the selectorate approves compensation spending.

### Trajectory asymmetry (exogenous, from economics)

- **Rapid** $(\omega_R, \omega_R)$: moderate, persistent displacement. Workers displaced from $t=1$.
- **Threshold** $(\omega_{T1}, \omega_{T2})$: few displaced initially (complementarity raises income of non-displaced to $Y^+ > 1$), massive displacement when automation threshold crossed. $\omega_{T1} \ll \omega_R \ll \omega_{T2}$.

### The four scenarios

**R×D (stable).** Moderate crisis from $t=1$. Displaced workers protest; employed workers fear future displacement → majority votes for compensation. Law passes. Lag: $\varphi_2 = 1$. Survives.

**T×D (falls).** $t=1$: few displaced, most earn $Y^+ > 1$ → majority OPPOSES compensation (why tax my prosperity for a few unlucky workers?). No law. $t=2$: massive displacement. Majority now wants comp, law passes — but lag: $\varphi_2 = 0$. Falls.

**R×A (falls).** Moderate crisis from $t=1$. Protest suppressed ($C_A$ high). Elite doesn't see moderate crisis through noisy channels ($\omega_R < \bar{\omega}_A$) → doesn't approve spending → dictator can't compensate without losing elite support → represses instead. Displacement accumulates. Falls in $t=2$.

**T×A (stable).** $t=1$: calm. $t=2$: massive crisis. Even the elite's noisy channels detect GDP collapse ($\omega_{T2} > \bar{\omega}_A$) → approves spending → dictator compensates immediately (decree, no lag). Survives.

### The irony

Each trajectory generates the crisis that exploits the opposing regime's selectorate constraint. Moderate crises fail the autocratic elite's visibility test. Massive crises overwhelm the democratic majority's willingness to pay.

---

## 1. Model Primitives

### 1.1 Environment

- Continuum of workers $i \in [0,1]$, two periods $t \in \{1,2\}$
- Regime $x \in \{D, A\}$

**Income per period:**

| Status | Income |
|--------|--------|
| Employed, normal | $Y = 1$ |
| Employed, complementarity (threshold $t=1$, non-displaced) | $Y^+ = 1 + \gamma > 1$, where $\gamma > 0$ is the productivity bonus from partial AI complementarity |
| Displaced, no compensation | $0$ |
| Displaced, compensated | $B \in (0,1)$ |

$Y^+$ enters the model formally through the voting mechanism (Section 1.6): workers earning $Y^+$ face higher tax cost of compensation and oppose it.

### 1.2 States and Trajectories

Nature draws $\theta \in \{R, T, N\}$ with prior $(p_R, p_T, p_N)$, $p_N > 0$.

| $\theta$ | $\omega_1$ | $\omega_2$ | Non-displaced income $t=1$ |
|-----------|------------|------------|---------------------------|
| $R$ | $\omega_R$ | $\omega_R$ | $Y = 1$ |
| $T$ | $\omega_{T1}$ | $\omega_{T2}$ | $Y^+ = 1 + \gamma$ |
| $N$ | $\omega_N$ | $\omega_N$ | $Y = 1$ |

**Key ordering**: $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$

### 1.3 Individual Shocks and Signals

- Displacement: $d_{it} \sim \text{Bernoulli}(\omega_t(\theta))$, iid conditional on $\theta$
- Signal: $s_{it} = \omega_t(\theta) + \sigma \varepsilon_{it}$, $\varepsilon_{it} \sim \text{Logistic}(0,1)$ iid

### 1.4 Displacement is Absorbing

$$\Omega_1(\theta) = \omega_1(\theta), \quad \Omega_2(\theta) = \omega_1(\theta) + (1-\omega_1(\theta)) \cdot \omega_2(\theta)$$

### 1.5 Protest

Only displaced workers protest. Expressive value:

$$v_{it} = (1 - y_{it}) + \delta \cdot \mathbb{E}[(1 - y_{i,t+1}) \mid d_{it}, s_{it}]$$

Cost with safety in numbers ($h(\pi) = \pi$):

$$\text{Protest iff } v_{it} > C_x \cdot (1 - \mathbb{E}[\pi_t \mid s_{it}]), \quad C_A > C_D > 0$$

### 1.6 The Meta-Primitive: Selectorate

The **selectorate** $S_x$ is the group whose support the incumbent needs to retain power (Bueno de Mesquita, Smith, Siverson & Morrow 2003).

- **Democracy**: $S_D = [0,1]$ (all workers). Decision by majority rule.
- **Autocracy**: $S_A \subset [0,1]$ with $|S_A| = \mu_A \ll 1$ (small elite: military, party leaders, oligarchs). Decision by elite consensus.

The incumbent values power at $V \to \infty$ (losing power = prison or death in autocracy, loss of office in democracy). The incumbent ALWAYS wants to compensate if it prevents falling. But **compensation requires selectorate approval**, because it is financed by taxing the selectorate.

**Three derived asymmetries:**

**(a) Information quality.** The selectorate's aggregate assessment of $\omega$ has precision that depends on selectorate size. Democracy: many diverse observers (voters, free press, independent agencies) → $\sigma_D$ small. Autocracy: few elites in an information bubble (subordinates report optimistically, media censored, Egorov et al. 2009) → $\sigma_A$ large.

**(b) Decision speed.** Large selectorate → many actors to coordinate → legislation, debate, coalition → lag of $L = 1$ period. Small selectorate → decree, phone call → immediate.

**(c) Compensation approval.** The selectorate approves compensation iff the perceived benefit (regime stability) exceeds the perceived cost (taxation). This generates regime-specific constraints:

**Democracy (majority vote):** Worker $i$ votes for compensation iff:

$$\underbrace{\delta \cdot P(d_{i,t+1}=1 \mid s_{it}) \cdot B}_{\text{insurance value}} > \underbrace{\tau \cdot Y_i}_{\text{tax cost}}$$

where $\tau = \hat{\omega} \cdot B$ is the per-capita tax (proportional to estimated cost). Key cases:
- Displaced ($d_i = 1$, $Y_i = 0$): always votes YES (gets $B$, pays no tax)
- Employed under rapid ($Y_i = 1$): votes YES iff insurance value $\delta \cdot P(\text{displaced next period}) \cdot B > \tau$
- Employed under threshold $t=1$ ($Y_i = Y^+ = 1 + \gamma$): votes YES iff $\delta \cdot P(\cdot) \cdot B > \tau \cdot (1+\gamma)$. **Higher income → higher tax burden → less likely to vote YES.**

**Autocracy (elite approval):** The elite observes $\tilde{\omega}_S = \omega + \sigma_A \cdot \zeta$ (same noisy channel as the dictator — they're in the same bubble). The elite approves iff:

$$P(\text{regime falls} \mid \text{no comp}, \tilde{\omega}_S) > \tau_{\text{elite}}$$

where $\tau_{\text{elite}}$ is the fiscal cost to the elite. If the crisis is invisible to the elite ($\tilde{\omega}_S$ is ambiguous), they perceive $P(\text{falls})$ as low and REFUSE to fund compensation. The dictator, who values power infinitely, would pay any price — but spending the elite's money on an invisible crisis gets him REMOVED by the elite.

> "You spent 7% of GDP on what? There's no crisis. You're incompetent." — The selectorate, removing the dictator.

This is why the dictator defaults to **repression** for moderate crises: repression uses the existing security apparatus (off-budget, no selectorate approval needed) and doesn't admit a problem exists.

### 1.7 Visibility Thresholds (Derived)

**Democracy**: $\bar{\omega}_D$ is the displacement rate at which the majority votes for compensation. This depends on the composition of the majority:
- Under rapid $t=1$: fraction $\omega_R$ displaced (vote YES) + fraction of employed who vote YES (insurance motive with $Y = 1$). If $\omega_R$ + forward-looking employed > 0.5, compensation passes. With $\omega_R = 0.30$ and moderate insurance demand: plausible.
- Under threshold $t=1$: fraction $\omega_{T1} \approx 0.05$ displaced + fraction of employed with $Y^+ = 1+\gamma$ who vote YES. With $\gamma > 0$, the higher tax burden makes employed workers vote NO. Need $\omega_{T1}$ + insurance voters > 0.5. With $\omega_{T1} = 0.05$ and $Y^+$ high: **fails**. Compensation blocked.

**Autocracy**: $\bar{\omega}_A$ is the displacement rate at which the elite approves spending. Derived from $\sigma_A$ (noisy assessment) and the elite's evidence threshold. With $\sigma_A$ large, $\bar{\omega}_A$ is high: only massive crises pass the elite's visibility test.

The key ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A$ is now DERIVED:
- $\bar{\omega}_D < \omega_R$: the democratic majority approves compensation under rapid because enough workers are displaced + fearful
- $\omega_R < \bar{\omega}_A$: the autocratic elite does NOT approve under rapid because the crisis is invisible through their noisy channels

### 1.8 Fall Condition

Regime falls iff **either**:
- (a) $\pi_t > \bar{\pi}_x^{\text{fall}}$ and $\varphi_t = 0$ (popular protest exceeds institutional tolerance), OR
- (b) Selectorate withdraws support (incumbent imposed unjustified fiscal costs)

In practice, (b) constrains the incumbent's CHOICE of compensation. The dictator who compensates without selectorate approval falls from (b) instead of (a). Rational incumbent avoids (b) → only compensates when selectorate approves.

### 1.9 Timing

1. $d_{it}$ realized → 2. Signals → 3. Protest ($\pi_t$) → 4. Compensation trigger check → 5. If triggered: autocracy $\varphi_t=1$ / democracy $\varphi_{t+1}=1$ → 6. Fall check: $\pi_t > \bar{\pi}_x^{\text{fall}}$ and $\varphi_t = 0$ → 7. Payoffs

**Step 4 differs by regime:**
- Democracy: comp triggered iff $\pi_t > \bar{\pi}_D^{\text{comp}}$ (protest = political demand = voice)
- Autocracy: comp triggered iff $\tilde{\omega}_S > \bar{\omega}_A$ (elite's economic assessment, independent of $\pi$)

---

## 2. Equilibrium Definition

An equilibrium of the game in period $t$ is a tuple $(s^*, \text{comp}_t, \varphi_t)$ such that:

**(i) Workers optimize.** $s^*$ solves the indifference condition given expected $\varphi$:

$$G(s^*) = \sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) - \bar{h}(\varphi) = 0$$

where $\bar{h}(\varphi) = 1 - v(\varphi)/C_x$.

**(ii) Compensation triggered.** Asymmetric by regime:

- **Democracy (voice):** $\text{comp}_t = 1$ iff $\pi_t > \bar{\pi}_D^{\text{comp}}$. Protest is the political demand that moves the legislature. Without visible protest, no bill is introduced. With sufficient protest, the political cost of inaction exceeds the fiscal cost of compensation. $\bar{\pi}_D^{\text{comp}}$ is the minimum protest that generates legislative action.

- **Autocracy (technocratic):** $\text{comp}_t = 1$ iff $\tilde{\omega}_S > \bar{\omega}_A$, where $\tilde{\omega}_S = \omega_t + \sigma_A \zeta$ is the elite's economic assessment. The autocrat compensates when the selectorate (elite) sees the crisis as justifying fiscal spending. Independent of $\pi$ — breaks the self-fulfilling cycle (see Appendix C).

**(iii) Regime speed.**
- If $\text{comp}_t = 1$: autocracy $\varphi_t = 1$ (immediate); democracy $\varphi_{t+1} = 1$ (lag)
- If $\text{comp}_t = 0$: $\varphi_t = 0$

**(iv) Consistency.** Workers' expectation of $\varphi$ (entering $v$) is consistent with the trigger outcome.

- *Democracy:* $\pi$ (from $s^*$) determines comp (via trigger). Since compensation is binary, workers' beliefs are restricted to $\{\text{comp}, \text{no-comp}\}$. We check both candidates and select the unique self-confirming one (Section 9). Under R×D: only comp is self-confirming (no-comp generates protest that triggers comp, contradicting the assumption). Under T×D $t=1$: only no-comp is self-confirming (protest is too low to trigger comp).
- *Autocracy:* comp depends on $\tilde{\omega}_S$, not $\pi$. Workers take comp as given (determined by the elite's assessment of $\omega$, which they can estimate from their own signals). No circularity.

**Remark (Hirschman).** The asymmetric trigger reflects different institutional logics. Democracy responds to *voice*: popular protest signals political demand, and the legislative process converts demand into policy. Autocracy responds to *technocratic assessment*: the elite evaluates economic indicators and authorizes spending when the threat to regime survival is evident. The asymmetry is not a modeling convenience — it is the institutional content of the model. A democracy that ignores protest is not functioning as a democracy. An autocracy that responds to protest is admitting weakness.

---

## 3. Single-State Benchmark (Known $\omega$)

**Indifference condition**: $\Omega \cdot \Lambda((\omega - s^*)/\sigma) = \bar{h}$, $\bar{h} = 1 - v/C_x$.

**Cutoff**: $s^* = \omega - \sigma \cdot \log(\bar{h}/(\Omega - \bar{h}))$. Exists iff $0 < \bar{h} < \Omega$.

**Protest**: $\pi^* = \bar{h}$ at interior equilibrium. Multiple equilibria with known $\omega$; uniqueness requires multi-state uncertainty.

---

## 4. Multi-State Equilibrium

$$G(s^*) = \sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma) - \bar{h} = 0$$

Transcendental — no closed form. Numerical root-finding required.

---

## 5. Lemma 2: Asymmetric Composition

**Lemma 2.** *With $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$:*

*(a) $t=1$: $\Omega_1(R) > \Omega_1(T) > \Omega_1(N)$.*

*(b) $t=2$: $\Omega_2(T) > \Omega_2(R) > \Omega_2(N)$, provided $\omega_{T2} > [\omega_R(2-\omega_R) - \omega_{T1}]/(1-\omega_{T1})$.*

**Proof.** (a) Immediate. (b):

$\Omega_2(R) = \omega_R(2 - \omega_R)$, $\quad \Omega_2(T) = \omega_{T1} + (1-\omega_{T1})\omega_{T2}$

$\Omega_2(T) > \Omega_2(R) \iff \omega_{T2} > \frac{\omega_R(2-\omega_R) - \omega_{T1}}{1-\omega_{T1}}$

With $\omega_R = 0.30$, $\omega_{T1} = 0.05$: bound $= 0.484$. With $\omega_{T2} = 0.60$: satisfied. $\square$

---

## 6. Lemma 0: Existence and Uniqueness

**Lemma 0.** *With $h(\pi) = \pi$, $F = \Lambda$, $v \in (0, C_x)$, $\sigma > 0$, all $p_\theta > 0$:*

*(a) At least one cutoff $s^*$ exists.*

*(b) The cutoff is unique for $\sigma$ sufficiently small.*

**Proof of (a).** Define $G(s) = \sum_\theta P(\theta \mid d=1, s) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s)/\sigma) - \bar{h}$.

*As $s \to +\infty$*: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$ for all $\theta$, so $G(s) \to -\bar{h} < 0$.

*As $s \to -\infty$*: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$ for all $\theta$. The posterior $P(\theta \mid d=1, s)$ concentrates on the state $\theta^*$ with the highest $\omega_t$ (because $\lambda((s - \omega)/\sigma) \propto e^{(s-\omega)/\sigma}$ decays slowest for the largest $\omega$). So $G(s) \to \Omega_t(\theta^*) - \bar{h} > 0$ for generic parameters ($\Omega_t(\theta^*) > \bar{h}$).

By continuity and the IVT, $\exists \, s^*$ with $G(s^*) = 0$. $\square$

**Proof of (b).** For $\sigma \to 0$, signals are precise. $G(s)$ becomes a step function jumping at each $\omega_t(\theta)$. Between jumps, $G$ is monotone (single state contributes, $\Lambda$ strictly decreasing in $s$). Each zero-crossing is unique within its neighborhood. For $\sigma$ small but positive, the step function is smoothed by $O(\sigma)$. By the IFT, each zero perturbs uniquely. If the step function has a single zero (generic: $\bar{h}$ crossed at one $\omega$ value), the smooth $G$ also has a single zero. $\square$

---

## 7. Lemma 1: Asymmetric Triggers

### 7.1 Democratic Trigger: Protest as Political Demand

In democracy, compensation requires **political demand**, which is generated by protest. Define:

$$\bar{\pi}_D^{\text{comp}} = \text{minimum protest that triggers legislative action}$$

This threshold captures: below $\bar{\pi}_D^{\text{comp}}$, displacement is politically invisible — too few affected, no organized demand, no bill introduced. Above it, the issue is salient, legislators respond, law passes.

$\bar{\pi}_D^{\text{comp}} < \bar{\pi}_D^{\text{fall}}$: the "sweet spot" where protest demands compensation without toppling the regime.

**Under rapid $t=1$:** $\omega_R = 0.30$ → many displaced → protest $\pi$ significant (from global game) → $\pi > \bar{\pi}_D^{\text{comp}}$ → bill introduced → law passes. Democracy compensates.

**Under threshold $t=1$:** $\omega_{T1} = 0.05$ → few displaced → protest $\pi = \omega_{T1} = 0.05$ (displaced protest, but very few). For $\bar{\pi}_D^{\text{comp}} \geq 0.05$: $\pi \leq \bar{\pi}_D^{\text{comp}}$ → insufficient political demand → no bill. The non-displaced majority is prospering ($Y^+ > 1$), reinforcing political indifference to the few displaced. Compensation is not blocked by a VOTE AGAINST — it is blocked by **absence of demand**. Nobody proposes it because nobody with political weight is asking.

This connects directly to the empirical evidence:
- Finseraas & Nyhus (2025): technological prosperity shifts the entire community AWAY from redistribution preferences — not via a formal vote, but via the disappearance of political demand for social protection.
- Dasgupta & Ramirez (2025): displaced farmers in the Great Plains didn't organize; the beneficiaries of agricultural technology set the political agenda.

### 7.2 Autocratic Trigger: Elite's Economic Assessment

In autocracy, the dictator values power at $V \to \infty$ and would always compensate. But compensation requires the **selectorate's (elite) fiscal approval** (Section 1.6). The elite approves iff they perceive the crisis through their noisy channel:

$$\text{Elite approves iff } \tilde{\omega}_S > \bar{\omega}_A, \quad \tilde{\omega}_S = \omega + \sigma_A \zeta$$

$\bar{\omega}_A$ is the elite's evidence threshold: the minimum economic signal that justifies spending the selectorate's money. With $\sigma_A$ large (information bubble), $\bar{\omega}_A$ is high — only massive crises pierce the noise.

**Under rapid:** $\omega_R < \bar{\omega}_A$ → elite doesn't see crisis → doesn't approve → dictator represses instead (off-budget, no approval needed).

**Under threshold $t=2$:** $\omega_{T2} > \bar{\omega}_A$ → elite sees GDP collapse → approves → dictator compensates immediately.

**No self-fulfilling problem:** The elite's assessment $\tilde{\omega}_S$ depends on $\omega$ (the economic fundamental), not on $\pi$ (protest). Workers can anticipate compensation without affecting the trigger. The elite sees GDP crashing regardless of whether workers protest.

### 7.3 Statement

**Lemma 1.** *The democratic protest trigger $\bar{\pi}_D^{\text{comp}}$ is exceeded under rapid but not under threshold $t=1$. The autocratic elite trigger $\bar{\omega}_A$ is exceeded under threshold $t=2$ but not under rapid. Formally:*

*(a) $\pi(R, t=1) > \bar{\pi}_D^{\text{comp}} > \pi(T, t=1) \approx 0$*

*(b) $\omega_{T2} > \bar{\omega}_A > \omega_R$*

**Proof of (a).** Under rapid $t=1$ (comp-expected equilibrium): $v = 1 + \delta(1-B) = 1.36 < C_D = 1.5$. The single-state approximation (valid for $\sigma$ small relative to state separation: $\sigma = 0.10$ vs gap $\omega_R - \omega_{T1} = 0.25 = 2.5\sigma$) gives $\pi \approx \bar{h} = 1 - 1.36/1.5 = 0.093$. For $\bar{\pi}_D^{\text{comp}} < 0.093$: comp triggered. Chenoweth & Stephan (2011) document that 3.5% mobilization triggers major political response; $\bar{\pi}_D^{\text{comp}} \approx 0.05$ is conservative.

Under threshold $t=1$ (no-comp equilibrium): $v = 1 + \delta = 1.9 > C_D = 1.5$ → dominant strategy for the few displaced → $\pi = \omega_{T1} = 0.05$. For $\bar{\pi}_D^{\text{comp}} \geq 0.05$: comp NOT triggered. $\square$

**Parametric condition:** $\bar{\pi}_D^{\text{comp}} \in [0.05, \, 0.093)$ — a narrow but non-empty interval. The lower bound ensures threshold protest doesn't trigger; the upper ensures rapid protest does. Width $= 0.043$, driven by $\bar{h}(R) - \omega_{T1} = 0.093 - 0.05$.

**Proof of (b).** $\bar{\omega}_A$ is the elite's evidence threshold: a parameter of the autocratic institution. We require $\bar{\omega}_A \in (\omega_R, \omega_{T2})$. This is feasible because $\omega_R < \omega_{T2}$ (by assumption). For any such $\bar{\omega}_A$, the elite's probability of approving compensation is $P(\tilde{\omega}_S > \bar{\omega}_A \mid \omega) = \Phi((\omega - \bar{\omega}_A)/\sigma_A)$, which is increasing in $\omega$. At $\omega = \omega_R$: $\Phi((\omega_R - \bar{\omega}_A)/\sigma_A) < \Phi(0) = 1/2$ (since $\omega_R < \bar{\omega}_A$). At $\omega = \omega_{T2}$: $\Phi((\omega_{T2} - \bar{\omega}_A)/\sigma_A) > 1/2$. Example: $\bar{\omega}_A = 0.40$, $\sigma_A = 0.15$: $P(\text{comp} \mid \omega_R = 0.30) = \Phi(-0.67) = 0.25$; $P(\text{comp} \mid \omega_{T2} = 0.60) = \Phi(1.33) = 0.91$. $\square$

### 7.4 Why Two Different Triggers (Hirschman 1970)

The asymmetry is not a modeling convenience — it reflects the institutional logic of each regime type:

**Democracy = voice.** The legislature responds to popular demand expressed through protest, petitions, media attention, and electoral pressure. Without voice, the democratic machinery does not activate. This is the defining feature of democratic responsiveness: the government acts BECAUSE citizens demand it.

**Autocracy = technocratic assessment.** The autocrat does not wait for (suppressed) protest to act — that would be admitting the regime has a legitimacy problem. Instead, the autocrat's advisors assess economic conditions, and the selectorate (elite) evaluates whether fiscal intervention is warranted. The decision channel is top-down (economic intelligence → elite consensus → decree), not bottom-up (protest → legislation).

A democracy that compensates without popular demand is paternalistic. An autocracy that compensates in response to protest is showing weakness. Each regime has its natural trigger.

---

## 8. Compensation Decisions by Scenario

| Scenario | $t$ | True $\omega$ | Democracy (voice trigger) | Autocracy (elite trigger) |
|----------|-----|---------------|---------------------------|---------------------------|
| R | 1 | $\omega_R$ | $\pi > \bar{\pi}_D^{\text{comp}}$ → **comp** (law, lag) | $\omega_R < \bar{\omega}_A$ → **no comp** → repress |
| T | 1 | $\omega_{T1}$ | $\pi \approx 0 < \bar{\pi}_D^{\text{comp}}$ → **no comp** | $\omega_{T1} < \bar{\omega}_A$ → **no comp** |
| R | 2 | $\omega_R$ | $\varphi_2 = 1$ (law from $t=1$) | Still $\omega_R < \bar{\omega}_A$ → **no comp** → repress |
| T | 2 | $\omega_{T2}$ | $\pi > \bar{\pi}_D^{\text{comp}}$ → **comp** but LAG → $\varphi_2 = 0$ | $\omega_{T2} > \bar{\omega}_A$ → **comp, immediate** |

---

## 8. Period 1 Equilibrium (Forward-Looking)

### 8.1 Expressive Value

*[Unchanged — absorbing displacement, forward-looking v]*

### 8.2 R×D: Compensation Equilibrium (via Voting)

Under rapid $t=1$, the majority votes for compensation because:
- Fraction $\omega_R \approx 0.30$ displaced → vote YES
- Employed workers ($1 - \omega_R = 0.70$) earn $Y = 1$ (no complementarity bonus) and face forward-looking risk $\delta \cdot \omega_R \cdot B$ → fraction of these vote YES from insurance motive
- With $\omega_R = 0.30$ and moderate δ: the displaced + forward-looking employed form a majority → comp passes

Workers anticipate comp → $v_1 = 1 + \delta(1-B)$. Protest low. Democracy survives.

### 8.3 T×D $t=1$: Compensation Blocked (via Voting + $Y^+$)

Under threshold $t=1$:
- Fraction $\omega_{T1} \approx 0.05$ displaced → vote YES (tiny minority)
- Employed workers ($\approx 0.95$) earn $Y^+ = 1 + \gamma > 1$. Their insurance motive is weak ($P(\text{displaced next period})$ appears low from their signal) and their tax cost is elevated ($\tau \cdot Y^+$). **Majority votes NO.**

No compensation law passes. Workers know this → $v_1$ depends on no-comp expectations. But $\omega_{T1}$ is so low that protest is negligible regardless. Both regimes survive $t=1$.

### 8.4 R×A: Repression Equilibrium

Under rapid $t=1$, the autocratic elite doesn't see the moderate crisis ($\omega_R < \bar{\omega}_A$). Dictator cannot spend the elite's money → defaults to repression (off-budget, uses existing security apparatus). Repression suppresses protest in $t=1$. But displacement accumulates.

In $t=2$: $\Omega_2(R) = \omega_R(2-\omega_R)$. Crisis still below elite's visibility ($\omega_R < \bar{\omega}_A$). Repression continues. But accumulated displacement now generates protest that exceeds $\bar{\pi}_A^{\text{fall}}$ (low threshold for unrepressed protest).

### 8.5 T×A: Elite Approves at $t=2$

$t=1$: calm, no action. $t=2$: $\omega_{T2}$ is massive → even the elite's noisy channels detect the crisis → approves spending → dictator compensates immediately → $\varphi_2 = 1$ → survives.

The self-fulfilling problem is resolved: workers may anticipate compensation and reduce protest, but the ELITE'S approval is based on $\tilde{\omega}_S$ (economic indicators), not on protest. The elite sees GDP collapsing regardless of whether workers protest. The dictator's justification to the elite is the economic data, not the street.

---

## 9. Proposition: Crossed Fragility

### 9.1 Statement

**Proposition.** *There exist open sets of parameters satisfying $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ such that:*

*(a) Democracy is stable under $R$ and unstable under $T$.*

*(b) Autocracy is unstable under $R$ and stable under $T$.*

### 9.2 Proof

**R×D (stable):** Majority approves comp in $t=1$ (displaced + forward-looking employed > 50%). Law passes. Workers anticipate $\varphi_2 = 1$ → $v_1$ reduced → low protest. In $t=2$: comp active, $v_2 = 1-B$ → low protest. Survives.

**T×D (falls):** $t=1$: majority earns $Y^+ > 1$ → votes NO → no comp, no law. $t=2$: $\omega_{T2}$ massive → majority NOW votes YES → law passes → but lag: $\varphi_2 = 0$. $v_2 = 1$ → high protest → $\pi_2 > \bar{\pi}_D^{\text{fall}}$ → falls. $\square$

**R×A (falls):** $t=1$: $\omega_R < \bar{\omega}_A$ → elite doesn't approve → dictator represses. $t=2$: $\omega_R$ still $< \bar{\omega}_A$ → still no approval → represses. But $\Omega_2(R) = \omega_R(2-\omega_R)$ → accumulated protest exceeds $\bar{\pi}_A^{\text{fall}}$. $\square$

**T×A (stable):** $t=1$: calm. $t=2$: $\omega_{T2} > \bar{\omega}_A$ → elite approves → comp immediate → $\varphi_2 = 1$ → protest drops → below $\bar{\pi}_A^{\text{fall}}$. $\square$

### 9.3 Parametric Conditions

**(i)** Majority approves comp under R $t=1$: $\omega_R + \text{forward-looking fraction} > 0.5$

**(ii)** Majority blocks comp under T $t=1$: $\omega_{T1} + \text{forward-looking fraction under } Y^+$ $< 0.5$ (requires $\gamma$ large enough)

**(iii)** $\pi_2^A(R) > \bar{\pi}_A^{\text{fall}}$: accumulated protest under rapid exceeds autocratic tolerance

**(iv)** $\omega_{T2} > \bar{\omega}_A$: massive crisis visible to elite

**(v)** Compensated protest under T×A $t=2$ $\leq \bar{\pi}_A^{\text{fall}}$

**(vi)** $\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$: visibility ordering

### 9.4 Non-Knife-Edge

**Democracy side:** The gap between "majority approves under rapid" and "majority blocks under threshold" is driven by TWO wedges: (a) composition ($\omega_R \gg \omega_{T1}$: more displaced under rapid) and (b) preferences ($Y = 1$ vs $Y^+ > 1$: employed workers under threshold have higher tax cost). Both wedges are strictly positive → open set of parameters.

**Autocracy side:** The gap $\bar{\omega}_A - \bar{\omega}_D$ is driven by $\sigma_A > \sigma_D$ (Lemma 1). Continuous in parameters → open set.

### 9.5 The $C_A$ Constraint as Result

*[Unchanged — C_A < 1/(1-Ω₂(R)) for protest to exist under rapid]*

### 9.6 One Meta-Primitive, Three Derived Forces

| Force | Derives from selectorate size | Mechanism |
|-------|------------------------------|-----------|
| **(a) Information** | Large selectorate → diverse signals → precise assessment. Small → bubble → noisy. | $\sigma_D < \sigma_A$ → Lemma 1 |
| **(b) Speed** | Large → legislation → lag. Small → decree → immediate. | Democratic comp arrives $t+1$; autocratic comp arrives $t$ |
| **(c) Approval** | Large → majority vote → blocked by $Y^+$ majority under threshold. Small → elite approval → blocked by invisible moderate crisis. | T×D: $Y^+$ blocks. R×A: noise blocks. |

**One primitive generates all three.** Remove selectorate difference → regimes are identical → no crossed fragility. This is the deepest version of the result: crossed fragility is a consequence of **selectorate size**, not of three independent institutional features.

---

## 10. Comparative Statics

### 10.1 $\omega_{T2}/\omega_R$ (Key)

*[Unchanged]*

### 10.2 $\gamma$ (Complementarity Bonus) — NEW

As $\gamma \uparrow$: employed workers under threshold earn more → tax cost rises → easier for majority to block comp → T×D fragility strengthened. With $\gamma = 0$: no preference shift, voting under threshold may pass → result weakens. **$\gamma > 0$ is essential for the democratic side of crossed fragility.**

This is the Finseraas & Nyhus (2025) / Dasgupta & Ramirez (2025) channel formalized: complementarity prosperity shifts preferences against redistribution.

### 10.3 $\mu_A$ (Selectorate Size)

As $\mu_A \downarrow$ (more autocratic): fewer elites → noisier assessment → $\bar{\omega}_A$ rises → dictator more blind to moderate crises → R×A fragility strengthens. But speed also increases → T×A stability strengthens. Both sides of autocratic pattern amplified.

### 10.4 $\delta$ and $C_A$

*[Unchanged]*

---

## 11. Extension: $T > 2$ Periods (Updated)

### 11.1 The Problem (Unchanged)

With $T > 2$, forward-looking workers anticipate compensation in $t^*+1$ → $v$ drops → protest drops → democracy survives. Does voting resolve this?

### 11.2 Resolution via Voting + $Y^+$

**Yes.** Under threshold with $T > 2$:

$t = 1, \ldots, t^*-1$: complementarity phase. Majority earns $Y^+ > 1$ → blocks compensation every period. No law passes. No institutional preparation.

$t = t^*$: threshold crosses. Massive displacement. Majority composition FLIPS (many displaced + employed now fearful). Law passes. But lag: $\varphi_{t^*+1} = 1$.

Workers in $t^*$ anticipate $\varphi_{t^*+1}$. BUT: do they trust the promise? The same democratic process that BLOCKED compensation for $t^*-1$ periods now promises it. The legislative track record is: repeated refusal. Workers' confidence in the promise is degraded.

More formally: the **fiscal capacity** to deliver $B$ is degraded by the complementarity phase. During $t=1,\ldots,t^*-1$, no institutional infrastructure for compensation was built (no agency, no legal framework, no budget line). When the law passes at $t^*$, implementation is partial: $B' < B$.

**Resolution B from v4 (capacity degradation) now has a micro-foundation:** the complementarity phase politically blocked the institutional preparation that full compensation requires. The welfare state was WEAKENED during prosperity because the majority didn't want it.

With $B'(\omega_{T2}) < B$: $v = 1 + \delta(1-B') > C_D$ → protest dominant → democracy falls. Same condition as v4: $B' < 1 - (C_D-1)/\delta$.

### 11.3 Autocracy under R×A with $T > 2$

With $T > 2$: $v = 1 + \delta$ (forward-looking, expects continued displacement). Higher $v$ → more protest → more likely to exceed $\bar{\pi}_A^{\text{fall}}$. **R×A result strengthens with $T > 2$** (accumulated displacement + forward-looking anger).

Elite still doesn't approve comp (moderate crisis invisible every period). Dictator represses every period. Displacement accumulates relentlessly. Eventually protest overwhelms repressive capacity.

### 11.4 Summary

| Scenario | $T = 2$ mechanism | $T > 2$ mechanism |
|----------|-------------------|-------------------|
| T×D falls | No $t=3$ (lag kills) | $Y^+$ blocked institutional preparation → $B' < B$ → promise not credible enough |
| R×A falls | Accumulation | Accumulation + forward-looking $v$ higher |

Both sides are **stronger** with $T > 2$, not weaker. The finite-horizon result is not an artifact — it is the conservative version.

---

## 12. Two Calibration Scenarios

### Scenario 1: AI as Historical Automation

$\omega_R = 0.15$ (Acemoglu & Restrepo 2020), $C_A/C_D = 4$ (Chenoweth & Stephan 2011).

With $\omega_R = 0.15$: $\Omega_2(R) = 0.28$. $\bar{h}_A = 1 - v/C_A$. With $C_A = 2.0$: $\bar{h} = 0.50 > 0.28$ → no protest in autocracy → R×A does NOT fall.

**Result**: Only democracy is vulnerable (to threshold). Autocracy is resilient to both trajectories because protest is too suppressed for moderate displacement to generate regime-threatening mobilization.

**Policy implication**: Monitor threshold automation risk in democracies. Build institutional triggers (automatic compensation when displacement exceeds threshold). Autocracies face no regime risk from AI automation at historical displacement rates.

### Scenario 2: AI is Different

$\omega_R = 0.30$ (AI-specific: general-purpose technology, all task types, faster than precedent), $C_A/C_D \approx 1.3$ (or $\omega_R$ high enough that protest exists even with $C_A = 2.0$).

With $\omega_R = 0.30$: $\Omega_2(R) = 0.51 > \bar{h} = 0.50$ → protest exists in autocracy → R×A falls.

**Result**: Full crossed fragility. Both regimes vulnerable, each to the opposing trajectory.

**Policy implication**: Civil society and intelligence agencies should monitor displacement rates. If AI displacement reaches $\omega_R > 0.25$, the autocratic stability threshold is breached — windows of opportunity for democratic transition open under rapid automation. Conversely, democracies should pre-commit compensation mechanisms before threshold automation matures.

### The Paper's Contribution

The model does not predict which scenario is correct — that is an empirical question about the nature of AI. The model **disciplines intuition about both scenarios** and derives the policy implications of each. The uncertainty between Scenarios 1 and 2 IS the central policy question of the AI automation debate.

---

## Appendix A: Logistic Properties

$\Lambda(z) = 1/(1+e^{-z})$, $\lambda(z) = \Lambda(z)(1-\Lambda(z))$, $\Lambda^{-1}(p) = \log(p/(1-p))$, $\Lambda(-z) = 1-\Lambda(z)$.

## Appendix B: Notation

| Symbol | Meaning |
|--------|---------|
| $\theta \in \{R, T, N\}$ | Automation trajectory |
| $\omega_R, \omega_{T1}, \omega_{T2}, \omega_N$ | Displacement rates; $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ |
| $Y^+ = 1 + \gamma$ | Income under complementarity ($\theta = T$, $t=1$, non-displaced) |
| $\gamma$ | Complementarity productivity bonus |
| $S_x$ | Selectorate (democracy: all workers; autocracy: small elite) |
| $\mu_A$ | Selectorate size in autocracy ($\ll 1$) |
| $\Omega_t(\theta)$ | Cumulative displaced (absorbing) |
| $\bar{h} = 1 - v/C_x$ | Participation threshold |
| $s^*$ | Cutoff signal |
| $C_x$ | Protest cost ($C_A > C_D$) |
| $\sigma_x$ | Selectorate's information noise ($\sigma_A > \sigma_D$) |
| $\bar{\omega}_x$ | Selectorate's approval threshold |
| $\bar{\pi}_x^{\text{fall}}$ | Institutional resilience to uncompensated protest |
| $B, B'$ | Compensation: full ($B$) and degraded ($B' < B$ under massive crisis) |
| $\delta$ | Discount factor |

## Appendix C: Design Decisions

### Meta-primitive: Selectorate size
- **Choice**: One meta-primitive (selectorate size) derives all three regime asymmetries (information, speed, approval). Follows Bueno de Mesquita et al. (2003).
- **Discarded**: Three independent primitives (σ_x, lag, decision mode) — appeared unrelated, added parameters, ω̄_A required as separate ad hoc primitive. Selectorate unifies them.

### Compensation trigger mechanism — OPEN QUESTION (2026-05-01)

Three alternatives under consideration:

**Alternative A: Formal voting (v5 current).** Selectorate votes/approves. Democracy: majority rule with Y+ raising tax cost → blocks under threshold. Autocracy: elite approval with σ_A noise → blocks under moderate crisis.
- Problem: forward-looking insurance motive dominates. Numerical verification shows γ* ≈ 2.0-4.0 needed (implausible). Workers who don't protest nonetheless vote YES for insurance. Full report: `quality_reports/2026-05-01_verify-v5-majority.md`.

**Alternative B: Agenda-setting.** Compensation bill introduced iff ω_t^salient > ω̄_D. Salience depends on displacement visibility and Y+ (prosperity reduces attention). Simpler, no insurance problem.
- Problem: somewhat ad hoc; doesn't connect protest to compensation.

**Alternative C: Protest as trigger (Hirschman).** Compensation triggered iff π > π̄_x^comp (political demand threshold). Democracy: protest = voice = demand for compensation. π̄_D^comp < π̄_D^fall (sweet spot exists). Autocracy: π suppressed by C_A → no sweet spot → trigger must be ω̃ (economic indicators).
- Advantage: connects global game directly to compensation. Protest IS the demand.
- Asymmetry: democracy triggered by voice (π), autocracy by technocratic information (ω̃). This IS Hirschman (1970): voice vs loyalty.
- Problem: self-fulfilling under T×A if trigger is π only (comp anticipated → π drops → trigger not met). Resolved by ω̃ for autocracy.
- Status: MOST PROMISING. To be formalized.

**Decision**: Alternative C preferred. Investigate formally in next session. Key: derive π̄_D^comp and π̄_A^comp from primitives. Show sweet spot exists in democracy but not in autocracy.

### Y+ > 1 formal
- **Choice**: Non-displaced workers under threshold t=1 earn Y+ = 1 + γ. Enters voting mechanism (higher tax cost → blocks compensation).
- **Discarded (v4)**: Y+ mentioned verbally only — didn't enter any equation. Missed the voting mechanism that resolves T×D under full Bayesian and T > 2.

### Selectorate approval replaces pure Bayesian comp rule
- **Choice**: Incumbent proposes, selectorate approves. Democracy: majority vote. Autocracy: elite consensus based on ω̃_S.
- **Discarded (v4)**: Pure Bayesian optimization (comp iff ΔP > ω̂·B). FAILED: insurance always cheap relative to power loss (V → ∞) → incumbent always compensates → no crossed fragility. The selectorate constraint is what prevents universal compensation.
- **Why full Bayesian fails**: With V → ∞, ANY positive ΔP exceeds any finite cost. The dictator would spend all of GDP to stay in power. What stops him is the SELECTORATE: spending their money on an invisible crisis gets him removed. The constraint is political, not computational.

### Self-fulfilling problem resolved
- **Choice**: Selectorate's approval based on economic indicators (ω̃_S), not protest. Workers can anticipate comp → zero protest. But elite sees GDP collapsing → approves anyway. No circularity.
- **Discarded**: Protest-only signal → self-fulfilling under T×A (v3). Dual signal → unnecessarily complex (v3). Single ω̃ → correct direction but didn't explain WHY the autocrat doesn't always compensate (v4). Selectorate explains it: the constraint is approval, not detection.

### Two calibration scenarios
- **Choice**: Present both "Historical" (ω_R=0.15, only democracy vulnerable) and "AI-different" (ω_R=0.30, crossed fragility). The model disciplines intuition about both.
- **Discarded**: Forcing crossed fragility with unrealistic parameters. The honest approach: show what the model says under each calibration and let the reader assess which scenario is more plausible.

### Confirmed parameters (simulation, v7)
```
ω_R=0.30, ω_T1=0.05, ω_T2=0.60, ω_N=0.02
σ=0.10, C_D=1.5, C_A=2.0, B=0.6, δ=0.9
π̄_D=0.20, π̄_A=0.05, σ_D=0.03, σ_A=0.15
```

| Scenario | π₂ | π̄ | Outcome |
|----------|----|----|---------|
| R×D | 0.000 (comp) | 0.20 | STABLE |
| R×A | 0.500 (accumulated) | 0.05 | FALLS |
| T×D | 0.333 (massive, no comp) | 0.20 | FALLS |
| T×A | 0.000 (immediate decree) | 0.05 | STABLE |
