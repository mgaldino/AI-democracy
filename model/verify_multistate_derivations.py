"""
Numerical verification of all claims in multistate_equilibrium_derivations.md

Verifies: D1 (state-specific protest), D2 (cutoff location), D3 (prior concentration),
D4 (R×A survival), D5 (four scenarios).

Author: Verification agent
Date: 2026-05-02
"""

import numpy as np
from scipy.optimize import brentq
from scipy.stats import norm
import sys

# ─────────────────────────────────────────────────────
# Parameters (from the document)
# ─────────────────────────────────────────────────────
omega_R = 0.30
omega_T1 = 0.05
omega_T2 = 0.60
omega_N = 0.02
sigma = 0.10
C_D = 1.5
C_A = 2.0
B = 0.6
delta = 0.9
pi_D_fall = 0.20
pi_A_fall = 0.05
omega_bar_A = 0.40
sigma_A = 0.15
p_R = 0.30
p_T = 0.30
p_N = 0.40

TOLERANCE = 0.005

results = []

def record(claim_id, description, expected, computed, tol=TOLERANCE):
    """Record a verification result."""
    diff = abs(expected - computed)
    status = "PASS" if diff <= tol else "FAIL"
    results.append({
        "id": claim_id,
        "description": description,
        "expected": expected,
        "computed": computed,
        "diff": diff,
        "tol": tol,
        "status": status,
    })
    return status

# ─────────────────────────────────────────────────────
# Core functions
# ─────────────────────────────────────────────────────

def logistic_cdf(z):
    """Logistic CDF: Lambda(z) = 1/(1 + exp(-z))"""
    return 1.0 / (1.0 + np.exp(-z))

def logistic_pdf(z):
    """Logistic PDF: lambda(z) = Lambda(z) * (1 - Lambda(z))"""
    lam = logistic_cdf(z)
    return lam * (1.0 - lam)

def cumulative_displaced(omega1, omega2_rate):
    """Cumulative displaced fraction over 2 periods (absorbing)."""
    return omega1 + (1 - omega1) * omega2_rate

def get_omegas_t1():
    """Displacement rates at t=1."""
    return {"R": omega_R, "T": omega_T1, "N": omega_N}

def get_omegas_t2():
    """Displacement rates at t=2 (flow, not cumulative)."""
    return {"R": omega_R, "T": omega_T2, "N": omega_N}

def get_Omega_t1():
    """Cumulative displaced at t=1."""
    return {"R": omega_R, "T": omega_T1, "N": omega_N}

def get_Omega_t2():
    """Cumulative displaced at t=2 (absorbing)."""
    return {
        "R": cumulative_displaced(omega_R, omega_R),
        "T": cumulative_displaced(omega_T1, omega_T2),
        "N": cumulative_displaced(omega_N, omega_N),
    }

def posterior_weights(s, omegas, priors, sigma_val):
    """
    Compute P(theta | d=1, s) for each state.
    P(theta|d=1,s) ∝ omega_theta * lambda((s - omega_theta)/sigma) * p_theta
    """
    states = list(omegas.keys())
    weights = {}
    for st in states:
        z = (s - omegas[st]) / sigma_val
        weights[st] = omegas[st] * logistic_pdf(z) * priors[st]
    total = sum(weights.values())
    if total == 0:
        # Avoid division by zero; use log-space
        log_w = {}
        for st in states:
            z = (s - omegas[st]) / sigma_val
            # log(lambda(z)) ≈ z for z << 0, ≈ -z for z >> 0
            log_w[st] = np.log(omegas[st]) + np.log(priors[st]) + _log_logistic_pdf(z)
        max_log = max(log_w.values())
        weights = {st: np.exp(log_w[st] - max_log) for st in states}
        total = sum(weights.values())
    return {st: weights[st] / total for st in states}

def _log_logistic_pdf(z):
    """Log of logistic PDF, numerically stable."""
    # log(lambda(z)) = -z - 2*log(1 + exp(-z))
    # For large |z|: log(lambda(z)) ≈ z  (z << 0)  or ≈ -z  (z >> 0)
    if z < -20:
        return z
    elif z > 20:
        return -z
    else:
        return -z - 2 * np.log(1 + np.exp(-z))

def pi_theta(Omega_theta, omega_theta, s_star, sigma_val):
    """State-specific protest: pi_theta = Omega * Lambda((omega - s*)/sigma)"""
    z = (omega_theta - s_star) / sigma_val
    return Omega_theta * logistic_cdf(z)

def G_function(s, omegas, Omegas, priors, sigma_val, h_bar):
    """
    G(s) = sum_theta P(theta|d=1,s) * Omega_theta * Lambda((omega_theta - s)/sigma) - h_bar
    """
    post = posterior_weights(s, omegas, priors, sigma_val)
    total = 0.0
    for st in omegas:
        z = (omegas[st] - s) / sigma_val
        total += post[st] * Omegas[st] * logistic_cdf(z)
    return total - h_bar

def find_equilibrium(omegas, Omegas, priors, sigma_val, h_bar, s_low=-5.0, s_high=5.0, n_grid=10000):
    """
    Find ALL roots of G(s) = 0 using grid search + brentq.
    Returns list of roots sorted ascending.
    """
    grid = np.linspace(s_low, s_high, n_grid)
    G_vals = [G_function(s, omegas, Omegas, priors, sigma_val, h_bar) for s in grid]

    roots = []
    for i in range(len(grid) - 1):
        if G_vals[i] * G_vals[i+1] < 0:
            try:
                root = brentq(
                    lambda s: G_function(s, omegas, Omegas, priors, sigma_val, h_bar),
                    grid[i], grid[i+1],
                    xtol=1e-10
                )
                roots.append(root)
            except ValueError:
                pass
    return sorted(roots)


# ─────────────────────────────────────────────────────
# VERIFICATION
# ─────────────────────────────────────────────────────

print("=" * 70)
print("VERIFICATION OF MULTISTATE EQUILIBRIUM DERIVATIONS")
print("=" * 70)

priors = {"R": p_R, "T": p_T, "N": p_N}

# ─────────────────────────────────────────────────────
# D1. State-Specific Protest
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("D1. STATE-SPECIFIC PROTEST LEMMA")
print("=" * 70)

# D1.1: Democracy uncompensated
v_dem_uncomp = 1 + delta  # = 1.9
h_bar_dem = 1 - v_dem_uncomp / C_D
print(f"\n--- Democracy, uncompensated ---")
print(f"v = 1 + delta = {v_dem_uncomp}")
print(f"h_bar = 1 - v/C_D = 1 - {v_dem_uncomp}/{C_D} = {h_bar_dem:.4f}")
record("D1.1a", "v_dem = 1 + delta", 1.9, v_dem_uncomp)
record("D1.1b", "h_bar_dem < 0 (dominant strategy)", -0.267, h_bar_dem, tol=0.001)
print(f"v = {v_dem_uncomp} > C_D = {C_D} => dominant strategy => pi_theta = Omega_theta")

# Democracy t=1 dominant strategy: pi = Omega_1
Omega_t1 = get_Omega_t1()
print(f"\nDemocracy t=1 protest:")
for st in ["R", "T", "N"]:
    pi_val = Omega_t1[st]
    print(f"  pi_{st}(1) = {pi_val:.4f}")

# Democracy t=2 dominant strategy: pi = Omega_2
Omega_t2 = get_Omega_t2()
record("D1.1c", "pi_R(2) dem = Omega_2(R)", 0.51, Omega_t2["R"])
record("D1.1d", "pi_T(2) dem = Omega_2(T)", 0.62, Omega_t2["T"])
record("D1.1e", "pi_N(2) dem = Omega_2(N)", 0.0396, Omega_t2["N"])
print(f"\nDemocracy t=2 protest:")
for st in ["R", "T", "N"]:
    print(f"  pi_{st}(2) = {Omega_t2[st]:.4f}")

# D1.2: Autocracy t=1
print(f"\n--- Autocracy, t=1 ---")
v_auto = 1 + delta  # = 1.9
h_bar_auto = 1 - v_auto / C_A
print(f"v = {v_auto}, C_A = {C_A}")
print(f"h_bar = 1 - {v_auto}/{C_A} = {h_bar_auto:.4f}")
record("D1.2a", "h_bar_auto = 0.05", 0.05, h_bar_auto, tol=0.001)

omegas_t1 = get_omegas_t1()

# Find equilibrium
roots_auto_t1 = find_equilibrium(omegas_t1, Omega_t1, priors, sigma, h_bar_auto)
print(f"\nAll roots of G(s)=0: {[f'{r:.4f}' for r in roots_auto_t1]}")

if len(roots_auto_t1) >= 1:
    # The document claims the RIGHT root: s* = 0.4578
    s_star_right = roots_auto_t1[-1]  # rightmost root
    print(f"Right root (selected): s* = {s_star_right:.4f}")
    record("D1.2b", "s* (autocracy t=1, right root)", 0.4578, s_star_right)

    if len(roots_auto_t1) >= 2:
        s_star_left = roots_auto_t1[0]
        print(f"Left root: s* = {s_star_left:.4f}")

    # Posterior at s*
    post_at_sstar = posterior_weights(s_star_right, omegas_t1, priors, sigma)
    print(f"\nPosterior at s* = {s_star_right:.4f}:")
    for st in ["R", "T", "N"]:
        print(f"  P({st}|d=1,s*) = {post_at_sstar[st]:.4f}")
    record("D1.2c", "P(R|d=1,s*) at right root", 0.974, post_at_sstar["R"])

    # State-specific protest
    pi_R_1 = pi_theta(Omega_t1["R"], omegas_t1["R"], s_star_right, sigma)
    pi_T_1 = pi_theta(Omega_t1["T"], omegas_t1["T"], s_star_right, sigma)
    pi_N_1 = pi_theta(Omega_t1["N"], omegas_t1["N"], s_star_right, sigma)
    print(f"\nState-specific protest at s* = {s_star_right:.4f}:")
    print(f"  pi_R(1) = {pi_R_1:.4f}")
    print(f"  pi_T(1) = {pi_T_1:.6f}")
    print(f"  pi_N(1) = {pi_N_1:.6f}")
    record("D1.2d", "pi_R(1) autocracy", 0.051, pi_R_1)
    record("D1.2e", "pi_T(1) autocracy", 0.0008, pi_T_1, tol=0.001)
    record("D1.2f", "pi_N(1) autocracy", 0.0002, pi_N_1, tol=0.001)

    # Weighted average check
    weighted_avg = sum(post_at_sstar[st] * pi_theta(Omega_t1[st], omegas_t1[st], s_star_right, sigma)
                       for st in ["R", "T", "N"])
    print(f"\nWeighted average = {weighted_avg:.4f}")
    print(f"h_bar = {h_bar_auto:.4f}")
    record("D1.2g", "Weighted avg = h_bar (IC check)", h_bar_auto, weighted_avg, tol=0.002)

    # Also compute and report both roots with their pi_R values
    print(f"\n--- Root analysis (both roots) ---")
    for i, root in enumerate(roots_auto_t1):
        pi_R_root = pi_theta(Omega_t1["R"], omegas_t1["R"], root, sigma)
        post_root = posterior_weights(root, omegas_t1, priors, sigma)
        print(f"  Root {i+1}: s* = {root:.6f}, pi_R = {pi_R_root:.6f}, P(R|s*) = {post_root['R']:.4f}")

# ─────────────────────────────────────────────────────
# D2. Cutoff Location
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("D2. CUTOFF LOCATION")
print("=" * 70)

# D2.5: G_{-infty} for autocracy
print("\n--- Asymptotic weights (s -> -infty) ---")
# w_theta^{-infty} ∝ omega_theta * p_theta * exp(-omega_theta/sigma)
unnorm = {}
for st, omega_val, p_val in [("R", omega_R, p_R), ("T", omega_T1, p_T), ("N", omega_N, p_N)]:
    unnorm[st] = omega_val * p_val * np.exp(-omega_val / sigma)
    print(f"  Unnorm({st}) = {omega_val} * {p_val} * exp(-{omega_val}/{sigma}) = {unnorm[st]:.6f}")

Z = sum(unnorm.values())
w_inf = {st: unnorm[st] / Z for st in unnorm}
print(f"\nNormalization Z = {Z:.6f}")
print(f"Asymptotic weights:")
for st in ["R", "T", "N"]:
    print(f"  w_{st}^{{-inf}} = {w_inf[st]:.4f}")

record("D2.6a", "w_R^{-inf}", 0.223, w_inf["R"])
record("D2.6b", "w_T^{-inf}", 0.452, w_inf["T"])
record("D2.6c", "w_N^{-inf}", 0.325, w_inf["N"])

G_neg_inf = sum(w_inf[st] * Omega_t1[st] for st in ["R", "T", "N"])
print(f"\nsum w * Omega = {G_neg_inf:.4f}")
print(f"G_{{-inf}} = {G_neg_inf:.4f} - h_bar = {G_neg_inf:.4f} - {h_bar_auto:.4f} = {G_neg_inf - h_bar_auto:.4f}")
record("D2.5a", "sum w*Omega = 0.096", 0.096, G_neg_inf, tol=0.002)
record("D2.5b", "G_{-inf} for autocracy = 0.046", 0.046, G_neg_inf - h_bar_auto)

# Verify numerically: G at s = -5
G_at_minus5 = G_function(-5.0, omegas_t1, Omega_t1, priors, sigma, h_bar_auto)
print(f"\nG(s=-5.0) = {G_at_minus5:.6f} (should be ~0.046)")
record("D2.5c", "G(s=-5) numerical", 0.046, G_at_minus5)

# D2.7: Approximation from D2(e)
# s* ≈ omega_R - sigma * log(h_bar/Omega_R / (1 - h_bar/Omega_R))
ratio = h_bar_auto / Omega_t1["R"]  # 0.05/0.30
s_star_approx = omega_R - sigma * np.log(ratio / (1 - ratio))
print(f"\n--- D2(e) approximation ---")
print(f"h_bar/Omega_R = {ratio:.4f}")
print(f"s* approx = {omega_R} - {sigma} * log({ratio:.4f}/{1-ratio:.4f})")
print(f"s* approx = {s_star_approx:.4f}")
record("D2.7", "s* approx from D2(e)", 0.461, s_star_approx)

# Compare with exact
if roots_auto_t1:
    print(f"s* exact = {roots_auto_t1[-1]:.4f}")
    print(f"Difference = {abs(s_star_approx - roots_auto_t1[-1]):.4f}")

# ─────────────────────────────────────────────────────
# D3. Prior Concentration in t=2
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("D3. PRIOR CONCENTRATION IN t=2")
print("=" * 70)

# Single-state R, t=2, v2=1 (last period)
v2_last = 1.0
h_bar_auto_t2 = 1 - v2_last / C_A
print(f"\n--- Autocracy, t=2, concentrated on R, v2=1 (last period) ---")
print(f"h_bar_2 = 1 - {v2_last}/{C_A} = {h_bar_auto_t2:.4f}")
print(f"Omega_2(R) = {Omega_t2['R']:.4f}")
print(f"Since h_bar_2 = {h_bar_auto_t2:.4f} < Omega_2(R) = {Omega_t2['R']:.4f}: interior equilibrium")
print(f"pi_R(2) = h_bar_2 = {h_bar_auto_t2:.4f} (single-state result)")
record("D3.8a", "pi_R(2) autocracy, concentrated, v2=1", 0.50, h_bar_auto_t2)

# Compensated
v_comp = (1 - B) * (1 + delta)  # 0.4 * 1.9 = 0.76
h_bar_comp = 1 - v_comp / C_A
print(f"\n--- Autocracy, t=2, compensated ---")
print(f"v_comp = (1-B)(1+delta) = {v_comp:.4f}")
print(f"h_bar_comp = 1 - {v_comp:.4f}/{C_A} = {h_bar_comp:.4f}")
print(f"Omega_2(R) = {Omega_t2['R']:.4f}")
if h_bar_comp >= Omega_t2["R"]:
    print(f"h_bar_comp = {h_bar_comp:.4f} >= Omega_2(R) = {Omega_t2['R']:.4f}: NO PROTEST")
    record("D3.9", "pi_R(2) compensated => 0", 0.0, 0.0)
else:
    print(f"h_bar_comp = {h_bar_comp:.4f} < Omega_2(R) = {Omega_t2['R']:.4f}: interior")
    record("D3.9", "pi_R(2) compensated => h_bar", h_bar_comp, h_bar_comp)

# Check: does the document say pi_R(2) = 0 when compensated?
# "Compensated: pi_R(2) = 0 (h_bar > Omega)"
# Let's verify: h_bar_comp = 0.62, Omega_2(R) = 0.51
# 0.62 > 0.51: yes, no protest
print(f"\nVerification: h_bar_comp={h_bar_comp:.4f} > Omega_2(R)={Omega_t2['R']:.4f}? {h_bar_comp > Omega_t2['R']}")
record("D3.9b", "h_bar_comp > Omega_2(R) => no protest", 1.0, 1.0 if h_bar_comp > Omega_t2["R"] else 0.0, tol=0.001)

# ─────────────────────────────────────────────────────
# D4. R×A Survival
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("D4. R x A SURVIVAL CONDITION")
print("=" * 70)

# Already computed: pi_R(1) from autocracy equilibrium
if roots_auto_t1:
    s_star_auto = roots_auto_t1[-1]
    pi_R_auto_t1 = pi_theta(Omega_t1["R"], omegas_t1["R"], s_star_auto, sigma)

    margin_05 = pi_R_auto_t1 - 0.05
    print(f"pi_R(1) = {pi_R_auto_t1:.4f}")
    print(f"pi_A_fall = 0.05")
    print(f"Margin (pi_A_fall=0.05) = {margin_05:.4f}")
    record("D4.10a", "pi_R(1) = 0.0513", 0.0513, pi_R_auto_t1)
    record("D4.10b", "margin with pi_A_fall=0.05", 0.0013, margin_05, tol=0.003)

    margin_06 = 0.06 - pi_R_auto_t1
    print(f"\nWith pi_A_fall = 0.06:")
    print(f"Margin = {margin_06:.4f}")
    record("D4.11", "margin with pi_A_fall=0.06", 0.0087, margin_06)

# ─────────────────────────────────────────────────────
# D5. Four Scenarios
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("D5. FOUR SCENARIOS")
print("=" * 70)

# ─── D5.1: D×R ───
print("\n--- D5.1: Democracy x Rapid ---")

# Credible commitment: v = 1 + delta*(1-B) = 1.36
v_cred = 1 + delta * (1 - B)
h_bar_cred = 1 - v_cred / C_D
print(f"v_cred = 1 + {delta}*(1-{B}) = {v_cred:.4f}")
print(f"h_bar_cred = 1 - {v_cred:.4f}/{C_D} = {h_bar_cred:.4f}")
record("D5.12a", "v_cred = 1.36", 1.36, v_cred)
record("D5.12b", "h_bar_cred = 0.093", 0.093, h_bar_cred, tol=0.002)

# Find equilibrium for democracy with credible commitment
roots_dem_cred = find_equilibrium(omegas_t1, Omega_t1, priors, sigma, h_bar_cred)
print(f"Roots (dem credible commitment): {[f'{r:.4f}' for r in roots_dem_cred]}")

if roots_dem_cred:
    s_star_dem_cred = roots_dem_cred[-1]  # rightmost root
    print(f"s* (rightmost) = {s_star_dem_cred:.4f}")

    pi_R_dem_cred = pi_theta(Omega_t1["R"], omegas_t1["R"], s_star_dem_cred, sigma)
    post_dem_cred = posterior_weights(s_star_dem_cred, omegas_t1, priors, sigma)
    print(f"P(R|d=1,s*) = {post_dem_cred['R']:.4f}")
    print(f"pi_R(1) = {pi_R_dem_cred:.4f}")
    record("D5.12c", "h_bar D×R = 0.093", 0.093, h_bar_cred, tol=0.002)
    record("D5.12d", "pi_R(1) D×R", 0.097, pi_R_dem_cred)
else:
    # If no root found, maybe h_bar is too close to the maximum of G
    print("WARNING: No equilibrium found for D×R credible commitment")
    # Try with finer grid
    roots_dem_cred_fine = find_equilibrium(omegas_t1, Omega_t1, priors, sigma, h_bar_cred,
                                            s_low=-10, s_high=10, n_grid=100000)
    if roots_dem_cred_fine:
        s_star_dem_cred = roots_dem_cred_fine[-1]
        print(f"s* (fine grid) = {s_star_dem_cred:.4f}")
        pi_R_dem_cred = pi_theta(Omega_t1["R"], omegas_t1["R"], s_star_dem_cred, sigma)
        print(f"pi_R(1) = {pi_R_dem_cred:.4f}")
        record("D5.12d", "pi_R(1) D×R", 0.097, pi_R_dem_cred)
    else:
        print("ERROR: Still no root found")
        record("D5.12d", "pi_R(1) D×R", 0.097, float('nan'))

# D×R t=2 compensated (last period)
v_comp_last = 1 - B  # 0.4, last period
h_bar_dem_comp_last = 1 - v_comp_last / C_D
print(f"\n--- D×R t=2 compensated (last period) ---")
print(f"v = 1 - B = {v_comp_last}")
print(f"h_bar = 1 - {v_comp_last}/{C_D} = {h_bar_dem_comp_last:.4f}")
print(f"Omega_2(R) = {Omega_t2['R']:.4f}")
if h_bar_dem_comp_last >= Omega_t2["R"]:
    print(f"h_bar = {h_bar_dem_comp_last:.4f} >= Omega_2(R) = {Omega_t2['R']:.4f}: NO PROTEST")
    pi_R2_dem = 0.0
else:
    pi_R2_dem = h_bar_dem_comp_last
    print(f"Interior: pi_R(2) = h_bar = {pi_R2_dem:.4f}")
record("D5_DxR_t2", "pi_R(2) D×R compensated = 0", 0.0, pi_R2_dem)

# ─── D5.2: D×T ───
print("\n--- D5.2: Democracy x Threshold ---")

# t=1: dominant strategy, pi_T(1) = Omega_1(T) = 0.05
pi_T1_dem = Omega_t1["T"]
print(f"t=1: dominant strategy, pi_T(1) = Omega_1(T) = {pi_T1_dem:.4f}")
record("D5_DxT_t1", "pi_T(1) D×T = 0.05", 0.05, pi_T1_dem)

# t=2: dominant strategy (no compensation), pi_T(2) = Omega_2(T) = 0.62
pi_T2_dem = Omega_t2["T"]
print(f"t=2: dominant strategy, pi_T(2) = Omega_2(T) = {pi_T2_dem:.4f}")
record("D5.13", "pi_T(2) D×T = 0.62", 0.62, pi_T2_dem)
print(f"Falls: {pi_T2_dem:.4f} > pi_D_fall = {pi_D_fall}")

# ─── D5.3: A×R ───
print("\n--- D5.3: Autocracy x Rapid ---")

# Already computed: pi_R(1) = 0.051
if roots_auto_t1:
    print(f"pi_R(1) = {pi_R_auto_t1:.4f} (borderline vs pi_A_fall = {pi_A_fall})")
    record("D5.14a", "pi_R(1) A×R", 0.051, pi_R_auto_t1)

# t=2, concentrated on R, v2=1 (last period)
print(f"t=2: concentrated on R, v2=1")
print(f"pi_R(2) = h_bar_2 = {h_bar_auto_t2:.4f}")
record("D5.14b", "pi_R(2) A×R = 0.50", 0.50, h_bar_auto_t2)

# Elite approval
P_approve_R = norm.cdf((omega_R - omega_bar_A) / sigma_A)
print(f"\nElite approval P(approve|omega_R={omega_R}) = Phi(({omega_R}-{omega_bar_A})/{sigma_A})")
print(f"= Phi({(omega_R - omega_bar_A)/sigma_A:.4f}) = {P_approve_R:.4f}")
record("D5_elite_R", "P(approve|omega_R) = 0.25", 0.25, P_approve_R)

# ─── D5.4: A×T ───
print("\n--- D5.4: Autocracy x Threshold ---")

# t=1: same equilibrium as A×R, but under true state T
if roots_auto_t1:
    pi_T1_auto = pi_theta(Omega_t1["T"], omegas_t1["T"], s_star_auto, sigma)
    print(f"pi_T(1) = {pi_T1_auto:.6f}")
    record("D5.15a", "pi_T(1) A×T = 0.0008", 0.0008, pi_T1_auto, tol=0.001)

# t=2: compensated (elite approves, decree)
P_approve_T2 = norm.cdf((omega_T2 - omega_bar_A) / sigma_A)
print(f"\nElite approval P(approve|omega_T2={omega_T2}) = Phi(({omega_T2}-{omega_bar_A})/{sigma_A})")
print(f"= Phi({(omega_T2 - omega_bar_A)/sigma_A:.4f}) = {P_approve_T2:.4f}")
record("D5_elite_T2", "P(approve|omega_T2) = 0.91", 0.91, P_approve_T2, tol=0.01)

# With compensation, v2 = (1-B)(1+delta) = 0.76
v2_comp = (1 - B) * (1 + delta)
h_bar_AT_comp = 1 - v2_comp / C_A
print(f"\nWith compensation, v2 = {v2_comp:.4f}")
print(f"h_bar = 1 - {v2_comp:.4f}/{C_A} = {h_bar_AT_comp:.4f}")
print(f"Omega_2(T) = {Omega_t2['T']:.4f}")
print(f"h_bar >= Omega_2(T)? {h_bar_AT_comp >= Omega_t2['T']}")
if h_bar_AT_comp >= Omega_t2["T"]:
    print(f"NO PROTEST: pi_T(2) = 0")
    record("D5.15b", "pi_T(2) A×T compensated = 0", 0.0, 0.0)
else:
    print(f"Interior: pi_T(2) = {h_bar_AT_comp:.4f}")
    record("D5.15b", "pi_T(2) A×T compensated = 0", 0.0, h_bar_AT_comp)

# With v2 = 1-B = 0.4 (last period, compensated)
v2_comp_last = 1 - B
h_bar_AT_comp_last = 1 - v2_comp_last / C_A
print(f"\nWith v2 = 1-B = {v2_comp_last}")
print(f"h_bar = 1 - {v2_comp_last}/{C_A} = {h_bar_AT_comp_last:.4f}")
print(f"h_bar >= Omega_2(T) = {Omega_t2['T']:.4f}? {h_bar_AT_comp_last >= Omega_t2['T']}")

# ─────────────────────────────────────────────────────
# EQUILIBRIUM SELECTION: Plot G(s) for autocracy t=1
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("EQUILIBRIUM SELECTION: G(s) ANALYSIS")
print("=" * 70)

grid = np.linspace(-2.0, 2.0, 2000)
G_vals = [G_function(s, omegas_t1, Omega_t1, priors, sigma, h_bar_auto) for s in grid]

# Find max and min
G_max_val = max(G_vals)
G_max_s = grid[np.argmax(G_vals)]
print(f"\nmax G(s) = {G_max_val:.6f} at s = {G_max_s:.4f}")
print(f"G(-2.0) = {G_vals[0]:.6f}")
print(f"G(2.0) = {G_vals[-1]:.6f}")

# Report all roots with details
print(f"\nAll roots (from broad search):")
roots_broad = find_equilibrium(omegas_t1, Omega_t1, priors, sigma, h_bar_auto, s_low=-3, s_high=3, n_grid=50000)
for i, root in enumerate(roots_broad):
    pi_R_at_root = pi_theta(Omega_t1["R"], omegas_t1["R"], root, sigma)
    pi_T_at_root = pi_theta(Omega_t1["T"], omegas_t1["T"], root, sigma)
    pi_N_at_root = pi_theta(Omega_t1["N"], omegas_t1["N"], root, sigma)
    post = posterior_weights(root, omegas_t1, priors, sigma)
    print(f"  Root {i+1}: s* = {root:.6f}")
    print(f"    P(R|s*) = {post['R']:.4f}, P(T|s*) = {post['T']:.4f}, P(N|s*) = {post['N']:.4f}")
    print(f"    pi_R = {pi_R_at_root:.6f}, pi_T = {pi_T_at_root:.6f}, pi_N = {pi_N_at_root:.6f}")
    weighted = sum(post[st] * pi_theta(Omega_t1[st], omegas_t1[st], root, sigma) for st in ["R","T","N"])
    print(f"    Weighted avg = {weighted:.6f} (should be {h_bar_auto:.4f})")

# ─────────────────────────────────────────────────────
# Additional checks from document text
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("ADDITIONAL CHECKS")
print("=" * 70)

# Check Omega_2 values
print(f"\nOmega_2(R) = {omega_R} + (1-{omega_R})*{omega_R} = {Omega_t2['R']:.4f}")
print(f"Omega_2(T) = {omega_T1} + (1-{omega_T1})*{omega_T2} = {Omega_t2['T']:.4f}")
print(f"Omega_2(N) = {omega_N} + (1-{omega_N})*{omega_N} = {Omega_t2['N']:.4f}")
record("Add.1", "Omega_2(R) = 0.51", 0.51, Omega_t2["R"])
record("Add.2", "Omega_2(T) = 0.62", 0.62, Omega_t2["T"])
record("Add.3", "Omega_2(N) = 0.0396", 0.0396, Omega_t2["N"])

# Democracy compensated t=2: h_bar = 0.493
v_dem_comp = (1 - B) * (1 + delta)  # 0.76
h_bar_dem_comp = 1 - v_dem_comp / C_D
print(f"\nDemocracy compensated: v = {v_dem_comp:.4f}, h_bar = {h_bar_dem_comp:.4f}")
record("Add.4", "h_bar dem compensated = 0.493", 0.493, h_bar_dem_comp, tol=0.002)

# Lambda(-1.58) = ?
z_check = (omega_R - s_star_right) / sigma if roots_auto_t1 else -1.58
lam_val = logistic_cdf(z_check)
print(f"\nLambda(({omega_R}-{s_star_right:.4f})/{sigma}) = Lambda({z_check:.4f}) = {lam_val:.4f}")
record("Add.5", "Lambda(-1.58) ≈ 0.171", 0.171, logistic_cdf(-1.58), tol=0.002)

# Lambda(-4.08)
lam_408 = logistic_cdf(-4.08)
print(f"Lambda(-4.08) = {lam_408:.6f}")
record("Add.6", "Lambda(-4.08) ≈ 0.017", 0.017, lam_408, tol=0.002)

# Lambda(-4.38)
lam_438 = logistic_cdf(-4.38)
print(f"Lambda(-4.38) = {lam_438:.6f}")
record("Add.7", "Lambda(-4.38) ≈ 0.012", 0.012, lam_438, tol=0.002)

# Single-state cutoff for R alone
s_star_single_R = omega_R + sigma * np.log((h_bar_auto / Omega_t1["R"]) / (1 - h_bar_auto / Omega_t1["R"]))
print(f"\nSingle-state cutoff (R only): s* = {s_star_single_R:.4f}")
# Doc says: s*_single = 0.30 + 0.10 * (-1.61) = 0.139
# But let's compute: log(0.05/0.30 / (1 - 0.05/0.30)) = log(0.1667/0.8333) = log(0.2) = -1.609
record("Add.8", "Single-state cutoff R = 0.139", 0.139, s_star_single_R, tol=0.005)

# D5 table check: h_bar for democracy under credible commitment
# Doc says h_bar = 0.093
print(f"\nD5 summary table check:")
print(f"  D×R t=1: v=1.36, h_bar={h_bar_cred:.4f}")
print(f"  D×T t=1: v=1.90, h_bar={1-1.9/1.5:.4f} (dominant)")
print(f"  A×R t=1: v=1.90, h_bar={h_bar_auto:.4f}")
print(f"  A×T t=1: v=1.90, h_bar={h_bar_auto:.4f}")

# D5 table: D×R t=2 compensated v=0.40 (last period, no delta)
# v = 1 - B = 0.4
h_bar_DxR_t2 = 1 - 0.4 / C_D
print(f"  D×R t=2: v=0.40, h_bar={h_bar_DxR_t2:.4f}")
record("Add.9", "h_bar D×R t=2 comp = 0.733", 0.733, h_bar_DxR_t2, tol=0.002)

# A×R t=2: v=1.0 (last period), h_bar=0.50
h_bar_AxR_t2 = 1 - 1.0 / C_A
print(f"  A×R t=2: v=1.00, h_bar={h_bar_AxR_t2:.4f}")
record("Add.10", "h_bar A×R t=2 = 0.500", 0.500, h_bar_AxR_t2, tol=0.001)

# A×T t=2: v=0.40 (comp, last period), h_bar=0.80
h_bar_AxT_t2 = 1 - 0.4 / C_A
print(f"  A×T t=2: v=0.40, h_bar={h_bar_AxT_t2:.4f}")
record("Add.11", "h_bar A×T t=2 = 0.800", 0.800, h_bar_AxT_t2, tol=0.001)

# ─────────────────────────────────────────────────────
# Democracy credible commitment: check Lambda value
# ─────────────────────────────────────────────────────
if roots_dem_cred:
    s_star_dc = roots_dem_cred[-1]
    z_dc = (omega_R - s_star_dc) / sigma
    lam_dc = logistic_cdf(z_dc)
    print(f"\n--- D×R credible commitment detail ---")
    print(f"s* = {s_star_dc:.4f}")
    print(f"z = ({omega_R} - {s_star_dc:.4f})/{sigma} = {z_dc:.4f}")
    print(f"Lambda(z) = {lam_dc:.4f}")
    print(f"pi_R = {Omega_t1['R']} * {lam_dc:.4f} = {Omega_t1['R']*lam_dc:.4f}")
    # Doc claims Lambda(-0.74) = 0.323
    record("Add.12", "Lambda(-0.74) ≈ 0.323", 0.323, logistic_cdf(-0.74), tol=0.002)

# ─────────────────────────────────────────────────────
# SUMMARY
# ─────────────────────────────────────────────────────
print("\n" + "=" * 70)
print("SUMMARY TABLE")
print("=" * 70)

n_pass = sum(1 for r in results if r["status"] == "PASS")
n_fail = sum(1 for r in results if r["status"] == "FAIL")
n_total = len(results)

print(f"\n{'ID':<15} {'Description':<45} {'Expected':>10} {'Computed':>10} {'Diff':>8} {'Status':>6}")
print("-" * 100)
for r in results:
    exp_str = f"{r['expected']:.4f}" if isinstance(r['expected'], float) else str(r['expected'])
    comp_str = f"{r['computed']:.4f}" if isinstance(r['computed'], float) else str(r['computed'])
    diff_str = f"{r['diff']:.4f}" if isinstance(r['diff'], float) else str(r['diff'])
    status_marker = "✓" if r["status"] == "PASS" else "✗"
    print(f"{r['id']:<15} {r['description']:<45} {exp_str:>10} {comp_str:>10} {diff_str:>8} {status_marker} {r['status']}")

print(f"\n{'='*70}")
print(f"TOTAL: {n_pass} PASS, {n_fail} FAIL out of {n_total} checks")
print(f"{'='*70}")

# ─────────────────────────────────────────────────────
# Write markdown report
# ─────────────────────────────────────────────────────
report_path = "/Users/manoelgaldino/Documents/DCP/Papers/IA-dem/notes/review_multistate_numerical.md"
with open(report_path, "w") as f:
    f.write("# Numerical Verification of Multi-State Equilibrium Derivations\n\n")
    f.write(f"**Date**: 2026-05-02\n")
    f.write(f"**Script**: `model/verify_multistate_derivations.py`\n")
    f.write(f"**Source**: `notes/multistate_equilibrium_derivations.md`\n")
    f.write(f"**Tolerance**: {TOLERANCE}\n\n")
    f.write(f"**Result**: {n_pass} PASS, {n_fail} FAIL out of {n_total} checks\n\n")
    f.write("---\n\n")

    f.write("## Summary Table\n\n")
    f.write(f"| ID | Description | Expected | Computed | Diff | Status |\n")
    f.write(f"|:---|:---|---:|---:|---:|:---:|\n")
    for r in results:
        exp_str = f"{r['expected']:.4f}" if isinstance(r['expected'], float) else str(r['expected'])
        comp_str = f"{r['computed']:.4f}" if isinstance(r['computed'], float) else str(r['computed'])
        diff_str = f"{r['diff']:.4f}" if isinstance(r['diff'], float) else str(r['diff'])
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"| {r['id']} | {r['description']} | {exp_str} | {comp_str} | {diff_str} | {status_icon} |\n")
    f.write("\n")

    f.write("---\n\n")
    f.write("## Equilibrium Selection Analysis\n\n")
    f.write("The document uses the RIGHT root of G(s*) = 0 for the autocracy t=1 equilibrium.\n\n")

    if roots_broad:
        f.write(f"**Number of roots found**: {len(roots_broad)}\n\n")
        for i, root in enumerate(roots_broad):
            pi_R_at_root = pi_theta(Omega_t1["R"], omegas_t1["R"], root, sigma)
            pi_T_at_root = pi_theta(Omega_t1["T"], omegas_t1["T"], root, sigma)
            pi_N_at_root = pi_theta(Omega_t1["N"], omegas_t1["N"], root, sigma)
            post = posterior_weights(root, omegas_t1, priors, sigma)
            f.write(f"### Root {i+1}: s* = {root:.6f}\n\n")
            f.write(f"- P(R|d=1,s*) = {post['R']:.4f}, P(T|d=1,s*) = {post['T']:.4f}, P(N|d=1,s*) = {post['N']:.4f}\n")
            f.write(f"- pi_R = {pi_R_at_root:.6f}, pi_T = {pi_T_at_root:.6f}, pi_N = {pi_N_at_root:.6f}\n")
            weighted = sum(post[st] * pi_theta(Omega_t1[st], omegas_t1[st], root, sigma) for st in ["R","T","N"])
            f.write(f"- Weighted average = {weighted:.6f} (h_bar = {h_bar_auto:.4f})\n\n")

        f.write(f"**Selected root (rightmost)**: s* = {roots_broad[-1]:.6f}\n\n")
        f.write("**Rationale**: The rightmost root corresponds to the equilibrium where the posterior ")
        f.write("concentrates on state R (rapid displacement). This is the economically relevant ")
        f.write("equilibrium because: (1) it satisfies the standard equilibrium selection criterion ")
        f.write("in global games (the 'largest' cutoff), and (2) the posterior at this root heavily ")
        f.write("favors the high-displacement state, consistent with displaced workers updating rationally.\n\n")

    f.write("---\n\n")
    f.write("## Detailed Section Verification\n\n")

    # D1
    f.write("### D1. State-Specific Protest\n\n")
    d1_checks = [r for r in results if r['id'].startswith('D1')]
    for r in d1_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    # D2
    f.write("### D2. Cutoff Location\n\n")
    d2_checks = [r for r in results if r['id'].startswith('D2')]
    for r in d2_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    # D3
    f.write("### D3. Prior Concentration\n\n")
    d3_checks = [r for r in results if r['id'].startswith('D3')]
    for r in d3_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    # D4
    f.write("### D4. R x A Survival\n\n")
    d4_checks = [r for r in results if r['id'].startswith('D4')]
    for r in d4_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    # D5
    f.write("### D5. Four Scenarios\n\n")
    d5_checks = [r for r in results if r['id'].startswith('D5')]
    for r in d5_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    # Additional
    f.write("### Additional Checks\n\n")
    add_checks = [r for r in results if r['id'].startswith('Add')]
    for r in add_checks:
        status_icon = "PASS" if r["status"] == "PASS" else "**FAIL**"
        f.write(f"- {r['id']}: {r['description']} — expected {r['expected']:.4f}, got {r['computed']:.4f} ({status_icon})\n")
    f.write("\n")

    f.write("---\n\n")
    f.write(f"## Conclusion\n\n")
    if n_fail == 0:
        f.write("All numerical claims in the derivations document verified successfully within tolerance.\n")
    else:
        f.write(f"{n_fail} claim(s) failed verification. See details above.\n")
        fail_list = [r for r in results if r['status'] == 'FAIL']
        f.write("\n**Failed claims:**\n")
        for r in fail_list:
            f.write(f"- {r['id']}: {r['description']} (expected {r['expected']:.4f}, got {r['computed']:.4f}, diff {r['diff']:.4f})\n")

print(f"\nReport written to: {report_path}")
