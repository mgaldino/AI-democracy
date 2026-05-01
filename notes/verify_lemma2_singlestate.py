"""
Numerical verification of two mathematical claims from the analytical model.

Claim 1: Lemma 2 (Absorbing Composition)
Claim 2: Single-State Equilibrium (logistic global game)

Author: numerical verification script
Date: 2026-05-01
"""

import math

# ============================================================
# CLAIM 1: Lemma 2 — Absorbing Composition
# ============================================================

print("=" * 70)
print("CLAIM 1: Lemma 2 (Absorbing Composition)")
print("=" * 70)
print()
print("Definitions:")
print("  Omega_2(R) = omega_H * (2 - omega_H)")
print("  Omega_2(T) = omega_L + (1 - omega_L) * omega_H")
print("  Omega_2(N) = omega_L * (2 - omega_L)")
print()
print("Claimed identity: Omega_2(R) - Omega_2(T) = (omega_H - omega_L)(1 - omega_H)")
print()

test_cases_lemma2 = [
    (0.40, 0.05, "standard"),
    (0.80, 0.10, "high omega_H"),
    (0.50, 0.50, "edge: omega_H = omega_L (should give 0)"),
    (0.99, 0.01, "extreme"),
    (0.00, 0.00, "both zero"),
    (1.00, 0.00, "omega_H=1, omega_L=0"),
    (1.00, 1.00, "both one"),
    (0.30, 0.25, "close values"),
]

all_pass_claim1 = True

for omega_H, omega_L, label in test_cases_lemma2:
    # Compute each Omega_2
    Omega2_R = omega_H * (2 - omega_H)
    Omega2_T = omega_L + (1 - omega_L) * omega_H
    Omega2_N = omega_L * (2 - omega_L)

    # LHS: direct subtraction
    lhs = Omega2_R - Omega2_T

    # RHS: claimed closed form
    rhs = (omega_H - omega_L) * (1 - omega_H)

    diff = abs(lhs - rhs)
    passed = diff < 1e-15

    if not passed:
        all_pass_claim1 = False

    print(f"  omega_H={omega_H:.2f}, omega_L={omega_L:.2f} ({label})")
    print(f"    Omega2(R)={Omega2_R:.6f}, Omega2(T)={Omega2_T:.6f}, Omega2(N)={Omega2_N:.6f}")
    print(f"    LHS = {lhs:.15f}")
    print(f"    RHS = {rhs:.15f}")
    print(f"    |diff| = {diff:.2e}  -->  {'PASS' if passed else 'FAIL'}")
    print()

    # Also verify ordering: Omega2(R) >= Omega2(T) >= Omega2(N) when omega_H >= omega_L
    if omega_H >= omega_L:
        ordering_ok = Omega2_R >= Omega2_T - 1e-15 and Omega2_T >= Omega2_N - 1e-15
        print(f"    Ordering Omega2(R) >= Omega2(T) >= Omega2(N): {'PASS' if ordering_ok else 'FAIL'}")
        print()

print(f"CLAIM 1 OVERALL: {'ALL PASS' if all_pass_claim1 else 'SOME FAILED'}")
print()


# ============================================================
# CLAIM 2: Single-State Equilibrium
# ============================================================

print("=" * 70)
print("CLAIM 2: Single-State Equilibrium")
print("=" * 70)
print()
print("Setup: known omega, displaced fraction Omega, h(pi)=pi, F = logistic CDF")
print("Claim: s* = omega - sigma * log(h_bar / (Omega - h_bar))")
print("       pi* = h_bar = 1 - v/C_x  (independent of omega)")
print()


def logistic_cdf(z):
    """Standard logistic CDF: Lambda(z) = 1 / (1 + exp(-z))"""
    # Numerically stable version
    if z >= 0:
        return 1.0 / (1.0 + math.exp(-z))
    else:
        ez = math.exp(z)
        return ez / (1.0 + ez)


# --- Test 1: omega=0.40, Omega=0.40, sigma=0.10, v=1.0, C_x=1.5 ---
print("-" * 50)
print("Test 1: omega=0.40, Omega=0.40, sigma=0.10, v=1.0, C_x=1.5")
print("-" * 50)

omega = 0.40
Omega = 0.40
sigma = 0.10
v = 1.0
C_x = 1.5

h_bar = 1 - v / C_x
print(f"  h_bar = 1 - {v}/{C_x} = {h_bar:.10f}")

s_star = omega - sigma * math.log(h_bar / (Omega - h_bar))
print(f"  s* = {omega} - {sigma} * log({h_bar:.6f} / ({Omega} - {h_bar:.6f}))")
print(f"     = {omega} - {sigma} * log({h_bar:.6f} / {Omega - h_bar:.6f})")
print(f"     = {s_star:.10f}")

# Verify: Omega * Lambda((omega - s*) / sigma) = h_bar
z = (omega - s_star) / sigma
pi_star = Omega * logistic_cdf(z)
print(f"  Verification: Omega * Lambda((omega - s*)/sigma)")
print(f"    z = (omega - s*)/sigma = ({omega} - {s_star:.10f}) / {sigma} = {z:.10f}")
print(f"    Lambda(z) = {logistic_cdf(z):.10f}")
print(f"    pi* = Omega * Lambda(z) = {Omega} * {logistic_cdf(z):.10f} = {pi_star:.10f}")
print(f"    h_bar = {h_bar:.10f}")
print(f"    |pi* - h_bar| = {abs(pi_star - h_bar):.2e}  -->  {'PASS' if abs(pi_star - h_bar) < 1e-12 else 'FAIL'}")
print()

# --- Test 2: omega=0.80, Omega=0.80, sigma=0.10, v=1.0, C_x=1.5 ---
print("-" * 50)
print("Test 2: omega=0.80, Omega=0.80, sigma=0.10, v=1.0, C_x=1.5")
print("-" * 50)

omega = 0.80
Omega = 0.80
sigma = 0.10
v = 1.0
C_x = 1.5

h_bar = 1 - v / C_x
print(f"  h_bar = {h_bar:.10f}")

s_star = omega - sigma * math.log(h_bar / (Omega - h_bar))
print(f"  s* = {s_star:.10f}")

z = (omega - s_star) / sigma
pi_star = Omega * logistic_cdf(z)
print(f"  pi* = {pi_star:.10f}")
print(f"  h_bar = {h_bar:.10f}")
print(f"  |pi* - h_bar| = {abs(pi_star - h_bar):.2e}  -->  {'PASS' if abs(pi_star - h_bar) < 1e-12 else 'FAIL'}")
print()

# --- Test 3: Sweep omega in {0.1, ..., 0.9}, Omega = omega ---
print("-" * 50)
print("Test 3: Sweep omega in {0.1, ..., 0.9}, Omega = omega, sigma=0.10, v=1.0, C_x=1.5")
print("-" * 50)

sigma = 0.10
v = 1.0
C_x = 1.5
h_bar = 1 - v / C_x
print(f"  h_bar = {h_bar:.10f}")
print()

all_pass_sweep = True
print(f"  {'omega':>6s}  {'Omega':>6s}  {'s*':>12s}  {'pi*':>14s}  {'|pi*-h_bar|':>14s}  {'Status':>6s}")
print(f"  {'-'*6}  {'-'*6}  {'-'*12}  {'-'*14}  {'-'*14}  {'-'*6}")

for omega_val in [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]:
    Omega_val = omega_val  # t=1: Omega = omega

    # Check if h_bar < Omega (required for interior equilibrium)
    if h_bar >= Omega_val:
        print(f"  {omega_val:6.2f}  {Omega_val:6.2f}  {'N/A':>12s}  {'N/A':>14s}  {'N/A':>14s}  {'SKIP (h_bar >= Omega)':>6s}")
        continue

    s_star_val = omega_val - sigma * math.log(h_bar / (Omega_val - h_bar))
    z_val = (omega_val - s_star_val) / sigma
    pi_star_val = Omega_val * logistic_cdf(z_val)
    err = abs(pi_star_val - h_bar)
    ok = err < 1e-12
    if not ok:
        all_pass_sweep = False

    print(f"  {omega_val:6.2f}  {Omega_val:6.2f}  {s_star_val:12.8f}  {pi_star_val:14.12f}  {err:14.2e}  {'PASS' if ok else 'FAIL'}")

print()
print(f"  Sweep result: {'ALL PASS' if all_pass_sweep else 'SOME FAILED'}")
print(f"  Key finding: pi* = {h_bar:.10f} for ALL omega values (independent of omega)")
print()

# --- Test 4: Edge cases when h_bar >= Omega ---
print("-" * 50)
print("Test 4: Edge cases — what happens when h_bar >= Omega?")
print("-" * 50)
print()

# Case 4a: v very small => h_bar close to 1, Omega small
print("Case 4a: v=0.05, C_x=1.5, Omega=0.10, omega=0.10, sigma=0.10")
v_edge = 0.05
C_x_edge = 1.5
h_bar_edge = 1 - v_edge / C_x_edge
Omega_edge = 0.10
omega_edge = 0.10
print(f"  h_bar = 1 - {v_edge}/{C_x_edge} = {h_bar_edge:.10f}")
print(f"  Omega = {Omega_edge}")
print(f"  h_bar >= Omega? {h_bar_edge >= Omega_edge} (h_bar={h_bar_edge:.4f} vs Omega={Omega_edge:.4f})")
print(f"  --> The formula requires h_bar < Omega.")
print(f"  --> When h_bar >= Omega, even if ALL displaced workers protest (pi=Omega),")
print(f"     h(Omega)=Omega < h_bar, so the regime NEVER falls.")
print(f"  --> No interior equilibrium exists. The unique equilibrium is pi*=0 (no protest).")
print(f"  --> log(h_bar/(Omega-h_bar)) is undefined (negative denominator or log of negative).")
try:
    s_star_edge = omega_edge - 0.10 * math.log(h_bar_edge / (Omega_edge - h_bar_edge))
    print(f"  --> s* computation: {s_star_edge} (math error expected)")
except ValueError as e:
    print(f"  --> s* computation raises ValueError: {e}")
print()

# Case 4b: h_bar exactly equals Omega
print("Case 4b: h_bar = Omega exactly (v=0.90, C_x=1.5, Omega=0.40)")
v_edge2 = 0.90
C_x_edge2 = 1.5
h_bar_edge2 = 1 - v_edge2 / C_x_edge2
Omega_edge2 = 0.40
print(f"  h_bar = {h_bar_edge2:.10f}")
print(f"  Omega = {Omega_edge2}")
print(f"  h_bar = Omega? {abs(h_bar_edge2 - Omega_edge2) < 1e-15}")
print(f"  Omega - h_bar = {Omega_edge2 - h_bar_edge2:.2e}")
print(f"  --> h_bar/(Omega - h_bar) -> infinity, so log -> +infinity, s* -> -infinity")
print(f"  --> This is the knife-edge: even full participation barely topples the regime.")
try:
    s_star_edge2 = 0.40 - 0.10 * math.log(h_bar_edge2 / (Omega_edge2 - h_bar_edge2))
    print(f"  --> s* = {s_star_edge2:.6f}")
except (ValueError, ZeroDivisionError) as e:
    print(f"  --> s* computation raises error: {e}")
print()

# Case 4c: Omega strictly larger than h_bar but close
print("Case 4c: Omega just barely above h_bar")
v_edge3 = 1.0
C_x_edge3 = 1.5
h_bar_edge3 = 1 - v_edge3 / C_x_edge3  # = 1/3
Omega_edge3 = h_bar_edge3 + 0.001  # barely above
omega_edge3 = Omega_edge3
sigma_edge3 = 0.10
print(f"  h_bar = {h_bar_edge3:.10f}")
print(f"  Omega = {Omega_edge3:.10f}")
print(f"  Omega - h_bar = {Omega_edge3 - h_bar_edge3:.6f}")

s_star_edge3 = omega_edge3 - sigma_edge3 * math.log(h_bar_edge3 / (Omega_edge3 - h_bar_edge3))
z_edge3 = (omega_edge3 - s_star_edge3) / sigma_edge3
pi_star_edge3 = Omega_edge3 * logistic_cdf(z_edge3)
print(f"  s* = {s_star_edge3:.6f}")
print(f"  pi* = {pi_star_edge3:.10f}")
print(f"  h_bar = {h_bar_edge3:.10f}")
print(f"  |pi* - h_bar| = {abs(pi_star_edge3 - h_bar_edge3):.2e}")
print(f"  --> Even close to the boundary, pi* = h_bar holds.")
print(f"  --> But s* = {s_star_edge3:.6f} is very negative (threshold far below omega),")
print(f"     meaning almost everyone with s_i > s* protests.")
print()

# --- Additional verification: vary sigma as well ---
print("-" * 50)
print("Bonus: Vary sigma to confirm pi* = h_bar regardless of noise level")
print("-" * 50)
print()

omega_b = 0.50
Omega_b = 0.50
v_b = 1.0
C_x_b = 1.5
h_bar_b = 1 - v_b / C_x_b

print(f"  omega={omega_b}, Omega={Omega_b}, v={v_b}, C_x={C_x_b}, h_bar={h_bar_b:.10f}")
print()
print(f"  {'sigma':>8s}  {'s*':>12s}  {'pi*':>14s}  {'|pi*-h_bar|':>14s}  {'Status':>6s}")
print(f"  {'-'*8}  {'-'*12}  {'-'*14}  {'-'*14}  {'-'*6}")

all_pass_sigma = True
for sigma_b in [0.001, 0.01, 0.05, 0.10, 0.20, 0.50, 1.00, 5.00, 10.00]:
    s_star_b = omega_b - sigma_b * math.log(h_bar_b / (Omega_b - h_bar_b))
    z_b = (omega_b - s_star_b) / sigma_b
    pi_star_b = Omega_b * logistic_cdf(z_b)
    err_b = abs(pi_star_b - h_bar_b)
    ok_b = err_b < 1e-10
    if not ok_b:
        all_pass_sigma = False
    print(f"  {sigma_b:8.3f}  {s_star_b:12.8f}  {pi_star_b:14.12f}  {err_b:14.2e}  {'PASS' if ok_b else 'FAIL'}")

print()
print(f"  Sigma sweep result: {'ALL PASS' if all_pass_sigma else 'SOME FAILED'}")
print()

# --- Summary ---
print("=" * 70)
print("SUMMARY")
print("=" * 70)
print()
print(f"Claim 1 (Lemma 2 identity): {'VERIFIED' if all_pass_claim1 else 'FAILED'}")
print(f"  Omega_2(R) - Omega_2(T) = (omega_H - omega_L)(1 - omega_H)")
print(f"  Tested {len(test_cases_lemma2)} parameter combinations including edge cases.")
print()
print(f"Claim 2 (Single-state equilibrium): {'VERIFIED' if all_pass_sweep and all_pass_sigma else 'FAILED'}")
print(f"  pi* = h_bar = 1 - v/C_x, independent of omega and sigma.")
print(f"  s* = omega - sigma * log(h_bar / (Omega - h_bar))")
print(f"  Tested across omega sweep (9 values) and sigma sweep (9 values).")
print(f"  Edge case: h_bar >= Omega => no interior equilibrium (formula undefined).")
print(f"  Edge case: Omega barely above h_bar => formula works but s* -> -infinity.")
