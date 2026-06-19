"""
Verify sweet spot of C_A with updated parameters.

Paper parameters: omega_R=0.30, omega_T1=0.05, omega_T2=0.60, omega_N=0.02,
sigma=0.10, C_D=1.5, C_A=2.0, B=0.6, delta=0.9, pi_fall_A=0.06 (updated).

Questions:
1. With C_A=2.0 and pi_fall_A=0.06: does crossed fragility hold?
2. What is the sweet spot (C_A^min, C_A^max)?
3. Verify all four scenarios with updated pi_fall_A.
"""

import numpy as np
from scipy.optimize import brentq
from scipy.stats import logistic


# Parameters (paper v2)
OMEGA_R = 0.30
OMEGA_T1 = 0.05
OMEGA_T2 = 0.60
OMEGA_N = 0.02
SIGMA = 0.10
C_D = 1.5
C_A = 2.0
B = 0.6
DELTA = 0.9
PI_FALL_D = 0.20
PI_FALL_A = 0.06  # Updated from 0.05
OMEGA_BAR_A = 0.40
SIGMA_A = 0.15
P_R = 0.30
P_T = 0.30
P_N = 0.40

# Derived
OMEGA2_R = OMEGA_R * (2 - OMEGA_R)  # 0.51
OMEGA2_T = OMEGA_T1 + (1 - OMEGA_T1) * OMEGA_T2  # 0.62

THETAS = ("R", "T", "N")


def omega_t(theta: str, t: int) -> float:
    """Displacement rate for state theta at time t."""
    if theta == "R":
        return OMEGA_R
    if theta == "T":
        return OMEGA_T1 if t == 1 else OMEGA_T2
    if theta == "N":
        return OMEGA_N
    raise ValueError(theta)


def cum_omega(theta: str, t: int) -> float:
    """Cumulative displaced fraction (absorbing)."""
    if t == 1:
        return omega_t(theta, 1)
    om1 = omega_t(theta, 1)
    om2 = omega_t(theta, 2)
    return om1 + (1 - om1) * om2


def expected_pi_multistate(s_star: float, t: int, v: float,
                           c_x: float) -> float:
    """E[pi | d=1, s*] in the 3-state model."""
    prior = {"R": P_R, "T": P_T, "N": P_N}
    # Posterior P(theta | d=1, s*)
    unnorm = {}
    for th in THETAS:
        om = omega_t(th, t)
        # P(d=1|theta) * P(s*|theta) * P(theta)
        unnorm[th] = om * logistic.pdf((s_star - om) / SIGMA) * prior[th]
    total = sum(unnorm.values())
    if total < 1e-300:
        post = prior.copy()
    else:
        post = {th: unnorm[th] / total for th in THETAS}

    e_pi = 0.0
    for th in THETAS:
        om = omega_t(th, t)
        big_om = cum_omega(th, t)
        e_pi += post[th] * big_om * logistic.cdf((om - s_star) / SIGMA)
    return e_pi


def solve_equilibrium(t: int, v: float, c_x: float):
    """Find cutoff s* and realized protest for each state.

    Returns dict with keys: s_star, pi_R, pi_T, pi_N, hbar
    """
    hbar = 1.0 - v / c_x
    if hbar <= 0:
        # Dominant strategy: all displaced protest
        return {
            "s_star": None, "dominant": True, "hbar": hbar,
            "pi_R": cum_omega("R", t),
            "pi_T": cum_omega("T", t),
            "pi_N": cum_omega("N", t),
        }

    # Search for roots of E[pi|d=1,s*] - hbar = 0
    s_grid = np.linspace(-2.0, 3.0, 1000)
    epi_vals = np.array([expected_pi_multistate(s, t, v, c_x) for s in s_grid])
    max_epi = epi_vals.max()

    if max_epi < hbar:
        # No equilibrium: protest fully suppressed
        return {
            "s_star": float('inf'), "dominant": False, "hbar": hbar,
            "pi_R": 0.0, "pi_T": 0.0, "pi_N": 0.0,
            "suppressed": True, "max_epi": max_epi,
        }

    def obj(s):
        return expected_pi_multistate(s, t, v, c_x) - hbar

    # Find the LEFT root (coordination equilibrium)
    peak_idx = int(np.argmax(epi_vals))
    s_peak = s_grid[peak_idx]

    left_root = None
    a = s_grid[0]
    if obj(a) <= 0 and obj(s_peak) >= 0:
        try:
            left_root = brentq(obj, a, s_peak, xtol=1e-12)
        except ValueError:
            pass

    if left_root is None:
        # Try with broader range
        a = s_peak - 10.0
        if obj(a) <= 0 and obj(s_peak) >= 0:
            try:
                left_root = brentq(obj, a, s_peak, xtol=1e-12)
            except ValueError:
                pass

    if left_root is None:
        left_root = s_peak  # Fallback

    s_star = left_root

    # Realized protest for each true state
    result = {"s_star": s_star, "dominant": False, "hbar": hbar}
    for th in THETAS:
        om = omega_t(th, t)
        big_om = cum_omega(th, t)
        result[f"pi_{th}"] = big_om * logistic.cdf((om - s_star) / SIGMA)
    return result


def print_section(title: str):
    print(f"\n{'=' * 70}")
    print(f"  {title}")
    print(f"{'=' * 70}")


def main():
    print_section("PARAMETERS")
    print(f"  omega_R={OMEGA_R}, omega_T1={OMEGA_T1}, omega_T2={OMEGA_T2}, "
          f"omega_N={OMEGA_N}")
    print(f"  sigma={SIGMA}, C_D={C_D}, C_A={C_A}, B={B}, delta={DELTA}")
    print(f"  pi_fall_D={PI_FALL_D}, pi_fall_A={PI_FALL_A}")
    print(f"  Omega2_R={OMEGA2_R:.4f}, Omega2_T={OMEGA2_T:.4f}")
    print(f"  C_A^dom = v/(1-Omega2_R) = {1.0/(1-OMEGA2_R):.4f}")

    # ================================================================
    # 1. Four scenarios with C_A=2.0, pi_fall_A=0.06
    # ================================================================
    print_section("1. FOUR SCENARIOS (C_A=2.0, pi_fall_A=0.06)")

    scenarios = [
        ("R×D", "R", C_D, True),   # rapid, democracy, comp expected
        ("R×A", "R", C_A, False),   # rapid, autocracy, no comp
        ("T×D", "T", C_D, False),   # threshold, democracy, no comp t=2
        ("T×A", "T", C_A, True),    # threshold, autocracy, comp by decree
    ]

    for name, traj, c_x, has_comp in scenarios:
        # t=1
        if traj == "R" and has_comp:  # R×D: comp expected
            v1 = 1 + DELTA * (1 - B)
        elif traj == "R" and not has_comp:  # R×A: no comp
            v1 = 1 + DELTA
        elif traj == "T":  # threshold t=1: low displacement
            v1 = 1 + DELTA  # forward-looking, no comp expected
        else:
            v1 = 1 + DELTA
        eq1 = solve_equilibrium(1, v1, c_x)

        # t=2
        if has_comp:
            v2 = 1 - B
        else:
            v2 = 1.0
        eq2 = solve_equilibrium(2, v2, c_x)

        theta = "R" if traj == "R" else "T"
        pi1 = eq1[f"pi_{theta}"]
        pi2 = eq2[f"pi_{theta}"]
        pi_fall = PI_FALL_D if "D" in name else PI_FALL_A

        if has_comp and "D" in name:
            # Democracy: comp with lag, so phi_2=1
            outcome = "STABLE" if pi2 < pi_fall else "FALLS"
        elif has_comp and "A" in name:
            # Autocracy: comp immediate
            outcome = "STABLE" if pi2 < pi_fall else "FALLS"
        else:
            outcome = "STABLE" if pi2 < pi_fall else "FALLS"

        dom1 = " (dominant)" if eq1.get("dominant") else ""
        dom2 = " (dominant)" if eq2.get("dominant") else ""
        sup2 = " (suppressed)" if eq2.get("suppressed") else ""

        print(f"\n  {name}:")
        print(f"    t=1: v={v1:.2f}, pi={pi1:.4f}{dom1}")
        print(f"    t=2: v={v2:.2f}, pi={pi2:.4f}{dom2}{sup2}, "
              f"pi_fall={pi_fall:.2f}")
        print(f"    Outcome: {outcome}")

    # ================================================================
    # 2. Sweet spot sweep
    # ================================================================
    print_section("2. SWEET SPOT SWEEP (R×A, t=2, v=1)")

    c_a_values = np.arange(1.5, 2.10, 0.02)
    header = f"  {'C_A':>6} | {'hbar':>6} | {'pi*_R':>8} | {'> pi_fall?':>10} | {'status':>12}"
    print(f"\n{header}")
    print(f"  {'-' * len(header)}")

    sweet_spot_min = C_D
    sweet_spot_max = None
    last_pi = None

    for ca in c_a_values:
        eq = solve_equilibrium(2, 1.0, ca)
        pi_r = eq["pi_R"]
        exceeds = pi_r > PI_FALL_A
        status = ""
        if eq.get("dominant"):
            status = "dominant"
        elif eq.get("suppressed"):
            status = "suppressed"
        elif pi_r > PI_FALL_A:
            status = "IN sweet spot"
        else:
            status = "below pi_fall"

        if last_pi is not None and last_pi > PI_FALL_A and pi_r <= PI_FALL_A:
            # Interpolate
            sweet_spot_max = ca - 0.02 + 0.02 * (last_pi - PI_FALL_A) / (
                last_pi - pi_r)

        last_pi = pi_r
        print(f"  {ca:6.2f} | {eq['hbar']:6.4f} | {pi_r:8.4f} | "
              f"{'YES' if exceeds else 'NO':>10} | {status:>12}")

    # Check for collapse/suppression
    if sweet_spot_max is None:
        # Check if we hit suppression
        for ca in np.arange(2.10, 3.00, 0.05):
            eq = solve_equilibrium(2, 1.0, ca)
            pi_r = eq["pi_R"]
            if pi_r <= PI_FALL_A:
                sweet_spot_max = ca
                break

    print(f"\n  Sweet spot: C_A in ({sweet_spot_min:.2f}, "
          f"{sweet_spot_max:.2f})" if sweet_spot_max else
          f"\n  Sweet spot: C_A in ({sweet_spot_min:.2f}, "
          f">{c_a_values[-1]:.2f})")

    # ================================================================
    # 3. Knife-edge check (T×A t=1)
    # ================================================================
    print_section("3. KNIFE-EDGE CHECK (T×A t=1)")

    # Under T×A t=1: displaced protest with v = 1 + delta = 1.9
    v_t1 = 1 + DELTA
    eq_ta1 = solve_equilibrium(1, v_t1, C_A)
    pi_ta1 = eq_ta1["pi_T"]
    print(f"  v = {v_t1:.2f}, C_A = {C_A:.2f}")
    print(f"  hbar = {eq_ta1['hbar']:.4f}")
    print(f"  pi(T, t=1) = {pi_ta1:.4f}")
    print(f"  pi_fall_A = {PI_FALL_A:.2f}")
    print(f"  pi < pi_fall_A? {'YES (stable)' if pi_ta1 < PI_FALL_A else 'NO (falls!)'}")
    print(f"  Margin: {PI_FALL_A - pi_ta1:.4f}")

    # R×A t=1 check
    print_section("4. R×A t=1 CHECK")
    eq_ra1 = solve_equilibrium(1, v_t1, C_A)
    pi_ra1 = eq_ra1["pi_R"]
    print(f"  v = {v_t1:.2f}, C_A = {C_A:.2f}")
    print(f"  pi(R, t=1) = {pi_ra1:.4f}")
    print(f"  pi_fall_A = {PI_FALL_A:.2f}")
    print(f"  pi < pi_fall_A? {'YES (survives t=1)' if pi_ra1 < PI_FALL_A else 'NO (falls t=1)'}")
    if pi_ra1 < PI_FALL_A:
        print(f"  -> Autocracy survives t=1, falls in t=2 via accumulation")

    # ================================================================
    # 4. C_A^dom boundary
    # ================================================================
    print_section("5. DOMINANT STRATEGY BOUNDARY")
    c_dom = 1.0 / (1 - OMEGA2_R)
    print(f"  C_A^dom = v/(1-Omega2_R) = 1/{1-OMEGA2_R:.4f} = {c_dom:.4f}")
    print(f"  Current C_A = {C_A:.2f}")
    print(f"  C_A < C_A^dom? {'YES' if C_A < c_dom else 'NO'}")
    print(f"  Margin: {c_dom - C_A:.4f}")

    # ================================================================
    # VERDICT
    # ================================================================
    print_section("VERDICT")

    eq_rd2 = solve_equilibrium(2, 1 - B, C_D)  # R×D, comp
    eq_ra2 = solve_equilibrium(2, 1.0, C_A)     # R×A, no comp
    eq_td2 = solve_equilibrium(2, 1.0, C_D)     # T×D, no comp (lag)
    eq_ta2 = solve_equilibrium(2, 1 - B, C_A)   # T×A, comp

    checks = {
        "R×D stable (pi < pi_fall_D)": eq_rd2["pi_R"] < PI_FALL_D,
        "R×A falls (pi > pi_fall_A)": eq_ra2["pi_R"] > PI_FALL_A,
        "T×D falls (pi > pi_fall_D)": eq_td2["pi_T"] > PI_FALL_D,
        "T×A stable (pi < pi_fall_A)": eq_ta2["pi_T"] < PI_FALL_A,
        "T×A t=1 stable (no knife-edge)": pi_ta1 < PI_FALL_A,
        "C_A=2.0 in sweet spot": C_A > C_D and eq_ra2["pi_R"] > PI_FALL_A,
        "C_A < C_A^dom (interior eq.)": C_A < c_dom,
    }

    all_pass = True
    for name, ok in checks.items():
        status = "PASS" if ok else "FAIL"
        if not ok:
            all_pass = False
        print(f"  [{status}] {name}")

    print(f"\n  OVERALL: {'ALL PASS' if all_pass else 'SOME FAILED'}")

    # Summary for paper
    print_section("SUMMARY FOR PAPER")
    print(f"  Parameters: C_A=2.0, pi_fall_A=0.06")
    print(f"  Sweet spot: C_A in ({sweet_spot_min:.2f}, "
          f"{sweet_spot_max:.2f})" if sweet_spot_max else
          f"  Sweet spot: C_A in ({sweet_spot_min:.2f}, "
          f"~{c_dom:.2f})")
    print(f"  C_A=2.0: pi*(R×A,t=2) = {eq_ra2['pi_R']:.4f} >> "
          f"pi_fall_A={PI_FALL_A}")
    print(f"  T×A t=1: pi = {pi_ta1:.4f} < pi_fall_A={PI_FALL_A} "
          f"(margin={PI_FALL_A - pi_ta1:.4f})")
    print(f"  R×A t=1: pi = {pi_ra1:.4f} < pi_fall_A={PI_FALL_A} "
          f"(margin={PI_FALL_A - pi_ra1:.4f})")


if __name__ == "__main__":
    main()
