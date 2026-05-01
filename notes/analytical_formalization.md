# Analytical Formalization: Reformulated Model (v4)

**Working document — derivations for "AI and Regime Stability"**
**Date**: 2026-05-01 (v4: simplified per design review — single signal, standard comp rule, 2×2 benchmark)
**Reference**: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`

---

## 0. The Mechanism in One Page: 2×2 Benchmark

Before the full model, we present the crossed fragility result in its simplest form. No global game, no signals, no Bayesian updating — just three forces interacting.

### Three forces

**(a) Informational asymmetry.** Democracy detects crises at low displacement rates; autocracy requires large displacement to detect a crisis. Formally: each regime $x$ has a *visibility threshold* $\bar{\omega}_x$ such that the incumbent detects a crisis iff $\omega_t > \bar{\omega}_x$. Because protest is freer in democracies and suppressed in autocracies, $\bar{\omega}_D < \bar{\omega}_A$.

**(b) Speed asymmetry.** Autocracy responds immediately (decree); democracy responds with a one-period lag (legislation, debate, coalition-building). Formally: if the incumbent compensates in $t$, then $\varphi_t = 1$ in autocracy but $\varphi_{t+1} = 1$ in democracy.

**(c) Trajectory asymmetry.** Rapid automation (independent tasks) causes moderate, persistent displacement: $(\omega_R, \omega_R)$. Threshold automation (complementary tasks, O-Ring) causes low displacement initially, then massive displacement when the automation threshold is crossed: $(\omega_{T1}, \omega_{T2})$ with $\omega_{T1} \ll \omega_R \ll \omega_{T2}$.

### The key ordering

$$\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$$

### The four scenarios

**R×D (stable).** $t=1$: $\omega_R > \bar{\omega}_D$ — democracy detects moderate crisis. Compensates. Lag: $\varphi_2 = 1$. $t=2$: compensation active, crisis managed. Survives.

**T×D (falls).** $t=1$: $\omega_{T1} < \bar{\omega}_D$ — no crisis detected. No compensation. $t=2$: $\omega_{T2} > \bar{\omega}_D$ — crisis detected. Compensates. But lag: $\varphi_3 = 1$ (no $t=3$). $\varphi_2 = 0$. Falls.

**R×A (falls).** $t=1$: $\omega_R < \bar{\omega}_A$ — autocracy cannot detect moderate crisis despite its speed. No compensation. $t=2$: $\omega_R$ continues, accumulated displacement. Still invisible. Falls.

**T×A (stable).** $t=1$: $\omega_{T1} < \bar{\omega}_A$ — calm. $t=2$: $\omega_{T2} > \bar{\omega}_A$ — crisis SO massive even autocracy detects it. Compensates immediately ($\varphi_2 = 1$). Survives.

### The irony

Moderate-persistent crises favor *information* (the regime that sees early can act in time). Massive-sudden crises favor *speed* (both regimes eventually see, but only the fast one responds in time). Each automation trajectory generates the crisis that exploits the opposing regime's weakness.

**The remainder of this document microfounds $\bar{\omega}_x$ from the global game and derives parametric conditions.** The 2×2 benchmark is not a separate model — it is the skeleton that the full model fleshes out.

---

## 1. Model Primitives

### 1.1 Environment

- Continuum of workers $i \in [0,1]$, two periods $t \in \{1,2\}$
- Employment income: $Y = 1$. Displacement income: $0$ (without compensation), $B \in (0,1)$ (with)
- Regime $x \in \{D, A\}$ (democracy, autocracy)

### 1.2 States and Trajectories

Nature draws $\theta \in \{R, T, N\}$ with prior $(p_R, p_T, p_N)$, $p_N > 0$.

| $\theta$ | $\omega_1$ | $\omega_2$ | Interpretation |
|-----------|------------|------------|----------------|
| $R$ | $\omega_R$ | $\omega_R$ | Independent tasks: moderate, persistent displacement |
| $T$ | $\omega_{T1}$ | $\omega_{T2}$ | Complementary tasks (O-Ring): few displaced initially, massive when threshold crossed |
| $N$ | $\omega_N$ | $\omega_N$ | Normal churn |

**Key ordering**: $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$

Under $T/t=1$, non-displaced workers benefit from complementarity (higher productivity). This reinforces the absence of protest but does not enter the formal payoff structure — it is a verbal observation that strengthens the "calm before the storm."

### 1.3 Individual Shocks and Signals

- Displacement: $d_{it} \sim \text{Bernoulli}(\omega_t(\theta))$, iid conditional on $\theta$
- Signal: $s_{it} = \omega_t(\theta) + \sigma \varepsilon_{it}$, $\varepsilon_{it} \sim \text{Logistic}(0,1)$ iid

Logistic CDF: $\Lambda(z) = 1/(1+e^{-z})$, PDF: $\lambda(z) = \Lambda(z)(1-\Lambda(z))$.

### 1.4 Displacement is Absorbing

$$\Omega_1(\theta) = \omega_1(\theta), \quad \Omega_2(\theta) = \omega_1(\theta) + (1-\omega_1(\theta)) \cdot \omega_2(\theta)$$

### 1.5 Protest

Only displaced workers protest. Expressive value:

$$v_{it} = (1 - y_{it}) + \delta \cdot \mathbb{E}[(1 - y_{i,t+1}) \mid d_{it}, s_{it}]$$

Cost with safety in numbers ($h(\pi) = \pi$, linear):

$$\text{Protest iff } v_{it} > C_x \cdot (1 - \mathbb{E}[\pi_t \mid s_{it}]), \quad C_A > C_D > 0$$

### 1.6 Two Primitives

| | Democracy | Autocracy |
|--|----------|-----------|
| Protest cost | $C_D$ (low) | $C_A$ (high) |
| Response speed | $\text{comp}_t \to \varphi_{t+1}$ (lag) | $\text{comp}_t \to \varphi_t$ (immediate) |

### 1.7 Incumbent's Information and Decision

### Why two different signals?

Workers and incumbents operate at **different informational scales** and face **different decision problems**.

**Workers** make an *individual coordination decision*: protest or not. They observe:
- $d_{it}$: whether they personally lost their job (direct experience)
- $s_{it} = \omega_t + \sigma \varepsilon_{it}$: a noisy local signal about how widespread displacement is (conversations with neighbors, local news, job market perception)

A worker does not need GDP data to decide whether to protest — they need to estimate whether enough *others like them* are angry enough to join. This is the global game: individual decision based on private signal about the coordination environment.

**The incumbent** makes an *aggregate policy decision*: compensate or not. They observe:

$$\tilde{\omega}_t = \omega_t + \sigma_x \cdot \zeta_t, \quad \zeta_t \sim N(0,1), \quad \sigma_D < \sigma_A$$

This is a **sufficient statistic** for the incumbent's *non-protest* information: ministry of finance reports, unemployment claims, tax revenue, trade data, intelligence briefings. The incumbent does not see each worker's signal; they see macro aggregates from bureaucratic channels.

The regime-specific noise $\sigma_x$ captures the quality of these bureaucratic channels:
- **Autocracy**: subordinates report optimistically up the hierarchy, statistical agencies are pressured to produce favorable numbers (the well-documented unreliability of Chinese GDP figures), intelligence services filter information to please the leader (Egorov, Guriev & Sonin 2009) → $\sigma_A$ large
- **Democracy**: independent statistical agencies (BLS, IBGE), free press cross-checks official data, congressional oversight demands accurate reporting → $\sigma_D$ small

In democracy, open protest provides an *additional* channel that further reduces $\sigma_D$: visible demonstrations complement bureaucratic data with real-time information about popular grievance. In autocracy, this channel is suppressed ($C_A$ high), leaving the incumbent reliant on the distorted bureaucratic channels alone. This is the micro-logic behind $\sigma_D < \sigma_A$: same bureaucratic channels in both regimes, but democracy has protest as a bonus information source.

> Workers observe their individual displacement status and a noisy local signal — sufficient for their binary protest decision. The incumbent observes an aggregate assessment from bureaucratic channels — sufficient for the binary compensation decision. Democracy's assessment is more precise ($\sigma_D < \sigma_A$) because open protest supplements bureaucratic information; autocracy lacks this supplement.

**Remark on $\sigma$ vs $\sigma_x$.** The model has two noise parameters: $\sigma$ (workers' signal noise about $\omega$) and $\sigma_x$ (incumbent's assessment noise). These are conceptually distinct — one is about individual perception, the other about institutional information aggregation — and treated as independent. However, they are linked through $C_x$: higher $C_x$ suppresses protest, which degrades one of the incumbent's information channels, raising $\sigma_x$. A microfoundation would write $\sigma_x = \bar{\sigma} / (1 + \alpha \pi^{\text{eq}})$, where $\pi^{\text{eq}}$ is equilibrium protest and $\alpha$ captures the weight of the protest channel. Since $\pi^{\text{eq}}$ is decreasing in $C_x$ (Section 2), this yields $\sigma_x$ increasing in $C_x$: $\sigma_A > \sigma_D$. We do not formalize this linkage (it would reintroduce the circularity that $\tilde{\omega}$ was designed to avoid), but note it to clarify that $\sigma_D < \sigma_A$ is not an arbitrary assumption — it follows from the same primitive ($C_D < C_A$) that drives the protest cost differential.

### Why not a single shared signal?

**Option considered and rejected: incumbent observes protest $\tilde{\pi} = \pi + \tau_x \xi$ directly.**

This creates a self-fulfilling problem specific to T×A. Under threshold $t=2$ in autocracy ($\omega_{T2}$ massive, compensation immediate):

- **Comp equilibrium**: workers anticipate $\varphi_2 = 1$ → $v = 1-B = 0.4$ → $\bar{h} = 1 - 0.4/C_A = 0.80$. But $\Omega_2(T) = 0.62 < 0.80$ → no interior equilibrium → $\pi = 0$. Incumbent sees $\tilde{\pi} \approx 0$ → no evidence → does NOT compensate → **contradicts comp assumption**. ✗

- **No-comp equilibrium**: workers anticipate $\varphi_2 = 0$ → $v = 1$ → $\bar{h} = 0.50 < \Omega_2(T) = 0.62$ → interior equilibrium exists → $\pi = 0.50$. Incumbent sees $\tilde{\pi} \approx 0.50$ → high protest → WOULD compensate → **contradicts no-comp assumption**. ✗

Neither pure equilibrium is self-confirming. The root cause: autocratic *immediate* compensation collapses the very protest signal that justified it. This circularity is specific to autocracy (where compensation is contemporaneous with protest) and does not affect democracy (where the lag breaks the feedback loop — compensation arrives next period, after protest is already observed).

The $\tilde{\omega}$ formulation resolves this by giving the incumbent information *independent of the protest it induces*. The economic shock ($\omega_t$) is partially observable through channels that do not depend on workers' protest decisions — factory closures, unemployment claims, tax revenue drops, import/export data. The quality of these channels is worse in autocracy ($\sigma_A > \sigma_D$), but their existence breaks the self-fulfilling cycle.

**Compensation rule** (standard optimization):

$$\text{comp}_t = 1 \iff \underbrace{\mathbb{E}[V_{\text{survive}} \mid \text{comp}, \tilde{\omega}_t] - \mathbb{E}[V_{\text{survive}} \mid \text{no comp}, \tilde{\omega}_t]}_{\Delta P(\tilde{\omega}_t)} > \underbrace{\mathbb{E}[\omega_t \mid \tilde{\omega}_t]}_{\hat{\omega}_t} \cdot B$$

The incumbent compensates when the expected survival gain exceeds the expected cost. This is a standard Bayesian decision rule — no ad hoc information-update threshold.

**Why autocracy doesn't compensate under $\omega_R$:** With $\sigma_A$ large, $\tilde{\omega}$ is noisy. $\mathbb{E}[\omega \mid \tilde{\omega}]$ is shrunk toward the prior mean $\bar{\omega} = p_R \omega_R + p_T \omega_{T1} + p_N \omega_N$, which is low. Both $\Delta P$ and $\hat{\omega}$ are attenuated → LHS falls below RHS.

**Why autocracy compensates under $\omega_{T2}$:** Even with $\sigma_A$ large, $\tilde{\omega} \approx \omega_{T2}$ is far above any plausible prior mean → $\mathbb{E}[\omega \mid \tilde{\omega}] \approx \omega_{T2}$. The signal-to-noise ratio $\omega_{T2}/\sigma_A$ is large enough that the posterior concentrates → $\Delta P$ is high → LHS exceeds RHS.

### 1.8 Fall Condition

Regime falls iff $\pi_t > \bar{\pi}_x^{\text{fall}}$ and $\varphi_t = 0$.

$\bar{\pi}_D^{\text{fall}} > \bar{\pi}_A^{\text{fall}}$: democracies absorb more protest.

### 1.9 Timing

1. $d_{it}$ realized → 2. Signals observed → 3. Protest → 4. Incumbent observes $\tilde{\omega}_t$, decides comp → 5. Compensation: autocracy $\varphi_t=1$ / democracy $\varphi_{t+1}=1$ → 6. Fall check → 7. Payoffs

---

## 2. Single-State Benchmark (Known $\omega$)

Complete-information benchmark. Illustrates the indifference logic; provides closed-form building blocks.

**Indifference condition** ($h(\pi) = \pi$, $\omega$ known):

$$\Omega \cdot \Lambda\left(\frac{\omega - s^*}{\sigma}\right) = \bar{h}, \quad \bar{h} \equiv 1 - v/C_x$$

**Closed-form cutoff** (existence requires $0 < \bar{h} < \Omega$):

$$s^* = \omega - \sigma \cdot \log\left(\frac{\bar{h}}{\Omega - \bar{h}}\right)$$

**Equilibrium protest**: $\pi^* = \bar{h}$ (interior equilibrium, independent of $\omega$).

**Caveat**: With known $\omega$, multiple equilibria exist (all-protest, no-protest, interior). Uniqueness requires multi-state uncertainty (Section 3).

---

## 3. Multi-State Equilibrium

### 3.1 Posterior

$$P(\theta \mid d=1, s) = \frac{\omega_t(\theta) \cdot \lambda\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \cdot p_\theta}{\sum_{\theta'} \omega_t(\theta') \cdot \lambda\left(\frac{s - \omega_t(\theta')}{\sigma}\right) \cdot p_{\theta'}}$$

### 3.2 Indifference Condition

$$G(s^*) \equiv \sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) - \bar{h} = 0$$

Transcendental — no closed form. Numerical root-finding required.

---

## 4. Lemma 2: Asymmetric Composition

**Lemma 2.** *With $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$:*

*(a) $t=1$: $\Omega_1(R) > \Omega_1(T) > \Omega_1(N)$.*

*(b) $t=2$: $\Omega_2(T) > \Omega_2(R) > \Omega_2(N)$, provided $\omega_{T2} > [\omega_R(2-\omega_R) - \omega_{T1}]/(1-\omega_{T1})$.*

**Proof.** (a) Immediate. (b):

$\Omega_2(R) = \omega_R(2 - \omega_R)$, $\quad \Omega_2(T) = \omega_{T1} + (1-\omega_{T1})\omega_{T2}$

$\Omega_2(T) > \Omega_2(R) \iff \omega_{T2} > \frac{\omega_R(2-\omega_R) - \omega_{T1}}{1-\omega_{T1}}$

With $\omega_R = 0.30$, $\omega_{T1} = 0.05$: bound $= 0.484$. With $\omega_{T2} = 0.60$: satisfied. $\square$

**Interpretation**: Threshold has MORE total displaced in $t=2$ than rapid. The autocracy mechanism cannot rely on "fewer displaced under threshold" — it works through the incumbent's *ability to detect and respond*.

---

## 5. Lemma 0: Existence and Uniqueness

**Lemma 0.** *With $h(\pi) = \pi$, $F = \Lambda$, $v \in (0, C_x)$, $\sigma > 0$, all $p_\theta > 0$:*

*(a) At least one cutoff $s^*$ exists.*

*(b) The cutoff is unique for $\sigma$ sufficiently small.*

**Proof of (a).** Define $G(s) = \sum_\theta P(\theta \mid d=1, s) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s)/\sigma) - \bar{h}$.

*Behavior as $s \to +\infty$*: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 0$ for all $\theta$, so $G(s) \to -\bar{h} < 0$.

*Behavior as $s \to -\infty$*: $\Lambda((\omega_t(\theta) - s)/\sigma) \to 1$ for all $\theta$. The posterior $P(\theta \mid d=1, s)$ concentrates on the state $\theta^*$ with the highest $\omega_t$ (because the signal likelihood $\lambda((s - \omega)/\sigma) \propto e^{(s-\omega)/\sigma}$ decays slowest for the largest $\omega$). So $G(s) \to \Omega_t(\theta^*) - \bar{h}$. For generic parameters, $\Omega_t(\theta^*) > \bar{h}$ (the highest-displacement state has more displaced workers than the participation threshold), so $G(s) > 0$ for $s$ sufficiently negative.

By continuity of $G$ and the Intermediate Value Theorem, there exists $s^*$ with $G(s^*) = 0$. $\square$

**Proof of (b).** Consider $\sigma \to 0$. In this limit, a worker with signal $s$ becomes certain about $\omega_t$: if $s$ is close to $\omega_t(\theta)$ for some $\theta$, the posterior concentrates on $\theta$. The function $G(s)$ becomes a step function that jumps at each $\omega_t(\theta)$. Between jumps, $G$ is monotone (since within a neighborhood of a single $\omega$, only one state contributes, and $\Lambda((\omega - s)/\sigma)$ is strictly decreasing in $s$). Each zero-crossing is therefore unique within its neighborhood.

For $\sigma$ small but positive, the step function is smoothed by an amount $O(\sigma)$. By the Implicit Function Theorem, each zero of the step function perturbs to a unique zero of $G$ for $\sigma$ small enough. If the step function has a single zero (which occurs when the $\bar{h}$ threshold is crossed at only one $\omega$ value — the generic case), the perturbed $G$ also has a single zero. $\square$

---

## 6. Lemma 1: The Dictator's Dilemma as Visibility Gap

### 6.1 Definition

The *visibility threshold* $\bar{\omega}_x$ is the smallest displacement rate at which the incumbent's signal $\tilde{\omega}_t$ leads to compensation with probability $> 1/2$.

From the compensation rule: $\text{comp} \iff \Delta P(\tilde{\omega}) > \hat{\omega} \cdot B$. Since both $\Delta P$ and $\hat{\omega}$ increase in $\tilde{\omega}$ (and hence in true $\omega$), there exists a threshold $\bar{\omega}_x$ above which compensation triggers. This threshold depends on $\sigma_x$: higher noise → higher threshold.

### 6.2 Statement

**Lemma 1** (Dictator's Dilemma). *$\bar{\omega}_A > \bar{\omega}_D$. Democracy detects crises at lower displacement rates than autocracy.*

**Proof.** The compensation rule triggers at $\bar{\omega}_x$, the smallest $\omega$ such that $\Delta P(\tilde{\omega}) > \hat{\omega} \cdot B$ holds with probability $> 1/2$ over the noise $\zeta$.

The incumbent's posterior mean is $\hat{\omega}(\tilde{\omega}) = \mathbb{E}[\omega \mid \tilde{\omega}]$. Under a normal signal with prior mean $\mu_0$ and prior variance $\sigma_0^2$:

$$\hat{\omega}(\tilde{\omega}) = \frac{\sigma_0^2}{\sigma_0^2 + \sigma_x^2} \tilde{\omega} + \frac{\sigma_x^2}{\sigma_0^2 + \sigma_x^2} \mu_0$$

The weight on the signal $\tilde{\omega}$ is $\sigma_0^2/(\sigma_0^2 + \sigma_x^2)$, which is **decreasing in $\sigma_x$**. As $\sigma_x$ increases:

(i) The posterior mean $\hat{\omega}$ is shrunk more toward the prior mean $\mu_0$, reducing the perceived severity of the crisis for any true $\omega > \mu_0$.

(ii) The posterior variance $\text{Var}(\omega \mid \tilde{\omega}) = \sigma_0^2 \sigma_x^2/(\sigma_0^2 + \sigma_x^2)$ increases, so $\Delta P$ — which depends on the incumbent's confidence about the state — is attenuated.

Both effects reduce the LHS of the compensation condition for any given true $\omega$. Therefore, a higher $\omega$ is needed to trigger compensation under $\sigma_A$ than under $\sigma_D$:

$$\sigma_A > \sigma_D \implies \bar{\omega}_A > \bar{\omega}_D$$

Formally: define $f(\omega, \sigma_x) = P(\Delta P(\tilde{\omega}) > \hat{\omega} \cdot B \mid \omega)$. This probability is increasing in $\omega$ (larger shocks generate higher $\tilde{\omega}$ in expectation) and decreasing in $\sigma_x$ (more noise attenuates the signal). By the Implicit Function Theorem applied to $f(\bar{\omega}_x, \sigma_x) = 1/2$:

$$\frac{d\bar{\omega}_x}{d\sigma_x} = -\frac{\partial f/\partial \sigma_x}{\partial f/\partial \omega} = -\frac{(\text{negative})}{(\text{positive})} > 0 \quad \square$$

### 6.3 The Critical Interval

Crossed fragility requires:

$$\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$$

This is a single inequality chain encoding the entire mechanism:
- Democracy sees $\omega_R$ (moderate) but not $\omega_{T1}$ (calm)
- Autocracy sees $\omega_{T2}$ (massive) but not $\omega_R$ (moderate)

---

## 7. Incumbent's Compensation by Scenario

| Scenario | $t$ | True $\omega$ | Democracy ($\sigma_D$ small) | Autocracy ($\sigma_A$ large) |
|----------|-----|---------------|------------------------------|-------------------------------|
| R | 1 | $\omega_R$ | $\omega_R > \bar{\omega}_D$ → **comp** | $\omega_R < \bar{\omega}_A$ → **no comp** |
| T | 1 | $\omega_{T1}$ | $\omega_{T1} < \bar{\omega}_D$ → **no comp** | $\omega_{T1} < \bar{\omega}_A$ → **no comp** |
| R | 2 | $\omega_R$ | $\varphi_2 = 1$ (from $t=1$ law) | Still $\omega_R < \bar{\omega}_A$ → **no comp** |
| T | 2 | $\omega_{T2}$ | **comp** but LAG → $\varphi_2 = 0$ | $\omega_{T2} > \bar{\omega}_A$ → **comp, immediate** |

---

## 8. Period 1 Equilibrium (Forward-Looking)

### 8.1 Expressive Value

Displaced worker in $t=1$ ($d_{i1}=1 \Rightarrow d_{i2}=1$ by absorbing):

- **Democracy, comp expected**: $v_1^{D,c} = 1 + \delta(1-B)$
- **Democracy, no comp**: $v_1^{D,n} = 1 + \delta$
- **Autocracy, comp expected** (immediate $\varphi_1=1$): $v_1^{A,c} = (1-B) + \delta \cdot \mathbb{E}[(1-y_{i2})]$

### 8.2 Equilibrium Selection Under R×D

Two candidates: comp-expected ($v^c$, low protest) and no-comp ($v^n$, high protest).

**No-comp is not self-confirming**: $v^n = 1 + \delta = 1.9 > C_D = 1.5$ → dominant strategy, all displaced protest ($\pi_1 = \omega_R$). But democracy detects this ($\omega_R > \bar{\omega}_D$) → would compensate → contradicts no-comp assumption.

**Comp is self-confirming**: $v^c = 1 + \delta(1-B) = 1.36 < C_D = 1.5$ → not dominant. $\bar{h} = 1 - 1.36/1.5 = 0.093$. Protest $\approx 9\%$. Democracy detects ��� compensates → consistent.

**Unique consistent equilibrium** under R×D: compensation. Democracy survives with low protest.

### 8.3 Under Threshold $t=1$

$\omega_{T1}$ small → few displaced → negligible protest → no detection → no comp. Both regimes survive.

---

## 9. Proposition: Crossed Fragility

### 9.1 Statement

**Proposition.** *There exist open sets of parameters satisfying $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ such that:*

*(a) Democracy is stable under $R$ and unstable under $T$.*

*(b) Autocracy is unstable under $R$ and stable under $T$.*

### 9.2 Proof Sketch

**R×D (stable):** $t=1$: comp equilibrium (Section 8.2), low protest. $t=2$: $\varphi_2 = 1$, $v_2 = 1-B$. $\pi_2^D \leq \bar{\pi}_D^{\text{fall}}$ by condition (i).

**T×D (falls):** $t=1$: $\omega_{T1} < \bar{\omega}_D$, no comp. $t=2$: $\omega_{T2} > \bar{\omega}_D$, comp but lag ($\varphi_2 = 0$). $v_2 = 1$. $\pi_2^D > \bar{\pi}_D^{\text{fall}}$ by condition (ii).

**R×A (falls):** $t=1$: $\omega_R < \bar{\omega}_A$, no comp. Survives via low $\pi$ (high $C_A$). $t=2$: $\Omega_2(R) = \omega_R(2-\omega_R)$, still $\omega_R < \bar{\omega}_A$, no comp. $\pi_2^A > \bar{\pi}_A^{\text{fall}}$ by condition (iii).

**T×A (stable):** $t=1$: calm. $t=2$: $\omega_{T2} > \bar{\omega}_A$, comp **immediately** ($\varphi_2 = 1$). $v_2 = 1-B$, protest drops. $\pi_2^A \leq \bar{\pi}_A^{\text{fall}}$ by condition (iv).

### 9.3 Parametric Conditions

**(i)** $1 - [1+\delta(1-B)]/C_D \leq \bar{\pi}_D^{\text{fall}}$ — R×D survives $t=1$

**(ii)** Protest with $v=1$, $\Omega_2(T)$ displaced $> \bar{\pi}_D^{\text{fall}}$ — T×D falls $t=2$

**(iii)** Protest with $v=1$, $\Omega_2(R)$ displaced $> \bar{\pi}_A^{\text{fall}}$ — R×A falls $t=2$

**(iv)** Protest with $v=1-B$ under $\Omega_2(T)$ compensated $\leq \bar{\pi}_A^{\text{fall}}$ — T×A survives $t=2$

**(v)** $\omega_{T1} < \bar{\omega}_D < \omega_R < \bar{\omega}_A < \omega_{T2}$ — visibility ordering (Lemma 1 + parameters)

**(vi)** $C_A < 1/(1 - \Omega_2(R))$ — protest exists under rapid (see Section 9.5)

### 9.4 Non-Knife-Edge

**For democracy:** The interval for $\bar{\pi}_D^{\text{fall}}$ has width driven by $\delta B / C_D$ (the forward-looking channel) and $\Omega_2(T) - \Omega_2(R)$ (the composition channel). Both are strictly positive.

**For autocracy:** The interval $(\bar{\omega}_D, \bar{\omega}_A)$ is non-empty and open for $\sigma_A > \sigma_D$. The condition $\omega_R \in (\bar{\omega}_D, \bar{\omega}_A)$ defines an open set in parameter space.

### 9.5 The C_A Constraint as Result

**Corollary** (Limits of repression). *Crossed fragility requires $C_A < 1/(1 - \Omega_2(R))$. With $\omega_R = 0.30$: $C_A < 2.04$.*

**Interpretation**: Extremely repressive autocracies ($C_A$ very high) suppress protest entirely, eliminating the mechanism of regime change. Such regimes �� think North Korea or Turkmenistan — do not exhibit crossed fragility because protest never materializes regardless of the economic shock. The result applies to moderately repressive regimes (the bulk of Geddes's (1999) typology: military, party, and personalist regimes with intermediate repressive capacity).

**Feasible range** (confirmed numerically): $C_A \in [C_D, \, 2.25]$, i.e., $C_A/C_D \in [1.0, 1.5]$.

### 9.6 The Three Forces

The 2×2 benchmark (Section 0) identified three forces. The full model microfounds each:

| Force | 2×2 primitive | Full model mechanism |
|-------|--------------|---------------------|
| **(a) Informational asymmetry** | $\bar{\omega}_D < \bar{\omega}_A$ | $\sigma_D < \sigma_A$ → incumbent's posterior is more precise in democracy → lower compensation threshold (Lemma 1) |
| **(b) Speed asymmetry** | Lag vs immediate | $\text{comp}_t \to \varphi_{t+1}$ (democracy) vs $\varphi_t$ (autocracy) |
| **(c) Trajectory asymmetry** | $\omega_{T1} \ll \omega_R \ll \omega_{T2}$ | Exogenous, from the economics of automation (independent vs complementary tasks) |

**Crossed fragility emerges from the interaction of (a), (b), and (c).** No single force generates it: remove informational asymmetry ($\sigma_D = \sigma_A$) → both regimes react identically → no crossing. Remove speed asymmetry (both lag or both immediate) → same response timing → no crossing. Remove trajectory asymmetry ($\omega_{T2} = \omega_R$) → same crisis under both trajectories → no differential vulnerability.

---

## 10. Comparative Statics

### 10.1 $\omega_{T2}/\omega_R$ Ratio (Key Parameter)

As $\omega_{T2}/\omega_R \uparrow$: gap between threshold and rapid widens → easier to place $\bar{\omega}_A$ between them ��� crossed fragility more robust. Economic interpretation: more O-Ring-like automation strengthens the result.

### 10.2 $\sigma_A/\sigma_D$ Ratio

As $\sigma_A/\sigma_D \uparrow$: $\bar{\omega}_A - \bar{\omega}_D$ widens → easier to separate regimes' detection ability. The dictator's dilemma sharpens.

### 10.3 $\delta$ (Discount Factor)

$\delta \uparrow$: $\Delta v = v^{\text{no}} - v^{\text{comp}} = \delta B$ grows → comp equilibrium more attractive under R×D → democracy's advantage amplified.

### 10.4 $C_A$ (Sweet Spot)

$C_A$ too low: protest not suppressed → autocracy also sees moderate crises → no dilemma. $C_A$ too high: protest fully suppressed → no mechanism of regime change. **Sweet spot**: $C_A$ high enough that $\omega_R < \bar{\omega}_A$ but low enough that $\pi_2^A(R) > \bar{\pi}_A^{\text{fall}}$.

### 10.5 Concave $h$ (Extension)

With $h(\pi) = \pi^\alpha$, $\alpha < 1$: Jensen's inequality raises cutoff → less protest → additional suppression effect. Mechanism robust: massive $\omega_{T2}$ generates high protest regardless of $h$'s shape.

---

## 11. Extension: $T > 2$ Periods

### 11.1 The Problem

With $T = 2$, democracy falls under threshold because the lag makes compensation arrive at $t=3$, which does not exist. **This is an artifact of the finite horizon.** With $T > 2$, does the result survive?

### 11.2 Setup

Generalize to $T \geq 2$ periods. Threshold crosses at $t^* = 2$ (can be generalized). Displacement rates:
- R: $\omega_R$ every period.  T: $\omega_{T1}$ for $t < t^*$, $\omega_{T2}$ for $t \geq t^*$.  N: $\omega_N$ every period.

Cumulative displacement (absorbing): $\Omega_t(\theta) = 1 - \prod_{s=1}^{t}(1 - \omega_s(\theta))$.

Democratic lag: $L = 1$ (law passed in $t$, compensation from $t+1$). Autocratic: immediate.

### 11.3 The Forward-Looking Channel Saves Democracy

Under T×D with $T > 2$, $t^* = 2$:

$t = 2$: massive displacement ($\omega_{T2}$). Democracy sees crisis, passes law. $\varphi_3 = 1$. Workers in $t=2$ are **forward-looking**: they know compensation arrives in $t=3$.

$$v_{i2} = 1 + \delta \cdot \mathbb{E}[(1-y_{i3}) \mid d_{i2}=1] = 1 + \delta(1-B)$$

This is **the same $v$** as under R×D $t=1$ with comp expected. With baseline parameters:

$v_{i2} = 1 + 0.9 \times 0.4 = 1.36 < C_D = 1.5 \implies \bar{h} = 0.093$

Protest $\approx 9\% < \bar{\pi}_D^{\text{fall}} = 0.20$. **Democracy survives $t=2$.**

$t = 3$: compensation active. $v = 1-B = 0.4$. Protest negligible. Survives.

$t \geq 4$: compensation continues. Survives.

**Conclusion: With $T > 2$ and $L = 1$, crossed fragility breaks for T×D.** The forward-looking channel that saves democracy under rapid (credible commitment reduces $v$) also saves it under threshold, as long as there is a future period where compensation can arrive.

### 11.4 What Drives the Result

The root cause is that the democratic lag ($L = 1$ period) is **short relative to the horizon**. Workers discount the one-period wait by $\delta = 0.9$, losing only $\delta B = 0.36$ of anger reduction. For democracy to fall, workers must have **no expectation of future compensation**. This requires either:
- (a) No future: $T = 2$ (baseline)
- (b) Long lag: $L$ large enough that $\delta^L(1-B) \approx 0$
- (c) Uncertainty about compensation: $P(\text{comp}) < 1$

### 11.5 Resolution Candidates

**Resolution A: Long and crisis-dependent lag.** The democratic lag $L$ is not fixed — it depends on the *scale* of the crisis. Moderate crises ($\omega_R$) require standard legislation ($L = 1$). Massive, unprecedented crises ($\omega_{T2}$) overwhelm legislative capacity: coalition-building is harder, fiscal implications larger, bureaucratic implementation slower.

Formally: $L(\omega) = 1$ for $\omega \leq \omega^{\dagger}$, $L(\omega) = L_{\text{high}} > 1$ for $\omega > \omega^{\dagger}$, with $\omega_R \leq \omega^{\dagger} < \omega_{T2}$.

If $L_{\text{high}}$ is large enough, $\delta^{L_{\text{high}}}(1-B)$ shrinks, and $v$ stays close to 1.

**Calibration**: Is this empirically defensible? The US response to the 2008 financial crisis took ~6 months (TARP, Oct 2008). The response to COVID took ~2 weeks (CARES Act, March 2020). The New Deal took years. AI-driven mass displacement, if O-Ring-like and sudden, would be unprecedented in scale — plausibly closer to the New Deal timeline than TARP. If a "period" is 5 years, $L_{\text{high}} = 2$ means 10 years of legislative delay, which is extreme but not implausible for restructuring an entire sector.

With $L = 2$: $v = 1 + \delta^2(1-B) = 1 + 0.81 \times 0.4 = 1.324$, $\bar{h} = 0.117$. Still below $\bar{\pi}_D^{\text{fall}} = 0.20$. Survives.

With $L = 3$: $v = 1.292$, $\bar{h} = 0.139$. Still below 0.20. Survives.

**Problem: needs $L \geq 8$ (40 years!) to get $\bar{h} > 0.20$.** Not plausible.

**Resolution B: Institutional capacity degradation.** The crisis is so massive that it degrades the democratic institution's ability to compensate. Tax revenue collapses (displaced workers don't pay taxes), fiscal capacity shrinks, the bureaucratic machinery overloads. The compensation that eventually arrives is *partial*: $B' < B$ under massive crisis.

Formally: $B(\omega) = B$ for $\omega \leq \omega^{\dagger}$, $B(\omega) = B' < B$ for $\omega > \omega^{\dagger}$.

With $B' = 0.2$ (partial compensation): $v = 1 + \delta(1-B') = 1 + 0.9 \times 0.8 = 1.72 > C_D = 1.5$. **Protest is dominant!** $\pi = \Omega_2(T) = 0.62 > 0.20$. **Democracy falls.** ✓

This works. The mechanism: under moderate crisis (rapid), full compensation ($B = 0.6$) is feasible → credible commitment defuses protest. Under massive crisis (threshold), only partial compensation ($B' = 0.2$) is feasible → commitment insufficient → protest remains high → democracy falls.

**Calibration**: Is reduced $B$ under massive crisis plausible? Yes — the fiscal base erodes precisely when the demand for compensation is highest. Scandinavian welfare states handle moderate automation well (retraining, UI) but would struggle with 60% displacement in one sector. The US couldn't fully compensate the Rust Belt decline despite decades of effort.

**Resolution C: Credibility problem under massive crisis.** Workers rationally doubt that democracy can deliver $B = 0.6$ when $\omega_{T2} = 0.60$. The implied fiscal cost is $\omega_{T2} \times B = 0.36$ (36% of national income). Workers discount the promise: $\hat{B} = B \times P(\text{implementable}) < B$.

This is equivalent to Resolution B (partial compensation) with a microfoundation in fiscal credibility.

**Resolution D: Accept T=2 as reduced form.** The 2-period model is not meant to represent calendar time — it represents the **window of vulnerability** between shock and institutional response. Period 1 = "shock arrives." Period 2 = "full impact." The model asks: if the regime cannot compensate before full impact, does it survive? The "no $t=3$" assumption captures the idea that the critical window is finite and that failing to act within it is irreversible (regime has already fallen, or the political damage is done even if compensation eventually arrives).

### 11.6 Assessment and Recommendation

| Resolution | Parsimony | Plausibility | Robustness |
|------------|-----------|-------------|------------|
| A (long lag) | Adds $\omega^{\dagger}$, $L_{\text{high}}$ | Moderate | **Fails** — needs implausible $L \geq 8$ |
| B (capacity degradation, $B' < B$) | Adds $\omega^{\dagger}$, $B'$ | **Strong** — fiscal erosion under mass displacement | **Works** — $B'=0.2$ → protest dominant |
| C (credibility, $\hat{B} < B$) | Same as B | **Strong** — microfounded in fiscal credibility | Same as B |
| D (accept $T=2$ as reduced form) | **No parameters** | Moderate — requires interpretive argument | N/A |

**Recommendation**: Lead with **D** (accept $T=2$ as reduced form) in the main text — it's honest and parsimonious. Present **B/C** (capacity degradation / credibility) as a robustness extension in the appendix, showing that with $B'(\omega_{T2}) < B$, crossed fragility survives for arbitrary $T$. This gives the referee both the clean baseline and the robustness check.

### 11.7 Formal Statement (Resolution B)

**Proposition** (Crossed Fragility with $T > 2$). *Suppose $B(\omega)$ is weakly decreasing for $\omega > \omega^{\dagger}$ (fiscal capacity erodes under massive shocks), with $B(\omega_R) = B$ and $B(\omega_{T2}) = B' < B$. If $1 + \delta(1-B') > C_D$ (partial compensation insufficient to prevent dominant-strategy protest), then crossed fragility holds for all $T \geq 2$.*

*Proof sketch.* T×D: in $t^*$, workers anticipate $B'$ in $t^*+1$. $v = 1 + \delta(1-B') > C_D$ → protest dominant → $\pi = \Omega_{t^*}(T)$ → exceeds $\bar{\pi}_D^{\text{fall}}$. All other scenarios: unchanged (R×D uses full $B$, R×A and T×A do not involve $B(\omega_{T2})$ in the critical period). $\square$

**Required condition**: $B' < 1 - (C_D - 1)/\delta = 1 - 0.5/0.9 = 0.444$.

With $B = 0.6$ (moderate crisis) and $B' = 0.2$ (massive crisis): $0.2 < 0.444$. Satisfied. ✓

**Interpretation**: The welfare state can handle moderate automation ($\omega_R$) with full compensation, but is overwhelmed by massive sudden automation ($\omega_{T2}$). Democracy's advantage — seeing and responding — breaks down not because it can't see, but because what it sees is too large to compensate fully. This echoes the climate change analogy: democracies respond well to incremental environmental degradation but may be overwhelmed by catastrophic tipping points.

---

## Appendix A: Logistic Properties

$\Lambda(z) = 1/(1+e^{-z})$, $\lambda(z) = \Lambda(z)(1-\Lambda(z))$, $\Lambda^{-1}(p) = \log(p/(1-p))$, $\Lambda(-z) = 1-\Lambda(z)$.

## Appendix B: Notation

| Symbol | Meaning |
|--------|---------|
| $\theta \in \{R, T, N\}$ | Automation trajectory |
| $\omega_R, \omega_{T1}, \omega_{T2}, \omega_N$ | Displacement rates; $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ |
| $\Omega_t(\theta)$ | Cumulative displaced (absorbing) |
| $\bar{h} = 1 - v/C_x$ | Participation threshold |
| $s^*$ | Cutoff signal |
| $C_x$ | Protest cost ($C_A > C_D$) |
| $\sigma_x$ | Incumbent's observation noise ($\sigma_A > \sigma_D$) |
| $\bar{\omega}_x$ | Visibility threshold (Lemma 1) |
| $\bar{\pi}_x^{\text{fall}}$ | Institutional resilience ($\bar{\pi}_D > \bar{\pi}_A$) |
| $B$ | Compensation level |
| $\delta$ | Discount factor |
| $\Lambda, \lambda$ | Logistic CDF, PDF |

## Appendix C: Design Decisions

### Parametrization
- **Choice**: R=(ω_R,ω_R), T=(ω_T1,ω_T2), N=(ω_N,ω_N), ω_N < ω_T1 < ω_R < ω_T2
- **Discarded**: Symmetric (ω_H,ω_H)/(ω_L,ω_H)/(ω_L,ω_L) — generated a trilema where π̄_D^fall couldn't simultaneously protect democracy under rapid and expose it under threshold.

### Incumbent's signal
- **Choice**: Single sufficient statistic ω̃ = ω + σ_x·ζ, with σ_D < σ_A. Represents the incumbent's overall assessment of ω from ALL sources (protest, statistics, reports, media). σ_x captures total information quality — worse in autocracy because protest channel is suppressed.
- **Discarded**: Dual signal (protest π̃ + macro ẽ) — unnecessarily complex; the single ω̃ already captures both channels as a sufficient statistic.
- **Discarded**: Protest-only signal (π̃ = π + τ_x·ξ) — self-fulfilling problem under T×A. With comp anticipated (autocracy, immediate), v=1-B → h̄=0.80 > Ω₂(T)=0.62 → no interior equilibrium → π=0 → incumbent blind → no comp → contradicts comp anticipation. With no-comp anticipated, v=1 → π=0.50 → incumbent would comp → contradicts no-comp. NEITHER pure equilibrium is self-confirming. The ω̃ signal breaks this cycle by providing information independent of protest.

### Compensation rule
- **Choice**: Standard Bayesian optimization: comp iff ΔP(ω̃) > ω̂·B. Properties emerge from σ_x difference.
- **Discarded**: Information-update rule (comp iff ΔP·[posterior-prior] > cost) — non-standard, appeared ad hoc.
- **Discarded**: Evidence-weighted (ΔP·P(crisis|π̃) > cost) — allowed cheap insurance under threshold.

### Autocracy mechanism
- **Choice**: Autocracy survives threshold because ω_T2 pierces σ_A noise → compensates immediately (speed). Falls under rapid because ω_R doesn't pierce σ_A noise → speed useless.
- **Discarded**: Accumulation (Ω₂(R) > Ω₂(T)) — invalidated by asymmetric parametrization.

### C_A constraint
- **Result, not assumption**: C_A < 1/(1-Ω₂(R)). Extremely repressive regimes don't exhibit crossed fragility.
- Feasible range: C_A/C_D ∈ [1.0, 1.5]. Baseline C_A = 2.0.

### Confirmed parameters (simulation)
```
ω_R=0.30, ω_T1=0.05, ω_T2=0.60, ω_N=0.02
σ=0.10, C_D=1.5, C_A=2.0, B=0.6, δ=0.9
π̄_D=0.20, π̄_A=0.05, p_R=0.30, p_T=0.30, p_N=0.40
```

| Scenario | π₂ | π̄ | Outcome |
|----------|----|----|---------|
| R×D | 0.000 (comp) | 0.20 | STABLE |
| R×A | 0.500 (accumulated) | 0.05 | FALLS |
| T×D | 0.333 (massive, no comp) | 0.20 | FALLS |
| T×A | 0.000 (immediate decree) | 0.05 | STABLE |
