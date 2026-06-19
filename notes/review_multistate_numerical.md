# Numerical Verification of Multi-State Equilibrium Derivations

**Date**: 2026-05-02
**Script**: `model/verify_multistate_derivations.py`
**Source**: `notes/multistate_equilibrium_derivations.md`
**Tolerance**: 0.005

**Result**: 50 PASS, 0 FAIL out of 50 checks

---

## Summary Table

| ID | Description | Expected | Computed | Diff | Status |
|:---|:---|---:|---:|---:|:---:|
| D1.1a | v_dem = 1 + delta | 1.9000 | 1.9000 | 0.0000 | PASS |
| D1.1b | h_bar_dem < 0 (dominant strategy) | -0.2670 | -0.2667 | 0.0003 | PASS |
| D1.1c | pi_R(2) dem = Omega_2(R) | 0.5100 | 0.5100 | 0.0000 | PASS |
| D1.1d | pi_T(2) dem = Omega_2(T) | 0.6200 | 0.6200 | 0.0000 | PASS |
| D1.1e | pi_N(2) dem = Omega_2(N) | 0.0396 | 0.0396 | 0.0000 | PASS |
| D1.2a | h_bar_auto = 0.05 | 0.0500 | 0.0500 | 0.0000 | PASS |
| D1.2b | s* (autocracy t=1, right root) | 0.4578 | 0.4578 | 0.0000 | PASS |
| D1.2c | P(R|d=1,s*) at right root | 0.9740 | 0.9738 | 0.0002 | PASS |
| D1.2d | pi_R(1) autocracy | 0.0510 | 0.0513 | 0.0003 | PASS |
| D1.2e | pi_T(1) autocracy | 0.0008 | 0.0008 | 0.0000 | PASS |
| D1.2f | pi_N(1) autocracy | 0.0002 | 0.0002 | 0.0000 | PASS |
| D1.2g | Weighted avg = h_bar (IC check) | 0.0500 | 0.0500 | 0.0000 | PASS |
| D2.6a | w_R^{-inf} | 0.2230 | 0.2226 | 0.0004 | PASS |
| D2.6b | w_T^{-inf} | 0.4520 | 0.4520 | 0.0000 | PASS |
| D2.6c | w_N^{-inf} | 0.3250 | 0.3254 | 0.0004 | PASS |
| D2.5a | sum w*Omega = 0.096 | 0.0960 | 0.0959 | 0.0001 | PASS |
| D2.5b | G_{-inf} for autocracy = 0.046 | 0.0460 | 0.0459 | 0.0001 | PASS |
| D2.5c | G(s=-5) numerical | 0.0460 | 0.0459 | 0.0001 | PASS |
| D2.7 | s* approx from D2(e) | 0.4610 | 0.4609 | 0.0001 | PASS |
| D3.8a | pi_R(2) autocracy, concentrated, v2=1 | 0.5000 | 0.5000 | 0.0000 | PASS |
| D3.9 | pi_R(2) compensated => 0 | 0.0000 | 0.0000 | 0.0000 | PASS |
| D3.9b | h_bar_comp > Omega_2(R) => no protest | 1.0000 | 1.0000 | 0.0000 | PASS |
| D4.10a | pi_R(1) = 0.0513 | 0.0513 | 0.0513 | 0.0000 | PASS |
| D4.10b | margin with pi_A_fall=0.05 | 0.0013 | 0.0013 | 0.0000 | PASS |
| D4.11 | margin with pi_A_fall=0.06 | 0.0087 | 0.0087 | 0.0000 | PASS |
| D5.12a | v_cred = 1.36 | 1.3600 | 1.3600 | 0.0000 | PASS |
| D5.12b | h_bar_cred = 0.093 | 0.0930 | 0.0933 | 0.0003 | PASS |
| D5.12c | h_bar D×R = 0.093 | 0.0930 | 0.0933 | 0.0003 | PASS |
| D5.12d | pi_R(1) D×R | 0.0970 | 0.0969 | 0.0001 | PASS |
| D5_DxR_t2 | pi_R(2) D×R compensated = 0 | 0.0000 | 0.0000 | 0.0000 | PASS |
| D5_DxT_t1 | pi_T(1) D×T = 0.05 | 0.0500 | 0.0500 | 0.0000 | PASS |
| D5.13 | pi_T(2) D×T = 0.62 | 0.6200 | 0.6200 | 0.0000 | PASS |
| D5.14a | pi_R(1) A×R | 0.0510 | 0.0513 | 0.0003 | PASS |
| D5.14b | pi_R(2) A×R = 0.50 | 0.5000 | 0.5000 | 0.0000 | PASS |
| D5_elite_R | P(approve|omega_R) = 0.25 | 0.2500 | 0.2525 | 0.0025 | PASS |
| D5.15a | pi_T(1) A×T = 0.0008 | 0.0008 | 0.0008 | 0.0000 | PASS |
| D5_elite_T2 | P(approve|omega_T2) = 0.91 | 0.9100 | 0.9088 | 0.0012 | PASS |
| D5.15b | pi_T(2) A×T compensated = 0 | 0.0000 | 0.0000 | 0.0000 | PASS |
| Add.1 | Omega_2(R) = 0.51 | 0.5100 | 0.5100 | 0.0000 | PASS |
| Add.2 | Omega_2(T) = 0.62 | 0.6200 | 0.6200 | 0.0000 | PASS |
| Add.3 | Omega_2(N) = 0.0396 | 0.0396 | 0.0396 | 0.0000 | PASS |
| Add.4 | h_bar dem compensated = 0.493 | 0.4930 | 0.4933 | 0.0003 | PASS |
| Add.5 | Lambda(-1.58) ≈ 0.171 | 0.1710 | 0.1708 | 0.0002 | PASS |
| Add.6 | Lambda(-4.08) ≈ 0.017 | 0.0170 | 0.0166 | 0.0004 | PASS |
| Add.7 | Lambda(-4.38) ≈ 0.012 | 0.0120 | 0.0124 | 0.0004 | PASS |
| Add.8 | Single-state cutoff R = 0.139 | 0.1390 | 0.1391 | 0.0001 | PASS |
| Add.9 | h_bar D×R t=2 comp = 0.733 | 0.7330 | 0.7333 | 0.0003 | PASS |
| Add.10 | h_bar A×R t=2 = 0.500 | 0.5000 | 0.5000 | 0.0000 | PASS |
| Add.11 | h_bar A×T t=2 = 0.800 | 0.8000 | 0.8000 | 0.0000 | PASS |
| Add.12 | Lambda(-0.74) ≈ 0.323 | 0.3230 | 0.3230 | 0.0000 | PASS |

---

## Equilibrium Selection Analysis

The document uses the RIGHT root of G(s*) = 0 for the autocracy t=1 equilibrium.

**Number of roots found**: 1

### Root 1: s* = 0.457789

- P(R|d=1,s*) = 0.9738, P(T|d=1,s*) = 0.0187, P(N|d=1,s*) = 0.0075
- pi_R = 0.051328, pi_T = 0.000833, pi_N = 0.000248
- Weighted average = 0.050000 (h_bar = 0.0500)

**Selected root (rightmost)**: s* = 0.457789

**Rationale**: The rightmost root corresponds to the equilibrium where the posterior concentrates on state R (rapid displacement). This is the economically relevant equilibrium because: (1) it satisfies the standard equilibrium selection criterion in global games (the 'largest' cutoff), and (2) the posterior at this root heavily favors the high-displacement state, consistent with displaced workers updating rationally.

---

## Detailed Section Verification

### D1. State-Specific Protest

- D1.1a: v_dem = 1 + delta — expected 1.9000, got 1.9000 (PASS)
- D1.1b: h_bar_dem < 0 (dominant strategy) — expected -0.2670, got -0.2667 (PASS)
- D1.1c: pi_R(2) dem = Omega_2(R) — expected 0.5100, got 0.5100 (PASS)
- D1.1d: pi_T(2) dem = Omega_2(T) — expected 0.6200, got 0.6200 (PASS)
- D1.1e: pi_N(2) dem = Omega_2(N) — expected 0.0396, got 0.0396 (PASS)
- D1.2a: h_bar_auto = 0.05 — expected 0.0500, got 0.0500 (PASS)
- D1.2b: s* (autocracy t=1, right root) — expected 0.4578, got 0.4578 (PASS)
- D1.2c: P(R|d=1,s*) at right root — expected 0.9740, got 0.9738 (PASS)
- D1.2d: pi_R(1) autocracy — expected 0.0510, got 0.0513 (PASS)
- D1.2e: pi_T(1) autocracy — expected 0.0008, got 0.0008 (PASS)
- D1.2f: pi_N(1) autocracy — expected 0.0002, got 0.0002 (PASS)
- D1.2g: Weighted avg = h_bar (IC check) — expected 0.0500, got 0.0500 (PASS)

### D2. Cutoff Location

- D2.6a: w_R^{-inf} — expected 0.2230, got 0.2226 (PASS)
- D2.6b: w_T^{-inf} — expected 0.4520, got 0.4520 (PASS)
- D2.6c: w_N^{-inf} — expected 0.3250, got 0.3254 (PASS)
- D2.5a: sum w*Omega = 0.096 — expected 0.0960, got 0.0959 (PASS)
- D2.5b: G_{-inf} for autocracy = 0.046 — expected 0.0460, got 0.0459 (PASS)
- D2.5c: G(s=-5) numerical — expected 0.0460, got 0.0459 (PASS)
- D2.7: s* approx from D2(e) — expected 0.4610, got 0.4609 (PASS)

### D3. Prior Concentration

- D3.8a: pi_R(2) autocracy, concentrated, v2=1 — expected 0.5000, got 0.5000 (PASS)
- D3.9: pi_R(2) compensated => 0 — expected 0.0000, got 0.0000 (PASS)
- D3.9b: h_bar_comp > Omega_2(R) => no protest — expected 1.0000, got 1.0000 (PASS)

### D4. R x A Survival

- D4.10a: pi_R(1) = 0.0513 — expected 0.0513, got 0.0513 (PASS)
- D4.10b: margin with pi_A_fall=0.05 — expected 0.0013, got 0.0013 (PASS)
- D4.11: margin with pi_A_fall=0.06 — expected 0.0087, got 0.0087 (PASS)

### D5. Four Scenarios

- D5.12a: v_cred = 1.36 — expected 1.3600, got 1.3600 (PASS)
- D5.12b: h_bar_cred = 0.093 — expected 0.0930, got 0.0933 (PASS)
- D5.12c: h_bar D×R = 0.093 — expected 0.0930, got 0.0933 (PASS)
- D5.12d: pi_R(1) D×R — expected 0.0970, got 0.0969 (PASS)
- D5_DxR_t2: pi_R(2) D×R compensated = 0 — expected 0.0000, got 0.0000 (PASS)
- D5_DxT_t1: pi_T(1) D×T = 0.05 — expected 0.0500, got 0.0500 (PASS)
- D5.13: pi_T(2) D×T = 0.62 — expected 0.6200, got 0.6200 (PASS)
- D5.14a: pi_R(1) A×R — expected 0.0510, got 0.0513 (PASS)
- D5.14b: pi_R(2) A×R = 0.50 — expected 0.5000, got 0.5000 (PASS)
- D5_elite_R: P(approve|omega_R) = 0.25 — expected 0.2500, got 0.2525 (PASS)
- D5.15a: pi_T(1) A×T = 0.0008 — expected 0.0008, got 0.0008 (PASS)
- D5_elite_T2: P(approve|omega_T2) = 0.91 — expected 0.9100, got 0.9088 (PASS)
- D5.15b: pi_T(2) A×T compensated = 0 — expected 0.0000, got 0.0000 (PASS)

### Additional Checks

- Add.1: Omega_2(R) = 0.51 — expected 0.5100, got 0.5100 (PASS)
- Add.2: Omega_2(T) = 0.62 — expected 0.6200, got 0.6200 (PASS)
- Add.3: Omega_2(N) = 0.0396 — expected 0.0396, got 0.0396 (PASS)
- Add.4: h_bar dem compensated = 0.493 — expected 0.4930, got 0.4933 (PASS)
- Add.5: Lambda(-1.58) ≈ 0.171 — expected 0.1710, got 0.1708 (PASS)
- Add.6: Lambda(-4.08) ≈ 0.017 — expected 0.0170, got 0.0166 (PASS)
- Add.7: Lambda(-4.38) ≈ 0.012 — expected 0.0120, got 0.0124 (PASS)
- Add.8: Single-state cutoff R = 0.139 — expected 0.1390, got 0.1391 (PASS)
- Add.9: h_bar D×R t=2 comp = 0.733 — expected 0.7330, got 0.7333 (PASS)
- Add.10: h_bar A×R t=2 = 0.500 — expected 0.5000, got 0.5000 (PASS)
- Add.11: h_bar A×T t=2 = 0.800 — expected 0.8000, got 0.8000 (PASS)
- Add.12: Lambda(-0.74) ≈ 0.323 — expected 0.3230, got 0.3230 (PASS)

---

## Conclusion

All numerical claims in the derivations document verified successfully within tolerance.
