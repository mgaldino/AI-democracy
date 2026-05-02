# Formal Proofs of Propositions 1--3: Crossed Fragility

**Document**: Rigorous derivation of equilibrium protest levels from model primitives  
**Date**: 2026-05-02  
**Reference model**: Analytical formalization v5 (`notes/analytical_formalization.md`)  
**Reference paper**: `paper.Rmd` (Sections 3--4)

---

## 0. Preliminaries

### 0.1 Parameters (v5 numerical example)

| Symbol | Value | Description |
|--------|-------|-------------|
| $\omega_R$ | 0.30 | Displacement rate, rapid |
| $\omega_{T1}$ | 0.05 | Displacement rate, threshold $t=1$ |
| $\omega_{T2}$ | 0.60 | Displacement rate, threshold $t=2$ |
| $\omega_N$ | 0.02 | Displacement rate, no shock |
| $\sigma$ | 0.10 | Signal noise |
| $C_D$ | 1.50 | Protest cost, democracy |
| $C_A$ | 1.65 | Protest cost, autocracy |
| $B$ | 0.60 | Compensation benefit |
| $\delta$ | 0.90 | Discount factor |
| $\gamma$ | 0.30 | Complementarity bonus |
| $\bar{\pi}_D^{\text{fall}}$ | 0.20 | Democratic fall threshold |
| $\bar{\pi}_A^{\text{fall}}$ | 0.05 | Autocratic fall threshold |
| $\bar{\pi}_D^{\text{comp}}$ | 0.07 | Democratic compensation trigger |
| $\bar{\omega}_A$ | 0.40 | Autocratic elite evidence threshold |
| $\sigma_A$ | 0.15 | Elite assessment noise |

### 0.2 Cumulative Displaced Fractions (Absorptive Displacement)

Since displacement is absorbing ($d_{it} = 1$ implies $d_{i,t+1} = 1$):

$$\Omega_1(\theta) = \omega_1(\theta)$$

$$\Omega_2(\theta) = \omega_1(\theta) + (1 - \omega_1(\theta)) \cdot \omega_2(\theta)$$

**Computed values:**

| Trajectory | $\Omega_1$ | $\Omega_2$ |
|------------|-----------|-----------|
| Rapid ($R$) | $\omega_R = 0.30$ | $0.30 + 0.70 \times 0.30 = 0.51$ |
| Threshold ($T$) | $\omega_{T1} = 0.05$ | $0.05 + 0.95 \times 0.60 = 0.62$ |
| No shock ($N$) | $\omega_N = 0.02$ | $0.02 + 0.98 \times 0.02 = 0.0396$ |

### 0.3 The Expressive Value

A displaced worker's expressive value in period $t$ is:

$$v_{it} = \underbrace{(1 - y_{it})}_{\text{current loss}} + \delta \cdot \underbrace{\mathbb{E}[(1 - y_{i,t+1}) \mid d_{it}, s_{it}]}_{\text{expected future loss}}$$

**For a displaced worker ($d_{it} = 1$):**

- *Current loss*: $(1 - y_{it})$. If uncompensated ($\varphi_t = 0$): $y_{it} = 0$, so current loss $= 1$. If compensated ($\varphi_t = 1$): $y_{it} = B$, so current loss $= 1 - B$.

- *Expected future loss*: Since displacement is absorbing, the worker will be displaced in $t+1$ with certainty. The future loss depends on whether compensation will be available: $(1 - y_{i,t+1}) = 1 - B \cdot \varphi_{t+1}$. In a two-period model, $t = 2$ is the last period, so there is no $t+1$; we set the future-loss term to zero for $t = 2$.

**For an employed worker ($d_{it} = 0$):**

- *Current loss*: $1 - y_{it} = 1 - 1 = 0$ (or $1 - Y^+ < 0$ under complementarity, but employed workers do not protest).
- Only displaced workers protest (employed workers have $v_i \leq 0$ or very small, and are not in the displaced pool).

### 0.4 Single-State Approximation

**Theorem (Single-State Equilibrium).** In a global game with known state $\omega$, displaced fraction $\Omega$, linear safety-in-numbers $h(\pi) = \pi$, and logistic signal noise:

- The indifference condition $\Omega \cdot \Lambda((\omega - s^*)/\sigma) = \bar{h}$ yields cutoff $s^* = \omega - \sigma \cdot \log(\bar{h}/(\Omega - \bar{h}))$.
- The equilibrium protest level is $\pi^* = \bar{h}$, where $\bar{h} = 1 - v/C_x$.
- This holds for any $\omega$ and any $\sigma > 0$, provided $0 < \bar{h} < \Omega$.

**Existence conditions:**

| Case | Condition | Equilibrium |
|------|-----------|-------------|
| Interior | $0 < \bar{h} < \Omega$ | $\pi^* = \bar{h}$ |
| Dominant strategy | $\bar{h} \leq 0$ (i.e., $v \geq C_x$) | $\pi^* = \Omega$ (all displaced protest) |
| No protest | $\bar{h} \geq \Omega$ (i.e., $v \leq C_x(1 - \Omega)$) | $\pi^* = 0$ |

**Proof.** Worker $i$ protests iff $v > C_x \cdot (1 - \pi)$, i.e., iff $\pi > 1 - v/C_x = \bar{h}$. In the global game, the cutoff worker at $s = s^*$ assigns probability $\Lambda((\omega - s^*)/\sigma)$ to the event that any given displaced worker protests. The aggregate protest rate among displaced workers is $\Lambda((\omega - s^*)/\sigma)$, so $\pi = \Omega \cdot \Lambda((\omega - s^*)/\sigma)$. The cutoff worker is indifferent when $\pi = \bar{h}$, giving $\Omega \cdot \Lambda((\omega - s^*)/\sigma) = \bar{h}$. Solving: $\Lambda((\omega - s^*)/\sigma) = \bar{h}/\Omega$, hence $(\omega - s^*)/\sigma = \log(\bar{h}/\Omega) - \log(1 - \bar{h}/\Omega) = \log(\bar{h}/(\Omega - \bar{h}))$, and $s^* = \omega - \sigma \cdot \log(\bar{h}/(\Omega - \bar{h}))$. The equilibrium protest level $\pi^* = \bar{h}$ is independent of $\omega$ and $\sigma$. $\square$

**Applicability.** The single-state approximation is valid when $\sigma$ is small relative to the separation between states, so that the posterior concentrates on the true state. With $\sigma = 0.10$ and minimum state separation $\omega_R - \omega_{T1} = 0.25 = 2.5\sigma$, the approximation is accurate. We note where multi-state effects could matter and confirm that numerical multi-state solutions agree with the approximation.

### 0.5 Compensation Triggers (Asymmetric)

**Democracy (voice):** Compensation is triggered iff $\pi_t > \bar{\pi}_D^{\text{comp}}$. In the model, $\bar{\pi}_D^{\text{comp}} = 0.07$.

**Autocracy (technocratic):** Compensation is triggered iff $\tilde{\omega}_S > \bar{\omega}_A$, where $\tilde{\omega}_S = \omega_t + \sigma_A \zeta$, $\zeta \sim \mathcal{N}(0,1)$. This is independent of $\pi$.

### 0.6 Fall Condition

Regime $x$ falls in period $t$ iff $\pi_t > \bar{\pi}_x^{\text{fall}}$ AND $\varphi_t = 0$.

### 0.7 Timing Recap

1. Displacement realized. 2. Signals observed. 3. Protest $\pi_t$. 4. Compensation trigger check. 5. If triggered: autocracy $\varphi_t = 1$ (immediate); democracy $\varphi_{t+1} = 1$ (lag). 6. Fall check. 7. Payoffs.

---

## 1. Proof of Proposition 1(a): Democracy Stable under Rapid

**Claim.** Under rapid displacement ($\theta = R$), democracy survives both periods.

### Step 1: Identify the self-confirming equilibrium in $t = 1$

Workers in $t = 1$ must form expectations about $\varphi_2$ (whether compensation will be available in $t = 2$). There are two candidate equilibria:

**(A) Compensation-expected equilibrium:** Workers anticipate $\varphi_2 = 1$.

**(B) No-compensation equilibrium:** Workers anticipate $\varphi_2 = 0$.

We check which is self-confirming by computing protest under each candidate and verifying whether it triggers compensation.

### Step 2: Derive $v$ under each candidate

**Candidate (A): $\varphi_2 = 1$ anticipated.**

A displaced worker in $t = 1$ has:
- Current loss: $1 - y_{i1} = 1 - 0 = 1$ (displaced, $\varphi_1 = 0$ since no prior legislation).
- Expected future loss: displacement is absorbing, so the worker is displaced in $t = 2$ with certainty. With $\varphi_2 = 1$: $y_{i2} = B = 0.6$. So expected future loss $= 1 - B = 0.4$.

$$v^{(A)} = 1 + \delta(1 - B) = 1 + 0.9 \times 0.4 = 1.36$$

**Candidate (B): $\varphi_2 = 0$ anticipated.**

$$v^{(B)} = 1 + \delta \cdot 1 = 1 + 0.9 = 1.90$$

### Step 3: Derive $\bar{h}$ and $\pi^*$ under each candidate

**Candidate (A):** $v^{(A)} = 1.36$, $C_D = 1.50$.

$$\bar{h}^{(A)} = 1 - \frac{v^{(A)}}{C_D} = 1 - \frac{1.36}{1.50} = 1 - 0.9\overline{3} = 0.0\overline{6} \approx 0.0933$$

Check existence: $0 < 0.0933 < \Omega_1(R) = 0.30$. Interior equilibrium exists.

$$\pi_1^{*(A)} = \bar{h}^{(A)} \approx 0.0933$$

**Candidate (B):** $v^{(B)} = 1.90 > C_D = 1.50$.

Since $v^{(B)} > C_D$, we have $\bar{h}^{(B)} = 1 - 1.90/1.50 = 1 - 1.2\overline{6} = -0.2\overline{6} < 0$.

Protesting is a dominant strategy for all displaced workers.

$$\pi_1^{*(B)} = \Omega_1(R) = 0.30$$

### Step 4: Self-confirmation check

**Candidate (A):** $\pi_1^{*(A)} = 0.0933 > \bar{\pi}_D^{\text{comp}} = 0.07$. Compensation IS triggered. A law is passed. Due to democratic lag, $\varphi_2 = 1$. This CONFIRMS the anticipation $\varphi_2 = 1$. **Self-confirming.**

**Candidate (B):** $\pi_1^{*(B)} = 0.30 > \bar{\pi}_D^{\text{comp}} = 0.07$. Compensation IS triggered. But the candidate assumed $\varphi_2 = 0$ (no comp). The protest itself triggers compensation, contradicting the assumption. **Not self-confirming.**

Therefore, the **unique self-confirming equilibrium** in $t = 1$ under R$\times$D is Candidate (A), with $\pi_1^* \approx 0.0933$ and $\varphi_2 = 1$.

### Step 5: Check $t = 1$ survival

$$\pi_1^* = 0.0933 < \bar{\pi}_D^{\text{fall}} = 0.20$$

**Democracy survives $t = 1$.** $\checkmark$

### Step 6: Derive $t = 2$ protest

In $t = 2$, compensation is active ($\varphi_2 = 1$). Displaced workers (fraction $\Omega_2(R) = 0.51$) receive $B = 0.6$. Since $t = 2$ is the last period, there is no future loss term:

$$v_2 = (1 - y_{i2}) = 1 - B = 0.4$$

$$\bar{h}_2 = 1 - \frac{v_2}{C_D} = 1 - \frac{0.4}{1.5} = 1 - 0.2\overline{6} = 0.7\overline{3} \approx 0.7333$$

Check existence: $\bar{h}_2 = 0.7333 > \Omega_2(R) = 0.51$. **No interior equilibrium.** Even if all displaced workers protested ($\pi = 0.51$), the safety-in-numbers level would be $h(\pi) = 0.51 < 0.7333 = \bar{h}$, which is insufficient to make protesting worthwhile for the marginal worker.

$$\pi_2^* = 0 \quad \text{(no protest)}$$

### Step 7: Check $t = 2$ survival

$$\pi_2^* = 0 < \bar{\pi}_D^{\text{fall}} = 0.20$$

**Democracy survives $t = 2$.** $\checkmark$

### Conclusion

Democracy survives both periods under rapid displacement. The mechanism: protest in $t = 1$ exceeds the voice threshold ($\pi_1^* = 0.093 > \bar{\pi}_D^{\text{comp}} = 0.07$), triggering compensation legislation. The credible commitment to $\varphi_2 = 1$ reduces the expressive value from $v = 1.90$ (no comp) to $v = 1.36$ (comp anticipated), keeping protest below the fall threshold. In $t = 2$, compensation reduces the expressive value to $v = 0.40$, which is so low that the participation threshold $\bar{h} = 0.733$ exceeds the displaced fraction $\Omega = 0.51$, producing zero protest. $\blacksquare$

---

## 2. Proof of Proposition 1(b): Democracy Unstable under Threshold

**Claim.** Under threshold automation ($\theta = T$), democracy falls in $t = 2$.

### Step 1: Period $t = 1$ --- no compensation triggered

Under threshold $t = 1$, $\omega_{T1} = 0.05$. Only 5% of workers are displaced.

**Expressive value for displaced workers.** A displaced worker in $t = 1$ anticipates future displacement with certainty (absorbing). Without compensation (which we verify is not triggered), the expected future loss depends on the worker's posterior over $\theta$.

However, in the single-state approximation at $\omega_{T1} = 0.05$, the displaced worker knows the true state is one with very low displacement. In the worst case (no compensation expected for any future state):

$$v_{\text{displaced}} = 1 + \delta = 1.9$$

Since $v = 1.9 > C_D = 1.5$, protesting is a **dominant strategy** for displaced workers: $\bar{h} = 1 - 1.9/1.5 = -0.267 < 0$. Every displaced worker protests regardless of coordination expectations.

**Aggregate protest.** Only displaced workers protest, and they all do:

$$\pi_1 = \Omega_1(T) = \omega_{T1} = 0.05$$

**Compensation trigger check.** $\pi_1 = 0.05 < \bar{\pi}_D^{\text{comp}} = 0.07$. The voice threshold is NOT met. No compensation bill is introduced.

**Remark on Y+ and political blocking.** Even if the trigger threshold were lower, the prosperity trap operates: the 95% of employed workers earn $Y^+ = 1 + \gamma = 1.3$. Their high income means (a) they face elevated tax costs from any compensation scheme, and (b) they see no reason to fund social insurance. The political demand for compensation is absent because the majority is prospering. This reinforces the formal trigger result: there is simply no political demand at $\pi_1 = 0.05$.

**Self-confirmation.** With no compensation triggered, $\varphi_1 = 0$ and $\varphi_2 = 0$. Workers' anticipation of no compensation is confirmed. **Self-confirming.**

### Step 2: Check $t = 1$ survival

$$\pi_1 = 0.05 < \bar{\pi}_D^{\text{fall}} = 0.20$$

**Democracy survives $t = 1$.** $\checkmark$

### Step 3: Derive $t = 2$ protest

In $t = 2$, $\omega_{T2} = 0.60$. Massive displacement. No compensation infrastructure exists ($\varphi_2 = 0$): no law was passed in $t = 1$ (voice threshold not met), and any law passed in $t = 2$ arrives with a lag ($\varphi_3 = 1$, which has no effect in a two-period model).

**Expressive value.** Displaced workers in $t = 2$ (the last period) have no future-loss term:

$$v_2 = 1 - y_{i2} = 1 - 0 = 1 \quad \text{(uncompensated)}$$

**Participation threshold:**

$$\bar{h}_2 = 1 - \frac{v_2}{C_D} = 1 - \frac{1}{1.5} = 1 - 0.\overline{6} = 0.\overline{3} \approx 0.3333$$

**Existence check.** $0 < 0.3333 < \Omega_2(T) = 0.62$. Interior equilibrium exists.

$$\pi_2^* = \bar{h}_2 = \frac{1}{3} \approx 0.3333$$

### Step 4: Check $t = 2$ survival

$$\pi_2^* = 0.3333 > \bar{\pi}_D^{\text{fall}} = 0.20$$

and $\varphi_2 = 0$.

**Democracy falls in $t = 2$.** $\checkmark$

### Step 5: Verify voice trigger is met but lag prevents rescue

In $t = 2$: $\pi_2^* = 0.333 > \bar{\pi}_D^{\text{comp}} = 0.07$. Compensation IS triggered in $t = 2$. But due to democratic lag, the law takes effect as $\varphi_3 = 1$. In the two-period model, there is no $t = 3$. Compensation arrives too late.

### Conclusion

Democracy falls under threshold automation. The mechanism: in $t = 1$, the low displacement rate ($\omega_{T1} = 0.05$) generates protest ($\pi_1 = 0.05$) that falls below the voice threshold ($\bar{\pi}_D^{\text{comp}} = 0.07$). No compensation is enacted. The prosperity of the complementary phase ($Y^+ = 1.3$) reinforces the political absence of demand. In $t = 2$, massive displacement ($\omega_{T2} = 0.60$) generates high protest ($\pi_2^* = 1/3 \approx 0.333$) that exceeds the fall threshold ($\bar{\pi}_D^{\text{fall}} = 0.20$) and compensation arrives too late due to the institutional lag. $\blacksquare$

---

## 3. Proof of Proposition 2(a): Autocracy Unstable under Rapid

**Claim.** Under rapid displacement ($\theta = R$), the autocracy falls in $t = 2$.

### Step 1: Elite trigger check --- $t = 1$

The autocratic elite observes $\tilde{\omega}_S = \omega_R + \sigma_A \zeta = 0.30 + 0.15\zeta$, $\zeta \sim \mathcal{N}(0,1)$. The elite authorizes compensation iff $\tilde{\omega}_S > \bar{\omega}_A = 0.40$.

$$P(\text{authorize} \mid \omega_R) = P\!\left(\zeta > \frac{\bar{\omega}_A - \omega_R}{\sigma_A}\right) = P\!\left(\zeta > \frac{0.40 - 0.30}{0.15}\right) = P(\zeta > 0.667) = 1 - \Phi(0.667)$$

Using the standard normal CDF: $\Phi(0.667) \approx 0.7475$.

$$P(\text{authorize} \mid \omega_R) \approx 1 - 0.7475 = 0.2525$$

The elite authorizes compensation with only 25% probability. **For the baseline analysis, we condition on the modal outcome: no compensation.** (With probability 0.75, the elite does NOT authorize. The proposition holds with probability at least 0.75, or for $\bar{\omega}_A$ sufficiently above $\omega_R$. For $\bar{\omega}_A \geq \omega_R + \sigma_A$ (i.e., at least one standard deviation above), the probability drops below 16%.)

**No compensation in $t = 1$:** $\varphi_1 = 0$.

### Step 2: Protest in $t = 1$

Displaced workers in $t = 1$ (fraction $\Omega_1(R) = 0.30$) have $v = 1 + \delta = 1 + 0.9 = 1.9$ (no comp now, no comp expected in $t = 2$ since the elite cannot see the moderate crisis).

Since $v = 1.9 > C_A = 1.65$: $\bar{h} = 1 - 1.9/1.65 = 1 - 1.1515 = -0.1515 < 0$. **Dominant strategy:** all displaced workers protest.

$$\pi_1 = \Omega_1(R) = 0.30$$

### Step 3: Check $t = 1$ fall condition

$\pi_1 = 0.30 > \bar{\pi}_A^{\text{fall}} = 0.05$ and $\varphi_1 = 0$.

**Note:** Under these parameters, the autocracy actually falls already in $t = 1$. However, the model's timing has the compensation trigger check (Step 4) occurring AFTER protest (Step 3), and the fall check (Step 6) at the end. Since the elite does not authorize compensation (with high probability), there is no $\varphi_1 = 1$, and the fall condition is met.

**Autocracy falls in $t = 1$.** But let us also verify $t = 2$ for completeness and for parameter ranges where $t = 1$ survival is possible (e.g., if the autocrat successfully represses in $t = 1$).

**Remark on repression.** The model as stated does not include a separate repression stage that prevents protest from being counted. If $C_A$ is interpreted as the cost that suppresses protest participation (through the safety-in-numbers mechanism), then the only question is whether $\pi_1^*$ exceeds $\bar{\pi}_A^{\text{fall}}$. With $\pi_1 = 0.30 > 0.05$, the regime falls. For the result to operate through $t = 2$ accumulation (as in the paper's narrative), one needs $C_A$ high enough that $\pi_1 < \bar{\pi}_A^{\text{fall}}$ but $\pi_2 > \bar{\pi}_A^{\text{fall}}$. With $C_A = 1.65$ and $v = 1.9$, this does not hold. See **Alternative derivation** below for the correct $v$ when the protest is in $t = 2$ only.

### Alternative Derivation: $t = 2$ accumulation story

For the paper's narrative (autocracy survives $t = 1$ through repression, falls in $t = 2$ through accumulation), the relevant calculation is:

**$t = 2$, no compensation.** Displaced workers (fraction $\Omega_2(R) = 0.51$). Since $t = 2$ is the last period:

$$v_2 = 1 \quad \text{(uncompensated, last period)}$$

$$\bar{h}_2 = 1 - \frac{v_2}{C_A} = 1 - \frac{1}{1.65} = 1 - 0.6061 = 0.3939$$

**Existence check.** $0 < 0.3939 < \Omega_2(R) = 0.51$. Interior equilibrium exists.

$$\pi_2^* = \bar{h}_2 = 0.3939$$

**Fall check:**

$$\pi_2^* = 0.3939 > \bar{\pi}_A^{\text{fall}} = 0.05$$

**Autocracy falls in $t = 2$.** $\checkmark$

**Elite trigger check in $t = 2$.** The crisis is STILL moderate ($\omega_R = 0.30 < \bar{\omega}_A = 0.40$). The elite's assessment remains below the evidence threshold:

$$P(\text{authorize} \mid \omega_R) = 1 - \Phi(0.667) \approx 0.2525$$

With high probability, the elite still does not authorize compensation. No decree. $\varphi_2 = 0$.

### Robustness: Forward-looking $v$ in $t = 1$

In $t = 1$, if the worker knows compensation will not arrive (elite cannot see the moderate crisis), the expressive value is:

$$v_1 = 1 + \delta \cdot 1 = 1.9$$

With $v_1 = 1.9 > C_A = 1.65$: dominant strategy, $\pi_1 = 0.30 > \bar{\pi}_A^{\text{fall}} = 0.05$. The autocracy falls even in $t = 1$. This **strengthens** the result: the autocracy is unstable under rapid even without the accumulation mechanism.

### Conclusion

The autocracy falls under rapid displacement. Whether the fall occurs in $t = 1$ or $t = 2$ depends on whether repression can contain $t = 1$ protest below $\bar{\pi}_A^{\text{fall}}$. With the v5 parameters:

- **If $t = 1$ protest is counted** ($C_A = 1.65$, $v = 1.9 > C_A$): dominant strategy protest, $\pi_1 = 0.30 \gg 0.05$. Falls in $t = 1$.
- **If $t = 1$ protest is suppressed** (narrative: repression works temporarily): displacement accumulates. In $t = 2$, $\pi_2^* = 0.394 > 0.05$. Falls in $t = 2$.

Either way, the autocracy is unstable under rapid displacement. The elite's noisy assessment ($\omega_R = 0.30 < \bar{\omega}_A = 0.40$) prevents compensation authorization. Without compensation, protest exceeds the low autocratic fall threshold. $\blacksquare$

---

## 4. Proof of Proposition 2(b): Autocracy Stable under Threshold

**Claim.** Under threshold automation ($\theta = T$), the autocracy survives both periods.

### Step 1: Period $t = 1$ --- calm

$\omega_{T1} = 0.05$. Few displaced. Displaced workers have $v = 1 + \delta = 1.9 > C_A = 1.65$, so protesting is a dominant strategy. But only $\Omega_1(T) = 0.05$ are displaced:

$$\pi_1 = \Omega_1(T) = 0.05$$

**Fall check:** $\pi_1 = 0.05 \leq \bar{\pi}_A^{\text{fall}} = 0.05$. Borderline. With $\bar{\pi}_A^{\text{fall}}$ defined as a strict inequality ($\pi > \bar{\pi}_A^{\text{fall}}$), the regime survives. With equality treated as survival: **autocracy survives $t = 1$.** $\checkmark$

**Remark.** For strict inequality at the boundary, we can set $\bar{\pi}_A^{\text{fall}} = 0.05 + \epsilon$ for any $\epsilon > 0$, or note that in the interior equilibrium with multi-state uncertainty, the protest level would be slightly different from the single-state approximation. The result is not knife-edge: any $\bar{\pi}_A^{\text{fall}} > \omega_{T1}$ suffices.

### Step 2: Elite trigger check --- $t = 2$

In $t = 2$, $\omega_{T2} = 0.60$. The elite observes $\tilde{\omega}_S = 0.60 + 0.15\zeta$.

$$P(\text{authorize} \mid \omega_{T2}) = P\!\left(\zeta > \frac{0.40 - 0.60}{0.15}\right) = P(\zeta > -1.333) = \Phi(1.333) \approx 0.9088$$

**The elite authorizes compensation with approximately 91% probability.** The massive crisis ($\omega_{T2} = 0.60$) overwhelms the noise in the elite's assessment. The crisis is self-revealing.

**Compensation by decree:** $\varphi_2 = 1$ (immediate, no lag).

### Step 3: Derive $t = 2$ protest (with compensation)

Displaced workers (fraction $\Omega_2(T) = 0.62$) receive compensation $B = 0.6$. Since $t = 2$ is the last period:

$$v_2 = 1 - B = 1 - 0.6 = 0.4$$

$$\bar{h}_2 = 1 - \frac{v_2}{C_A} = 1 - \frac{0.4}{1.65} = 1 - 0.2424 = 0.7576$$

**Existence check.** $\bar{h}_2 = 0.7576 > \Omega_2(T) = 0.62$. **No interior equilibrium.** Even if all displaced workers protested ($\pi = 0.62$), the safety-in-numbers level $h(\pi) = 0.62 < 0.7576 = \bar{h}$ is insufficient to sustain protest.

$$\pi_2^* = 0 \quad \text{(no protest)}$$

### Step 4: Check $t = 2$ survival

$$\pi_2^* = 0 < \bar{\pi}_A^{\text{fall}} = 0.05$$

**Autocracy survives $t = 2$.** $\checkmark$

### Step 5: Verify the compensated no-protest is self-confirming

Workers anticipated $\varphi_2 = 1$ (elite authorizes with 91% probability, compensation by decree). With $\varphi_2 = 1$, protest is zero. Zero protest does not trigger any fall condition. The elite's authorization was based on $\tilde{\omega}_S$ (independent of $\pi$), so there is no circularity. **Self-confirming.** $\checkmark$

### Conclusion

The autocracy survives threshold automation. In $t = 1$, calm prevails ($\pi_1 = 0.05 \leq \bar{\pi}_A^{\text{fall}}$). In $t = 2$, the massive crisis ($\omega_{T2} = 0.60$) is self-revealing: the elite authorizes compensation with 91% probability. The autocrat compensates by decree (no lag). Compensation reduces the expressive value to $v = 0.4$, making the participation threshold $\bar{h} = 0.758$ exceed the displaced fraction $\Omega = 0.62$, producing zero protest. $\blacksquare$

---

## 5. Proof of Proposition 3: Crossed Fragility

**Claim.** There exist open sets of parameters satisfying A1--A9 such that: (a) under rapid displacement, democracy is stable and autocracy is unstable; (b) under threshold automation, democracy is unstable and autocracy is stable.

### Step 1: Statement of the five conditions

From Propositions 1 and 2, crossed fragility requires:

**(C1)** R$\times$D stable: $\pi_1^*(R, D) > \bar{\pi}_D^{\text{comp}}$ (voice triggers comp) and $\pi_t^*(R, D) < \bar{\pi}_D^{\text{fall}}$ for $t \in \{1,2\}$ (does not fall).

**(C2)** T$\times$D falls: $\pi_1^*(T, D) < \bar{\pi}_D^{\text{comp}}$ (voice does not trigger comp in $t=1$) and $\pi_2^*(T, D) > \bar{\pi}_D^{\text{fall}}$ (falls in $t=2$).

**(C3)** R$\times$A falls: $\omega_R < \bar{\omega}_A$ (elite does not authorize comp) and $\pi^*(R, A) > \bar{\pi}_A^{\text{fall}}$ (protest overwhelms).

**(C4)** T$\times$A stable: $\omega_{T2} > \bar{\omega}_A$ (elite authorizes comp) and compensated $\pi_2^*(T, A) < \bar{\pi}_A^{\text{fall}}$.

**(C5)** Both regimes survive $t = 1$ under threshold: $\omega_{T1}$ small enough.

### Step 2: Verify each condition with v5 parameters

We now substitute the v5 parameters and verify each condition algebraically.

**Condition C1 (R$\times$D stable):**

From Section 1 above:
- $v = 1 + \delta(1-B) = 1.36$. $\bar{h} = 1 - 1.36/1.50 = 1 - 68/75 = 7/75 \approx 0.0933$. $\pi_1^* = 0.0933$.
- $\pi_1^* = 0.0933 > \bar{\pi}_D^{\text{comp}} = 0.07$. $\checkmark$ (voice triggers comp)
- $\pi_1^* = 0.0933 < \bar{\pi}_D^{\text{fall}} = 0.20$. $\checkmark$ (does not fall in $t=1$)
- In $t=2$: $v = 0.4$, $\bar{h} = 0.733 > \Omega_2(R) = 0.51$. $\pi_2^* = 0 < 0.20$. $\checkmark$ (does not fall in $t=2$)

**Condition C2 (T$\times$D falls):**

From Section 2 above:
- $t=1$: $\pi_1 = \omega_{T1} = 0.05 < \bar{\pi}_D^{\text{comp}} = 0.07$. $\checkmark$ (no comp triggered)
- $t=2$: $v = 1.0$. $\bar{h} = 1/3 \approx 0.333$. $\Omega_2(T) = 0.62 > 0.333$. Interior eq: $\pi_2^* = 1/3$.
- $\pi_2^* = 0.333 > \bar{\pi}_D^{\text{fall}} = 0.20$. $\checkmark$ (falls in $t=2$)

**Condition C3 (R$\times$A falls):**

From Section 3 above:
- $\omega_R = 0.30 < \bar{\omega}_A = 0.40$. $\checkmark$ (elite does not authorize)
- $t=2$: $v = 1.0$. $\bar{h} = 1 - 1/1.65 \approx 0.3939$. $\Omega_2(R) = 0.51 > 0.3939$. $\pi_2^* = 0.3939$.
- $\pi_2^* = 0.3939 > \bar{\pi}_A^{\text{fall}} = 0.05$. $\checkmark$ (falls)

**Condition C4 (T$\times$A stable):**

From Section 4 above:
- $\omega_{T2} = 0.60 > \bar{\omega}_A = 0.40$. $\checkmark$ (elite authorizes)
- $t=2$ with comp: $v = 0.4$. $\bar{h} = 1 - 0.4/1.65 \approx 0.7576$. $\Omega_2(T) = 0.62 < 0.7576$. $\pi_2^* = 0$.
- $\pi_2^* = 0 < \bar{\pi}_A^{\text{fall}} = 0.05$. $\checkmark$ (stable)

**Condition C5 (both survive $t=1$ under threshold):**

- Democracy: $\pi_1 = 0.05 < \bar{\pi}_D^{\text{fall}} = 0.20$. $\checkmark$
- Autocracy: $\pi_1 = 0.05 \leq \bar{\pi}_A^{\text{fall}} = 0.05$. $\checkmark$ (weakly; strict with $\bar{\pi}_A^{\text{fall}} = 0.05 + \epsilon$)

### Step 3: Open set argument

The five conditions are strict inequalities (except C5 for autocracy, which can be made strict). Each is a continuous function of the parameters. By the continuity of equilibrium protest $\pi^*$ in the model primitives $(C_x, B, \delta, \omega_R, \omega_{T1}, \omega_{T2}, \bar{\pi}_D^{\text{comp}}, \bar{\pi}_D^{\text{fall}}, \bar{\pi}_A^{\text{fall}}, \bar{\omega}_A)$:

- Each condition defines an open set in parameter space (preimage of an open interval under a continuous function).
- The intersection of finitely many open sets is open.
- The v5 parameterization lies in this intersection (verified in Step 2).
- Therefore the intersection is a non-empty open set.

### Step 4: Sufficient conditions for crossed fragility (parametric)

The crossed fragility pattern holds whenever the following parametric conditions are jointly satisfied:

**(i)** $1 - \frac{1 + \delta(1-B)}{C_D} > \bar{\pi}_D^{\text{comp}}$ --- voice triggers comp under rapid.

Substituting: $1 - \frac{1 + \delta(1-B)}{C_D} > \bar{\pi}_D^{\text{comp}}$, equivalently $C_D > \frac{1 + \delta(1-B)}{1 - \bar{\pi}_D^{\text{comp}}}$.

**(ii)** $\omega_{T1} < \bar{\pi}_D^{\text{comp}}$ --- few displaced under threshold $t=1$, below voice trigger.

**(iii)** $1 - \frac{1}{C_D} > \bar{\pi}_D^{\text{fall}}$ --- uncompensated protest under threshold $t=2$ exceeds fall threshold.

Equivalently: $C_D < \frac{1}{1 - \bar{\pi}_D^{\text{fall}}}$.

**(iv)** $\omega_R < \bar{\omega}_A$ --- elite misses moderate crisis.

**(v)** $\omega_{T2} > \bar{\omega}_A$ --- elite sees massive crisis.

**(vi)** $1 - \frac{1}{C_A} < \Omega_2(R)$ --- interior equilibrium exists for R$\times$A.

**(vii)** $1 - \frac{1}{C_A} > \bar{\pi}_A^{\text{fall}}$ --- R$\times$A protest exceeds autocratic fall threshold.

**(viii)** $1 - \frac{1-B}{C_A} > \Omega_2(T)$ --- no interior equilibrium for T$\times$A with comp (protest = 0).

**Verification with v5 parameters:**

| Condition | LHS | RHS | Holds? |
|-----------|-----|-----|--------|
| (i) $\bar{h}^{\text{comp}} > \bar{\pi}_D^{\text{comp}}$ | $0.0933$ | $0.07$ | $\checkmark$ |
| (ii) $\omega_{T1} < \bar{\pi}_D^{\text{comp}}$ | $0.05$ | $0.07$ | $\checkmark$ |
| (iii) $\bar{h}_2^{\text{no-comp}} > \bar{\pi}_D^{\text{fall}}$ | $0.3333$ | $0.20$ | $\checkmark$ |
| (iv) $\omega_R < \bar{\omega}_A$ | $0.30$ | $0.40$ | $\checkmark$ |
| (v) $\omega_{T2} > \bar{\omega}_A$ | $0.60$ | $0.40$ | $\checkmark$ |
| (vi) $\bar{h}_A^{\text{no-comp}} < \Omega_2(R)$ | $0.3939$ | $0.51$ | $\checkmark$ |
| (vii) $\bar{h}_A^{\text{no-comp}} > \bar{\pi}_A^{\text{fall}}$ | $0.3939$ | $0.05$ | $\checkmark$ |
| (viii) $\bar{h}_A^{\text{comp}} > \Omega_2(T)$ | $0.7576$ | $0.62$ | $\checkmark$ |

All eight conditions hold with strict inequality and positive margin. The result is not knife-edge. $\blacksquare$

---

## 6. Numerical Verification Table

### Summary of derivations

| Scenario | Period | $\varphi_t$ | $v$ | $\bar{h} = 1 - v/C_x$ | $\Omega_t$ | Interior eq? | $\pi^*$ | Threshold | Outcome |
|----------|--------|-------------|-----|------------------------|------------|--------------|---------|-----------|---------|
| R$\times$D | 1 | 0 | 1.36 | 0.0933 | 0.30 | Yes ($\bar{h} < \Omega$) | 0.0933 | $\bar{\pi}_D^{\text{comp}} = 0.07$ | Comp triggered |
| R$\times$D | 2 | 1 | 0.40 | 0.7333 | 0.51 | No ($\bar{h} > \Omega$) | 0.0000 | $\bar{\pi}_D^{\text{fall}} = 0.20$ | **STABLE** |
| T$\times$D | 1 | 0 | 1.90 | $-0.267$ | 0.05 | Dominant | 0.0500 | $\bar{\pi}_D^{\text{comp}} = 0.07$ | No comp |
| T$\times$D | 2 | 0 | 1.00 | 0.3333 | 0.62 | Yes | 0.3333 | $\bar{\pi}_D^{\text{fall}} = 0.20$ | **FALLS** |
| R$\times$A | 1 | 0 | 1.90 | $-0.152$ | 0.30 | Dominant | 0.3000 | $\bar{\pi}_A^{\text{fall}} = 0.05$ | Falls $t=1$* |
| R$\times$A | 2 | 0 | 1.00 | 0.3939 | 0.51 | Yes | 0.3939 | $\bar{\pi}_A^{\text{fall}} = 0.05$ | **FALLS** |
| T$\times$A | 1 | 0 | 1.90 | $-0.152$ | 0.05 | Dominant | 0.0500 | $\bar{\pi}_A^{\text{fall}} = 0.05$ | Borderline |
| T$\times$A | 2 | 1 | 0.40 | 0.7576 | 0.62 | No ($\bar{h} > \Omega$) | 0.0000 | $\bar{\pi}_A^{\text{fall}} = 0.05$ | **STABLE** |

\* R$\times$A $t=1$: With $v = 1.9 > C_A = 1.65$, protest is dominant and $\pi_1 = 0.30 > 0.05$. The autocracy actually falls in $t=1$ with these parameters. The $t=2$ result ($\pi_2 = 0.394$) shows that even with repression delaying the fall, accumulation produces the same outcome.

### Key algebra

| Quantity | Formula | Value |
|----------|---------|-------|
| $v_{\text{comp}}$ (R$\times$D, $t=1$) | $1 + \delta(1-B) = 1 + 0.9 \times 0.4$ | 1.36 |
| $v_{\text{no-comp}}$ ($t=1$, forward-looking) | $1 + \delta = 1 + 0.9$ | 1.90 |
| $v_{\text{compensated}}$ ($t=2$, comp active) | $1 - B = 1 - 0.6$ | 0.40 |
| $v_{\text{uncompensated}}$ ($t=2$, no comp) | $1 - 0 = 1$ | 1.00 |
| $\bar{h}$ (R$\times$D, comp, $t=1$) | $1 - 1.36/1.50$ | 0.0933 |
| $\bar{h}$ (R$\times$D, comp, $t=2$) | $1 - 0.40/1.50$ | 0.7333 |
| $\bar{h}$ (T$\times$D, no comp, $t=2$) | $1 - 1.00/1.50$ | 0.3333 |
| $\bar{h}$ (R$\times$A, no comp, $t=2$) | $1 - 1.00/1.65$ | 0.3939 |
| $\bar{h}$ (T$\times$A, comp, $t=2$) | $1 - 0.40/1.65$ | 0.7576 |
| $\Omega_2(R)$ | $0.30 + 0.70 \times 0.30$ | 0.5100 |
| $\Omega_2(T)$ | $0.05 + 0.95 \times 0.60$ | 0.6200 |
| $P(\text{elite auth} \mid \omega_R)$ | $\Phi((0.30 - 0.40)/0.15)$ | 0.2525 |
| $P(\text{elite auth} \mid \omega_{T2})$ | $\Phi((0.60 - 0.40)/0.15)$ | 0.9088 |

---

## 7. Discussion of Approximation and Robustness

### 7.1 Single-state approximation validity

The single-state approximation gives $\pi^* = \bar{h} = 1 - v/C_x$, independent of $\omega$ and $\sigma$. This is exact in the single-state global game and is a valid approximation when:

- $\sigma$ is small relative to state separation: $\sigma = 0.10$ vs. minimum separation $\omega_R - \omega_{T1} = 0.25 = 2.5\sigma$. The posterior concentrates on the true state.
- The posterior weight on non-true states is exponentially small: $P(\theta' \mid s) \propto \exp(-|\omega_t(\theta') - s|/\sigma)$, which decays rapidly for states far from $s$.

### 7.2 Multi-state effects

In the full multi-state game (Section 4 of the analytical formalization), the equilibrium cutoff $s^*$ solves:

$$G(s^*) = \sum_\theta P(\theta \mid d=1, s^*) \cdot \Omega_t(\theta) \cdot \Lambda\!\left(\frac{\omega_t(\theta) - s^*}{\sigma}\right) - \bar{h} = 0$$

The numerical verification scripts (`notes/verify_v5_altC_triggers.py`, `notes/verify_lemma2_singlestate.py`) confirm that the single-state approximation agrees with the multi-state solution for these parameters. The key results (which scenarios produce protest above/below thresholds) are robust to multi-state corrections.

### 7.3 Robustness of the R$\times$D self-confirming equilibrium

The self-confirmation argument for R$\times$D requires $\bar{h}^{\text{comp}} > \bar{\pi}_D^{\text{comp}}$ (comp-expected equilibrium generates enough protest to trigger comp) and $\bar{h}^{\text{no-comp}} \cdot \Omega_1(R) > \bar{\pi}_D^{\text{comp}}$ or $v_{\text{no-comp}} > C_D$ (no-comp equilibrium generates even MORE protest, ruling it out). Both hold comfortably:

- $0.0933 > 0.07$ (comp equilibrium triggers comp): margin $= 0.023$.
- $1.90 > 1.50$ (no-comp: dominant strategy, $\pi = 0.30 > 0.07$): even stronger.

### 7.4 The T$\times$D t=1 displaced workers

Under threshold $t = 1$, the displaced workers (fraction $\omega_{T1} = 0.05$) have $v = 1 + \delta = 1.9 > C_D$, so they all protest. This gives $\pi_1 = 0.05$. The fact that $\pi_1 = 0.05 < \bar{\pi}_D^{\text{comp}} = 0.07$ (margin $= 0.02$) is what prevents the voice trigger from activating. This margin is positive but narrow. The result is strengthened by the prosperity trap: even if $\bar{\pi}_D^{\text{comp}}$ were set at 0.04 (below $\omega_{T1}$), the democratic majority earning $Y^+ = 1.3$ would oppose any compensation legislation introduced, blocking it through the normal political process.

### 7.5 Parametric window for $\bar{\pi}_D^{\text{comp}}$

The democratic compensation trigger must satisfy:

$$\omega_{T1} < \bar{\pi}_D^{\text{comp}} < \bar{h}^{\text{comp}}(R \times D)$$
$$0.05 < \bar{\pi}_D^{\text{comp}} < 0.0933$$

This is a window of width $0.043$. The chosen value $\bar{\pi}_D^{\text{comp}} = 0.07$ sits comfortably in this window. The window exists because $\bar{h}^{\text{comp}} > \omega_{T1}$, i.e., protest under rapid (with comp anticipated) exceeds the displaced fraction under threshold $t = 1$. This is driven by the fundamental asymmetry: rapid displacement is moderate but widespread ($\omega_R \gg \omega_{T1}$), while threshold $t = 1$ is sparse.

### 7.6 Borderline T$\times$A in $t = 1$

With $\pi_1 = 0.05 = \bar{\pi}_A^{\text{fall}} = 0.05$, the autocracy is at the boundary in $t = 1$ under threshold. This is an artifact of setting $\bar{\pi}_A^{\text{fall}}$ exactly equal to $\omega_{T1}$. In practice:

- $\bar{\pi}_A^{\text{fall}} > \omega_{T1}$: autocracy strictly survives $t = 1$. This holds for any $\bar{\pi}_A^{\text{fall}} > 0.05$ (e.g., $\bar{\pi}_A^{\text{fall}} = 0.06$).
- The multi-state equilibrium would give slightly different protest at $\omega_{T1}$, potentially above or below 0.05 depending on the posterior weights.

The result is robust: the key condition for T$\times$A stability is the $t = 2$ outcome (zero protest under compensation), which holds with a large margin ($\bar{h} = 0.758 \gg \Omega = 0.62$).

---

## 8. Proof Structure Summary

| Proposition | Key derivation | Central formula | Numerical check |
|-------------|---------------|-----------------|-----------------|
| P1(a): R$\times$D stable | Self-confirming eq: $v = 1 + \delta(1-B)$ | $\pi_1^* = 1 - \frac{1+\delta(1-B)}{C_D} = 0.093 \in (\bar{\pi}_D^{\text{comp}}, \bar{\pi}_D^{\text{fall}})$ | $0.07 < 0.093 < 0.20$ $\checkmark$ |
| P1(b): T$\times$D falls | No comp in $t=1$ ($\pi_1 = \omega_{T1} < \bar{\pi}_D^{\text{comp}}$), lag in $t=2$ | $\pi_2^* = 1 - \frac{1}{C_D} = 0.333 > \bar{\pi}_D^{\text{fall}}$ | $0.333 > 0.20$ $\checkmark$ |
| P2(a): R$\times$A falls | Elite blind ($\omega_R < \bar{\omega}_A$), no comp | $\pi^* = 1 - \frac{1}{C_A} = 0.394 > \bar{\pi}_A^{\text{fall}}$ | $0.394 > 0.05$ $\checkmark$ |
| P2(b): T$\times$A stable | Elite sees crisis ($\omega_{T2} > \bar{\omega}_A$), decree | $\bar{h} = 1 - \frac{1-B}{C_A} = 0.758 > \Omega_2(T) = 0.62$ $\Rightarrow$ $\pi^* = 0$ | $0 < 0.05$ $\checkmark$ |
| P3: Crossed fragility | Intersection of P1 + P2 | 8 parametric conditions, all strict | Open set $\checkmark$ |
