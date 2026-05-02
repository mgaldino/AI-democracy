# Verification: v5 Alt C Protest-as-Trigger Mechanism

**Date**: 2026-05-01
**Script**: `notes/verify_v5_altC_triggers.py`
**Overall**: 14/15 PASS, 1 FAIL (T×D crossed fragility)

## Parameters

| Parameter | Value |
|-----------|-------|
| ω_R | 0.30 |
| ω_T1 | 0.05 |
| ω_T2 | 0.60 |
| ω_N | 0.02 |
| σ | 0.10 |
| C_D | 1.5 |
| C_A | 2.0 |
| B | 0.6 |
| δ | 0.9 |
| p_R | 0.30 |
| p_T | 0.30 |
| p_N | 0.40 |
| σ_A | 0.15 |
| π̄_D^comp | 0.05 |
| π̄_D^fall | 0.40 |
| π̄_A^fall | 0.05 |

### Derived quantities

| Quantity | Value |
|----------|-------|
| Ω₁(R) = ω_R | 0.30 |
| Ω₁(T) = ω_T1 | 0.05 |
| Ω₂(R) = ω_R + (1-ω_R)ω_R | 0.51 |
| Ω₂(T) = ω_T1 + (1-ω_T1)ω_T2 | 0.62 |

## Check 1: Protest Levels (Single-State Approximation)

Equilibrium condition: h̄ = 1 - v/C_x. Interior eq at π* = h̄ iff h̄ < Ω; otherwise π = 0 (insufficient mass) or π = Ω (dominant strategy).

| Scenario | v | C_x | Ω | h̄ | π* | Status |
|----------|---|-----|---|----|----|--------|
| R×D t=1 comp | 1.360 | 1.5 | 0.30 | 0.0933 | 0.0933 | PASS |
| R×D t=1 no-comp | 1.900 | 1.5 | 0.30 | -0.267 | 0.3000 (dominant) | PASS |
| T×D t=1 | 0.000 | 1.5 | 0.05 | 1.000 | 0.0000 | PASS |
| T×D t=2 no-comp | 1.000 | 1.5 | 0.62 | 0.3333 | 0.3333 | PASS |
| R×A t=2 no-comp | 1.000 | 2.0 | 0.51 | 0.5000 | 0.5000 | PASS |
| T×A t=2 comp | 0.400 | 2.0 | 0.62 | 0.8000 | 0.0000 (no eq) | PASS |

### Key observations

- **R×A t=2**: h̄ = 0.50 is just barely below Ω₂(R) = 0.51. The interior equilibrium exists but by a margin of only 0.01. This is close to knife-edge for autocracy falling under rapid.
- **T×A t=2 comp**: h̄ = 0.80 >> Ω₂(T) = 0.62. Even with all displaced protesting, safety-in-numbers is insufficient. Zero protest. Robust.
- **T×D t=2 no-comp**: h̄ = 0.333 < Ω₂(T) = 0.62. Interior equilibrium exists with good margin.

## Check 2: Democratic Trigger (π̄_D^comp = 0.05)

| Scenario | π | > π̄_D^comp? | Implication | Status |
|----------|---|-------------|-------------|--------|
| R×D t=1 comp | 0.0933 | YES | Triggers comp law → self-confirming | PASS |
| R×D t=1 no-comp | 0.3000 | YES | Would trigger comp → NOT self-confirming | PASS |
| T×D t=1 | 0.0000 | NO | No trigger → no comp | PASS |
| T×D t=2 | 0.3333 | YES | Triggers comp, but LAG → φ₂ = 0 → falls | PASS |

**Consistency check**: Under R×D t=1, the "no-comp" scenario would itself trigger compensation (π = 0.30 >> 0.05). Therefore no-comp is not a self-confirming equilibrium — the unique equilibrium is comp. This validates the mechanism: democracy's responsiveness is endogenous.

## Check 3: Autocratic Trigger

Autocrat observes ω̃_S = ω + σ_A ε, and compensates iff ω̃_S > ω̄_A.

P(comp|ω) = Φ((ω - ω̄_A)/σ_A)

**Required**: P(comp|ω_R = 0.30) < 0.5 AND P(comp|ω_T2 = 0.60) > 0.5.

Exact range: **ω̄_A ∈ (0.30, 0.60)**, width = 0.30. NOT knife-edge.

| ω̄_A | P(comp\|ω_R) | P(comp\|ω_T2) | Valid? |
|------|-------------|--------------|--------|
| 0.30 | 0.5000 | 0.9772 | boundary |
| 0.35 | 0.3694 | 0.9522 | YES |
| 0.40 | 0.2525 | 0.9088 | YES |
| 0.45 | 0.1587 | 0.8413 | YES |
| 0.50 | 0.0912 | 0.7475 | YES |
| 0.55 | 0.0478 | 0.6306 | YES |
| 0.60 | 0.0228 | 0.5000 | boundary |

Chosen ω̄_A = 0.45: P(comp|R) = 0.159, P(comp|T2) = 0.841.

**Status: PASS**

## Check 4: Full Crossed Fragility

| Scenario | Expected | Actual | Status | Detail |
|----------|----------|--------|--------|--------|
| R×D | STABLE | STABLE | **PASS** | π₂ = 0.00 (comp φ₂=1, h̄=0.73 > Ω=0.51) |
| T×D | FALLS | **STABLE** | **FAIL** | π₂ = 0.333 < π̄_D^fall = 0.40 |
| R×A | FALLS | FALLS | **PASS** | π₂ = 0.50 > π̄_A^fall = 0.05 |
| T×A | STABLE | STABLE | **PASS** | π₂ = 0.00 (comp immediate, h̄=0.80 > Ω=0.62) |

### Diagnosis of FAIL: T×D

**Problem**: π₂(T×D) = 0.333 < π̄_D^fall = 0.40. Democracy does NOT fall under threshold with these parameters.

**Root cause**: h̄ = 1 - v/C_D = 1 - 1/1.5 = 0.333. The fall threshold π̄_D^fall = 0.40 is higher than the equilibrium protest level. Democracy absorbs the protest.

**Fix options** (any one suffices):

1. **Lower π̄_D^fall**: Setting π̄_D^fall < 0.333 (e.g., 0.30) makes T×D fall. But this conflicts with the interpretation that democracies absorb more protest than autocracies (π̄_D^fall > π̄_A^fall should still hold, and π̄_A^fall = 0.05, so 0.30 > 0.05 is fine).

2. **Lower C_D**: Reducing C_D to 1.2 gives h̄ = 1 - 1/1.2 = 0.167, and π = 0.167 — even lower. This goes the wrong direction for T×D.

3. **Raise ω_T2**: Increasing ω_T2 raises Ω₂(T), which already satisfies Ω₂ > h̄. The protest level is h̄, not Ω₂. So this does not change π. Irrelevant.

4. **Introduce backward-looking γ**: Adding v = 1 + γ for workers displaced in both periods would increase protest under rapid but NOT under threshold t=2 (since t=1 had low displacement). This helps R×A but not T×D.

5. **Lower C_D further while adjusting π̄_D^fall**: If C_D = 1.0, then v = 1 >= C_D → dominant strategy → π = Ω₂(T) = 0.62 > π̄_D^fall = 0.40. This works but changes R×D: v_comp = 0.4, h̄ = 0.60, Ω₂(R) = 0.51 → h̄ > Ω → π = 0. Still STABLE. And R×D t=1: v = 1.36 > C_D = 1.0 → dominant → π = 0.30. This is fine if π̄_D^fall = 0.40 > 0.30.

6. **Use non-displaced workers protesting**: If employed workers also protest (v_employed = δ E[ω₂] > 0), effective Ω increases beyond just displaced fraction. This is the most model-consistent fix.

**Recommended parameter adjustment for T×D to FAIL**:

- Set C_D = 1.0 (or any C_D ≤ v = 1.0). Then v ≥ C_D → dominant strategy → π = Ω₂(T) = 0.62 > 0.40. Democracy falls.
- Check R×D still works: v_comp = 1 - B = 0.4 < C_D = 1.0 → h̄ = 0.60 > Ω₂(R) = 0.51 → π = 0 → STABLE. Yes.
- Check R×D t=1: v = 1 + δ(1-B) = 1.36 > C_D = 1.0 → dominant → π = 0.30 < π̄_D^fall = 0.40 → survives. Yes.
- All four cells work with C_D = 1.0, π̄_D^fall = 0.40.

Alternatively, keep C_D = 1.5 and set π̄_D^fall = 0.30 (still > π̄_A^fall = 0.05).

## Summary

| Check | Items | Pass | Fail |
|-------|-------|------|------|
| 1. Protest levels | 6 | 6 | 0 |
| 2. Democratic triggers | 4 | 4 | 0 |
| 3. Autocratic trigger range | 1 | 1 | 0 |
| 4. Crossed fragility | 4 | 3 | 1 |
| **Total** | **15** | **14** | **1** |

**The single FAIL (T×D) is a parameter issue, not a model issue.** With the given parameters (C_D = 1.5, π̄_D^fall = 0.40), equilibrium protest under threshold t=2 is h̄ = 0.333, which falls below the democratic fall threshold. Adjusting either C_D (to 1.0) or π̄_D^fall (to 0.30) restores full crossed fragility. The mechanism is sound; the calibration needs tuning.

### Additional finding: R×A is near knife-edge

Under R×A t=2, h̄ = 0.50 and Ω₂(R) = 0.51. The interior equilibrium exists by a margin of 0.01. With ω_R = 0.29 instead of 0.30, Ω₂(R) = 0.4959 < 0.50 = h̄, and the equilibrium would collapse to π = 0 (autocracy survives). This sensitivity should be acknowledged or addressed by using slightly higher ω_R or lower C_A.
