# Analytical Formalization: Reformulated Model (v2)

**Working document — derivations for "AI and Regime Stability"**
**Date**: 2026-05-01 (v3: corrected economics + confirmed numerically)
**Reference**: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`

---

## 0. Model Primitives and Notation

### 0.1 Environment

- Continuum of workers $i \in [0,1]$
- Two periods $t \in \{1, 2\}$
- Employment income normalized: $Y = 1$
- Displacement income: $0$ (without compensation), $B \in (0,1)$ (with compensation)
- Under threshold $t=1$: non-displaced workers earn $Y^+ > 1$ (complementarity raises income)
- Regime $x \in \{D, A\}$ (democracy, autocracy)

### 0.2 States and Trajectories

Nature draws $\theta \in \{R, T, N\}$ with prior $(p_R, p_T, p_N)$, $p_N > 0$.

| $\theta$ | $\omega_1(\theta)$ | $\omega_2(\theta)$ | Economic interpretation |
|-----------|---------------------|---------------------|------------------------|
| $R$ (rapid) | $\omega_R$ | $\omega_R$ | Independent tasks: AI substitutes task-by-task from $t=1$. Moderate, persistent. |
| $T$ (threshold) | $\omega_{T1}$ | $\omega_{T2}$ | Complementary tasks (O-Ring): partial automation complements workers in $t=1$ (few displaced, rest earn more). When AI crosses threshold in $t=2$, all tasks automated at once. Massive. |
| $N$ (no shock) | $\omega_N$ | $\omega_N$ | Normal churn. |

**Key ordering**: $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$

- $\omega_{T1} < \omega_R$: under threshold $t=1$, most workers benefit from complementarity. Few displaced (inelastic demand sectors). Far less than under rapid.
- $\omega_{T2} > \omega_R$: when the threshold is crossed, displacement is massive — entire sector automated at once, exceeding the gradual displacement of rapid.
- $\omega_N$: baseline churn (retirements, sector rotation).

**Remark on $t=1$ under threshold**: Non-displaced workers under $T$ are *better off* (complementarity raises productivity and income to $Y^+ > 1$). They have *negative* grievance. This makes $T/t=1$ almost indistinguishable from $N$ in terms of protest — the "calm before the storm" is literal prosperity.

### 0.3 Individual Shocks and Signals

Each worker draws:
- Displacement: $d_{it} \sim \text{Bernoulli}(\omega_t(\theta))$, iid conditional on $\theta$
- Signal: $s_{it} = \omega_t(\theta) + \sigma \varepsilon_{it}$, where $\varepsilon_{it} \sim \text{Logistic}(0,1)$ iid

The logistic CDF is $\Lambda(z) = 1/(1 + e^{-z})$ with PDF $\lambda(z) = \Lambda(z)(1 - \Lambda(z))$.

### 0.4 Displacement is Absorbing

Once displaced, a worker remains displaced:

$$\Omega_1(\theta) = \omega_1(\theta)$$

$$\Omega_2(\theta) = \omega_1(\theta) + (1 - \omega_1(\theta)) \cdot \omega_2(\theta)$$

### 0.5 Protest Decision

Only displaced workers protest ($d_{it} = 1$ is necessary for $a_{it} = 1$).

**Expressive value** (anger + forward-looking fear):

$$v_{it} = (1 - y_{it}) + \delta \cdot \mathbb{E}[(1 - y_{i,t+1}) \mid d_{it}, s_{it}]$$

**Effective cost** with safety in numbers:

$$\text{Cost} = C_x \cdot (1 - h(\pi_t))$$

where $h(\pi) = \pi$ (linear baseline), $C_A > C_D > 0$.

**Protest rule**: displaced worker $i$ protests iff $v_{it} > C_x \cdot (1 - \mathbb{E}[h(\pi_t) \mid s_{it}])$.

### 0.6 Regime Differences: Two Primitives

| Primitive | Democracy ($D$) | Autocracy ($A$) |
|-----------|-----------------|-----------------|
| Protest cost | $C_D$ (low) | $C_A$ (high) |
| Response speed | **Slow**: $\text{comp}_t \to \varphi_{t+1}$ | **Fast**: $\text{comp}_t \to \varphi_t$ |

**Parametric constraint on $C_A$** (confirmed numerically): Crossed fragility requires $C_A \in (C_D, \, 1/(1 - \Omega_2(R)))$. Upper bound ensures protest exists under rapid accumulated displacement. With $\omega_R = 0.30$: $\Omega_2(R) = 0.51$, so $C_A < 2.04$. Confirmed feasible range: **$C_A \in [1.5, 2.25]$** (ratio $C_A/C_D$ from 1.0 to 1.5). Baseline: $C_A = 2.0$.

### 0.7 Incumbent's Problem

The incumbent observes TWO signals:
- **Protest signal**: $\tilde{\pi}_t = \pi_t + \tau_x \cdot \xi_t$ (noisy, $\tau_D \ll \tau_A$). Regime-specific: informative in democracy (low $C_D$ → more protest → clearer signal), suppressed in autocracy (high $C_A$).
- **Macroeconomic signal**: $\tilde{e}_t = \omega_t + \eta \cdot \zeta_t$ (noisy, $\zeta \sim N(0,1)$). Regime-agnostic but only informative for **large** shocks. Formally: there exists $\bar{\omega}^{\text{macro}}$ such that for $\omega_t > \bar{\omega}^{\text{macro}}$, the macro signal reliably detects the crisis.

**Key ordering**: $\omega_R < \bar{\omega}^{\text{macro}} < \omega_{T2}$
- Moderate rapid crisis ($\omega_R$): below macro threshold → incumbent relies on protest signal only
- Massive threshold crisis ($\omega_{T2}$): above macro threshold → directly observable (GDP crash, factory closures)

**Compensation rule** (information-update based, confirmed by simulation):

$$\text{comp}_t = 1 \iff \Delta P \cdot [\underbrace{P(\theta \mid \tilde{\pi}_t, \tilde{e}_t) - P(\theta)}_{\text{information update}}] > \hat{\omega}_t \cdot B$$

The incumbent acts only if they *learned something* — the posterior moved from the prior. Democracy learns from protest (info_update ≈ 0.70 under rapid). Autocracy doesn't learn from protest under moderate crisis (info_update ≈ 0.03). Under massive crisis, both learn from macro signal.

**Simulation confirmation**: info_update is the mechanism that selects equilibria endogenously, not ad hoc:
- R×D: info_update = 0.70 → comp ✓
- R×A: info_update = 0.028 → no comp ✓
- T×D: info_update = 0.00 (no signal in $t=1$) → no comp ✓
- T×A: macro signal triggers in $t=2$ ($\omega_{T2} > \bar{\omega}^{\text{macro}}$) → comp ✓

### 0.8 Fall Condition

Regime falls iff $\pi_t > \bar{\pi}_x^{\text{fall}}$ and $\varphi_t = 0$ (no active compensation).

$\bar{\pi}_D^{\text{fall}} > \bar{\pi}_A^{\text{fall}}$: democracies absorb more protest.

### 0.9 Timing Within Each Period

1. Nature: $d_{it}$ realized for each $i$
2. Signals: worker observes $(d_{it}, s_{it})$
3. Protest: each $i$ chooses $a_{it} \in \{0, 1\}$. $\pi_t = \int a_{it} \, di$
4. Incumbent observes $\tilde{\pi}_t$, decides $\text{comp}_t$
5. If $\text{comp}_t = 1$: autocracy $\varphi_t = 1$ (immediate); democracy $\varphi_{t+1} = 1$ (lag)
6. If crisis persists ($\varphi_t = 0$) and $\pi_t > \bar{\pi}_x^{\text{fall}}$ → regime falls
7. Payoffs realized

---

## 1. Single-State Benchmark (Known $\omega$)

This section derives the equilibrium when $\theta$ is known (hence $\omega_t$ is known). This is a *complete-information benchmark*, not the main model. It illustrates the indifference logic and provides closed-form building blocks.

### 1.1 Setup

Fix a period $t$ with known $\omega$, displaced fraction $\Omega$, expressive value $v$ (common to all displaced), and protest cost $C_x$. With $h(\pi) = \pi$:

**Indifference condition** at cutoff $s = s^*$:

$$\Omega \cdot \Lambda\left(\frac{\omega - s^*}{\sigma}\right) = \bar{h}, \quad \bar{h} \equiv 1 - v/C_x$$

### 1.2 Closed-Form Cutoff

$$\boxed{s^*(\omega) = \omega - \sigma \cdot \log\left(\frac{\bar{h}}{\Omega - \bar{h}}\right)}$$

**Existence requires** $0 < \bar{h} < \Omega$:
- $\bar{h} > 0$: $v < C_x$ (protest not dominant)
- $\bar{h} < \Omega$: $v > C_x(1 - \Omega)$ (coordination can make protest worthwhile)

### 1.3 Equilibrium Protest Level

$$\pi^* = \bar{h} = 1 - v/C_x$$

With known $\omega$ and linear $h$, protest is independent of $\omega$ at the interior equilibrium. The fundamental affects *who* protests (via $s^*$) but not the *aggregate level*.

**Caveat** (from analytical review): With known $\omega$, this is a complete-information coordination game with **multiple equilibria**: all-protest, no-protest, and the interior cutoff. The result $\pi^* = \bar{h}$ characterizes the interior equilibrium only. Uniqueness requires the multi-state uncertainty of the full model (Section 2). This benchmark is illustrative, not a uniqueness claim.

---

## 2. Multi-State Equilibrium (Unknown $\theta$)

### 2.1 Worker's Posterior Over $\theta$

A displaced worker ($d_{it} = 1$) with signal $s$ updates:

$$P(\theta \mid d=1, s) = \frac{\omega_t(\theta) \cdot \lambda\left(\frac{s - \omega_t(\theta)}{\sigma}\right) \cdot p_\theta}{\sum_{\theta'} \omega_t(\theta') \cdot \lambda\left(\frac{s - \omega_t(\theta')}{\sigma}\right) \cdot p_{\theta'}}$$

### 2.2 Conditional Protest Level

$$\pi(\theta, s^*) = \Omega_t(\theta) \cdot \Lambda\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right)$$

### 2.3 Indifference Condition

$$\boxed{G(s^*) \equiv \sum_{\theta \in \{R,T,N\}} P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) - \bar{h} = 0}$$

Transcendental equation — no closed form for $s^*$. Numerical root-finding required.

### 2.4 Why Multi-State Matters

In the single-state benchmark, $\pi^* = \bar{h}$ is independent of $\omega$: protest carries no information about the state. With multiple states and distinct $\omega$ values, the realized protest $\pi(\theta, s^*)$ varies across $\theta$, enabling the incumbent to partially infer $\theta$ from $\tilde{\pi}$.

---

## 3. Lemma 2: Composition Under Asymmetric Displacement

**Lemma 2** (Asymmetric Composition). *With absorbing displacement and the ordering $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$:*

*(a) In $t=1$: $\Omega_1(R) = \omega_R > \omega_{T1} = \Omega_1(T) > \omega_N = \Omega_1(N)$.*

*(b) In $t=2$: $\Omega_2(T) > \Omega_2(R) > \Omega_2(N)$, provided $\omega_{T2}$ is sufficiently larger than $\omega_R$.*

**Proof.**

(a) Immediate: $\Omega_1(\theta) = \omega_1(\theta)$.

(b) Compute:

$$\Omega_2(R) = \omega_R + (1 - \omega_R) \cdot \omega_R = \omega_R(2 - \omega_R)$$

$$\Omega_2(T) = \omega_{T1} + (1 - \omega_{T1}) \cdot \omega_{T2}$$

$$\Omega_2(N) = \omega_N + (1 - \omega_N) \cdot \omega_N = \omega_N(2 - \omega_N)$$

For $\Omega_2(T) > \Omega_2(R)$:

$$\omega_{T1} + (1 - \omega_{T1}) \cdot \omega_{T2} > \omega_R(2 - \omega_R)$$

Since $\omega_{T1} < \omega_R$, the LHS is approximately $\omega_{T2}$ for small $\omega_{T1}$. So the condition is roughly $\omega_{T2} > \omega_R(2 - \omega_R)$, which holds when $\omega_{T2}$ is sufficiently larger than $\omega_R$.

**Example**: $\omega_R = 0.30$, $\omega_{T1} = 0.05$, $\omega_{T2} = 0.60$:
- $\Omega_2(R) = 0.30 \times 1.70 = 0.51$
- $\Omega_2(T) = 0.05 + 0.95 \times 0.60 = 0.62$
- $\Omega_2(T) > \Omega_2(R)$ ✓ $\quad \square$

**Corollary** (Reversal). *Unlike the symmetric model (where $\Omega_2(R) > \Omega_2(T)$), the asymmetric displacement creates $\Omega_2(T) > \Omega_2(R)$: threshold has MORE total displaced in $t=2$ than rapid. This means the old "accumulation" mechanism for autocracy (more displaced under rapid) no longer applies. The autocracy mechanism must work through a different channel (Section 8).*

---

## 4. Lemma 0: Existence and Uniqueness of the Cutoff Equilibrium

**Lemma 0** (Cutoff Equilibrium). *Fix period $t$, $v \in (0, C_x)$, $\sigma > 0$, and prior with all $p_\theta > 0$. With $h(\pi) = \pi$ and $F = \Lambda$:*

*(a) There exists at least one $s^*$ satisfying $G(s^*) = 0$.*

*(b) The equilibrium is unique for $\sigma$ sufficiently small.*

**Proof of (a).** Same structure as before: $G(s) \to -\bar{h} < 0$ as $s \to +\infty$; $G(s) > 0$ for $s$ sufficiently negative (posterior concentrates on high-$\omega$ state, whose $\Omega$ exceeds $\bar{h}$). IVT gives existence. $\square$

**Proof of (b) — sketch.** For small $\sigma$, signals are precise. The posterior concentrates sharply around the true $\omega$, and $G$ transitions monotonically through zero. Formal proof via IFT perturbation around $\sigma = 0$. $\square$

---

## 5. Lemma 1: Visibility Thresholds and the Dictator's Dilemma

### 5.1 Key Structural Change

With asymmetric displacement, $t=2$ states have **distinct** $\omega_2$ values:
- $R$: $\omega_2 = \omega_R$ (moderate)
- $T$: $\omega_2 = \omega_{T2}$ (massive)
- $N$: $\omega_2 = \omega_N$ (churn)

This is fundamentally different from the old model where $R$ and $T$ shared $\omega_2 = \omega_H$. Now the protest levels differ in BOTH $\Omega_2$ AND $\omega_2$:

$$\pi(\theta, s^*) = \Omega_2(\theta) \cdot \Lambda\left(\frac{\omega_2(\theta) - s^*}{\sigma}\right)$$

States with higher $\omega_2$ generate higher protest on both channels (more displaced AND higher logistic term).

### 5.2 Definition (Visibility Threshold)

**Definition.** The *visibility threshold* $\bar{\omega}_x^{\text{vis}}$ is the smallest $\omega$ at which the protest signal is informative enough for the incumbent in regime $x$ to correctly identify a crisis with probability $> 1/2$.

Formally: $\bar{\omega}_x^{\text{vis}}$ is the $\omega$ such that $P(\omega_t = \omega \mid \tilde{\pi}_t) = 1/2$ when the true state has displacement rate $\omega$.

### 5.3 Statement

**Lemma 1** (Dictator's Dilemma as Visibility Gap). *The visibility threshold satisfies $\bar{\omega}_A^{\text{vis}} > \bar{\omega}_D^{\text{vis}}$. That is, democracy detects crises at lower displacement rates than autocracy.*

*Consequence: There exist $\omega$ values that democracy can "see" but autocracy cannot. Specifically, if $\omega_R \in (\bar{\omega}_D^{\text{vis}}, \bar{\omega}_A^{\text{vis}})$, then democracy detects the rapid crisis but autocracy does not.*

### 5.4 Proof

**Two channels reinforce:**

**Channel 1: Protest compression.** Higher $C_x$ → higher $\bar{h}$ → higher cutoff $s^*$ → fewer protesters → $\pi(\theta, s^*)$ compressed toward zero. The *range* of $\pi$ across states shrinks. By the IFT argument (Section 1):

$ds^*/dC_x > 0$ → $\pi(\theta, s^*)$ decreases for all $\theta$ → range narrows.

For the incumbent, smaller range means the protest signal carries less information: a moderate $\tilde{\pi}$ could come from any state.

**Channel 2: Observation noise.** $\tau_A \gg \tau_D$ → even if protest levels differed, the autocrat's observation is blurred.

Both channels raise $\bar{\omega}_A^{\text{vis}}$: the autocrat needs a *larger* crisis to generate a protest signal that is both (a) large enough to stand out despite compression and (b) detectable through observation noise. $\square$

### 5.5 The Critical Interval

The crossed fragility mechanism requires:

$$\bar{\omega}_D^{\text{vis}} < \omega_R < \bar{\omega}_A^{\text{vis}} < \omega_{T2}$$

- $\omega_R > \bar{\omega}_D^{\text{vis}}$: democracy sees the moderate rapid crisis → compensates
- $\omega_R < \bar{\omega}_A^{\text{vis}}$: autocracy CANNOT see the moderate rapid crisis → doesn't compensate → falls
- $\omega_{T2} > \bar{\omega}_A^{\text{vis}}$: the threshold crisis is SO massive that even autocracy sees it → compensates (immediately, speed) → survives

**This is the information-speed interaction in one inequality chain.**

### 5.6 Why $\omega_{T2}$ Pierces the Autocrat's Blindness

Even with high $C_A$ and large $\tau_A$, a crisis with $\omega_{T2} \gg \omega_R$ generates protest that is qualitatively different:

$$\pi(T, s^*_A) = \Omega_2(T) \cdot \Lambda\left(\frac{\omega_{T2} - s^*_A}{\sigma}\right)$$

Since $\omega_{T2}$ is far above $s^*_A$ (which is anchored near the moderate $\omega_R$ or $\omega_N$ range), $\Lambda((\omega_{T2} - s^*_A)/\sigma) \approx 1$. So $\pi(T, s^*_A) \approx \Omega_2(T) \gg \pi(R, s^*_A)$.

This large $\tilde{\pi}_T$ pierces through $\tau_A$ noise because the signal-to-noise ratio $\pi(T)/\tau_A$ grows with $\omega_{T2}$.

---

## 6. Incumbent's Problem and Compensation Zone

### 6.1 Bayesian Inference from Protest

The incumbent observes $\tilde{\pi}_t$ and updates:

$$P(\theta \mid \tilde{\pi}_t) \propto \phi\left(\frac{\tilde{\pi}_t - \pi^{\text{eq}}(\theta)}{\tau_x}\right) \cdot p_\theta$$

**Key asymmetry by period:**

In $t=1$: $\pi^{\text{eq}}(R)$ is moderate (many displaced under $\omega_R$), $\pi^{\text{eq}}(T) \approx \pi^{\text{eq}}(N) \approx 0$ (few displaced). Democracy distinguishes $R$ from $\{T, N\}$; autocracy cannot (compressed + noisy).

In $t=2$: $\pi^{\text{eq}}(T)$ is very high ($\omega_{T2}$ massive), $\pi^{\text{eq}}(R)$ is moderate, $\pi^{\text{eq}}(N) \approx 0$. Even the autocrat can distinguish $T$ from $\{R, N\}$ (the signal is that strong).

### 6.2 Evidence-Weighted Compensation Rule

$$\text{comp}_t = 1 \iff \Delta P(\tilde{\pi}_t) \cdot P(\text{crisis}_t \mid \tilde{\pi}_t) > \hat{\omega}_t \cdot B$$

### 6.3 Compensation Decisions by Scenario

| Scenario | $t$ | $\pi^{\text{eq}}$ | Democracy | Autocracy |
|----------|-----|-------------------|-----------|-----------|
| R | 1 | Moderate | Sees crisis → **comp** | Blind → **no comp** |
| T | 1 | ≈ 0 | No evidence → **no comp** | No evidence → **no comp** |
| N | 1 | ≈ 0 | No evidence → **no comp** | No evidence → **no comp** |
| R | 2 | Moderate | φ₂=1 (from t=1 law) | Still blind → **no comp** |
| T | 2 | Very high | comp but LAG (no t=3) → **no effect** | Sees massive crisis → **comp (immediate!)** |
| N | 2 | ≈ 0 | No evidence → no comp | No evidence → no comp |

This table encodes the entire crossed fragility mechanism.

---

## 7. Period 1 Equilibrium (Forward-Looking)

### 7.1 Expressive Value in $t=1$

For a displaced worker in $t=1$:

$$v_{i1} = 1 + \delta \cdot \mathbb{E}[(1 - y_{i2}) \mid d_{i1}=1, s_{i1}]$$

Since displacement is absorbing ($d_{i1}=1 \Rightarrow d_{i2}=1$), the future loss depends only on compensation:

**Democracy, comp expected** (law passes in $t=1$): $v_1^{D,c} = 1 + \delta(1 - B)$

**Democracy, no comp expected**: $v_1^{D,n} = 1 + \delta$

**Autocracy, comp expected** (immediate φ₁=1): $v_1^{A,c} = (1-B) + \delta \cdot \mathbb{E}[(1-y_{i2})]$

### 7.2 Fixed Point and Equilibrium Selection

Two candidate equilibria: comp-expected (lower $v$, lower protest) and no-comp-expected (higher $v$, higher protest). Select the self-confirming one.

Under R×D: $v_1^{D,c} = 1 + \delta(1-B)$. With baseline parameters ($\delta=0.9$, $B=0.6$): $v_1 = 1.36 < C_D = 1.5$. **Not dominant.** $\bar{h} = 1 - 1.36/1.5 = 0.093$. Protest ≈ 9%.

The incumbent sees moderate protest (ω_R is visible to democracy) → compensates → consistent with comp-expected. **The compensation equilibrium is self-confirming.**

Under R with no-comp-expected: $v_1 = 1 + 0.9 = 1.9 > C_D = 1.5$. **Dominant strategy** — all protest, $\pi_1 = \Omega_1 = \omega_R$. Incumbent sees high protest → would compensate → **contradicts no-comp assumption**. **This equilibrium is NOT self-confirming.**

Therefore under R×D, the **unique consistent equilibrium** is the compensation equilibrium. Democracy survives $t=1$ with low protest.

### 7.3 Under Threshold $t=1$

$\omega_{T1}$ is small → few displaced → protest negligible → no evidence of crisis → neither regime compensates. Both survive. Workers under threshold who are NOT displaced are *better off* (complementarity income $Y^+ > 1$). Zero grievance from the majority. The few displaced ($\omega_{T1}$ fraction) are a silent minority among satisfied workers.

---

## 8. Proposition: Crossed Fragility

### 8.1 Statement

**Proposition** (Crossed Fragility). *There exist open sets of parameters $(\omega_R, \omega_{T1}, \omega_{T2}, \omega_N, C_D, C_A, B, \delta, \sigma, \bar{\pi}_D^{\text{fall}}, \bar{\pi}_A^{\text{fall}}, p_R, p_T, p_N)$ satisfying $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ such that:*

*(a) Democracy is stable under rapid ($\theta = R$) and unstable under threshold ($\theta = T$).*

*(b) Autocracy is unstable under rapid and stable under threshold.*

### 8.2 The Four Scenarios

**R×D (democracy survives rapid):**

$t=1$: $\omega_R$ → moderate displacement → protest visible to democracy → law passed ($\text{comp}_1 = 1$). Workers anticipate $\varphi_2 = 1$ → $v_1$ reduced → protest $\pi_1 \approx \bar{h}^{D,c}$ which is low. Condition: $\bar{h}^{D,c} = 1 - [1+\delta(1-B)]/C_D \leq \bar{\pi}_D^{\text{fall}}$.

$t=2$: $\varphi_2 = 1$ (law from $t=1$). $v_2 = 1 - B$. Protest reduced. Condition: protest with $v = 1-B$ stays below $\bar{\pi}_D^{\text{fall}}$.

**Mechanism**: information advantage → sees moderate crisis → acts (slowly, but in time because crisis is gradual).

**T×D (democracy falls under threshold):**

$t=1$: $\omega_{T1}$ small → negligible protest → no evidence → no comp → no law. Complementarity prosperity masks the coming storm.

$t=2$: $\omega_{T2}$ massive → $\Omega_2(T)$ large → high protest. Democracy sees the crisis → passes law ($\text{comp}_2 = 1$) → but **democratic lag**: $\varphi_3 = 1$ (no $t=3$). So $\varphi_2 = 0$. Workers know no compensation arrives: $v_2 = 1$. Condition: $\pi_2^D > \bar{\pi}_D^{\text{fall}}$.

**Mechanism**: information without speed is fatal under surprise.

**R×A (autocracy falls under rapid):**

$t=1$: $\omega_R$ → moderate displacement → protest **suppressed** by high $C_A$ → incumbent's signal uninformative (Lemma 1: $\omega_R < \bar{\omega}_A^{\text{vis}}$) → no comp. Survives $t=1$ via low $\pi$ (suppression works short-term).

$t=2$: $\omega_R$ continues → accumulated displacement $\Omega_2(R) = \omega_R(2-\omega_R)$. Still no comp (still can't see). $v_2 = 1$. Protest:

$$\pi_2^A = \Omega_2(R) \cdot \Lambda\left(\frac{\omega_R - s^*_{2,A}}{\sigma}\right)$$

Condition: $\pi_2^A > \bar{\pi}_A^{\text{fall}}$ (which is low, Chenoweth threshold).

**Mechanism**: speed without information is useless — autocracy is fast but doesn't know what to respond to.

**T×A (autocracy survives threshold):**

$t=1$: $\omega_{T1}$ small → calm → no action needed. Repressive capacity intact.

$t=2$: $\omega_{T2}$ massive → protest VERY high even with high $C_A$ (because $\omega_{T2}$ is so large that $\Lambda((\omega_{T2} - s^*_A)/\sigma) \approx 1$). The signal is SO strong it pierces observation noise: $\omega_{T2} > \bar{\omega}_A^{\text{vis}}$.

Incumbent sees the crisis → $\text{comp}_2 = 1$ → autocracy acts **immediately** ($\varphi_2 = 1$, no lag) → workers compensated → $v_2 = 1-B$ → protest drops below $\bar{\pi}_A^{\text{fall}}$.

**Mechanism**: massive crisis is visible even to the blind → speed advantage kicks in.

### 8.3 Parametric Conditions

**(i)** $1 - [1 + \delta(1-B)]/C_D \leq \bar{\pi}_D^{\text{fall}}$ — R×D survives $t=1$ (comp equilibrium protest is low)

**(ii)** Protest with $v = 1-B$, $\Omega_2(R)$ displaced $\leq \bar{\pi}_D^{\text{fall}}$ — R×D survives $t=2$ (compensation active)

**(iii)** Protest with $v = 1$, $\Omega_2(T)$ displaced $> \bar{\pi}_D^{\text{fall}}$ — T×D falls in $t=2$ (no compensation, lag)

**(iv)** $\pi_2^A(R) > \bar{\pi}_A^{\text{fall}}$ — R×A falls in $t=2$ (moderate crisis, no compensation)

**(v)** $\omega_{T2} > \bar{\omega}_A^{\text{vis}}$ — T×A: autocrat detects massive crisis

**(vi)** Protest with $v = 1-B$ under autocracy with $\Omega_2(T)$ compensated $\leq \bar{\pi}_A^{\text{fall}}$ — T×A survives $t=2$ (compensation effective)

**(vii)** Both survive $t=1$ under threshold: $\omega_{T1}$ small → negligible protest

### 8.4 Non-Knife-Edge Argument

**For democracy**: The gap between $\pi_1^{D,c}(\text{rapid})$ and $\pi_2^{D}(\text{threshold, no comp})$ is driven by:
- $v_1^{D,c} = 1 + \delta(1-B)$ vs $v_2^{D,\text{no}} = 1$: compensation expectations reduce anger by $\delta B$
- $\Omega_1(R) = \omega_R$ vs $\Omega_2(T) = \omega_{T1} + (1-\omega_{T1})\omega_{T2} \approx \omega_{T2}$: threshold has more displaced

Both channels widen the interval for $\bar{\pi}_D^{\text{fall}}$.

**For autocracy**: The mechanism operates through the visibility threshold $\bar{\omega}_A^{\text{vis}}$. The condition $\omega_R < \bar{\omega}_A^{\text{vis}} < \omega_{T2}$ defines an open set in $(\omega_R, \omega_{T2}, C_A, \tau_A)$ space. Since $\bar{\omega}_A^{\text{vis}}$ varies continuously with parameters and $\omega_R < \omega_{T2}$, the set is non-empty and open.

### 8.5 The Role of Each Mechanism

| Mechanism | Where it enters | What it does |
|-----------|----------------|--------------|
| **Asymmetric displacement** ($\omega_{T1} < \omega_R < \omega_{T2}$) | All conditions | Creates the fundamental asymmetry: moderate-persistent vs calm-then-massive |
| **Democratic lag** | Condition (iii) | Prevents democracy from responding to surprise in $t=2$ |
| **Evidence-weighted compensation** | Condition (iii) | Prevents democracy from acting without evidence in $t=1$ under threshold |
| **Dictator's dilemma** (Lemma 1) | Condition (iv) | Prevents autocracy from seeing moderate crisis under rapid |
| **Visibility piercing** | Condition (v) | Allows autocracy to see massive crisis under threshold |
| **Speed advantage** | Condition (vi) | Allows autocracy to act immediately when crisis is visible |
| **Credible commitment** | Condition (i) | Democracy defuses $t=1$ rapid via forward-looking channel |

### 8.6 Central Irony

**Moderate-persistent crises (rapid)** favor *information*: the regime that sees the problem early can respond gradually. Democracy sees; autocracy doesn't.

**Massive-sudden crises (threshold)** favor *speed*: both regimes eventually see the problem, but only the fast one can respond in time. Autocracy responds immediately; democracy's lag is fatal.

Each automation trajectory generates the type of crisis that exploits the *opposing* regime's weakness.

---

## 9. Comparative Statics

### 9.1 Effect of $C_A$ (Protest Cost Gap)

As $C_A \uparrow$:
- $\bar{\omega}_A^{\text{vis}} \uparrow$ → autocracy even blinder to moderate crises → R×A falls more easily
- But also: protest more suppressed → π lower → R×A may survive via pure suppression
- For T×A: if $C_A$ is very high, even $\omega_{T2}$ may not generate enough protest → visibility piercing fails
- **Sweet spot**: $C_A$ high enough to blind autocracy to $\omega_R$ but not so high that $\omega_{T2}$ is also invisible

### 9.2 Effect of $\omega_{T2}/\omega_R$ Ratio

This is the key parameter of the new model. As $\omega_{T2}/\omega_R \uparrow$:
- The gap between threshold and rapid widens → easier to place $\bar{\omega}_A^{\text{vis}}$ between them
- Crossed fragility becomes more robust (larger open set)
- Economic interpretation: more O-Ring-like automation (bigger threshold effect) strengthens the result

### 9.3 Effect of $\delta$ (Discount Factor)

As $\delta \uparrow$:
- $v_1$ increases → more protest in $t=1$ without comp
- But $\delta B$ (compensation value) also increases → comp equilibrium benefit grows
- Net: $\Delta v = v^{\text{no}} - v^{\text{comp}} = \delta B$ grows → comp equilibrium more attractive → democracy's advantage under rapid is amplified

### 9.4 Effect of $\sigma$ (Signal Noise)

As $\sigma \uparrow$:
- All protest levels converge → harder to distinguish states → $\bar{\omega}_x^{\text{vis}}$ increases for both regimes
- But $\bar{\omega}_A^{\text{vis}}$ increases faster (starts higher, noise compounds) → gap $\bar{\omega}_A^{\text{vis}} - \bar{\omega}_D^{\text{vis}}$ may widen or narrow
- Crossed fragility requires $\sigma$ not too large (signals must retain informativeness)

### 9.5 Extension: Concave $h$

With $h(\pi) = \pi^\alpha$, $\alpha \in (0,1)$:
- Jensen's inequality raises the cutoff → less protest → additional suppression
- Non-monotonicity of $\mathbb{E}[h(\pi)]$ in $s^*$ can generate multiple equilibria
- The visibility mechanism is robust: massive $\omega_{T2}$ generates high protest regardless of $h$'s shape

---

## Appendix A: Logistic Distribution Properties

- CDF: $\Lambda(z) = 1/(1 + e^{-z})$
- PDF: $\lambda(z) = \Lambda(z)(1 - \Lambda(z))$
- Quantile: $\Lambda^{-1}(p) = \log(p/(1-p))$
- Symmetry: $\Lambda(-z) = 1 - \Lambda(z)$
- MLRP: $\lambda$ is log-concave
- Variance: $\pi^2/3 \approx 3.29$

## Appendix B: Notation Summary

| Symbol | Meaning |
|--------|---------|
| $\theta \in \{R, T, N\}$ | Automation type (rapid/threshold/no shock) |
| $\omega_R$ | Displacement rate under rapid (moderate, both periods) |
| $\omega_{T1}$ | Displacement rate under threshold $t=1$ (low, complementarity phase) |
| $\omega_{T2}$ | Displacement rate under threshold $t=2$ (massive, threshold crossed) |
| $\omega_N$ | Displacement rate under no shock (normal churn) |
| $\omega_N < \omega_{T1} < \omega_R < \omega_{T2}$ | Key ordering |
| $d_{it} \in \{0,1\}$ | Individual displacement status |
| $s_{it}$ | Private signal: $s = \omega_t + \sigma\varepsilon_i$ |
| $\sigma$ | Signal noise |
| $\Omega_t(\theta)$ | Cumulative displaced fraction (absorbing) |
| $\bar{h}$ | Participation threshold: $1 - v/C_x$ |
| $s^*$ | Cutoff signal in equilibrium |
| $C_x$ | Protest cost ($C_A > C_D$) |
| $h(\pi) = \pi$ | Safety in numbers (linear baseline) |
| $B \in (0,1)$ | Compensation level |
| $\varphi_t \in \{0,1\}$ | Compensation active in period $t$ |
| $\delta \in (0,1]$ | Discount factor |
| $\bar{\pi}_x^{\text{fall}}$ | Institutional resilience ($\bar{\pi}_D > \bar{\pi}_A$) |
| $\bar{\omega}_x^{\text{vis}}$ | Visibility threshold (Lemma 1) |
| $\tilde{\pi}_t$ | Incumbent's noisy observation of $\pi_t$ |
| $\tau_x$ | Observation noise ($\tau_A \gg \tau_D$) |
| $\Lambda, \lambda$ | Logistic CDF, PDF |

## Appendix C: Design Decisions

### Decisão: Parametrização dos estados
- **Escolha**: R=(ω_R, ω_R), T=(ω_T1, ω_T2), N=(ω_N, ω_N) com ω_N < ω_T1 < ω_R < ω_T2
- **Descartado**: (ω_H, ω_H) / (ω_L, ω_H) / (ω_L, ω_L) — mesma ω_H em t=2 para R e T. Gerava trilema: π̄_D^fall não pode simultaneamente tolerar protesto alto (rapid) e não tolerar protesto moderado (threshold). A nova parametrização resolve pela economia: rapid é moderado-persistente, threshold é calmo-então-massivo.
- **Descartado**: T=(0, ω_T2) — zero deslocamento em t=1. Economicamente impreciso: demanda inelástica gera algum deslocamento. ω_T1 > 0 (mas pequeno) é mais correto.

### Decisão: Mecanismo da autocracia
- **Escolha**: Autocracy survives threshold via macro signal + speed (massive crisis directly observable via GDP crash → compensates immediately). Falls under rapid via dictator's dilemma (moderate crisis invisible to both protest and macro channels).
- **Descartado**: Accumulation mechanism (Ω₂(R) > Ω₂(T)) — invalidado pela nova parametrização onde Ω₂(T) > Ω₂(R).
- **Descartado**: Repressive degradation — assimétrica sem justificativa.
- **Descartado**: Visibility piercing via protest only — self-fulfilling problem: se workers antecipam comp → v cai → zero protesto → autocrata não vê nada via π̃. Sinal macro resolve: autocrata compensa com base em indicadores econômicos, não protesto.

### Decisão: Regra de compensação
- **Escolha**: Information-update rule: comp iff ΔP · [P(θ|signals) - P(θ)] > ω̂·B. Incumbente age quando APRENDEU algo.
- **Descartado**: Evidence-weighted rule (ΔP · P(ω_H|π̃) > cost) — permite compensação preventiva barata sob threshold (cheap insurance problem).
- **Descartado**: Pure expected-value (ΔP > cost) — mesma razão.
- **Motivação**: info_update endogeniza a seleção de equilíbrio. Sob R×D, update = 0.70 (muito). Sob R×A, update = 0.03 (quase nada). Sob T t=1, update = 0 (sem sinal). Não é ad hoc.

### Decisão: Sinal dual (protesto + macro)
- **Escolha**: Incumbente observa π̃ (regime-específico) E ẽ (macro, regime-agnóstico). Macro só informativo para ω > ω̄^macro. Condição: ω_R < ω̄^macro < ω_T2.
- **Descartado**: Protesto como único canal — self-fulfilling problem em T×A. Se comp antecipado, π → 0, autocrata não tem informação.
- **Motivação**: resolve self-fulfilling E justifica seleção de equilíbrio. T×A comp é consistente porque autocrata vê GDP colapsar. R×A no-comp é consistente porque choque moderado não aparece em indicadores macro E protesto suprimido.

### Decisão: C_A ∈ (C_D, 2.04)
- **Escolha**: C_A limitado superiormente por 1/(1-Ω₂(R)) para garantir existência de protesto sob rapid. Baseline C_A = 2.0.
- **Descartado**: C_A = 2.5 — h̄ = 0.60 > Ω₂(R) = 0.51 → nenhum protesto existe → autocracia sobrevive trivialmente sob rapid → sem crossed fragility.
- **Confirmado numericamente**: C_A ∈ [1.5, 2.25] funciona. Ratio C_A/C_D de 1.0 a 1.5.

### Parâmetros baseline confirmados (simulação)
```
ω_R = 0.30, ω_T1 = 0.05, ω_T2 = 0.60, ω_N = 0.02
σ = 0.10, C_D = 1.5, C_A = 2.0, B = 0.6, δ = 0.9
π̄_D^fall = 0.20, π̄_A^fall = 0.05
p_R = 0.30, p_T = 0.30, p_N = 0.40
```

Resultados:
| Cenário | π₂ | π̄ | Outcome |
|---------|----|----|---------|
| R×D | 0.000 (comp → sem protesto) | 0.20 | STABLE ✓ |
| R×A | 0.500 (acumulou 2 períodos) | 0.05 | FALLS ✓ |
| T×D | 0.333 (massivo + sem comp) | 0.20 | FALLS ✓ |
| T×A | 0.000 (decreto imediato) | 0.05 | STABLE ✓ |
