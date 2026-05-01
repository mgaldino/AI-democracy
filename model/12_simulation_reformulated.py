"""
Simulação numérica v8: full Bayesian incumbent (matches analytical v4)
======================================================================
Fixes from v7 review (72/100 BLOCK):
  1. Visibility threshold derived from ΔP > ω̂·B (not heuristic)
  2. Stochastic incumbent signal ω̃ = ω + σ_x·ζ
  3. Removed dead code (incumbent_posterior_omega)
  4. Fixed autocracy comp value in t=1

Reference: ../IA-dem-analytical/notes/analytical_formalization.md (v4)
"""

import numpy as np
from scipy.optimize import brentq
from scipy.stats import logistic, norm
from dataclasses import dataclass, replace
from typing import Optional

np.random.seed(42)

THETAS = ("R", "T", "N")
N_MC = 200  # Monte Carlo draws for stochastic incumbent


# =============================================================================
# Parameters
# =============================================================================

@dataclass
class Params:
    """Confirmed parameters (analytical + numerical)."""
    omega_R: float = 0.30
    omega_T1: float = 0.05
    omega_T2: float = 0.60
    omega_N: float = 0.02
    sigma: float = 0.10        # Worker signal noise
    C_D: float = 1.5
    C_A: float = 2.0
    B: float = 0.6
    delta: float = 0.9
    pi_fall_D: float = 0.20
    pi_fall_A: float = 0.05
    sigma_D: float = 0.03      # Incumbent noise democracy
    sigma_A: float = 0.15      # Incumbent noise autocracy
    p_R: float = 0.30
    p_T: float = 0.30
    p_N: float = 0.40


# =============================================================================
# Helpers
# =============================================================================

def F_cdf(z: float) -> float:
    return logistic.cdf(z)


def f_pdf(z: float) -> float:
    return logistic.pdf(z)


def omega_by_theta(theta: str, t: int, p: Params) -> float:
    if theta == "R":
        return p.omega_R
    elif theta == "T":
        return p.omega_T1 if t == 1 else p.omega_T2
    elif theta == "N":
        return p.omega_N
    raise ValueError(theta)


def Omega_t(theta: str, t: int, p: Params) -> float:
    """Total displaced at time t under θ (absorbing)."""
    if t == 1:
        return omega_by_theta(theta, 1, p)
    om1 = omega_by_theta(theta, 1, p)
    om2 = omega_by_theta(theta, 2, p)
    return om1 + (1.0 - om1) * om2


# =============================================================================
# Global Game (worker side)
# =============================================================================

def posterior_worker(
    s: float, t: int, p: Params, prior: dict[str, float]
) -> dict[str, float]:
    """P(θ|d=1,s) ∝ ω(θ)·λ((s-ω)/σ)·prior(θ)"""
    unnorm = {}
    for theta in THETAS:
        omega = omega_by_theta(theta, t, p)
        unnorm[theta] = omega * f_pdf((s - omega) / p.sigma) * prior[theta]
    total = sum(unnorm.values())
    if total < 1e-300:
        return {th: prior[th] for th in THETAS}
    return {th: unnorm[th] / total for th in THETAS}


def expected_pi_at_cutoff(
    s_star: float, t: int, p: Params, prior: dict[str, float]
) -> float:
    """E[π|d=1,s*] with h(π)=π."""
    post = posterior_worker(s_star, t, p, prior)
    E_pi = 0.0
    for theta in THETAS:
        omega = omega_by_theta(theta, t, p)
        Omega = Omega_t(theta, t, p)
        E_pi += post[theta] * Omega * F_cdf((omega - s_star) / p.sigma)
    return E_pi


def solve_cutoff(
    t: int, p: Params, v: float, C_x: float, prior: dict[str, float]
) -> Optional[float]:
    """Find s* such that E[π|d=1,s*] = 1-v/C_x."""
    hbar = 1.0 - v / C_x
    if hbar <= 0:
        return None

    test_pts = np.linspace(-2.0, 2.0, 100)
    E_vals = [expected_pi_at_cutoff(s, t, p, prior) for s in test_pts]
    max_E = max(E_vals)
    if max_E < hbar:
        return float('inf')

    peak_idx = int(np.argmax(E_vals))
    s_peak = test_pts[peak_idx]

    def obj(s: float) -> float:
        return expected_pi_at_cutoff(s, t, p, prior) - hbar

    # Right root
    b = s_peak + 3.0
    for _ in range(10):
        if obj(b) < 0:
            break
        b += 2.0
    if obj(s_peak) >= 0 and obj(b) <= 0:
        return brentq(obj, s_peak, b, xtol=1e-10)

    # Left root
    a = s_peak - 3.0
    for _ in range(10):
        if obj(a) < 0:
            break
        a -= 2.0
    if obj(a) <= 0 and obj(s_peak) >= 0:
        return brentq(obj, a, s_peak, xtol=1e-10)

    return None if obj(s_peak) > 0 else float('inf')


def realized_pi(
    s_star: Optional[float], t: int, theta_true: str, p: Params
) -> float:
    """Realized protest given s* and true θ."""
    Omega = Omega_t(theta_true, t, p)
    omega = omega_by_theta(theta_true, t, p)
    if s_star is None:
        return Omega
    if s_star == float('inf'):
        return 0.0
    return Omega * F_cdf((omega - s_star) / p.sigma)


# =============================================================================
# Incumbent: Bayesian compensation decision (derived from ΔP > ω̂·B)
# =============================================================================

def incumbent_posterior_theta(
    omega_tilde: float, t: int, regime: str, p: Params,
    prior: dict[str, float]
) -> dict[str, float]:
    """
    P(θ|ω̃) ∝ N(ω̃; ω_t(θ), σ_x²) · prior(θ)

    Incumbent's posterior over θ given noisy macro observation.
    """
    sigma_x = p.sigma_D if regime == "D" else p.sigma_A
    unnorm = {}
    for theta in THETAS:
        omega_theta = omega_by_theta(theta, t, p)
        unnorm[theta] = norm.pdf(omega_tilde, loc=omega_theta,
                                 scale=sigma_x) * prior[theta]
    total = sum(unnorm.values())
    if total < 1e-300:
        return prior
    return {th: unnorm[th] / total for th in THETAS}


def compute_delta_P(
    post_inc: dict[str, float], regime: str, p: Params,
    prior_workers_t2: dict[str, float]
) -> float:
    """
    ΔP = P(survive t=2 | comp) - P(survive t=2 | no comp)

    For each θ, solve global game in t=2 under comp/no-comp,
    check if π₂ < π̄^fall.
    """
    C_x = p.C_D if regime == "D" else p.C_A
    pi_fall = p.pi_fall_D if regime == "D" else p.pi_fall_A

    v_comp = 1.0 - p.B
    v_no = 1.0

    s2_comp = solve_cutoff(2, p, v_comp, C_x, prior_workers_t2)
    s2_no = solve_cutoff(2, p, v_no, C_x, prior_workers_t2)

    p_survive_comp = 0.0
    p_survive_no = 0.0
    for theta in THETAS:
        pi2_c = realized_pi(s2_comp, 2, theta, p)
        pi2_n = realized_pi(s2_no, 2, theta, p)
        p_survive_comp += post_inc[theta] * (1.0 if pi2_c < pi_fall else 0.0)
        p_survive_no += post_inc[theta] * (1.0 if pi2_n < pi_fall else 0.0)

    return p_survive_comp - p_survive_no


def incumbent_compensates(
    omega_true: float, t: int, regime: str, p: Params,
    prior: dict[str, float], prior_workers_t2: dict[str, float],
    stochastic: bool = True
) -> tuple[bool, dict]:
    """
    Full Bayesian compensation decision (Section 1.7 of analytical notes).

    1. Draw ω̃ = ω + σ_x·ζ (or use expected value if not stochastic)
    2. Compute P(θ|ω̃) — posterior over states
    3. Compute ΔP from posterior-weighted survival probabilities
    4. Compute ω̂ = E[ω|ω̃] — posterior mean of ω
    5. comp iff ΔP > ω̂·B

    With stochastic=True: Monte Carlo over ζ draws, comp iff P(comp) > 0.5.
    """
    sigma_x = p.sigma_D if regime == "D" else p.sigma_A

    if not stochastic:
        # Deterministic: use ω̃ = ω_true (expected observation)
        omega_tilde = omega_true
        post_inc = incumbent_posterior_theta(omega_tilde, t, regime, p, prior)
        delta_P = compute_delta_P(post_inc, regime, p, prior_workers_t2)
        omega_hat = sum(post_inc[th] * omega_by_theta(th, t, p)
                        for th in THETAS)
        cost = omega_hat * p.B
        compensates = delta_P > cost
        return compensates, {
            "omega_tilde": omega_tilde, "post_inc": post_inc,
            "delta_P": delta_P, "omega_hat": omega_hat, "cost": cost,
        }

    # Stochastic: Monte Carlo
    comp_count = 0
    last_diag = {}
    for _ in range(N_MC):
        zeta = np.random.normal(0, 1)
        omega_tilde = omega_true + sigma_x * zeta
        post_inc = incumbent_posterior_theta(omega_tilde, t, regime, p, prior)
        delta_P = compute_delta_P(post_inc, regime, p, prior_workers_t2)
        omega_hat = sum(post_inc[th] * omega_by_theta(th, t, p)
                        for th in THETAS)
        cost = omega_hat * p.B
        if delta_P > cost:
            comp_count += 1
        last_diag = {"omega_tilde": omega_tilde, "post_inc": post_inc,
                     "delta_P": delta_P, "omega_hat": omega_hat, "cost": cost}

    p_comp = comp_count / N_MC
    compensates = p_comp > 0.5
    last_diag["p_comp_mc"] = p_comp
    return compensates, last_diag


# =============================================================================
# Workers' prior update
# =============================================================================

def update_prior_workers(
    pi1: float, s1: Optional[float], p: Params, prior: dict[str, float]
) -> dict[str, float]:
    """Workers observe π₁ publicly → update P(θ)."""
    eps = 0.005
    unnorm = {}
    for theta in THETAS:
        pi_eq = realized_pi(s1, 1, theta, p)
        unnorm[theta] = norm.pdf(pi1, loc=pi_eq, scale=eps) * prior[theta]
    total = sum(unnorm.values())
    if total < 1e-300:
        return prior
    return {th: unnorm[th] / total for th in THETAS}


# =============================================================================
# Full simulation
# =============================================================================

def simulate_scenario(
    theta_true: str, regime: str, p: Params,
    verbose: bool = True, stochastic: bool = True
) -> dict:
    """Simulate 2 periods with full Bayesian incumbent."""
    C_x = p.C_D if regime == "D" else p.C_A
    pi_fall = p.pi_fall_D if regime == "D" else p.pi_fall_A
    prior = {"R": p.p_R, "T": p.p_T, "N": p.p_N}
    results: dict = {"theta": theta_true, "regime": regime}

    # ── t=1 ──────────────────────────────────────────────────────────────
    omega1 = omega_by_theta(theta_true, 1, p)

    # Workers need to anticipate comp to set v. Two-step:
    # 1. Check if incumbent WOULD compensate (using deterministic path)
    # 2. Workers anticipate accordingly
    # Equilibrium: self-confirming expectations.

    # Candidate: no-comp expected
    v_no = 1.0 + p.delta
    s_no = solve_cutoff(1, p, v_no, C_x, prior)
    pi_no = realized_pi(s_no, 1, theta_true, p)
    prior_w_t2_no = update_prior_workers(pi_no, s_no, p, prior)
    comp_no, diag_no = incumbent_compensates(
        omega1, 1, regime, p, prior, prior_w_t2_no, stochastic=stochastic
    )

    # Candidate: comp expected
    if regime == "D":
        v_comp = 1.0 + p.delta * (1.0 - p.B)  # φ₂=1 (law, lag)
    else:
        v_comp = (1.0 - p.B) + p.delta * (1.0 - p.B)  # φ₁=1 immediate
    s_comp = solve_cutoff(1, p, v_comp, C_x, prior)
    pi_comp = realized_pi(s_comp, 1, theta_true, p)
    prior_w_t2_comp = update_prior_workers(pi_comp, s_comp, p, prior)
    comp_yes, diag_yes = incumbent_compensates(
        omega1, 1, regime, p, prior, prior_w_t2_comp, stochastic=stochastic
    )

    # Self-confirmation:
    # - If no-comp expected AND incumbent doesn't comp → consistent ✓
    # - If comp expected AND incumbent comps → consistent ✓
    # - If no-comp expected BUT incumbent comps → no-comp not self-confirming
    # - If comp expected BUT incumbent doesn't → comp not self-confirming
    if not comp_no and not comp_yes:
        s1, pi1, comp1, v1, diag1 = s_no, pi_no, False, v_no, diag_no
    elif comp_no and comp_yes:
        # Both self-confirming → select comp (Pareto-dominant for workers)
        s1, pi1, comp1, v1, diag1 = s_comp, pi_comp, True, v_comp, diag_yes
    elif comp_no and not comp_yes:
        # No-comp: incumbent comps (not self-confirming for no-comp)
        # Comp: incumbent doesn't comp (not self-confirming for comp)
        # → No pure equilibrium. Use no-comp (risk-dominant).
        s1, pi1, comp1, v1, diag1 = s_no, pi_no, True, v_no, diag_no
    else:
        # comp_yes and not comp_no → comp is the unique self-confirming eq
        s1, pi1, comp1, v1, diag1 = s_comp, pi_comp, True, v_comp, diag_yes

    phi2_from_t1 = 1.0 if comp1 else 0.0

    results["t1"] = {
        "omega1": omega1, "v1": v1, "s_star": s1,
        "pi1": pi1, "comp1": comp1, "diagnostics": diag1,
    }

    if verbose:
        eq_lab = ("dom" if s1 is None else "∅" if s1 == float('inf')
                  else f"s*={s1:.2f}")
        p_mc = diag1.get("p_comp_mc", "det")
        print(f"  t=1: ω₁={omega1:.2f} comp={comp1} "
              f"(P_mc={p_mc}) v={v1:.2f} eq={eq_lab} π₁={pi1:.4f}")

    # ── t=2 ──────────────────────────────────────────────────────────────
    omega2 = omega_by_theta(theta_true, 2, p)
    Omega2 = Omega_t(theta_true, 2, p)

    # Incumbent's t=2 compensation decision
    prior_w_t2 = update_prior_workers(pi1, s1, p, prior)
    comp2, diag2 = incumbent_compensates(
        omega2, 2, regime, p, prior, prior_w_t2, stochastic=stochastic
    )

    # Effective compensation in t=2
    if regime == "A" and comp2:
        phi2_eff = 1.0  # Autocracy: immediate
    elif regime == "D" and phi2_from_t1 > 0:
        phi2_eff = 1.0  # Democracy: t=1 law takes effect
    elif regime == "D" and comp2:
        phi2_eff = 0.0  # Democracy: sees t=2 crisis, but LAG → no t=3
    else:
        phi2_eff = 0.0

    v2 = 1.0 - p.B * phi2_eff
    s2 = solve_cutoff(2, p, v2, C_x, prior_w_t2)
    pi2 = realized_pi(s2, 2, theta_true, p)

    # Fall: π > π̄ AND uncompensated
    falls = pi2 > pi_fall and phi2_eff == 0.0

    results["t2"] = {
        "omega2": omega2, "Omega2": Omega2,
        "comp2": comp2, "phi2_eff": phi2_eff,
        "v2": v2, "s_star": s2, "pi2": pi2, "falls": falls,
        "diagnostics": diag2,
    }
    results["outcome"] = "FALLS_T2" if falls else "STABLE"

    if verbose:
        eq_lab = ("dom" if s2 is None else "∅" if s2 == float('inf')
                  else f"s*={s2:.2f}")
        p_mc2 = diag2.get("p_comp_mc", "det")
        phi_note = f" φ₂={phi2_eff:.0f}" if phi2_eff > 0 else ""
        print(f"  t=2: ω₂={omega2:.2f} Ω₂={Omega2:.3f} comp2={comp2} "
              f"(P_mc={p_mc2}){phi_note} v={v2:.2f} eq={eq_lab} "
              f"π₂={pi2:.4f} cai={'SIM' if falls else 'não'}")

    return results


# =============================================================================
# Main
# =============================================================================

def run_crossed_fragility(
    p: Optional[Params] = None, stochastic: bool = True
) -> dict:
    """Run 4 scenarios, verify crossed fragility."""
    if p is None:
        p = Params()

    mode = "stochastic" if stochastic else "deterministic"
    print("=" * 70)
    print(f"SIMULAÇÃO v8 — full Bayesian incumbent ({mode}, N_MC={N_MC})")
    print("=" * 70)
    print(f"\nEconomia: ω_R={p.omega_R} ω_T1={p.omega_T1} ω_T2={p.omega_T2}")
    print(f"Regimes: C_D={p.C_D} C_A={p.C_A} B={p.B} δ={p.delta}")
    print(f"Incumbente: σ_D={p.sigma_D} σ_A={p.sigma_A}")
    print(f"Queda: π̄_D={p.pi_fall_D} π̄_A={p.pi_fall_A}")

    scenarios = [("R", "D"), ("R", "A"), ("T", "D"), ("T", "A")]
    labels = {
        ("R","D"): "Rapid × Democracia", ("R","A"): "Rapid × Autocracia",
        ("T","D"): "Threshold × Democracia", ("T","A"): "Threshold × Autocracia",
    }

    results: dict = {}
    for theta, regime in scenarios:
        print(f"\n{'─'*60}")
        print(f"  {labels[(theta,regime)]}")
        print(f"{'─'*60}")
        results[(theta, regime)] = simulate_scenario(
            theta, regime, p, stochastic=stochastic
        )

    # Verify
    print("\n" + "=" * 70)
    print("RESULTADO")
    print("=" * 70)
    expected = {("R","D"): "STABLE", ("R","A"): "FALLS_T2",
                ("T","D"): "FALLS_T2", ("T","A"): "STABLE"}
    crossed = True
    print(f"\n{'Cenário':<28} {'Result':<10} {'Exp':<10} {'OK?'}")
    print("-" * 55)
    for key, exp in expected.items():
        act = results[key]["outcome"]
        ok = act == exp
        if not ok:
            crossed = False
        print(f"{labels[key]:<28} {act:<10} {exp:<10} {'✓' if ok else '✗'}")
    print("-" * 55)
    status = "CONFIRMADA" if crossed else "NÃO CONFIRMADA"
    print(f"\n>>> FRAGILIDADE CRUZADA {status} <<<")

    return results


if __name__ == "__main__":
    # Run both deterministic and stochastic
    print("\n" + "=" * 70)
    print("  DETERMINISTIC (expected-value path)")
    print("=" * 70)
    run_crossed_fragility(stochastic=False)

    print("\n\n" + "=" * 70)
    print("  STOCHASTIC (Monte Carlo, N=200)")
    print("=" * 70)
    run_crossed_fragility(stochastic=True)
