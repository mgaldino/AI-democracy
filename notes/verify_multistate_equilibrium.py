"""
Numerical verification for multi-state global game equilibrium derivations.
Accompanies notes/multistate_equilibrium_derivations.md.

Key insight: The expressive value v depends on worker status.
- Displaced, uncompensated worker: v = 1 + delta (absorbing => future loss = 1)
- Displaced, compensated worker: v = (1-B) + delta*(1-B) = (1-B)(1+delta)

For democracy (C_D=1.5) with v=1.9: h_bar = 1 - 1.9/1.5 = -0.267 < 0
  => Protesting is a DOMINANT STRATEGY for displaced workers.
  => ALL displaced workers protest. pi_theta = Omega_t(theta).

For autocracy (C_A=2.0) with v=1.9: h_bar = 1 - 1.9/2.0 = 0.05
  => Interior cutoff equilibrium exists when Omega > 0.05.
"""

import numpy as np
from scipy.optimize import brentq
from scipy.stats import norm

# ============================================================
# Parameters (from paper.Rmd Section 3.8)
# ============================================================
omega_R = 0.30
omega_T1 = 0.05
omega_T2 = 0.60
omega_N = 0.02
sigma = 0.10
C_D = 1.5
C_A = 2.0
B = 0.6
delta = 0.9
gamma = 0.3
pi_D_fall = 0.20
pi_A_fall = 0.05
p_R = 0.30
p_T = 0.30
p_N = 0.40
omega_bar_A = 0.40
sigma_A_val = 0.15

np.random.seed(42)

# ============================================================
# Expressive values
# ============================================================
v_displaced_uncomp = 1.0 + delta  # = 1.9
v_displaced_comp = (1.0 - B) * (1.0 + delta)  # = 0.4 * 1.9 = 0.76

print("=" * 70)
print("EXPRESSIVE VALUES")
print("=" * 70)
print(f"  v (displaced, uncompensated) = 1 + delta = {v_displaced_uncomp:.2f}")
print(f"  v (displaced, compensated)   = (1-B)(1+delta) = {v_displaced_comp:.2f}")
print(f"  h_bar_D (uncomp) = 1 - {v_displaced_uncomp}/{C_D} = {1 - v_displaced_uncomp/C_D:.4f}")
print(f"  h_bar_A (uncomp) = 1 - {v_displaced_uncomp}/{C_A} = {1 - v_displaced_uncomp/C_A:.4f}")
print(f"  h_bar_D (comp)   = 1 - {v_displaced_comp}/{C_D} = {1 - v_displaced_comp/C_D:.4f}")
print(f"  h_bar_A (comp)   = 1 - {v_displaced_comp}/{C_A} = {1 - v_displaced_comp/C_A:.4f}")

# ============================================================
# Logistic CDF / PDF
# ============================================================
def Lambda(z):
    return 1.0 / (1.0 + np.exp(-np.clip(z, -500, 500)))

def lam(z):
    z = np.clip(z, -500, 500)
    e = np.exp(-z)
    return e / (1.0 + e)**2

# ============================================================
# Cumulative displaced (absorbing)
# ============================================================
def Omega(t, theta):
    if t == 1:
        return {'R': omega_R, 'T': omega_T1, 'N': omega_N}[theta]
    elif t == 2:
        return {'R': omega_R*(2-omega_R), 'T': omega_T1+(1-omega_T1)*omega_T2, 'N': omega_N*(2-omega_N)}[theta]

def omega_flow(t, theta):
    if t == 1:
        return {'R': omega_R, 'T': omega_T1, 'N': omega_N}[theta]
    elif t == 2:
        return {'R': omega_R, 'T': omega_T2, 'N': omega_N}[theta]

# ============================================================
# Multi-state equilibrium
# ============================================================
def G_func(s, t, C_x, v):
    """G(s) = sum_theta P(theta|d=1,s) * Omega_t(theta) * Lambda((omega_theta - s)/sigma) - h_bar"""
    h_bar = 1.0 - v / C_x
    thetas = ['R', 'T', 'N']
    priors = {'R': p_R, 'T': p_T, 'N': p_N}

    weights = {}
    for th in thetas:
        w_th = omega_flow(t, th)
        z = (s - w_th) / sigma
        weights[th] = w_th * lam(z) * priors[th]
    total_w = sum(weights.values())
    if total_w < 1e-300:
        return -h_bar

    posteriors = {th: weights[th] / total_w for th in thetas}
    val = sum(posteriors[th] * Omega(t, th) * Lambda((omega_flow(t, th) - s) / sigma) for th in thetas)
    return val - h_bar

def find_cutoff(t, C_x, v, bracket=(-2.0, 2.0)):
    fa = G_func(bracket[0], t, C_x, v)
    fb = G_func(bracket[1], t, C_x, v)
    if fa * fb > 0:
        bracket = (-5.0, 5.0)
        fa = G_func(bracket[0], t, C_x, v)
        fb = G_func(bracket[1], t, C_x, v)
        if fa * fb > 0:
            return None  # No interior equilibrium
    return brentq(lambda s: G_func(s, t, C_x, v), bracket[0], bracket[1], xtol=1e-12)

def pi_theta_val(s_star, t, theta):
    return Omega(t, theta) * Lambda((omega_flow(t, theta) - s_star) / sigma)

def posterior_at_s(s, t):
    thetas = ['R', 'T', 'N']
    priors = {'R': p_R, 'T': p_T, 'N': p_N}
    weights = {}
    for th in thetas:
        w_th = omega_flow(t, th)
        z = (s - w_th) / sigma
        weights[th] = w_th * lam(z) * priors[th]
    total = sum(weights.values())
    return {th: weights[th] / total for th in thetas}

# ============================================================
# ANALYSIS
# ============================================================

print("\n" + "=" * 70)
print("CUMULATIVE DISPLACED FRACTIONS")
print("=" * 70)
for t in [1, 2]:
    for th in ['R', 'T', 'N']:
        print(f"  Omega_{t}({th}) = {Omega(t, th):.4f}")

# ============================================================
# DEMOCRACY ANALYSIS
# ============================================================
print("\n" + "=" * 70)
print("DEMOCRACY (C_D = 1.5)")
print("=" * 70)

v_D = v_displaced_uncomp  # 1.9
h_bar_D = 1 - v_D / C_D  # -0.267

print(f"\n  v = {v_D}, h_bar = {h_bar_D:.4f}")
print(f"  Since h_bar < 0, v > C_D: protesting is DOMINANT STRATEGY for displaced workers.")
print(f"  ALL displaced workers protest regardless of signal or coordination.")
print(f"  => pi_theta(t) = Omega_t(theta) for all theta, t.")

print("\n  State-specific protest (dominant strategy regime):")
for t in [1, 2]:
    for th in ['R', 'T', 'N']:
        print(f"    pi_{th}(t={t}) = Omega_{t}({th}) = {Omega(t, th):.4f}")

# Under Rapid (true state = R):
print(f"\n  --- RAPID (true state R) ---")
print(f"    t=1: pi_R(1) = {Omega(1, 'R'):.4f}, pi_D_fall = {pi_D_fall:.4f}, exceeds? {Omega(1, 'R') > pi_D_fall}")
print(f"    t=2: pi_R(2) = {Omega(2, 'R'):.4f}, pi_D_fall = {pi_D_fall:.4f}, exceeds? {Omega(2, 'R') > pi_D_fall}")

# Under Threshold (true state T):
print(f"\n  --- THRESHOLD (true state T) ---")
print(f"    t=1: pi_T(1) = {Omega(1, 'T'):.4f}, pi_D_fall = {pi_D_fall:.4f}, exceeds? {Omega(1, 'T') > pi_D_fall}")
print(f"    t=2: pi_T(2) = {Omega(2, 'T'):.4f}, pi_D_fall = {pi_D_fall:.4f}, exceeds? {Omega(2, 'T') > pi_D_fall}")

# ============================================================
# AUTOCRACY ANALYSIS
# ============================================================
print("\n" + "=" * 70)
print("AUTOCRACY (C_A = 2.0)")
print("=" * 70)

v_A = v_displaced_uncomp  # 1.9
h_bar_A = 1 - v_A / C_A  # 0.05

print(f"\n  v = {v_A}, h_bar = {h_bar_A:.4f}")
print(f"  h_bar > 0: interior equilibrium possible when Omega > h_bar.")

# Check each period
for t in [1, 2]:
    print(f"\n  --- t = {t} ---")
    s_star = find_cutoff(t, C_A, v_A)
    if s_star is not None:
        print(f"    Interior cutoff s* = {s_star:.6f}")
        post = posterior_at_s(s_star, t)
        print(f"    Posteriors: R={post['R']:.4f}, T={post['T']:.4f}, N={post['N']:.4f}")
        for th in ['R', 'T', 'N']:
            pi = pi_theta_val(s_star, t, th)
            print(f"    pi_{th}(t={t}) = {pi:.6f}")
    else:
        # Check if h_bar < 0 or > max(Omega)
        max_Om = max(Omega(t, th) for th in ['R', 'T', 'N'])
        print(f"    No interior cutoff. h_bar={h_bar_A:.4f}, max(Omega)={max_Om:.4f}")
        if h_bar_A <= 0:
            print(f"    Dominant strategy: ALL displaced protest. pi_theta = Omega_theta.")
        elif h_bar_A >= max_Om:
            print(f"    No protest: h_bar >= max(Omega). pi_theta = 0 for all theta.")
        else:
            # G(s) < 0 everywhere but h_bar < max Omega?
            # Let's scan G
            print(f"    Scanning G(s)...")
            ss = np.linspace(-2, 2, 201)
            gs = [G_func(s, t, C_A, v_A) for s in ss]
            print(f"    G_max = {max(gs):.6f} at s = {ss[np.argmax(gs)]:.4f}")
            print(f"    G_min = {min(gs):.6f}")

# ============================================================
# G(s) scan for autocracy
# ============================================================
print("\n" + "=" * 70)
print("G(s) PROFILE — AUTOCRACY, v=1.9")
print("=" * 70)

for t in [1, 2]:
    print(f"\n  t = {t}, h_bar = {h_bar_A:.4f}")
    ss = np.linspace(-0.5, 1.0, 31)
    for s in ss:
        g = G_func(s, t, C_A, v_A)
        print(f"    s={s:+.4f}: G={g:+.6f}")

# ============================================================
# Compensated case: v = (1-B)(1+delta) = 0.76
# ============================================================
print("\n" + "=" * 70)
print("COMPENSATED CASE: v = (1-B)(1+delta) = 0.76")
print("=" * 70)

v_comp = v_displaced_comp  # 0.76

for regime, C_x in [('Democracy', C_D), ('Autocracy', C_A)]:
    hb = 1 - v_comp / C_x
    print(f"\n  {regime}: h_bar = 1 - {v_comp:.2f}/{C_x} = {hb:.4f}")
    for t in [1, 2]:
        s_star = find_cutoff(t, C_x, v_comp)
        if s_star is not None:
            print(f"    t={t}: s* = {s_star:.6f}")
            for th in ['R', 'T', 'N']:
                pi = pi_theta_val(s_star, t, th)
                print(f"      pi_{th} = {pi:.6f}")
        else:
            max_Om = max(Omega(t, th) for th in ['R', 'T', 'N'])
            print(f"    t={t}: No interior cutoff (h_bar={hb:.4f}, max_Omega={max_Om:.4f})")
            if hb <= 0:
                print(f"      => Dominant strategy: all displaced protest")
            elif hb >= max_Om:
                print(f"      => No protest equilibrium")

# ============================================================
# ELITE APPROVAL
# ============================================================
print("\n" + "=" * 70)
print("ELITE APPROVAL PROBABILITIES (sigma_A = 0.15, omega_bar_A = 0.40)")
print("=" * 70)

for w, label in [(omega_R, 'omega_R=0.30'), (omega_T1, 'omega_T1=0.05'),
                  (omega_T2, 'omega_T2=0.60'), (omega_N, 'omega_N=0.02')]:
    p_approve = norm.cdf((w - omega_bar_A) / sigma_A_val)
    print(f"  P(approve | {label}) = {p_approve:.4f}")

# ============================================================
# KEY ANALYSIS: What h_bar values give interior equilibrium?
# ============================================================
print("\n" + "=" * 70)
print("INTERIOR EQUILIBRIUM EXISTENCE CONDITIONS")
print("=" * 70)

# For interior equilibrium, we need: 0 < h_bar < G_inf
# where G_inf = lim_{s->-inf} sum P(theta|d=1,s) * Omega(theta)

for t in [1, 2]:
    # As s -> -inf, posterior concentrates on theta with largest omega
    # P(theta|d=1,s) -> w_theta = omega_theta * p_theta * exp(omega_theta/sigma) / Z
    unnorm = {}
    for th in ['R', 'T', 'N']:
        w = omega_flow(t, th)
        unnorm[th] = w * {'R': p_R, 'T': p_T, 'N': p_N}[th] * np.exp(w / sigma)
    Z = sum(unnorm.values())
    weights_inf = {th: unnorm[th] / Z for th in ['R', 'T', 'N']}

    G_inf = sum(weights_inf[th] * Omega(t, th) for th in ['R', 'T', 'N'])

    print(f"\n  t = {t}:")
    print(f"    Asymptotic weights (s -> -inf): R={weights_inf['R']:.6f}, T={weights_inf['T']:.6f}, N={weights_inf['N']:.6f}")
    print(f"    G_inf = sum w_theta * Omega_theta = {G_inf:.6f}")
    print(f"    For interior equilibrium: need 0 < h_bar < {G_inf:.6f}")
    print(f"    h_bar_D(v=1.9) = {1-v_displaced_uncomp/C_D:.4f} {'< 0: DOMINANT' if 1-v_displaced_uncomp/C_D < 0 else ''}")
    print(f"    h_bar_A(v=1.9) = {1-v_displaced_uncomp/C_A:.4f} {'OK' if 0 < 1-v_displaced_uncomp/C_A < G_inf else 'OUT OF RANGE'}")

# ============================================================
# COMPLETE FOUR-SCENARIO ANALYSIS
# ============================================================
print("\n" + "=" * 70)
print("COMPLETE FOUR-SCENARIO ANALYSIS")
print("=" * 70)

# Key realization:
# In democracy, v > C_D => all displaced protest => pi = Omega
# In autocracy, h_bar = 0.05 => interior equilibrium
# But the compensation/fall logic also depends on regime-specific triggers

# DEMOCRACY x RAPID
print("\n--- D x R (Democracy, Rapid) ---")
print(f"  t=1: All displaced protest. pi = Omega_1(R) = {Omega(1,'R'):.4f}")
print(f"    pi > pi_D_fall={pi_D_fall}? {Omega(1,'R') > pi_D_fall}")
print(f"    pi > pi_D_comp? YES (triggers compensation via voice)")
print(f"    Compensation enacted but lag: phi_1=0, phi_2=1")
print(f"    NOTE: With compensation promised for t=2, credible commitment")
print(f"    reduces v for t=1 protest. But v=1.9 > C_D=1.5 even without future,")
print(f"    so dominant strategy holds in t=1 regardless.")
print(f"    pi_R(1) = 0.30 > pi_D_fall = 0.20 => FALLS IN t=1!")
print(f"    PROBLEM: Democracy falls under rapid in t=1 too!")

# DEMOCRACY x THRESHOLD
print("\n--- D x T (Democracy, Threshold) ---")
print(f"  t=1: pi = Omega_1(T) = {Omega(1,'T'):.4f}")
print(f"    pi > pi_D_fall={pi_D_fall}? {Omega(1,'T') > pi_D_fall}")
print(f"    Stable in t=1.")
print(f"  t=2: pi = Omega_2(T) = {Omega(2,'T'):.4f}")
print(f"    pi > pi_D_fall={pi_D_fall}? {Omega(2,'T') > pi_D_fall}")
print(f"    FALLS in t=2.")

# AUTOCRACY x RAPID
print("\n--- A x R (Autocracy, Rapid) ---")
s1 = find_cutoff(1, C_A, v_A)
if s1:
    pi_R1_A = pi_theta_val(s1, 1, 'R')
else:
    # Check if dominant or no protest
    if 1 - v_A/C_A <= 0:
        pi_R1_A = Omega(1, 'R')
    else:
        pi_R1_A = 0  # No protest
print(f"  t=1: s*={s1}, pi_R(1) = {pi_R1_A:.4f}")
print(f"    Elite approval P(approve|omega_R) = {norm.cdf((omega_R-omega_bar_A)/sigma_A_val):.4f}")
print(f"    No compensation.")
print(f"    pi > pi_A_fall={pi_A_fall}? {pi_R1_A > pi_A_fall}")

s2 = find_cutoff(2, C_A, v_A)
if s2:
    pi_R2_A = pi_theta_val(s2, 2, 'R')
else:
    if 1 - v_A/C_A <= 0:
        pi_R2_A = Omega(2, 'R')
    else:
        pi_R2_A = 0
print(f"  t=2: s*={s2}, pi_R(2) = {pi_R2_A:.4f}")
print(f"    pi > pi_A_fall={pi_A_fall}? {pi_R2_A > pi_A_fall}")

# AUTOCRACY x THRESHOLD
print("\n--- A x T (Autocracy, Threshold) ---")
if s1:
    pi_T1_A = pi_theta_val(s1, 1, 'T')
else:
    pi_T1_A = Omega(1, 'T') if 1-v_A/C_A <= 0 else 0
print(f"  t=1: pi_T(1) = {pi_T1_A:.6f}")
print(f"    pi > pi_A_fall={pi_A_fall}? {pi_T1_A > pi_A_fall}")

if s2:
    pi_T2_A = pi_theta_val(s2, 2, 'T')
else:
    pi_T2_A = Omega(2, 'T') if 1-v_A/C_A <= 0 else 0
print(f"  t=2 (no comp): pi_T(2) = {pi_T2_A:.6f}")
print(f"    Elite approval P(approve|omega_T2) = {norm.cdf((omega_T2-omega_bar_A)/sigma_A_val):.4f}")
print(f"    If compensated: v_comp={v_comp:.2f}, h_bar_comp={1-v_comp/C_A:.4f}")

s2_comp = find_cutoff(2, C_A, v_comp)
if s2_comp:
    pi_T2_A_comp = pi_theta_val(s2_comp, 2, 'T')
    print(f"    Compensated: s*={s2_comp:.6f}, pi_T(2) = {pi_T2_A_comp:.6f}")
    print(f"    pi > pi_A_fall={pi_A_fall}? {pi_T2_A_comp > pi_A_fall}")
else:
    print(f"    Compensated: no interior cutoff")
    if 1-v_comp/C_A <= 0:
        print(f"    Dominant strategy even with compensation")
    else:
        max_Om = max(Omega(2, th) for th in ['R', 'T', 'N'])
        print(f"    h_bar_comp={1-v_comp/C_A:.4f} vs max_Omega={max_Om:.4f}")

# ============================================================
# CRITICAL ISSUE: D x R falls in t=1 with these parameters!
# ============================================================
print("\n" + "=" * 70)
print("CRITICAL: PARAMETER RECONCILIATION")
print("=" * 70)
print(f"""
The paper says D x R is STABLE. But with:
  v = 1 + delta = 1.9
  C_D = 1.5
  h_bar_D = -0.267 < 0 => dominant strategy
  pi_R(1) = Omega_1(R) = 0.30 > pi_D_fall = 0.20 => FALLS

This means the paper's stability under D x R requires either:
  (a) v < C_D = 1.5 in t=1 (credible commitment effect)
  (b) The fall condition checks COMPENSATED protest
  (c) pi_D_fall is higher
  (d) The model uses a different v for the coordination game

The paper says (Section 3.8): "credible legislative commitment reduces
workers' expected future loss, lowering v_i in t=1."

If compensation is enacted in t=1 (phi_2=1 promised), then:
  E[future loss] = omega_R * (1-B) = 0.30 * 0.40 = 0.12
  (remaining workers face omega_R displacement but get B if displaced)
  v_credible = 1 + delta * 0.12 = 1 + 0.9 * 0.12 = 1.108

  h_bar_D(v=1.108) = 1 - 1.108/1.5 = {1-1.108/1.5:.4f}

  This is > 0 but < Omega_1(R) = 0.30. Interior equilibrium possible!
""")

# Recompute with credible commitment
v_credible = 1 + delta * omega_R * (1 - B)
print(f"v_credible = {v_credible:.4f}")
hb_credible = 1 - v_credible / C_D
print(f"h_bar_D(credible) = {hb_credible:.4f}")

# But wait - the credible commitment is endogenous.
# Before compensation is triggered, v = 1.9 (no expectation of comp)
# After comp triggered, v drops to 1.108.
# The timing: protest happens, THEN compensation trigger fires.
# So the protest that triggers compensation uses v=1.9 (before trigger).
# But the protest that determines FALL uses... also v=1.9?

# Actually, the paper's logic for D x R stability:
# 1. Workers protest with high v (v > C_D => dominant strategy)
# 2. pi_R(1) = Omega_1(R) = 0.30 > pi_D_comp => compensation triggered
# 3. pi_R(1) = 0.30 > pi_D_fall = 0.20??
# 4. But pi_D_fall = 0.20 in the paper. So D x R FALLS in t=1 too!

# Unless pi_D_fall is the threshold AFTER accounting for the compensation.
# The paper says: "Regime falls iff pi_t > pi_D_fall AND phi_t = 0"
# In democracy t=1: phi_1 = 0 (lag!) so the fall check is just pi_1 > pi_D_fall
# And pi_1 = 0.30 > 0.20. So democracy falls under rapid in t=1!

# This is a genuine issue with the paper's parameters.
# Let me check if the paper handles this differently.

print(f"\nWith v_credible in a single-state game under R:")
s_cred = find_cutoff(1, C_D, v_credible)
if s_cred:
    pi_cred = pi_theta_val(s_cred, 1, 'R')
    print(f"  s* = {s_cred:.6f}")
    print(f"  pi_R = {pi_cred:.6f}")
    print(f"  pi < pi_D_fall? {pi_cred < pi_D_fall}")
else:
    print(f"  No interior cutoff")
    if hb_credible <= 0:
        print(f"  Dominant: pi = Omega(R) = {Omega(1,'R')}")

# Let me also check: what if the paper means pi is fraction of DISPLACED
# workers who protest, not fraction of ALL workers?
print("\n\nAlternative: if pi = fraction of displaced who protest")
print("  Then single-state: pi* = h_bar in terms of displaced-only fraction")
print("  And the fall threshold is on fraction of displaced who protest")
print("  Then pi_fall is measured against displaced-who-protest, which can be > 1?")
print("  No, that doesn't make sense either.")

# The most likely resolution: the paper's credible commitment effect
# is that once compensation is triggered simultaneously with protest,
# the v drops and the effective protest is lower. But the timing says
# protest -> trigger -> fall check. So fall check uses original protest.

# Actually re-reading: the paper says the CREDIBLE commitment reduces
# v_i in t=1. This means workers anticipate that if pi is large enough,
# compensation will be triggered. So v is endogenous to the equilibrium.
# In equilibrium: if workers expect compensation to be triggered,
# they use v_credible = 1.108, and with h_bar = 0.261,
# pi* depends on the equilibrium analysis.

print("\n\nEndogenous credibility analysis:")
print(f"  If workers expect comp (phi_2=1): v = {v_credible:.4f}, h_bar = {hb_credible:.4f}")
print(f"  Single-state (R only): pi* = h_bar = {hb_credible:.4f}")
print(f"  Is pi* > pi_D_comp? Depends on pi_D_comp value.")
print(f"  Is pi* < pi_D_fall = {pi_D_fall}? {hb_credible < pi_D_fall}")
print(f"  YES! h_bar = {hb_credible:.4f} > pi_D_comp (assume small) and < pi_D_fall = {pi_D_fall}")
print(f"  => Democracy survives under rapid IF credible commitment holds.")

# For the multi-state game with v_credible:
s_ms = find_cutoff(1, C_D, v_credible)
if s_ms:
    print(f"\n  Multi-state cutoff: s* = {s_ms:.6f}")
    for th in ['R', 'T', 'N']:
        pi = pi_theta_val(s_ms, 1, th)
        print(f"    pi_{th}(1) = {pi:.6f}")
else:
    print(f"\n  No multi-state interior cutoff with v={v_credible:.4f}")
    # Scan
    ss = np.linspace(-1, 1, 201)
    gs = [G_func(s, 1, C_D, v_credible) for s in ss]
    print(f"    G_max = {max(gs):.6f} at s = {ss[np.argmax(gs)]:.4f}")

# Try with just v = 1 (the user's specification, ignoring future)
print("\n\nWith v = 1 (user specification, current period only):")
for regime, C_x in [('D', C_D), ('A', C_A)]:
    hb = 1 - 1.0/C_x
    print(f"  {regime}: h_bar = {hb:.4f}")
    for t in [1, 2]:
        s = find_cutoff(t, C_x, 1.0)
        if s:
            print(f"    t={t}: s* = {s:.6f}")
            for th in ['R', 'T', 'N']:
                pi = pi_theta_val(s, t, th)
                print(f"      pi_{th} = {pi:.6f}")
        else:
            max_Om = max(Omega(t, th) for th in ['R', 'T', 'N'])
            print(f"    t={t}: No cutoff. h_bar={hb:.4f}, max_Omega={max_Om:.4f}")

print("\n\nDone.")
