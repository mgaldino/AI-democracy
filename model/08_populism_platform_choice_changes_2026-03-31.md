# Change Log: Populism Platform Choice Extension

**Date:** 2026-03-31  
**Project:** IA-dem  
**Scope:** Item 13 of the work plan in `CLAUDE.md`

## Objective of This Round

Formalize the populism extension so that platform choice is endogenous. The key requirement was to stop pre-assigning `M-party` and `P-party` roles and instead model a choice between:

- `C`: compensation, with type-dependent payoff
- `R`: populism, with type-independent payoff

After discussion, the chosen institutional interpretation was **Option A: agenda-setting within `E`**. This means the baseline is not a full party competition model. It is a pre-Appendix-A stage in which an agenda-setter inside the exposed bloc decides whether `E` organizes around compensation or populism.

## Files Changed

### 1. `model/06_populism_numerical_sketch.R`

**Status:** updated

**Main changes**

- Replaced the old `M-party` versus `P-party` setup with a single choice problem.
- Defined platform choice using expected payoffs:
  - `Pi_C`
  - `Pi_R^0`
  - `Pi_R^1`
- Added a reduced-form self-reinforcing campaign term through `cleavage_amplification`.
- Derived and printed a heterogeneity threshold:
  - `sigma_bar = 2f / (B rho)` in the uniform example
- Added assertions verifying:
  - baseline assumptions from the main model
  - the autocratic crossed-fragility window
  - uniqueness under rapid automation
  - coexistence of equilibria at high enough `sigma_E`
  - disappearance of the populist equilibrium when `phi_0 >= phi_bar`
- Updated comments and output text to reflect **Option A**:
  - the actor is now an agenda-setter inside `E`
  - if `C` is chosen, the game moves to Appendix A, where `N` decides whether to finance compensation

**Substantive implication**

The sketch no longer implies that any `sigma_E > 0` generates populism. Instead, a populist equilibrium exists only when heterogeneity is large enough to make `R` profitable.

**Execution result**

The script ran successfully with `Rscript`. The only warnings were locale warnings during R startup.
After the final Option A wording cleanup, the script was run again and continued to execute successfully.

### 2. `model/07_populism_platform_choice_sketch.md`

**Status:** created and then revised

**Main changes**

- Wrote a full formal note for endogenous platform choice.
- Explicitly fixed the institutional baseline as **agenda-setting within `E`**.
- Added a section explaining how this stage fits with Appendix A:
  - Proposition 9 determines whether a compensatory demand exists
  - Appendix A determines whether `N` finances that demand
- Added a **paper-ready formulation** in manuscript style:
  - short setup paragraph
  - Proposition 9
  - proof sketch
  - interpretation paragraph
- Kept a compact analytical restatement of the proposition in symbolic form.
- Final editorial cleanup:
  - removed the duplicate "Candidate Proposition" header
  - relabeled the symbolic version as **Analytical Restatement**
- Added a **short stochastic extension**:
  - `Pr(win_R) = G(s_R^1 - s_C)`
  - this is explicitly treated as a later electoral layer, not the baseline

**Substantive implication**

The extension now has a clean baseline logic:

1. threshold automation creates internal heterogeneity in `E`
2. compensation remains uniform and therefore politically incomplete
3. populism pools heterogeneous grievances
4. campaign entry amplifies cleavage activation
5. two equilibria arise only when the agenda-setter finds `R` profitable

### 3. `quality_reports/2026-03-31_formal-model-design-populism-platform-choice-v1.md`

**Status:** created

**Purpose**

Saved a formal-model-design assessment of the redesigned extension.

**Result**

- Score: `8.5/10`
- Main strength: platform choice is now endogenous
- Main remaining weakness: campaign amplification is still reduced-form and should be described carefully as salience/fragmentation rather than as a new material payoff

## Conceptual Decisions Taken

### Decision 1: Choose Option A

The extension uses **agenda-setting within `E`** as the baseline institutional locus.

**Reason**

- most parsimonious
- closest to Appendix A
- preserves the focus of the paper on regime fragility rather than party competition
- avoids turning the extension into a separate electoral model

### Decision 2: Keep electoral competition stochastic and secondary

The deterministic baseline remains in the agenda-setting model. The electoral layer is postponed to a short stochastic extension.

**Reason**

- avoids overcomplicating the baseline
- addresses the concern that populist entry should imply only a chance of victory, not guaranteed success
- preserves the central mechanism while improving realism later

### Decision 3: Use the formal asymmetry already present in the model

The mechanism is built from an existing payoff difference:

- `u_i(C)` depends on `x_i`
- `u_i(R)` does not

**Reason**

This is the cleanest way to endogenize platform choice without importing an entirely new behavioral structure.

## Numerical Results Confirmed

Using the current calibration:

- `Delta = -0.4`
- `phi_bar = 0.6`
- `kappa_bar = 0.6`
- `sigma_bar = 0.24`

The script confirms:

- under `rapid`, only the compromise equilibrium exists
- under `threshold`, the populist equilibrium appears once `sigma_E` exceeds the threshold
- with the test grid used in the script, coexistence begins at `sigma_E = 0.30`
- if `phi_0 >= phi_bar`, only the compromise equilibrium survives

## Open Follow-Up

The next natural step is to decide whether this material enters the manuscript as:

- a new proposition in the main text (`P9`)
- a new appendix extending Appendix A
- a bridge section between Section 4 and Appendix A

Given the current design quality, the best candidate is **`P9` plus a short appendix-style derivation**.
