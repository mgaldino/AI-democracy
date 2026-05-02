# Verification Report: v5 Majority/Selectorate Claims

**Date**: 2026-05-01
**Reference**: `notes/analytical_formalization.md` (v5)
**Script**: `notes/verify_v5_majority_selectorate.py`

## Parameters

```
omega_R=0.30, omega_T1=0.05, omega_T2=0.60, omega_N=0.02
sigma=0.10, C_D=1.5, C_A=2.0, B=0.6, delta=0.9
p_R=0.30, p_T=0.30, p_N=0.40
gamma=0.3 (Y+ = 1.3)
```

## Results Summary

| Check | Claim | Status | Computed |
|-------|-------|--------|----------|
| 1. Majority approves under rapid t=1 | Phi_R > 0.286 | **PASS** | Phi_R = 1.000, majority = 1.000 |
| 2. Majority blocks under threshold t=1 | Phi_T < 0.474 | **FAIL** | Phi_T = 0.953, majority = 0.956 |
| 3. gamma* (flip value) | gamma=0.3 suffices | **FAIL** | gamma* > 2.0 (bisection hit ceiling) |
| 4. Arithmetic of required Phi | 0.286 and 0.474 | **PASS** | 0.5002 and 0.5003 |
| 5. Lemma 2 exact bounds | bound=0.484, Omega_2 values | **PASS** | All match to <0.001 |

**Overall: 3 PASS, 2 FAIL (Checks 2 and 3).**

## Detailed Findings

### Check 1: Majority under rapid t=1 -- PASS

- Displaced fraction omega_R = 0.30 (all vote YES).
- Employed fraction = 0.70 with Y = 1.
- Phi_R = 1.000 (100% of employed vote YES).
- Majority = 1.000.
- The majority approves unanimously.

**Note**: Phi_R = 1.0 is much stronger than the document's claimed threshold of 0.286. Every single employed worker votes YES because the insurance motive (delta * E[omega_2 | d=0, s]) dominates the tax cost (E[omega_1 | d=0, s]) for ALL signal values when delta=0.9. The employed workers see a substantial probability of theta=T (with omega_T2=0.60), making the expected future displacement high relative to current tax.

### Check 2: Majority under threshold t=1 -- FAIL

- Displaced fraction omega_T1 = 0.05 (all vote YES).
- Employed fraction = 0.95 with Y+ = 1.3.
- Phi_T = 0.953 (95.3% of employed vote YES).
- Majority = 0.956, well above 0.50.
- **The majority does NOT block compensation. It approves overwhelmingly.**

**Root cause**: The voting condition is `delta * P_hat > omega_hat * Y+`, where:
- P_hat = E[omega_2 | d=0, s] includes omega_T2 = 0.60 weighted by P(T|s).
- omega_hat = E[omega_1 | d=0, s] includes omega_T1 = 0.05 weighted by P(T|s).

The ratio E[omega_2] / E[omega_1] is approximately omega_T2/omega_T1 = 12. So `delta * P_hat / omega_hat` is approximately 0.9 * 12 = 10.8. The factor (1+gamma) = 1.3 is nowhere near enough to overcome this 10.8x ratio.

**At a typical signal s = 0.05 (center of distribution under theta=T):**
- P(R|s) = 0.08, P(T|s) = 0.39, P(N|s) = 0.53
- P_hat = 0.270, omega_hat = 0.054
- LHS = delta * P_hat = 0.243
- RHS = omega_hat * (1+gamma) = 0.071
- Ratio LHS/RHS = 3.43

The insurance motive overwhelms the tax cost because the threshold catastrophe (omega_T2=0.60) is so severe that even a moderate posterior on theta=T generates a large expected future displacement.

### Check 3: Sensitivity to gamma -- gamma* exceeds 2.0

| gamma | Y+ | Phi_T | Majority | Approves? |
|-------|----|-------|----------|-----------|
| 0.00 | 1.00 | 1.000 | 1.000 | YES |
| 0.10 | 1.10 | 0.995 | 0.995 | YES |
| 0.20 | 1.20 | 0.972 | 0.974 | YES |
| 0.30 | 1.30 | 0.953 | 0.956 | YES |
| 0.50 | 1.50 | 0.920 | 0.924 | YES |
| 1.00 | 2.00 | 0.852 | 0.859 | YES |

The bisection search for gamma* hit the ceiling at 2.0 without finding the flip point.

**Analytical estimate**: For a worker with signal near omega_T1=0.05, need (1+gamma) > delta * E[omega_2] / E[omega_1] = 0.9 * 0.270 / 0.054 = 4.46, so gamma > 3.46. At other signal values the ratio varies, but the MEDIAN employed worker requires gamma around 3-4 to flip to NO. The overall gamma* (where the majority of the 95% employed flips) is approximately 2.0-4.0, depending on the exact signal distribution tails.

With the given parameters, gamma=0.3 is an order of magnitude too small.

### Check 4: Arithmetic -- PASS

- Under rapid: omega_R + (1-omega_R)*0.286 = 0.30 + 0.70*0.286 = 0.5002. Exact threshold: 0.285714.
- Under threshold: omega_T1 + (1-omega_T1)*0.474 = 0.05 + 0.95*0.474 = 0.5003. Exact threshold: 0.473684.
- Both match the document's rounded claims within 0.01.

### Check 5: Lemma 2 exact bounds -- PASS

- Bound for Omega_2(T) > Omega_2(R): [omega_R*(2-omega_R) - omega_T1] / (1-omega_T1) = [0.51 - 0.05]/0.95 = 0.4842. Document claims 0.484. **Match.**
- Omega_2(T) = 0.05 + 0.95*0.60 = 0.6200. Document claims 0.62. **Match.**
- Omega_2(R) = 0.30*1.70 = 0.5100. Document claims 0.51. **Match.**
- Omega_2(T) = 0.62 > Omega_2(R) = 0.51. **Confirmed.**
- omega_T2 = 0.60 > bound = 0.484. **Confirmed.**

## Diagnosis of Check 2 Failure

The fundamental issue is that the voting condition `delta * P_hat > omega_hat * Y+` compares *expected future displacement* against *current tax rate times income*. Under theta=T at t=1:

1. **E[omega_2]** is high because it includes the catastrophic omega_T2 = 0.60 weighted by P(T|s) (around 0.39 at typical signals).
2. **E[omega_1]** is low because omega_T1 = 0.05 and omega_N = 0.02.
3. The ratio E[omega_2]/E[omega_1] is approximately 5x even after Bayesian updating, because the threshold trajectory's "time bomb" nature (low omega_1, high omega_2) creates a massive insurance motive.

**gamma only enters through the (1+gamma) multiplier on the tax side**, which is linear. But the insurance motive grows with the omega_T2/omega_T1 ratio, which is 12x. No reasonable gamma overcomes this.

## Potential Fixes

Three approaches could restore the majority-blocking result under threshold t=1:

### Fix A: Myopic workers (remove insurance motive)
If employed workers under threshold t=1 vote based only on *current* displacement risk (not forward-looking), the insurance motive disappears. The condition becomes: `delta * omega_1 * B > tau * Y+`, which for omega_T1=0.05 is easily blocked by gamma. This is the simplest fix but sacrifices the forward-looking structure.

### Fix B: Separate the tax and insurance bases
If the tax rate is based on current displacement (tau = omega_1 * B) but the insurance value uses a *discounted* or *ambiguity-weighted* E[omega_2], the ratio can be controlled. For example, if workers apply an ambiguity discount alpha to the catastrophic state: `P_hat_ambig = alpha * E[omega_2 | theta=T or N] * P(T or N) + ...`, with alpha < 1.

### Fix C: Change the threshold trajectory parameters
With omega_T2 closer to omega_T1 (say omega_T2 = 0.15), the insurance ratio drops. But this undermines the "time bomb" interpretation of the threshold trajectory.

### Fix D: Tax as level, not proportional to income
If the tax is a lump-sum tau = omega_hat * B (same for everyone regardless of income), then Y+ does not enter the condition. The majority blocks iff not enough workers want *any* insurance. This removes the Y+ channel entirely, which is the distinctive mechanism of v5.

## Conclusion

Checks 1, 4, and 5 pass. Checks 2 and 3 fail: the majority-blocking result under threshold t=1 does NOT hold with the given parameters and voting mechanism. The insurance motive (delta * E[omega_2]) is an order of magnitude larger than the tax cost (omega_hat * Y+) because the omega_T2/omega_T1 ratio is 12. The complementarity bonus gamma=0.3 is far too small to overcome this. The voting mechanism needs revision to produce the claimed majority reversal.
