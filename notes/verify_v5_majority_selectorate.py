"""
Numerical verification of v5 model claims (majority/selectorate formalization).

Reference: notes/analytical_formalization.md (v5)
Parameters: confirmed set from Appendix C (simulation v7).

Checks:
1. Majority condition under rapid t=1
2. Majority condition under threshold t=1
3. Sensitivity to gamma
4. Arithmetic of required Phi thresholds
5. Lemma 2 exact bounds
"""

import numpy as np
from scipy.special import expit  # logistic CDF


# ── Parameters ──────────────────────────────────────────────────────
omega_R   = 0.30
omega_T1  = 0.05
omega_T2  = 0.60
omega_N   = 0.02
sigma     = 0.10
C_D       = 1.5
C_A       = 2.0
B         = 0.6
delta     = 0.9
p_R       = 0.30
p_T       = 0.30
p_N       = 0.40
gamma     = 0.3   # complementarity bonus: Y+ = 1 + gamma = 1.3

# ── Helper: Bayesian posterior P(theta | d, s) ─────────────────────

def posterior_theta(d: int, s: float):
    """
    Compute P(theta | d_i, s_i) for theta in {R, T, N}.

    Likelihood: L(d, s | theta) = omega^d * (1-omega)^{1-d} * f_logistic((s - omega)/sigma) / sigma
    where omega = omega_t(theta) for t=1.

    Returns dict with keys 'R', 'T', 'N'.
    """
    omegas = {'R': omega_R, 'T': omega_T1, 'N': omega_N}
    priors = {'R': p_R, 'T': p_T, 'N': p_N}

    log_unnorm = {}
    for theta, om in omegas.items():
        # Bernoulli log-likelihood
        if d == 1:
            log_bern = np.log(om + 1e-300)
        else:
            log_bern = np.log(1 - om + 1e-300)
        # Logistic density log-likelihood: log f((s-om)/sigma) - log(sigma)
        z = (s - om) / sigma
        log_logistic = -z - 2 * np.log(1 + np.exp(-z)) - np.log(sigma)
        log_unnorm[theta] = log_bern + log_logistic + np.log(priors[theta] + 1e-300)

    # Normalize
    max_log = max(log_unnorm.values())
    unnorm = {k: np.exp(v - max_log) for k, v in log_unnorm.items()}
    total = sum(unnorm.values())
    return {k: v / total for k, v in unnorm.items()}


def expected_future_displacement(d: int, s: float):
    """
    E[omega_2(theta) | d, s] for a worker in t=1.
    omega_2(R) = omega_R, omega_2(T) = omega_T2, omega_2(N) = omega_N.

    P_hat = expected probability of displacement in t=2, conditional on
    being employed in t=1 (d_{i1}=0).  For displaced (d=1), the worker
    is already displaced but we still compute expected future omega.
    """
    post = posterior_theta(d, s)
    omega2 = {'R': omega_R, 'T': omega_T2, 'N': omega_N}
    return sum(post[theta] * omega2[theta] for theta in ['R', 'T', 'N'])


def expected_current_omega(d: int, s: float):
    """
    E[omega_1(theta) | d, s].  Used for the tax rate hat{omega}_t.
    """
    post = posterior_theta(d, s)
    omega1 = {'R': omega_R, 'T': omega_T1, 'N': omega_N}
    return sum(post[theta] * omega1[theta] for theta in ['R', 'T', 'N'])


# ── CHECK 1: Majority condition under rapid t=1 ────────────────────

print("=" * 72)
print("CHECK 1: Majority condition under rapid t=1")
print("=" * 72)

# Under rapid, true omega_1 = omega_R = 0.30.
# Displaced fraction = omega_R = 0.30. All displaced vote YES.
# Employed fraction = 1 - omega_R = 0.70, with Y = 1.
# An employed worker (d=0) votes YES iff:
#   delta * P_hat > hat_omega * Y
# where P_hat = E[omega_2 | d=0, s], hat_omega = E[omega_1 | d=0, s], Y=1.

# We integrate over the signal distribution of employed workers under rapid.
# s ~ omega_R + sigma * eps, eps ~ Logistic(0,1)

N_MC = 200_000
np.random.seed(42)

# Draw signals for employed workers under rapid t=1
eps_samples = np.random.logistic(0, 1, N_MC)
s_samples = omega_R + sigma * eps_samples

votes_yes = 0
for s in s_samples:
    P_hat = expected_future_displacement(d=0, s=s)
    omega_hat = expected_current_omega(d=0, s=s)
    # Vote YES iff delta * P_hat > omega_hat * Y, Y=1
    if delta * P_hat > omega_hat * 1.0:
        votes_yes += 1

Phi_R = votes_yes / N_MC
majority_R = omega_R + (1 - omega_R) * Phi_R

print(f"  Displaced fraction (vote YES):    {omega_R:.4f}")
print(f"  Employed fraction:                {1 - omega_R:.4f}")
print(f"  Phi_R (fraction of employed voting YES): {Phi_R:.4f}")
print(f"  Total YES = omega_R + (1-omega_R)*Phi_R = {majority_R:.4f}")
print(f"  Majority threshold:               0.5000")
print(f"  Majority approves? {majority_R > 0.5}")
check1_pass = majority_R > 0.5
print(f"  >> CHECK 1: {'PASS' if check1_pass else 'FAIL'}")
print()


# ── CHECK 2: Majority condition under threshold t=1 ────────────────

print("=" * 72)
print("CHECK 2: Majority condition under threshold t=1 (gamma={})".format(gamma))
print("=" * 72)

# Under threshold t=1, true omega_1 = omega_T1 = 0.05.
# Displaced fraction = omega_T1 = 0.05. All displaced vote YES.
# Employed fraction = 1 - omega_T1 = 0.95, with Y+ = 1 + gamma = 1.3.
# An employed worker (d=0) votes YES iff:
#   delta * P_hat > hat_omega * Y+
# where P_hat = E[omega_2 | d=0, s], hat_omega = E[omega_1 | d=0, s], Y+ = 1+gamma.

# Draw signals for employed workers under threshold t=1
eps_samples_T = np.random.logistic(0, 1, N_MC)
s_samples_T = omega_T1 + sigma * eps_samples_T

votes_yes_T = 0
for s in s_samples_T:
    P_hat = expected_future_displacement(d=0, s=s)
    omega_hat = expected_current_omega(d=0, s=s)
    Y_plus = 1 + gamma
    # Vote YES iff delta * P_hat > omega_hat * Y+
    if delta * P_hat > omega_hat * Y_plus:
        votes_yes_T += 1

Phi_T = votes_yes_T / N_MC
majority_T = omega_T1 + (1 - omega_T1) * Phi_T

print(f"  Displaced fraction (vote YES):    {omega_T1:.4f}")
print(f"  Employed fraction:                {1 - omega_T1:.4f}")
print(f"  Y+ = 1 + gamma:                  {1 + gamma:.4f}")
print(f"  Phi_T (fraction of employed voting YES): {Phi_T:.4f}")
print(f"  Total YES = omega_T1 + (1-omega_T1)*Phi_T = {majority_T:.4f}")
print(f"  Majority threshold:               0.5000")
print(f"  Majority blocks? {majority_T < 0.5}")
check2_pass = majority_T < 0.5
print(f"  >> CHECK 2: {'PASS' if check2_pass else 'FAIL'}")
print()


# ── CHECK 3: Sensitivity to gamma ──────────────────────────────────

print("=" * 72)
print("CHECK 3: Sensitivity to gamma (find gamma*)")
print("=" * 72)

gamma_values = [0.0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.5, 1.0]
N_MC_sweep = 100_000
np.random.seed(123)
eps_sweep = np.random.logistic(0, 1, N_MC_sweep)
s_sweep = omega_T1 + sigma * eps_sweep

# Precompute P_hat and omega_hat for each signal (they don't depend on gamma)
P_hat_arr = np.zeros(N_MC_sweep)
omega_hat_arr = np.zeros(N_MC_sweep)
for idx, s in enumerate(s_sweep):
    P_hat_arr[idx] = expected_future_displacement(d=0, s=s)
    omega_hat_arr[idx] = expected_current_omega(d=0, s=s)

print(f"  {'gamma':>8} | {'Y+':>6} | {'Phi_T':>8} | {'Majority':>10} | {'Approves?':>10}")
print(f"  {'-'*8}-+-{'-'*6}-+-{'-'*8}-+-{'-'*10}-+-{'-'*10}")

results_gamma = []
for g in gamma_values:
    Y_plus = 1 + g
    # Vote YES iff delta * P_hat > omega_hat * Y+
    yes_mask = (delta * P_hat_arr) > (omega_hat_arr * Y_plus)
    Phi_T_g = yes_mask.mean()
    maj = omega_T1 + (1 - omega_T1) * Phi_T_g
    approves = maj > 0.5
    results_gamma.append((g, Y_plus, Phi_T_g, maj, approves))
    print(f"  {g:8.2f} | {Y_plus:6.2f} | {Phi_T_g:8.4f} | {maj:10.4f} | {'YES' if approves else 'NO':>10}")

# Find gamma* by bisection
lo, hi = 0.0, 2.0
for _ in range(50):
    mid = (lo + hi) / 2
    Y_plus = 1 + mid
    yes_mask = (delta * P_hat_arr) > (omega_hat_arr * Y_plus)
    Phi_T_mid = yes_mask.mean()
    maj_mid = omega_T1 + (1 - omega_T1) * Phi_T_mid
    if maj_mid > 0.5:
        lo = mid
    else:
        hi = mid

gamma_star = (lo + hi) / 2
print(f"\n  gamma* (critical value where majority flips): {gamma_star:.4f}")
check3_pass = True  # informational
print(f"  >> CHECK 3: INFORMATIONAL (gamma* = {gamma_star:.4f})")
print()


# ── CHECK 4: Verify arithmetic of required Phi thresholds ──────────

print("=" * 72)
print("CHECK 4: Arithmetic of required Phi thresholds")
print("=" * 72)

# Claim 1: omega_R + (1-omega_R)*0.286 = 0.50
lhs_1 = omega_R + (1 - omega_R) * 0.286
# Claim 2: omega_T1 + (1-omega_T1)*0.474 = 0.50
lhs_2 = omega_T1 + (1 - omega_T1) * 0.474

# Exact required Phi
Phi_R_required = (0.50 - omega_R) / (1 - omega_R)
Phi_T_required = (0.50 - omega_T1) / (1 - omega_T1)

print(f"  Under rapid:     omega_R + (1-omega_R)*0.286 = {omega_R} + {1-omega_R}*0.286 = {lhs_1:.4f}")
print(f"  Exact required:  (0.50 - {omega_R}) / (1 - {omega_R}) = {Phi_R_required:.6f}")
print(f"  Document claims 0.286, exact is {Phi_R_required:.6f}.")
check4a = abs(lhs_1 - 0.50) < 0.01  # approximate match (0.286 is rounded)
print(f"  Approximate match (within 0.01 of 0.50)? {check4a}")
print()

print(f"  Under threshold: omega_T1 + (1-omega_T1)*0.474 = {omega_T1} + {1-omega_T1}*0.474 = {lhs_2:.4f}")
print(f"  Exact required:  (0.50 - {omega_T1}) / (1 - {omega_T1}) = {Phi_T_required:.6f}")
print(f"  Document claims 0.474, exact is {Phi_T_required:.6f}.")
check4b = abs(lhs_2 - 0.50) < 0.01
print(f"  Approximate match (within 0.01 of 0.50)? {check4b}")
print()

check4_pass = check4a and check4b
print(f"  >> CHECK 4: {'PASS' if check4_pass else 'FAIL'}")
print()


# ── CHECK 5: Lemma 2 exact bounds ──────────────────────────────────

print("=" * 72)
print("CHECK 5: Lemma 2 exact bounds")
print("=" * 72)

# 5a. Bound for Omega_2(T) > Omega_2(R):
# omega_T2 > [omega_R*(2-omega_R) - omega_T1] / (1 - omega_T1)
numerator = omega_R * (2 - omega_R) - omega_T1
denominator = 1 - omega_T1
bound = numerator / denominator

print(f"  Lemma 2(b) bound:")
print(f"    [omega_R*(2-omega_R) - omega_T1] / (1 - omega_T1)")
print(f"    = [{omega_R}*{2-omega_R} - {omega_T1}] / {1-omega_T1}")
print(f"    = [{omega_R*(2-omega_R):.4f} - {omega_T1}] / {denominator}")
print(f"    = {numerator:.4f} / {denominator:.4f}")
print(f"    = {bound:.4f}")
print(f"  Document claims: 0.484")
check5a = abs(bound - 0.484) < 0.001
print(f"  Match? {check5a} (computed {bound:.4f} vs claimed 0.484)")
print()

# 5b. Omega_2(T) = omega_T1 + (1-omega_T1)*omega_T2
Omega2_T = omega_T1 + (1 - omega_T1) * omega_T2
print(f"  Omega_2(T) = omega_T1 + (1-omega_T1)*omega_T2")
print(f"             = {omega_T1} + {1-omega_T1}*{omega_T2}")
print(f"             = {omega_T1} + {(1-omega_T1)*omega_T2:.4f}")
print(f"             = {Omega2_T:.4f}")
print(f"  Document claims: 0.62")
check5b = abs(Omega2_T - 0.62) < 0.001
print(f"  Match? {check5b} (computed {Omega2_T:.4f} vs claimed 0.62)")
print()

# 5c. Omega_2(R) = omega_R*(2-omega_R)
Omega2_R = omega_R * (2 - omega_R)
print(f"  Omega_2(R) = omega_R*(2-omega_R)")
print(f"             = {omega_R}*(2-{omega_R})")
print(f"             = {omega_R}*{2-omega_R}")
print(f"             = {Omega2_R:.4f}")
print(f"  Document claims: 0.51")
check5c = abs(Omega2_R - 0.51) < 0.001
print(f"  Match? {check5c} (computed {Omega2_R:.4f} vs claimed 0.51)")
print()

# 5d. Check Omega_2(T) > Omega_2(R)
print(f"  Omega_2(T) = {Omega2_T:.4f} > Omega_2(R) = {Omega2_R:.4f} ?  {Omega2_T > Omega2_R}")
check5d = Omega2_T > Omega2_R

# 5e. Verify omega_T2 > bound
print(f"  omega_T2 = {omega_T2} > bound = {bound:.4f} ?  {omega_T2 > bound}")
check5e = omega_T2 > bound

check5_pass = check5a and check5b and check5c and check5d and check5e
print(f"\n  >> CHECK 5: {'PASS' if check5_pass else 'FAIL'}")
print()


# ── SUMMARY ─────────────────────────────────────────────────────────

print("=" * 72)
print("SUMMARY")
print("=" * 72)
checks = [
    ("1. Majority approves under rapid t=1", check1_pass, f"Phi_R={Phi_R:.4f}, majority={majority_R:.4f}"),
    ("2. Majority blocks under threshold t=1", check2_pass, f"Phi_T={Phi_T:.4f}, majority={majority_T:.4f}"),
    ("3. gamma* (critical flip value)", check3_pass, f"gamma*={gamma_star:.4f}"),
    ("4. Arithmetic of Phi thresholds", check4_pass, f"0.286→{lhs_1:.4f}, 0.474→{lhs_2:.4f}"),
    ("5. Lemma 2 exact bounds", check5_pass, f"bound={bound:.4f}, Ω₂(T)={Omega2_T:.4f}, Ω₂(R)={Omega2_R:.4f}"),
]

all_pass = True
for name, passed, detail in checks:
    status = "PASS" if passed else "FAIL"
    if not passed:
        all_pass = False
    print(f"  [{status}] {name}: {detail}")

print()
print(f"  Overall: {'ALL PASS' if all_pass else 'SOME FAILED'}")
print("=" * 72)
