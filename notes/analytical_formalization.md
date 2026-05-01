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

1. $d_{it}$ realized → 2. Signals → 3. Protest ($\pi_t$) → 4. Incumbent proposes comp → 5. **Selectorate votes/approves** → 6. If approved: autocracy $\varphi_t=1$ / democracy $\varphi_{t+1}=1$ → 7. Fall check → 8. Payoffs

---

## 2. Single-State Benchmark (Known $\omega$)

*[Unchanged from v4]*

**Indifference condition**: $\Omega \cdot \Lambda((\omega - s^*)/\sigma) = \bar{h}$, $\bar{h} = 1 - v/C_x$.

**Cutoff**: $s^* = \omega - \sigma \cdot \log(\bar{h}/(\Omega - \bar{h}))$. Exists iff $0 < \bar{h} < \Omega$.

**Protest**: $\pi^* = \bar{h}$ at interior equilibrium. Multiple equilibria with known $\omega$; uniqueness requires multi-state uncertainty.

---

## 3. Multi-State Equilibrium

*[Unchanged from v4]*

$$G(s^*) = \sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda((\omega_t(\theta) - s^*)/\sigma) - \bar{h} = 0$$

---

## 4. Lemma 2: Asymmetric Composition

*[Unchanged from v4]*

$\Omega_2(T) > \Omega_2(R)$ iff $\omega_{T2} > [\omega_R(2-\omega_R) - \omega_{T1}]/(1-\omega_{T1})$.

---

## 5. Lemma 0: Existence and Uniqueness

*[Unchanged from v4 — full proofs retained]*

---

## 6. Lemma 1: The Dictator's Dilemma as Selectorate Visibility Gap

### 6.1 Definition (Updated)

The *visibility threshold* $\bar{\omega}_x$ is now the smallest displacement rate at which the **selectorate** approves compensation spending.

In democracy: $\bar{\omega}_D$ = the $\omega$ at which the majority votes for compensation (depends on $Y^+$, $\gamma$, $\delta$, composition of voters).

In autocracy: $\bar{\omega}_A$ = the $\omega$ at which the elite's noisy assessment $\tilde{\omega}_S$ generates sufficient evidence to approve spending. Derived from $\sigma_A$ as before.

### 6.2 Statement

**Lemma 1** (Dictator's Dilemma). *$\bar{\omega}_A > \bar{\omega}_D$.*

**Proof.** Two channels:

(i) *Democratic selectorate has better information.* Diverse voters + free press + independent statistics → lower $\sigma_D$ → posterior closer to true $\omega$ → crisis detected at lower $\omega$. Elite in autocracy shares a noisy bubble → higher $\sigma_A$ → needs larger $\omega$ to be convinced.

(ii) *Democratic selectorate has broader interests.* Voters include displaced workers (who always vote YES) and employed workers with insurance motive. Elite members are not displaced and only care about stability threats to their rents. They approve ONLY when regime survival is at stake — a higher bar.

Both channels raise $\bar{\omega}_A$ relative to $\bar{\omega}_D$. $\square$

### 6.3 Under Threshold $t=1$: $Y^+$ Blocks Democratic Compensation

Even if $\omega_{T1} > \bar{\omega}_D$ (democracy would normally compensate at this displacement level), the threshold $t=1$ case is special: non-displaced workers earn $Y^+ > 1$. Their tax cost of compensation is $\tau \cdot Y^+$, which exceeds $\tau \cdot 1$. With $\gamma$ large enough, even the insurance motive is insufficient to overcome the higher tax burden:

$$\text{Worker with } Y^+ \text{ votes NO iff: } \tau \cdot (1+\gamma) > \delta \cdot P(d_{i,t+1}=1) \cdot B$$

Since $P(d_{i,t+1}=1)$ is low under threshold $t=1$ (workers are in the complementarity phase, few displaced, future looks bright from their signal), the insurance motive is weak. Combined with $Y^+$ raising the tax cost, the majority votes NO.

**Key result**: Under threshold $t=1$, democratic compensation is blocked not by the incumbent's inability to see the crisis, but by the **selectorate's rational refusal to pay for insurance they don't think they need** — they're prospering.

This is exactly the Finseraas & Nyhus (2025) and Dasgupta & Ramirez (2025) mechanism: technological prosperity shifts preferences against redistribution.

---

## 7. Compensation Decisions by Scenario

| Scenario | $t$ | True $\omega$ | Democracy | Autocracy |
|----------|-----|---------------|-----------|-----------|
| R | 1 | $\omega_R$ | Majority votes YES (displaced + fearful employed) → **comp** | Elite doesn't see ($\omega_R < \bar{\omega}_A$) → **no comp** → repress |
| T | 1 | $\omega_{T1}$ | Majority votes NO ($Y^+ > 1$, few displaced) → **no comp** | Elite doesn't see ($\omega_{T1} < \bar{\omega}_A$) → **no comp** |
| R | 2 | $\omega_R$ | $\varphi_2 = 1$ (law from $t=1$) | Still $\omega_R < \bar{\omega}_A$ → **no comp** → repress |
| T | 2 | $\omega_{T2}$ | Majority votes YES → **comp** but LAG → $\varphi_2 = 0$ | Elite sees ($\omega_{T2} > \bar{\omega}_A$) → **comp, immediate** |

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
