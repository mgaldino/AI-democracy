# Unified Global Game Sketch: One Coordination Mechanism for A3 and A4

## 1. Objective

The current baseline derives the paper's main result from two separate reduced-form assumptions:

- `A3`: democracy compensates only after an observed shock
- `A4`: autocratic repression is degraded under rapid shocks and fully effective under threshold shocks

This note replaces those two assumptions with a single coordination game. The only trajectory-specific primitive is signal noise:

- rapid displacement: `sigma_r` low
- threshold automation: `sigma_tau` high

The same coordination stage, summarized by equilibrium participation under a common participation technology, then does two jobs:

1. in democracy, it determines whether the threat from `E` is politically credible enough to activate compensation
2. in autocracy, it determines whether collective action is visible enough to degrade repression

`A5` remains separate. It is an intertemporal institutional constraint about lead time, not a coordination primitive.

The unification claim is therefore not that coordination has identical causal weight in both regimes. The claim is narrower and more precise: the same informational friction and participation technology feed two regime-specific continuation maps. In democracy, coordination matters by determining whether an observed `t=1` shock becomes a credible threat before `A5` closes the compensatory window. In autocracy, coordination matters more directly by determining whether repression is degraded.

## 2. Core Intuition

The unified mechanism is public visibility of grievance.

Let `g(pi)` denote how publicly legible the grievance of `E` becomes when a mass `pi` of exposed workers joins collective action. The same `g(pi)` enters both regimes:

- in democracy, higher `g(pi)` raises the majority's expected cost of refusing compensation
- in autocracy, higher `g(pi)` increases defections, scrutiny, and coordination, reducing effective repression

What is unified is the signal structure, the participation technology, and the visibility mapping `g(pi)`. Because continuation values differ by regime, equilibrium participation need not be numerically identical in democracy and autocracy; the claim is a common coordination framework, not a literal identity of `pi^*` across institutional environments.

For exposition, it is useful to describe the two sides asymmetrically. The democratic mechanism is timing plus credibility: a visible coalition must arise while the shock is observed and while the institutional window is still open. The autocratic mechanism is coordination versus coercion: a visible coalition directly reduces the effectiveness of repression.

To recover the current paper's exact comparative statics, use the step version:

```math
g(pi) =
\begin{cases}
1 & \text{if } pi \geq \bar{pi} \\
0 & \text{if } pi < \bar{pi}
\end{cases}
```

where `bar{pi} in (0,1)` is the common visibility threshold. Smooth versions of `g(pi)` generate the same qualitative result and can be relegated to an appendix.

## 3. Setup

### 3.1 Players and periods

- Two periods, `t in {1,2}`
- One exposed group `E`, modeled as a continuum of workers `i in [0,1]`
- Regime type `x in {D, A}`: democracy or autocracy
- Trajectory `j in {r, tau}`: rapid displacement or threshold automation

The loss process remains exactly as in the paper:

- rapid displacement: `ell_1 = L`, `ell_2 = 0`
- threshold automation: `ell_1 = 0`, `ell_2 = L`

with `L > 0`.

### 3.2 Information

In each period, worker `i` observes a private signal about the common severity and public legibility of the shock:

```math
s_{it} = omega_t + sigma_j epsilon_{it}, \qquad epsilon_{it} \sim F
```

with:

- `omega_t = ell_t in {0, L}`
- `sigma_j` fixed by trajectory
- `F` continuous, symmetric, full support, and satisfying monotone likelihood ratio

Interpretation:

- under rapid displacement, losses are simultaneous and publicly visible, so `sigma_r` is low
- under threshold automation, workers are displaced after a long complementary phase and are less certain who else is hit, so `sigma_tau` is high

This is still a reduced-form informational representation, but now it is used once, in one place, for both regimes.

### 3.3 Collective action

After observing `s_{it}`, each member of `E` chooses:

```math
a_{it} \in \{0,1\}
```

where `a_{it} = 1` means joining public collective action. Aggregate participation is:

```math
pi_t = \int_0^1 a_{it} di
```

### 3.4 Timing

Within any period `t`:

1. nature determines `omega_t = ell_t`
2. each member of `E` observes `s_{it}`
3. each member chooses `a_{it}`
4. `pi_t` becomes public
5. the regime responds:
   - democracy: the non-exposed majority `N` decides whether to authorize compensation
   - autocracy: effective repression is updated as a function of `pi_t`
6. members of `E` choose `M` or `R`

As in the current paper, the only period where `A5` binds is threshold automation at `t = 2`.

The baseline does not include an explicit intertemporal discount factor. This is deliberate. The two periods should be read as two politically distinct moments in the sequence of the shock, not as two fixed calendar intervals over which agents solve a consumption-savings problem. The mechanism of interest is institutional timing: whether a visible shock arrives while the polity can still build compensatory capacity. That intertemporal linkage is captured by `A5`, which governs persistence and lead time. Introducing discounting would become natural in an extension where regimes or voters choose preventive capacity ex ante, but it is not required for the baseline crossed-fragility result.

## 4. Regime-Specific Continuation Maps

The coordination game is common. What differs by regime is how `g(pi_t)` affects continuation payoffs.

That commonality should not be overstated. The same participation stage enters both regimes, but its causal role is not identical. On the democratic side, the equilibrium object `pi_t` determines whether an observed shock is converted into a credible claim before `A5` binds. On the autocratic side, `pi_t` directly governs whether coercive capacity remains intact.

### 4.1 Democracy

Let the non-exposed majority `N` choose `varphi_t in {0, bar{varphi}}`.

The key refinement relative to the previous draft is that democratic compensation depends on both:

1. an observed material shock, `ell_t = L`
2. a visible coalition, `pi_t >= bar{pi}`

The observed shock keeps the logic of reactive compensation. Visible mobilization makes that reaction politically credible.

If `N` compensates, its payoff is:

```math
U_N^{comp} = w_N - c bar{varphi}
```

If `N` refuses, its payoff is:

```math
U_N^{refuse} = w_N - 1[\ell_t = L] Gamma(pi_t)
```

where `Gamma'(pi_t) > 0` is the expected cost of instability. Use the step version:

```math
Gamma(pi_t) = gamma g(pi_t)
```

with `gamma > 0`. Then `N` compensates iff:

```math
\ell_t = L \quad \text{and} \quad gamma g(pi_t) \geq c bar{varphi}
```

Under the same scope condition as Appendix A,

```math
gamma \geq c bar{varphi}
```

the majority's best response in `t = 1` is:

```math
varphi_1(\ell_1, pi_1) = bar{varphi} 1[\ell_1 = L] g(pi_1)
```

By `A5`, baseline democratic capacity evolves according to:

```math
varphi_2 = varphi_1
```

So the democratic continuation map is:

- if the shock is observed in `t=1` and the coalition is visible, `varphi_1 = bar{varphi}` and that capacity carries into `t=2`
- if `ell_1 = 0`, or if `pi_1 < bar{pi}`, then `varphi_1 = 0`
- if the shock arrives only in `t=2`, `A5` prevents fresh activation

This refines the old `A3`. Democratic compensation remains reactive to an observed shock, but an observed shock is not sufficient by itself: it must also generate a visible coalition capable of making the threat from `E` politically credible.

For `E`, conditional on an observed shock in `t=1`, the public continuation gain from successfully crossing the visibility threshold is:

```math
Y_D
= [w_E - L(1-bar{varphi})] - [w_E - L]
= L bar{varphi}
= bar{kappa}
```

where:

```math
bar{kappa} = Delta + L = L - |Delta| > 0
```

by `A2`.

### 4.2 Autocracy

Let effective repression be:

```math
kappa^{eff}(pi_t) = kappa_0 eta(pi_t)
```

where the visibility of mass action causes defections, leakage, and external scrutiny. Use:

```math
eta(pi_t) = 1 - (1-eta_r) g(pi_t)
```

So:

- if `pi_t >= bar{pi}`, repression is degraded to `eta_r < 1`
- if `pi_t < bar{pi}`, repression remains fully effective: `eta = 1`

This yields:

```math
u_E(R \mid A, pi_t) = theta W - k - kappa_0 eta(pi_t)
```

and:

```math
u_E(M \mid A) = w_E - L
```

The public continuation gain from crossing the visibility threshold is:

```math
Y_A
= [theta W - k - kappa_0 eta_r] - [w_E - L]
= bar{kappa} - kappa_0 eta_r
```

Hence:

- if `kappa_0 eta_r < bar{kappa}`, visible coordination makes radical action attractive
- if `kappa_0 >= bar{kappa}`, low visibility keeps autocracy stable

This is precisely the moderate-autocracy interval behind Proposition 3:

```math
kappa_0 in [bar{kappa}, bar{kappa}/eta_r)
```

## 5. The Common Coordination Subgame

The key correction relative to the previous sketch is that collective action is an impure public good, not a pure private prize. If visibility is achieved, all exposed workers benefit from the regime-specific continuation outcome `Y_x`. Participants, however, also obtain a selective benefit from coalition membership.

This benefit is not an ad hoc taste for activism. The action `a_i = 1` should be read as *joining a visible coalition*, not merely expressing sympathy. Coalition membership creates an excludable club good once the coalition crosses the visibility threshold:

```math
z_i(a_i, pi_t; x) = a_i b_x 1[pi_t \geq bar{pi}], \qquad b_x > 0
```

Interpretation:

- in democracy, coalition members become the publicly identified claimants whose mobilization gives the threat credibility; they gain access to targeted emergency transfers, legal support, and bargaining leverage that cannot be extended to passive beneficiaries ex ante
- in autocracy, coalition members gain the mutual protection, communication channels, and ex post influence that only organized visible opposition can generate

This is an Olson-style selective incentive generated by coalition membership itself. The public outcome `Y_x` is shared by the group; what sustains participation is the member-only club good `b_x`. The same coalition technology operates in both regimes. What differs is the institutional content of the club good.

Let `m > 0` be the private cost of joining visible collective action if the coalition fails to cross the visibility threshold.

For regime `x in {D, A}`, define:

```math
q_i(s_i; sigma_j) = Pr[pi_t >= bar{pi} \mid s_i]
```

as worker `i`'s posterior probability that collective action becomes publicly visible.

Then the mobilization payoffs are:

```math
v_i(1 \mid x, s_i) = q_i(s_i; sigma_j) (Y_x + b_x) - [1-q_i(s_i; sigma_j)] m
```

```math
v_i(0 \mid x, s_i) = q_i(s_i; sigma_j) Y_x
```

Hence the incremental payoff from participation is:

```math
Delta v_i(1,0 \mid x, s_i)
= q_i(s_i; sigma_j) b_x - [1-q_i(s_i; sigma_j)] m
```

and the worker participates iff:

```math
q_i(s_i; sigma_j) \geq q_x^* \equiv \frac{m}{b_x + m}
```

So the same formal participation rule governs both regimes, but now it does so without suppressing the public-good character of the continuation outcome.

When `Y_x <= 0`, the public outcome from visible coordination is not valuable. In that case participation is not an equilibrium margin of interest. Thus the coordination channel is active only when `Y_x > 0`:

- democracy with `ell_t = L`: `Y_D = bar{kappa} > 0`
- moderate autocracy: `Y_A = bar{kappa} - kappa_0 eta_r > 0`

This is why the autocratic coordination margin matters only in the moderate-autocracy interval. If `Y_A <= 0`, even visible coordination cannot overturn repression and the autocracy is strong in the paper's terminology.

### 5.1 Equilibrium concept

Use Bayesian Nash equilibrium in monotone threshold strategies.

For the comparative-static argument, impose the following regularity condition:

**Assumption GG.**

1. the common fundamental `omega` has a continuous prior with full support on a compact interval
2. the signal family `s_i = omega + sigma epsilon_i` is a location family with continuous density satisfying monotone likelihood ratio in `s_i`
3. larger `sigma` Blackwell-degrades the private signal structure
4. conditional on others using a cutoff strategy, the visibility event `{pi_t >= bar{pi}}` is increasing in the fundamental `omega`

Under Assumption GG, standard global-games arguments can be applied directly to the participation stage.

The candidate equilibrium takes cutoff form:

```math
a_i^*(s_i; x, sigma_j) = 1[s_i \geq s_x^*(sigma_j)]
```

with equilibrium participation:

```math
pi_x^*(sigma_j) = Pr[s_i \geq s_x^*(sigma_j)]
```

### 5.2 Lemma 1: Cutoff equilibrium

Suppose:

1. Assumption GG holds
2. `b_x > 0`

Then `Delta v_i(1,0 \mid x, s_i)` is increasing in `s_i`, so the mobilization game admits a monotone cutoff equilibrium for each regime `x` and trajectory-specific noise `sigma_j`.

*Proof sketch.* Fix a conjectured cutoff `s_x^*` for all other agents. Because aggregate participation is increasing in the common fundamental `omega`, there exists a visibility cutoff `tilde{omega}_x(s_x^*, sigma_j)` such that visibility occurs iff `omega >= tilde{omega}_x`. Therefore:

```math
q_i(s_i; sigma_j, s_x^*) = Pr[\omega >= tilde{omega}_x(s_x^*, sigma_j) \mid s_i]
```

By Assumption GG, this posterior probability is increasing in `s_i`. Since:

```math
Delta v_i(1,0 \mid x, s_i)
= q_i(s_i; sigma_j, s_x^*) b_x - [1-q_i(s_i; sigma_j, s_x^*)] m
```

and `b_x, m > 0`, the gain from participation is also increasing in `s_i`. Hence best responses are threshold strategies, and equilibrium can be represented by a cutoff `s_x^*(sigma_j)`. `square`

The point of the lemma is modest but important: once participation is interpreted as coalition membership generating an excludable club good, the model no longer assumes away free riding; instead it yields a standard threshold-strategy participation rule.

### 5.3 Lemma 2: Noise comparative statics

Order the signal structures by Blackwell informativeness. Higher `sigma_j` makes private signals less informative about the common shock, thereby lowering the posterior probability that enough others will also find mobilization worthwhile. Under Assumption GG:

```math
s_x^*(sigma_j) \text{ is weakly increasing in } sigma_j
```

and therefore:

```math
pi_x^*(sigma_j) \text{ is weakly decreasing in } sigma_j
```

*Proof sketch.* For a fixed conjectured cutoff `s_x^*`, Blackwell degradation implies that the posterior `q_i(s_i; sigma_j, s_x^*)` is weakly lower at every signal realization when `sigma_j` increases. Therefore `Delta v_i(1,0 \mid x, s_i)` has increasing differences in `(s_i, -sigma_j)`: noisier environments make participation less attractive at every signal. Monotone comparative statics then imply a weakly higher equilibrium cutoff `s_x^*(sigma_j)`. Since equilibrium participation is the measure of agents with `s_i >= s_x^*(sigma_j)`, a higher cutoff yields weakly lower `pi_x^*(sigma_j)`. `square`

This is the comparative static that the earlier sketch only asserted.

### 5.4 Endogenous noise thresholds

The previous version introduced `sigma_D^*` and `sigma_A^*` ad hoc. Here they are endogenous objects.

For each regime `x` when `ell_t = L`, define the low-noise and high-noise limits:

- **Low-noise activation (`LN-x`)**:

```math
\lim_{\sigma \downarrow 0} pi_x^*(sigma) > bar{pi}
```

Intuitively, signals become nearly common knowledge and the coalition club good `b_x` makes participation worthwhile.

- **High-noise demobilization (`HN-x`)**:

```math
\lim_{\sigma \uparrow \infty} pi_x^*(sigma) < bar{pi}
```

A sufficient reduced-form condition for `HN-x` is that the common posterior success probability under maximally noisy signals, call it `q_x^0`, satisfies:

```math
q_x^0 b_x < (1-q_x^0) m
```

To turn these into a formal threshold result, add one continuity condition:

5. the equilibrium participation function `pi_x^*(sigma)` is continuous in `sigma`

Then:

**Proposition 0 (Endogenous noise threshold).** Suppose Assumption GG holds, `b_x > 0`, `pi_x^*(sigma)` is continuous in `sigma`, and conditions `LN-x` and `HN-x` are satisfied. Then there exists at least one endogenous cutoff:

```math
hat{sigma}_x \in (0,\infty)
```

such that:

```math
pi_x^*(hat{sigma}_x) = bar{pi}
```

and:

```math
pi_x^*(sigma) \geq bar{pi} \quad \text{for sufficiently low } sigma,
\qquad
pi_x^*(sigma) < bar{pi} \quad \text{for sufficiently high } sigma
```

If the comparative static in Lemma 2 is strict on the relevant interval, the cutoff is unique and satisfies:

```math
pi_x^*(sigma) \geq bar{pi} \iff sigma \leq hat{sigma}_x
```

*Proof sketch.* By Lemma 2, `pi_x^*(sigma)` is weakly decreasing in `sigma`. By continuity and conditions `LN-x` and `HN-x`, the Intermediate Value Theorem guarantees at least one crossing of `bar{pi}`. If the monotone decline is strict on the crossing interval, the crossing is unique. `square`

The model no longer assumes these thresholds. It derives them from equilibrium participation plus explicit regularity and parameter conditions.

## 6. From Signal Noise to A3 and A4

### 6.1 No-shock periods

When `omega_t = ell_t = 0`, `A1` implies there is no destabilizing outside option. The continuation gain from visibility is zero in both regimes, so:

```math
pi_D^*(sigma_j \mid ell_t = 0) = pi_A^*(sigma_j \mid ell_t = 0) = 0
```

This preserves the current paper's stable no-shock periods.

### 6.2 Rapid displacement: low `sigma`

Suppose:

```math
sigma_r < min\{hat{sigma}_D, hat{sigma}_A\}
```

Then:

```math
pi_D^*(sigma_r) >= bar{pi}
\qquad \text{and} \qquad
pi_A^*(sigma_r) >= bar{pi}
```

Hence, because rapid displacement also implies `ell_1 = L`, the democratic side yields:

```math
varphi_1^*(sigma_r) = bar{varphi}
```

and `A5` implies `varphi_2^*(sigma_r) = bar{varphi}` as inherited capacity, though this is irrelevant because `ell_2 = 0`.

On the autocratic side:

```math
eta^*(sigma_r) = eta_r
```

So rapid displacement delivers both:

- credible democratic threat and compensation
- visible autocratic opposition and degraded repression

### 6.3 Threshold automation: high `sigma`

Suppose:

```math
sigma_tau > max\{hat{sigma}_D, hat{sigma}_A\}
```

Then:

```math
pi_D^*(sigma_tau) < bar{pi}
\qquad \text{and} \qquad
pi_A^*(sigma_tau) < bar{pi}
```

Hence, because threshold automation implies `ell_1 = 0`, the democratic side yields:

```math
varphi_1^*(sigma_tau) = 0
```

and therefore, by `A5`:

```math
varphi_2^*(sigma_tau) = 0
```

On the autocratic side:

```math
eta^*(sigma_tau) = 1
```

So threshold automation delivers both:

- no credible democratic threat and no activated compensation
- disorganized autocratic opposition and fully effective repression

These two results now come from endogenous equilibrium thresholds in one coordination framework, not from two disconnected assumptions. On the democratic side, the primary driver of failure under threshold automation is still the original one: there is no observed shock in `t=1`, so no compensatory capacity is built before the `A5` window closes. The high-noise coordination result in `t=2` is confirmatory rather than essential for democratic instability; it shows that even ex post mobilization is unlikely to reopen the compensatory channel.

## 7. Recovering the Paper's Main Results

### 7.1 Democratic fragility

For weak democracies (`varphi_0 = 0` in the extension language):

- rapid displacement: `sigma_r` low implies `pi_D^* >= bar{pi}` exactly when the shock is observed in `t=1`, so `varphi_1 = bar{varphi}` and democracy is stable
- threshold automation: `ell_1 = 0`, so `varphi_1 = 0`; by `A5`, this already implies `varphi_2 = 0` when the shock finally arrives in `t=2`. The high-noise result `pi_D^* < bar{pi}` in `t=2` reinforces the conclusion, but the core democratic tragedy is the missed `t=1` window

This reproduces Proposition 1 with a larger inferential distance:

trajectory -> observed shock timing + `sigma` -> `pi_D^*` when `ell = L` -> credibility of threat -> compensation if the `t=1` window is open -> stability

instead of:

trajectory -> `A3`

### 7.2 Autocratic fragility

For autocracies with:

```math
kappa_0 in [bar{kappa}, bar{kappa}/eta_r)
```

- rapid displacement: `sigma_r` low implies `pi_A^* >= bar{pi}`, so `eta = eta_r` and `kappa_0 eta_r < bar{kappa}`; autocracy is unstable
- threshold automation: `sigma_tau` high implies `pi_A^* < bar{pi}`, so `eta = 1` and `kappa_0 >= bar{kappa}`; autocracy is stable

This reproduces Proposition 2 as an equilibrium result rather than a primitive.

Outside that interval, the existing typology is also preserved:

- if `kappa_0 < bar{kappa}`, the autocracy is weak and unstable regardless of `pi`
- if `kappa_0 >= bar{kappa}/eta_r`, the autocracy is strong and stable even when `pi >= bar{pi}`

### 7.3 Crossed fragility

Combining the two sides yields Proposition 3:

- under rapid displacement, democracy survives because low-noise coordination turns an observed `t=1` shock into a credible compensatory threat before `A5` closes the window, while autocracy fails because the same low-noise coordination degrades repression
- under threshold automation, democracy fails primarily because no shock is observed while the compensatory window is open, with high noise reinforcing weak ex post credibility, while autocracy survives because high noise preserves repression

The crossed pattern is now a property of one common informational-coordination framework interacting with distinct institutional continuation maps, even though equilibrium participation need not be numerically identical across regimes.

## 8. Numerical Illustration

Use the paper's parameter values:

- `w_E = 1`
- `W = 2`
- `L = 1`
- `theta = 0.5`
- `k = 0.4`
- `kappa_0 = 0.8`
- `eta_r = 0.5`

Then:

```math
Delta = theta W - k - w_E = -0.4
```

```math
bar{varphi} = 1 - |Delta|/L = 0.6
```

```math
bar{kappa} = Delta + L = 0.6
```

and:

```math
kappa_0 = 0.8 in [0.6, 1.2) = [bar{kappa}, bar{kappa}/eta_r)
```

So the regime is a moderate autocracy in the paper's terminology.

Add three coordination parameters for illustration:

- democratic coalition club good: `b_D = 0.3`
- autocratic coalition club good: `b_A = 0.1`
- visibility threshold: `bar{pi} = 0.5`
- failed-mobilization cost: `m = 0.1`

Then the participation thresholds are:

```math
q_D^* = \frac{0.1}{0.3 + 0.1} = 0.25
```

```math
q_A^* = \frac{0.1}{0.1 + 0.1} = 0.5
```

Interpretation:

- in democracy, workers need only a moderate posterior probability of successful collective visibility to join, because mobilization gives access to a large compensatory coalition
- in autocracy, workers need a higher posterior because the gain from visibly degrading repression is smaller, but it is still positive in the moderate-autocracy range

If the primitive signal structures satisfy:

```math
sigma_r < min\{hat{sigma}_D, hat{sigma}_A\}
\qquad \text{and} \qquad
sigma_tau > max\{hat{sigma}_D, hat{sigma}_A\}
```

then Lemma 2 implies that rapid displacement crosses the visibility threshold while threshold automation does not. The continuation maps are therefore:

- democracy under rapid: `varphi = 0.6`
- democracy under threshold: `varphi = 0`
- autocracy under rapid: `eta = 0.5`
- autocracy under threshold: `eta = 1`

This reproduces the paper's payoffs exactly:

- rapid + democracy: `u_E(M) = 1 - 1(1-0.6) = 0.6 = u_E(R)` -> stable
- rapid + autocracy: `u_E(R) = 0.5*2 - 0.4 - 0.8*0.5 = 0.2 > 0 = u_E(M)` -> unstable
- threshold + democracy: `u_E(R) = 0.6 > 0 = u_E(M)` -> unstable
- threshold + autocracy: `u_E(R) = 0.5*2 - 0.4 - 0.8 = -0.2 < 0 = u_E(M)` -> stable

The numerical example therefore survives intact. The difference is that `varphi` and `eta` are now generated by `pi*`, which is itself generated by `sigma`, and participation is now disciplined by a model that explicitly allows for free riding rather than assuming it away.

## 9. What This Buys Relative to the Current Architecture

### 9.1 Larger distance from premises to conclusions

The current body effectively says:

- trajectory -> `A3`
- trajectory -> `A4`
- `A3 + A4` -> crossed fragility

The unified version says:

- trajectory -> `sigma`
- `sigma` -> equilibrium participation `pi*`
- `pi*` -> democratic compensation and autocratic repression through the same visibility function `g(pi)`
- those continuation values -> regime stability

That is a materially longer inferential chain.

### 9.2 One mediator, not two

Coordination is no longer split across:

- a voting model for democracy
- a global game for autocracy

Instead, the same participation game does both jobs. Regime type changes the continuation map, not the underlying coordination mechanism.

But the paper should describe this carefully. Coordination is a common mediator, not an identically weighted proximate cause in both regimes. In democracy, timing and `A5` remain crucial because compensation must be activated while the shock is both observed and politically legible. In autocracy, realized coordination plays the more direct role because it changes the effectiveness of coercion itself.

### 9.3 Stronger interpretation of moderate autocracy

The interval:

```math
kappa_0 in [bar{kappa}, bar{kappa}/eta_r)
```

now has a clean equilibrium meaning:

- low visibility: repression suffices
- high visibility: repression fails

So "moderate autocracy" is no longer just an interval read off from `A4`; it is the set of autocracies for which coordination matters.

### 9.4 Cleaner role for Appendix A and Appendix B

Appendix A becomes a richer derivation of the democratic concession rule `varphi(pi)`.

Appendix B becomes a proof appendix for the existence, uniqueness, and comparative statics of `pi*(sigma)`.

The body now contains the actual mechanism.

## 10. Remaining Limitation

This sketch solves the main architecture problem, but one reduced-form step remains: the mapping from automation trajectory to signal noise. The gain is that this reduced form is now singular and transparent:

- one informational primitive (`sigma`)
- one coordination game
- two regime-specific continuation maps

That is a much cleaner target than the current pair of disconnected microfoundations.
