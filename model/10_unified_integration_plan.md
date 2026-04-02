# Integration Plan for a Unified Global Game in `paper.md`

## 1. Goal

Integrate the microfoundations now split across Appendix A and Appendix B into the main body so that:

1. `A3` and `A4` become equilibrium consequences of one coordination game
2. `sigma` is the only trajectory-varying primitive
3. Proposition 3 is read as a property of equilibrium, not as a conjunction of two assumptions
4. `A5` remains a separate timing assumption
5. Propositions `P1-P4`, `P7-P8`, and the corollaries remain substantively unchanged

Do not change the paper's substantive claims. Change the architecture that generates them.

## 2. High-Level Editorial Strategy

The revision should move the paper from:

- simple baseline in the body
- substantive derivation in appendices

to:

- single substantive baseline in the body
- appendices as proof and robustness material

The key move is to replace separate assumptions `A3` and `A4` with a common coordination block:

- private signals: `s_i = omega + sigma epsilon_i`
- participation: `a_i in {0,1}`
- aggregate coordination: `pi`
- visibility function: `g(pi)`

Then let regime type change only the continuation map:

- democracy: `varphi(pi)`
- autocracy: `eta(pi)`

## 3. Section-by-Section Changes

### 3.1 Introduction

Keep the introduction's claims. Change only the framing sentence that currently points readers to two separate appendices.

Recommended adjustment:

- replace any wording that suggests "Appendix A microfounds democracy" and "Appendix B microfounds autocracy"
- instead say that Section 2 develops a unified coordination game and the appendices provide fuller proofs and alternative functional forms

No change is needed to the substantive contribution paragraph.

### 3.2 Section 2: The Model

This is the main rewrite.

#### Current structure

- `2.1 Environment`
- `2.2 Assumptions`

#### Proposed structure

- `2.1 Environment`
- `2.2 Information and Collective Action`
- `2.3 Regime-Specific Continuation Maps`
- `2.4 Assumptions and Parameter Restrictions`

#### What stays

- trajectories `ell_1 = L, ell_2 = 0` and `ell_1 = 0, ell_2 = L`
- payoffs for `u_E(M)` and `u_E(R)`
- notation `Delta`, `bar{varphi}`, `bar{kappa}`, `eta_r`
- `A1`, `A2`, `A5`

#### What changes

Remove `A3` and `A4` from the assumption list as primitives.

Replace them in Section 2 with:

1. a common signal structure

```math
s_{it} = omega_t + sigma_j epsilon_{it}
```

2. a participation stage

```math
a_{it} in \{0,1\}, \qquad pi_t = \int a_{it} di
```

3. a common visibility function `g(pi_t)` with a step-function version in the body and a smooth version optional for an appendix

4. regime-specific continuation maps:

- democracy: `varphi_t(pi_t) = bar{varphi} g(pi_t)` under the majority-cost condition `gamma >= c bar{varphi}`
- autocracy: `eta(pi_t) = 1 - (1-eta_r) g(pi_t)`

#### What to say explicitly in text

Add one paragraph stating:

- trajectory affects only signal noise
- coordination is the unique mediator
- regime type affects how visible coordination is processed institutionally

That sentence directly answers the reviewers' criticism.

### 3.3 Section 3: Results

This section should now have one extra step before the propositions.

#### Proposed internal flow

- `3.1 Equilibrium participation`
- `3.2 Democratic and autocratic stability`
- `3.3 Main propositions`

#### New result to insert before P1/P2

Add a lemma or proposition establishing:

- for each regime `x in {D,A}`, the coordination game has a unique monotone equilibrium
- equilibrium participation `pi_x^*(sigma)` is weakly decreasing in `sigma`
- therefore there exist cutoffs `sigma_D^*` and `sigma_A^*` such that low `sigma` implies `pi_x^* >= bar{pi}` and high `sigma` implies `pi_x^* < bar{pi}`

This lemma is the engine that replaces separate assumptions `A3` and `A4`.

#### Rewrite of Proposition 1

Keep the statement unchanged or nearly unchanged. Rewrite the proof so the logic is:

- rapid displacement -> low `sigma_r`
- low `sigma_r` -> `pi_D^* >= bar{pi}`
- `pi_D^* >= bar{pi}` -> majority authorizes `bar{varphi}`
- threshold automation -> high `sigma_tau`
- high `sigma_tau` -> `pi_D^* < bar{pi}`
- no credible compensatory threat; `A5` prevents late rescue

#### Rewrite of Proposition 2

Keep the statement unchanged. Rewrite the proof so the logic is:

- low `sigma_r` -> `pi_A^* >= bar{pi}` -> `eta = eta_r`
- high `sigma_tau` -> `pi_A^* < bar{pi}` -> `eta = 1`
- then apply the existing threshold comparisons with `bar{kappa}`

#### Rewrite of Proposition 3

Do not change the statement. Change the proof so the central sentence is no longer "combine P1 and P2" alone.

Recommended proof framing:

"The crossed pattern emerges because the same low-noise coordination equilibrium activates compensation in democracy but degrades repression in autocracy, while the same high-noise equilibrium suppresses compensation in democracy but preserves repression in autocracy."

That sentence should appear early in the proof.

#### Add one explicit credibility sentence after P3

Use a short paragraph acknowledging the inferential upgrade:

"In the unified model, Proposition 3 is not obtained by imposing separate regime-specific assumptions. It follows from one equilibrium object, `pi*`, generated by the trajectory-dependent information structure."

That directly addresses the Edmans concern about short distance from premises to conclusions.

### 3.4 Section 4: Welfare-State Extension

This section should remain mostly intact.

Only two adjustments are needed:

1. redefine weak democracy more explicitly as a democracy that relies on the coordination channel to activate compensation
2. add one sentence that `varphi_0` bypasses the coordination bottleneck for threshold shocks

Suggested sentence:

"Standing compensatory capacity, `varphi_0`, insures democracy against the low-participation equilibrium induced by high-noise threshold shocks."

The statements and proofs of `P7` and `P8` do not need substantive changes.

### 3.5 Discussion

Modify the limitation paragraph on regime-specific instruments.

Current problem:

- it reads as if the paper simply assumes democracies compensate and autocracies repress

Revised problem statement:

- the underlying coordination mechanism is unified, but the institutional continuation maps remain regime-specific

That is a milder and more defensible limitation.

Also add one sentence making clear that `sigma` remains reduced-form. This is now the main residual limitation.

## 4. What Happens to Appendix A and Appendix B

### Appendix A

Do not delete it outright. Reposition it.

Recommended role:

- keep it as the explicit majority-rule derivation of the democratic concession rule
- shorten the current opening so it is clearly labeled as a richer derivation of `varphi(pi)`, not the only place where democratic microfoundations live

In other words, Appendix A becomes:

"Proof-level democratic continuation map under majority rule"

rather than:

"The place where A3 is actually derived"

### Appendix B

Also keep it, but change its function.

Recommended role:

- provide the technical proof skeleton for existence, uniqueness, and monotone comparative statics of the coordination equilibrium
- optionally introduce smooth `g(pi)` and non-step versions of `eta(pi)`
- optionally place the formal Morris-Shin references and threshold-equilibrium details there

In other words, Appendix B becomes:

"Technical appendix for the unified global game"

rather than:

"Separate autocratic microfoundation"

### Net effect

Appendix A and Appendix B are absorbed conceptually into the baseline without having to disappear physically from the manuscript.

## 5. Recommended New Assumption Set

After integration, the cleanest assumption structure is:

- `A1`: stability without automation
- `A2`: automation can destabilize
- `A3`: visibility threshold `g(pi)` and monotone equilibrium participation under the global game
- `A4`: majority-cost condition and repression-discount condition as parameter restrictions, not trajectory-specific behavioral assumptions
- `A5`: institutional capacity requires lead time

If you want to preserve the numbering exactly, keep `A3` and `A4`, but rewrite their content:

- `A3` becomes the democratic continuation map induced by visible coordination
- `A4` becomes the autocratic continuation map induced by visible coordination

That is still better than the current version because the trajectory variation then enters through `sigma`, not directly through `varphi` or `eta`.

## 6. Notation Plan

Keep the paper's core notation:

- `Delta`
- `bar{varphi}`
- `bar{kappa}`
- `eta_r`
- `varphi_0`
- `kappa_0`

Add only:

- `s_i`
- `sigma_j`
- `a_i`
- `pi`
- `bar{pi}`
- `g(pi)`
- `m`

Avoid reusing symbols already overloaded in the current appendices:

- do not reuse `c` for failed participation cost
- do not introduce `x_i`
- do not write `eta_R`

That will also solve the notational criticisms in the formal-model review.

## 7. Proposition-by-Proposition Verification Checklist

### Baseline results

- `P1`: unchanged in statement; proof now runs through `sigma -> pi_D^* -> varphi`
- `P2`: unchanged in statement; proof now runs through `sigma -> pi_A^* -> eta`
- `P3`: unchanged in statement; strengthened in interpretation because it now emerges from one game
- `P4`: unchanged; uses the same payoffs after the continuation maps are determined
- `Remark 1`: unchanged
- `Remark 2`: unchanged
- `Corollary 1`: unchanged

### Extension results

- `P7`: unchanged; `varphi_0` now bypasses the low-participation problem
- `P8`: unchanged
- `Corollary 2`: unchanged

### Appendix C

- `P9`: no substantive change required
- only update any cross-references that currently describe Appendix A and Appendix B as separate regime-specific microfoundations

## 8. Minimal Writing Sequence

To implement the integration with the least disruption:

1. rewrite Section 2 first
2. add the new participation lemma at the top of Section 3
3. rewrite proofs of `P1-P3`
4. adjust the first paragraph of Section 4
5. reframe Appendix A and Appendix B
6. update cross-references in the introduction and discussion

This order minimizes the chance of local inconsistencies.

## 9. Why This Solves the Reviewers' Main Objection

The present manuscript invites the criticism that the body is "just arithmetic" because `A3` and `A4` already encode the answer.

The unified architecture changes the inferential chain to:

- trajectory -> `sigma`
- `sigma` -> equilibrium coordination `pi*`
- `pi*` -> regime-specific continuation map
- continuation map -> stability

That is the right architecture for the paper's strongest claim:

crossed fragility is not imposed separately in democracy and autocracy; it is generated by one coordination mechanism processed differently by two institutional environments.

## 10. Residual Risk

Even after integration, one reduced-form move remains: mapping trajectory shape into `sigma`. That should be acknowledged clearly in the paper.

But this is a much narrower and cleaner residual risk than the current setup, where both `A3` and `A4` look trajectory-specific by construction.
