# Endogenous Platform Choice under Threshold Automation

## Objective

This note replaces the ex-ante `M-party` versus `P-party` labels with a single agenda-setter inside the exposed bloc who chooses which platform to organize after the threshold shock is revealed. The key question is:

> When does an entrepreneur prefer to offer compensation (`C`) rather than populism (`R`)?

The answer must come from the model's own payoff structure. It cannot be imposed by labeling one actor "mainstream" and the other "populist."

## Setup

Focus on democracy at `t = 2` after a threshold trajectory:

- `l_1 = 0`, `l_2 = L`
- `phi_0 < phi_bar` unless stated otherwise
- exposed workers are heterogeneous because the complementary phase in `t = 1` generated unequal gains

Let exposed worker `i` have type `x_i`, interpreted as the worker's effective pre-shock income after the complementary phase. Under threshold automation:

`x_i ~ F_sigma`, centered at `w_E`, with dispersion `sigma_E`

Under rapid automation, there is no complementary phase, so `sigma_E = 0` and all workers have `x_i = w_E`.

## Institutional Locus: Agenda-Setting within `E`

The baseline interpretation is not a full electoral game between parties. It is an agenda-setting game inside the exposed bloc.

Timing:

1. The threshold shock `L` is revealed.
2. An agenda-setter chooses which program to organize for `E`: compensation (`C`) or populism (`R`).
3. Workers in `E` coordinate around the available program.
4. If `C` is successfully organized, the polity moves to the Appendix A stage: the non-exposed majority `N` decides whether to finance compensation.
5. If `R` is organized, the exposed bloc backs democratic backsliding.

This interpretation keeps the extension tightly connected to the existing model:

- the new stage determines whether `E` presents a coherent compensatory demand
- Appendix A still determines whether `N` pays for that demand
- `N` is not a co-designer of platforms; it remains the decisive payer once a compensatory agenda exists

So the extension does not replace Appendix A. It sits one step before it.

## Material Payoffs

If the agenda-setter offers compensation and the compensatory platform is implemented, worker `i` receives:

`u_i(C) = x_i - L(1 - phi_bar)`

If the agenda-setter offers populism, worker `i` receives the regime-change payoff already present in the baseline model:

`u_i(R) = theta W - k = w_E + Delta`

Because `phi_bar = 1 - |Delta| / L` and `Delta < 0`, we can rewrite the indifference condition as:

`u_i(R) >= u_i(C)` iff `x_i <= w_E`

This is the central asymmetry:

- `C` is type-dependent because payoff varies with `x_i`
- `R` is pooling because payoff is identical for every type

Under heterogeneity, compensation does not satisfy all exposed workers equally. That is the opening for populism.

## Agenda-Setter

Let the agenda-setter value political control of the exposed bloc by `B > 0`. Offering `R` also requires a fixed mobilization or branding cost `f > 0`.

### Support for `C`

If the agenda-setter offers `C`, support inside the exposed bloc is:

`s_C(sigma_E) = 1 - F_sigma(w_E)`

Under a symmetric continuous distribution, `s_C = 1/2`. Under rapid automation (`sigma_E = 0`), ties are broken in favor of moderation, so `s_C = 1`.

### Support for `R` without campaign momentum

If the agenda-setter considers `R` but voters do not expect a viable populist surge, support is only the material baseline:

`s_R^0(sigma_E) = F_sigma(w_E)`

Under rapid automation, `s_R^0(0) = 0`.

### Support for `R` with campaign momentum

If the agenda-setter offers `R`, the campaign itself activates an anti-elite cleavage and fragments the exposed bloc further. Represent this by a cutoff shift `psi(sigma_E)` with:

- `psi(0) = 0`
- `psi'(sigma_E) > 0`

Then realized support for `R` after entry is:

`s_R^1(sigma_E) = F_sigma(w_E + psi(sigma_E))`

with `s_R^1 > s_R^0` whenever `sigma_E > 0`.

This is the self-reinforcing component requested in Option B:

`R` enters -> campaign fragments `E` -> `R` becomes more attractive.

## Entrepreneur Payoffs

Define platform payoffs:

`Pi_C = B s_C(sigma_E)`

`Pi_R^0 = B s_R^0(sigma_E) - f`

`Pi_R^1 = B s_R^1(sigma_E) - f`

Interpretation:

- `Pi_C` is the value from coordinating a compensatory coalition inside `E`
- `Pi_R^0` is the payoff from trying `R` when populist momentum fails to materialize
- `Pi_R^1` is the payoff from trying `R` when entry itself triggers momentum

## Equilibrium Logic

There are two equilibrium conditions.

### Compromise equilibrium

If voters expect no viable populist surge, the agenda-setter compares `C` to `R` without momentum. A compromise equilibrium exists whenever:

`Pi_C >= Pi_R^0`

### Populist equilibrium

If voters expect populist momentum after entry, the agenda-setter compares `C` to `R` with momentum. A populist equilibrium exists whenever:

`Pi_R^1 >= Pi_C`

### Two-equilibrium region

Both equilibria coexist when:

`Pi_R^0 <= Pi_C <= Pi_R^1`

This is the minimal formal statement of self-fulfilling populist entry.

## Uniform Example

Take:

`x_i ~ Uniform[w_E - sigma_E, w_E + sigma_E]`

and let the campaign amplification term be:

`psi(sigma_E) = rho sigma_E^2`, with `rho > 0`

Then, for any `sigma_E > 0`:

`s_C = 1/2`

`s_R^0 = 1/2`

`s_R^1 = 1/2 + (rho sigma_E)/2`

So:

`Pi_C = B / 2`

`Pi_R^0 = B / 2 - f`

`Pi_R^1 = B (1/2 + rho sigma_E / 2) - f`

The compromise equilibrium always exists because `Pi_C >= Pi_R^0`.

The populist equilibrium exists iff:

`B (1/2 + rho sigma_E / 2) - f >= B / 2`

which simplifies to:

`sigma_E >= sigma_bar = 2f / (B rho)`

This yields a clean comparative-static result:

> Under threshold automation, weak democracies admit a populist equilibrium only when heterogeneity is large enough.

That is stronger than the earlier sketch, where any `sigma_E > 0` was enough by construction.

## Rapid versus Threshold

### Rapid

With `sigma_E = 0`, there is no internal heterogeneity and no campaign amplification:

- `s_C = 1`
- `s_R^0 = 0`
- `s_R^1 = 0`

Therefore `C` is uniquely optimal. Populism is not viable.

### Threshold

With `sigma_E > 0`, `C` no longer treats all exposed workers equally. The agenda-setter can profitably switch to `R` if the campaign-induced fragmentation is strong enough to satisfy `sigma_E >= sigma_bar`.

## Welfare State as Selector

If `phi_0 >= phi_bar`, compensation is automatic. Then the agenda-setter cannot block compensation by switching platforms, because the decisive institutional choice has already been made ex ante.

In reduced form:

- `s_C = 1`
- `s_R^0 = 0`
- `s_R^1 = 0`

So only the compromise equilibrium survives.

This gives Proposition 7 more depth:

`phi_0` is not only insurance against the shock itself. It also shuts down the political profitability of populist platform choice.

## Paper-Ready Formulation

This is the version closest to the style of the manuscript.

**Extension to Appendix A.** Insert one agenda-setting stage before the voting game. After the threshold shock is revealed, an agenda-setter inside `E` chooses which platform to organize:

- `C`: a compensatory demand that sends the game to Appendix A, where `N` decides whether to finance `phi_bar`
- `R`: a populist demand for democratic backsliding, delivering the regime-change payoff already present in the baseline model

Define platform payoffs:

`Pi_C = B s_C(sigma_E)`

`Pi_R^0 = B s_R^0(sigma_E) - f`

`Pi_R^1 = B s_R^1(sigma_E) - f`

where:

- `s_C(sigma_E)` is support for compensation inside `E`
- `s_R^0(sigma_E)` is support for populism absent campaign momentum
- `s_R^1(sigma_E)` is support for populism when entry itself activates anti-elite cleavage
- `s_R^1 > s_R^0` for all `sigma_E > 0`

**Proposition 9 (Agenda-setting and endogenous populist platform choice).**  
*Suppose democracy faces threshold automation, `phi_0 < phi_bar`, and exposed workers have types `x_i ~ F_sigma` centered at `w_E`. An agenda-setter inside `E` chooses between organizing compensation (`C`) and organizing populism (`R`). Then:*

1. *Under rapid automation (`sigma_E = 0`), only the compensatory equilibrium exists.*
2. *Under threshold automation, a compromise equilibrium exists if `Pi_C >= Pi_R^0`.*
3. *Under threshold automation, a populist equilibrium exists if `Pi_R^1 >= Pi_C`.*
4. *Hence weak democracies admit two equilibria whenever `Pi_R^0 <= Pi_C <= Pi_R^1`.*
5. *If `phi_0 >= phi_bar`, only the compensatory equilibrium exists.*

*Proof sketch.* Under rapid automation, `sigma_E = 0`, so all exposed workers have the same type and populism has no pooling advantage: `s_C = 1`, `s_R^0 = s_R^1 = 0`, so `Pi_C > Pi_R^1`. Under threshold automation, heterogeneity makes compensation politically incomplete because `u_i(C)` depends on `x_i` while `u_i(R)` does not. If the agenda-setter expects no populist momentum, `R` yields only `Pi_R^0`, so compensation survives whenever `Pi_C >= Pi_R^0`. If the agenda-setter expects populist entry to activate an anti-elite cleavage, `R` yields `Pi_R^1`, so populism is viable whenever `Pi_R^1 >= Pi_C`. Both inequalities can hold simultaneously, generating two equilibria. Finally, if `phi_0 >= phi_bar`, compensation is automatic and the agenda-setting margin disappears. `\blacksquare`

**Interpretation for the paper.** Proposition 9 does not replace Appendix A. It refines it. Appendix A explains when `N` pays for compensation once a compensatory demand exists. Proposition 9 explains when such a demand exists in the first place. The contribution is that threshold automation can fail democratically not because the shock is unseen, but because the complementary phase has already fragmented the exposed bloc before the majority decides whether to compensate it.

## Analytical Restatement

The same result can be restated compactly in symbolic form. Suppose democracy faces threshold automation, `phi_0 < phi_bar`, exposed workers have types `x_i ~ F_sigma` centered at `w_E`, and an agenda-setter inside `E` chooses between a compensatory platform `C` and a populist platform `R`. Let platform payoffs satisfy:

`Pi_C = B s_C(sigma_E)`,  
`Pi_R^0 = B s_R^0(sigma_E) - f`,  
`Pi_R^1 = B s_R^1(sigma_E) - f`,

with `s_R^1 > s_R^0` for all `sigma_E > 0`.

Then:

1. Under rapid automation (`sigma_E = 0`), only the compensatory equilibrium exists.
2. Under threshold automation, a compromise equilibrium exists if `Pi_C >= Pi_R^0`.
3. Under threshold automation, a populist equilibrium exists if `Pi_R^1 >= Pi_C`.
4. Hence weak democracies admit two equilibria whenever `Pi_R^0 <= Pi_C <= Pi_R^1`.
5. If `phi_0 >= phi_bar`, only the compensatory equilibrium exists.

## Why This Solves the Main Gap

The agenda-setter now chooses the platform endogenously. The choice is driven by a formal property already present in the model:

- compensation is uniform but type-dependent in payoff
- populism is pooling and type-independent in payoff

Heterogeneity matters because it makes a uniform compensatory platform politically incomplete. The self-reinforcing campaign term then makes `R` politically profitable in a way that does not require pre-assigning one actor to be "the populist." Under option A, this profitability is the ability to capture the agenda within `E`, not yet the ability to win the general election.

## Stochastic Extension for the Full Version

The final paper can later add an electoral layer by replacing deterministic populist success with a win probability. This should remain a short extension, not the baseline.

`Pr(win_R) = G(s_R^1 - s_C)`, with `G' > 0`

Then the agenda-setter offers `R` whenever:

`B Pr(win_R) >= f`

In paper language:

**Short stochastic extension.** *If populist success is probabilistic rather than deterministic, define `Pr(win_R) = G(s_R^1 - s_C)` with `G' > 0`. Then the agenda-setter offers `R` whenever `B Pr(win_R) >= f`. The qualitative logic of Proposition 9 is unchanged: greater heterogeneity raises the expected payoff from populism by increasing the probability that a populist platform captures the exposed bloc.*

This preserves the same intuition while avoiding the claim that entry guarantees victory.
