"""
Verify Lemma 0 monotonicity claims for the AI-dem paper.

Key question: does equilibrium protest increase or decrease in C_x?

The paper claims dpi/dC_x < 0 (higher cost, less protest).
The analytical derivation suggests dpi/dC_x > 0 in the interior
(single-state: pi* = h_bar = 1 - v/C_x, increasing in C_x).

This script verifies numerically in both single-state and multi-state cases.
"""

import numpy as np
from scipy.optimize import brentq
from scipy.special import expit  # logistic CDF


def logistic_cdf(z: float) -> float:
    """Logistic CDF: Lambda(z) = 1/(1+exp(-z))"""
    return expit(z)


def logistic_pdf(z: float) -> float:
    """Logistic PDF: lambda(z) = Lambda(z)*(1-Lambda(z))"""
    L = logistic_cdf(z)
    return L * (1 - L)


def posterior_weights(s: float, omega: np.ndarray, sigma: float,
                      priors: np.ndarray) -> np.ndarray:
    """
    Compute P(theta | d=1, s) for displaced worker.

    P(theta | d=1, s) ∝ omega_theta * lambda((s - omega_theta)/sigma) * p_theta
    """
    log_weights = np.log(omega) + np.log(priors)
    z = (s - omega) / sigma
    # Use log-sum-exp for numerical stability
    log_lambda = z - 2 * np.log(1 + np.exp(z))
    # Correction: lambda(z) = exp(z)/(1+exp(z))^2
    # log lambda(z) = z - 2*log(1+exp(z))
    # Use logaddexp for stability
    log_lambda = z - 2 * np.logaddexp(0, z)
    log_weights = log_weights + log_lambda
    log_weights -= np.max(log_weights)  # normalize for numerical stability
    weights = np.exp(log_weights)
    return weights / weights.sum()


def G_function(s: float, omega: np.ndarray, Omega: np.ndarray,
               sigma: float, priors: np.ndarray, h_bar: float) -> float:
    """
    G(s) = sum_theta P(theta|d=1,s) * Omega_theta * Lambda((omega_theta - s)/sigma) - h_bar
    """
    q = posterior_weights(s, omega, sigma, priors)
    pi_theta = Omega * logistic_cdf((omega - s) / sigma)
    return np.sum(q * pi_theta) - h_bar


def find_equilibrium(omega: np.ndarray, Omega: np.ndarray, sigma: float,
                     priors: np.ndarray, h_bar: float,
                     s_low: float = -5.0, s_high: float = 5.0) -> float:
    """Find cutoff s* by root-finding on G(s) = 0."""
    G_low = G_function(s_low, omega, Omega, sigma, priors, h_bar)
    G_high = G_function(s_high, omega, Omega, sigma, priors, h_bar)

    if G_low * G_high > 0:
        return None  # No interior equilibrium

    return brentq(lambda s: G_function(s, omega, Omega, sigma, priors, h_bar),
                  s_low, s_high)


def compute_protest(s_star: float, omega_theta: float, Omega_theta: float,
                    sigma: float) -> float:
    """Compute state-specific protest: pi_theta = Omega * Lambda((omega - s*)/sigma)"""
    return Omega_theta * logistic_cdf((omega_theta - s_star) / sigma)


# =============================================================================
# BASELINE PARAMETERS
# =============================================================================
omega = np.array([0.30, 0.05, 0.02])  # R, T1, N
Omega_t1 = omega.copy()  # t=1: Omega = omega
priors = np.array([0.30, 0.30, 0.40])
sigma = 0.10
v = 1.9  # uncompensated: 1 + delta = 1 + 0.9
delta = 0.9
B = 0.6

print("=" * 70)
print("LEMMA 0 MONOTONICITY VERIFICATION")
print("=" * 70)

# =============================================================================
# TEST 1: Single-state game (t=2, concentrated prior on R)
# =============================================================================
print("\n--- TEST 1: Single-state game (prior on R, omega=0.30, Omega=0.30) ---")
omega_single = np.array([0.30])
Omega_single = np.array([0.30])
priors_single = np.array([1.0])

C_values = [1.92, 1.95, 2.0, 2.5, 2.7, 2.714, 2.8, 3.0, 4.0]
print(f"\n{'C_x':>8} {'h_bar':>8} {'s*':>10} {'pi*':>10} {'C_dom':>10}")
print("-" * 50)

for C_x in C_values:
    h_bar = 1 - v / C_x
    C_dom = v / (1 - 0.30)

    if h_bar <= 0:
        print(f"{C_x:8.3f} {h_bar:8.4f} {'DOM':>10} {0.30:10.4f} {C_dom:10.3f}")
        continue

    if h_bar >= 0.30:
        print(f"{C_x:8.3f} {h_bar:8.4f} {'NONE':>10} {0.0:10.4f} {C_dom:10.3f}")
        continue

    s_star = find_equilibrium(omega_single, Omega_single, sigma,
                              priors_single, h_bar, -2, 2)
    if s_star is not None:
        pi = compute_protest(s_star, 0.30, 0.30, sigma)
        print(f"{C_x:8.3f} {h_bar:8.4f} {s_star:10.4f} {pi:10.4f} {C_dom:10.3f}")
    else:
        print(f"{C_x:8.3f} {h_bar:8.4f} {'FAIL':>10} {'N/A':>10} {C_dom:10.3f}")

print(f"\nDominant-strategy boundary: C_dom = v/(1-Omega) = {v/(1-0.30):.4f}")
print(f"OBSERVATION: pi* = h_bar = 1 - v/C_x, which is INCREASING in C_x.")

# =============================================================================
# TEST 2: Multi-state game (t=1, autocracy)
# =============================================================================
print("\n\n--- TEST 2: Multi-state game (t=1, autocracy, 3 states) ---")
C_values_multi = [1.92, 1.95, 2.0, 2.2, 2.5, 3.0, 3.5, 3.8, 4.0]

print(f"\n{'C_x':>8} {'h_bar':>8} {'s*':>10} {'pi_R':>10} {'pi_T':>10} {'pi_N':>10}")
print("-" * 62)

for C_x in C_values_multi:
    h_bar = 1 - v / C_x

    if h_bar <= 0:
        pi_R = Omega_t1[0]
        pi_T = Omega_t1[1]
        pi_N = Omega_t1[2]
        print(f"{C_x:8.3f} {h_bar:8.4f} {'DOM':>10} {pi_R:10.4f} {pi_T:10.4f} {pi_N:10.4f}")
        continue

    if h_bar >= max(Omega_t1):
        print(f"{C_x:8.3f} {h_bar:8.4f} {'NONE':>10} {0.0:10.4f} {0.0:10.4f} {0.0:10.4f}")
        continue

    s_star = find_equilibrium(omega, Omega_t1, sigma, priors, h_bar, -3, 3)
    if s_star is not None:
        pi_R = compute_protest(s_star, omega[0], Omega_t1[0], sigma)
        pi_T = compute_protest(s_star, omega[1], Omega_t1[1], sigma)
        pi_N = compute_protest(s_star, omega[2], Omega_t1[2], sigma)
        print(f"{C_x:8.3f} {h_bar:8.4f} {s_star:10.4f} {pi_R:10.4f} {pi_T:10.4f} {pi_N:10.4f}")
    else:
        print(f"{C_x:8.3f} {h_bar:8.4f} {'FAIL':>10} {'N/A':>10} {'N/A':>10} {'N/A':>10}")

# =============================================================================
# TEST 3: Single-state t=2, accumulated displacement (R×A scenario)
# =============================================================================
print("\n\n--- TEST 3: Single-state t=2, Omega_2^R = 0.51 (R×A, uncompensated) ---")
Omega_2R = 0.51

C_values_t2 = [1.92, 1.95, 2.0, 2.5, 3.0, 3.5, 3.87, 3.88, 4.0]
print(f"\n{'C_x':>8} {'h_bar':>8} {'pi*':>10} {'> pi_fall?':>12} (pi_fall = 0.06)")
print("-" * 50)

for C_x in C_values_t2:
    h_bar = 1 - v / C_x
    C_dom = v / (1 - Omega_2R)

    if h_bar <= 0:
        pi = Omega_2R
        exceeds = "YES (DOM)" if pi > 0.06 else "NO (DOM)"
        print(f"{C_x:8.3f} {h_bar:8.4f} {pi:10.4f} {exceeds:>12}")
    elif h_bar >= Omega_2R:
        pi = 0.0
        print(f"{C_x:8.3f} {h_bar:8.4f} {pi:10.4f} {'NO (ZERO)':>12}")
    else:
        pi = h_bar  # single-state result
        exceeds = "YES" if pi > 0.06 else "NO"
        print(f"{C_x:8.3f} {h_bar:8.4f} {pi:10.4f} {exceeds:>12}")

print(f"\nDominant-strategy boundary: C_dom = v/(1-Omega_2R) = {v/(1-Omega_2R):.4f}")
print(f"Note: At C_A = 2.0, pi* = {1-v/2.0:.4f}. Compare pi_fall^A = 0.06.")

# =============================================================================
# TEST 4: The paper's actual comparative statics claim check
# =============================================================================
print("\n\n" + "=" * 70)
print("SUMMARY: MONOTONICITY OF pi* IN C_x")
print("=" * 70)
print(f"""
Paper claims: dpi*/dC_x < 0 (higher cost => less protest)
Analytical result: dpi*/dC_x > 0 within interior (pi* = 1 - v/C_x, increasing)

For the single-state game:
  pi* = h_bar = 1 - v/C_x   for C_x in (v, v/(1-Omega))
  pi* = 0                    for C_x > v/(1-Omega)

The protest INCREASES with cost in the interior, then JUMPS to zero
at the dominant-strategy boundary.

KEY NUMBERS at baseline (v = {v}, C_A = 2.0, Omega_2^R = {Omega_2R}):
  h_bar = {1-v/2.0:.4f}
  C_dom = {v/(1-Omega_2R):.4f}
  pi* = {1-v/2.0:.4f}
  pi_fall^A = 0.06
  pi* < pi_fall? {1-v/2.0 < 0.06}

  => At baseline, autocracy DOES NOT FALL under rapid t=2.
  => Protest (0.05) does not exceed fall threshold (0.06).
""")

# =============================================================================
# TEST 5: What v or C_A would make R×A fall work?
# =============================================================================
print("\n--- TEST 5: What parameters make R×A fall work? ---")
print(f"\nNeed: pi* > pi_fall^A = 0.06, where pi* = 1 - v/C_A")
print(f"i.e., v/C_A < 0.94, i.e., v < 0.94 * C_A")
print(f"\nWith C_A = 2.0: need v < {0.94*2.0:.2f}. Current v = {v}. FAILS.")
print(f"With v = 1.9: need C_A > {v/0.94:.4f}. Current C_A = 2.0. FAILS.")
print(f"\nOption A: Lower pi_fall^A to 0.05: pi* = 0.05 = pi_fall. Knife-edge.")
print(f"Option B: Lower pi_fall^A to 0.04: pi* = 0.05 > 0.04. Works.")
print(f"Option C: Raise C_A to {v/0.94:.2f}: pi* = 0.06 = pi_fall. Knife-edge.")
print(f"Option D: Raise C_A to 2.15: pi* = {1-v/2.15:.4f} > 0.06. Works.")
print(f"Option E: Lower v to 1.88: pi* = {1-1.88/2.0:.4f}. Barely works.")
