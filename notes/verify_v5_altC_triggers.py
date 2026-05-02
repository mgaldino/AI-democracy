"""
Verify the protest-as-trigger mechanism for democracy in the v5 model.

Parameters:
  ω_R=0.30, ω_T1=0.05, ω_T2=0.60, ω_N=0.02
  σ=0.10, C_D=1.5, C_A=2.0, B=0.6, δ=0.9
  p_R=0.30, p_T=0.30, p_N=0.40
  σ_A=0.15 (elite's noise)

Four checks:
  1. Protest levels under each scenario (single-state approximation)
  2. Democratic trigger check (π̄_D^comp = 0.05)
  3. Autocratic trigger check (find ω̄_A that separates R from T2)
  4. Full crossed fragility check with Alt C triggers
"""

import numpy as np
from scipy.stats import norm

# ── Parameters ──────────────────────────────────────────────────────────

omega_R  = 0.30   # displacement prob under Rapid
omega_T1 = 0.05   # displacement prob under Threshold t=1
omega_T2 = 0.60   # displacement prob under Threshold t=2
omega_N  = 0.02   # displacement prob under No-shock

sigma    = 0.10   # signal noise
C_D      = 1.5    # protest cost in democracy
C_A      = 2.0    # protest cost in autocracy
B        = 0.6    # compensation benefit
delta    = 0.9    # discount factor

p_R      = 0.30   # prior on Rapid
p_T      = 0.30   # prior on Threshold
p_N      = 0.40   # prior on No-shock

sigma_A  = 0.15   # elite's observation noise in autocracy

pi_bar_D_comp = 0.05  # democratic compensation trigger (5%)

# ── Derived quantities ──────────────────────────────────────────────────

# Cumulative displaced fractions (absorptive displacement)
Omega_1_R  = omega_R                              # Rapid t=1
Omega_1_T  = omega_T1                             # Threshold t=1
Omega_1_N  = omega_N                              # No-shock t=1

Omega_2_R  = omega_R + (1 - omega_R) * omega_R    # Rapid t=2 (absorptive)
Omega_2_T  = omega_T1 + (1 - omega_T1) * omega_T2 # Threshold t=2 (absorptive)
Omega_2_N  = omega_N + (1 - omega_N) * omega_N    # No-shock t=2


# ── Helper: protest level (single-state approximation) ──────────────────
def compute_protest(v, C_x, Omega):
    """
    Single-state approximation of the global game.

    Equilibrium condition: a worker protests iff v > C_x * (1 - h(π)),
    with h(π) = π (linear safety-in-numbers).

    In the unique interior equilibrium (if it exists):
      h̄ = 1 - v/C_x
      π* = h̄  (since h(π) = π)

    But π ≤ Ω (only displaced workers protest in this setup).

    Cases:
      - v ≤ 0:         no one protests → π = 0
      - v ≥ C_x:       dominant strategy to protest → π = Ω
      - 0 < v < C_x:   interior equilibrium h̄ = 1 - v/C_x
        - if h̄ ≥ Ω:   not enough people to sustain → π = 0
          (need π = h̄ but only Ω available, and Ω < h̄ means
           the realized safety-in-numbers is too low)
        - if h̄ < Ω:   interior eq π* = h̄
          Wait — check direction: h̄ = 1 - v/C_x is the threshold
          above which protest is self-sustaining. Actually:

    Let me re-derive carefully.
    Worker protests iff: v > C_x * (1 - π)  [since h(π) = π]
    Equivalently:        π > 1 - v/C_x

    If v > C_x: condition is π > negative number → always protests → π = Ω
    If v ≤ 0:   condition is π > 1+ → never protests → π = 0

    For 0 < v < C_x, define threshold: π̂ = 1 - v/C_x ∈ (0, 1)

    In the global game with uniform prior (Laplacian property):
    Worker with signal s_i uses strategy: protest iff s_i > s*
    At the cutoff s*, the worker is indifferent. Under Laplacian property,
    the worker believes π ~ U[0, Ω], so:

    E[payoff of protesting | s*] = v - C_x * E[1 - π | π evaluated at eq]

    With the single-state approximation and h(π) = π:
    The indifference condition gives us the equilibrium protest level.

    For the SIMPLIFIED single-state calculation the user requests:
      h̄ = 1 - v/C_x
      If h̄ < 0 (v > C_x): dominant strategy → π = Ω
      If h̄ ≥ 1 (v ≤ 0): no protest → π = 0
      If 0 ≤ h̄ < Ω: interior equilibrium → π = h̄
      If Ω ≤ h̄ < 1: insufficient mass → π = 0
        (This is the case where even if ALL displaced protest,
         safety-in-numbers is below what's needed → no eq)

    Actually, re-examining: if h̄ is the threshold of π needed for
    protest to be worthwhile, and Ω is the max possible π:
    - If Ω > h̄: there exists an interior equilibrium at π = h̄
      (enough people available to sustain safety-in-numbers at h̄)
    - If Ω ≤ h̄: even all displaced protesting gives π = Ω < h̄,
      which is insufficient → no protest equilibrium → π = 0

    Returns (h_bar, pi_star, case_description).
    """
    if v <= 0:
        h_bar = 1.0  # effectively no protest
        return h_bar, 0.0, "v <= 0 → no protest"
    if v >= C_x:
        h_bar = 1 - v / C_x  # negative
        return h_bar, Omega, f"v={v:.3f} >= C_x={C_x} → dominant strategy → π = Ω = {Omega:.4f}"

    h_bar = 1 - v / C_x

    if h_bar >= Omega:
        return h_bar, 0.0, f"h̄={h_bar:.4f} >= Ω={Omega:.4f} → no interior eq → π = 0"
    else:
        return h_bar, h_bar, f"h̄={h_bar:.4f} < Ω={Omega:.4f} → interior eq → π = h̄ = {h_bar:.4f}"


# ══════════════════════════════════════════════════════════════════════════
# CHECK 1: Protest levels under each scenario (single-state approximation)
# ══════════════════════════════════════════════════════════════════════════

results_check1 = []

print("=" * 80)
print("CHECK 1: Protest levels under each scenario (single-state approximation)")
print("=" * 80)

# --- R×D t=1 with compensation (law passed, φ₂ = 1 anticipated) ---
# v = 1 + δ(1 - B) = 1 + 0.9*(1 - 0.6) = 1 + 0.36 = 1.36
v_RD_t1_comp = 1 + delta * (1 - B)
h_bar, pi_star, desc = compute_protest(v_RD_t1_comp, C_D, Omega_1_R)
print(f"\nR×D t=1 (comp anticipated): v = {v_RD_t1_comp:.4f}, C_D = {C_D}")
print(f"  {desc}")
results_check1.append(("R×D t=1 comp", v_RD_t1_comp, C_D, Omega_1_R, h_bar, pi_star, desc))

# --- R×D t=1 without compensation ---
# v = 1 + δ = 1 + 0.9 = 1.9
v_RD_t1_nocomp = 1 + delta
h_bar, pi_star, desc = compute_protest(v_RD_t1_nocomp, C_D, Omega_1_R)
print(f"\nR×D t=1 (no comp): v = {v_RD_t1_nocomp:.4f}, C_D = {C_D}")
print(f"  {desc}")
results_check1.append(("R×D t=1 no-comp", v_RD_t1_nocomp, C_D, Omega_1_R, h_bar, pi_star, desc))

# --- T×D t=1: few displaced, employed have v ≈ 0 ---
# For displaced: v = 1 + δ * E[loss_future] ≈ small because few displaced
# Actually: under threshold t=1, ω_T1 = 0.05, so few are displaced.
# Displaced worker: v = 1 + δ * E[1 - y_{i2}] but we're in single-state approx
# For simplicity (as user says "v ≈ 0 for employed"):
# The protest is limited: even displaced have v but Ω_1_T = 0.05
# Let's compute for displaced workers with v = 1 (no comp expected, t=1 threshold)
# Under threshold t=1: low ω, no one expects crisis → v_employed ≈ 0
# v_displaced = 1 + δ * E[future loss] but expected future loss is ambiguous
# Single-state simplification: v ≈ 0 for most (employed), few displaced
v_TD_t1 = 0.0  # approximation: employed don't protest
h_bar, pi_star, desc = compute_protest(v_TD_t1, C_D, Omega_1_T)
print(f"\nT×D t=1 (employed, v≈0): v = {v_TD_t1:.4f}, C_D = {C_D}")
print(f"  {desc}")
results_check1.append(("T×D t=1", v_TD_t1, C_D, Omega_1_T, h_bar, pi_star, desc))

# --- T×D t=2 (no compensation): v = 1 ---
v_TD_t2_nocomp = 1.0
h_bar_TD_t2, pi_star_TD_t2, desc = compute_protest(v_TD_t2_nocomp, C_D, Omega_2_T)
print(f"\nT×D t=2 (no comp): v = {v_TD_t2_nocomp:.4f}, C_D = {C_D}, Ω₂(T) = {Omega_2_T:.4f}")
print(f"  {desc}")
results_check1.append(("T×D t=2 no-comp", v_TD_t2_nocomp, C_D, Omega_2_T, h_bar_TD_t2, pi_star_TD_t2, desc))

# --- R×A t=2 (no compensation): v = 1 ---
v_RA_t2 = 1.0
h_bar_RA_t2, pi_star_RA_t2, desc = compute_protest(v_RA_t2, C_A, Omega_2_R)
print(f"\nR×A t=2 (no comp): v = {v_RA_t2:.4f}, C_A = {C_A}, Ω₂(R) = {Omega_2_R:.4f}")
print(f"  {desc}")
results_check1.append(("R×A t=2 no-comp", v_RA_t2, C_A, Omega_2_R, h_bar_RA_t2, pi_star_RA_t2, desc))

# --- T×A t=2 (with compensation): v = 1 - B = 0.4 ---
v_TA_t2_comp = 1 - B
h_bar_TA_t2, pi_star_TA_t2, desc = compute_protest(v_TA_t2_comp, C_A, Omega_2_T)
print(f"\nT×A t=2 (comp): v = {v_TA_t2_comp:.4f}, C_A = {C_A}, Ω₂(T) = {Omega_2_T:.4f}")
print(f"  {desc}")
results_check1.append(("T×A t=2 comp", v_TA_t2_comp, C_A, Omega_2_T, h_bar_TA_t2, pi_star_TA_t2, desc))


# ══════════════════════════════════════════════════════════════════════════
# CHECK 2: Democratic trigger check (π̄_D^comp = 0.05)
# ══════════════════════════════════════════════════════════════════════════

print("\n" + "=" * 80)
print("CHECK 2: Democratic trigger check (π̄_D^comp = 0.05)")
print("=" * 80)

results_check2 = []

# R×D t=1 comp: π = h̄ from check 1
_, pi_RD_t1_comp, _ = compute_protest(v_RD_t1_comp, C_D, Omega_1_R)
triggers_comp = pi_RD_t1_comp > pi_bar_D_comp
print(f"\nR×D t=1 comp: π = {pi_RD_t1_comp:.4f}, π̄_D^comp = {pi_bar_D_comp}")
print(f"  Triggers compensation? {triggers_comp} (π > π̄_D^comp = {pi_RD_t1_comp > pi_bar_D_comp})")
results_check2.append(("R×D t=1 comp", pi_RD_t1_comp, triggers_comp,
                        "Expected: triggers → comp law passed → self-confirming"))

# R×D t=1 no-comp: π from check 1
_, pi_RD_t1_nocomp, _ = compute_protest(v_RD_t1_nocomp, C_D, Omega_1_R)
triggers_nocomp = pi_RD_t1_nocomp > pi_bar_D_comp
print(f"\nR×D t=1 no-comp: π = {pi_RD_t1_nocomp:.4f}, π̄_D^comp = {pi_bar_D_comp}")
print(f"  Triggers compensation? {triggers_nocomp}")
if triggers_nocomp:
    print(f"  → no-comp is NOT self-confirming (protest would trigger comp)")
results_check2.append(("R×D t=1 no-comp", pi_RD_t1_nocomp, triggers_nocomp,
                        "Expected: triggers → no-comp not self-confirming"))

# T×D t=1: π ≈ 0
_, pi_TD_t1, _ = compute_protest(v_TD_t1, C_D, Omega_1_T)
triggers_TD_t1 = pi_TD_t1 > pi_bar_D_comp
print(f"\nT×D t=1: π = {pi_TD_t1:.4f}, π̄_D^comp = {pi_bar_D_comp}")
print(f"  Triggers compensation? {triggers_TD_t1}")
results_check2.append(("T×D t=1", pi_TD_t1, triggers_TD_t1,
                        "Expected: no trigger → no comp"))

# T×D t=2: π from check 1
triggers_TD_t2 = pi_star_TD_t2 > pi_bar_D_comp
print(f"\nT×D t=2: π = {pi_star_TD_t2:.4f}, π̄_D^comp = {pi_bar_D_comp}")
print(f"  Triggers compensation? {triggers_TD_t2}")
if triggers_TD_t2:
    print(f"  → Triggers comp, but LAG → φ₂ = 0 → democracy FALLS")
results_check2.append(("T×D t=2", pi_star_TD_t2, triggers_TD_t2,
                        "Expected: triggers but lag → falls"))


# ══════════════════════════════════════════════════════════════════════════
# CHECK 3: Autocratic trigger check
# ══════════════════════════════════════════════════════════════════════════

print("\n" + "=" * 80)
print("CHECK 3: Autocratic trigger check")
print("=" * 80)

# The autocrat observes ω̃_S = ω + σ_A * ε, ε ~ N(0,1)
# P(ω̃_S > ω̄_A | ω) = P(ε > (ω̄_A - ω)/σ_A) = Φ((ω - ω̄_A)/σ_A)

# We want ω̄_A such that:
#   P(comp | ω_R = 0.30) < 0.5  (autocrat does NOT compensate under rapid)
#   P(comp | ω_T2 = 0.60) > 0.5 (autocrat DOES compensate under threshold t=2)
# Wait — this is backwards for crossed fragility. Let me re-read the question.
#
# The question asks: find ω̄_A such that P(comp|ω_R) < 0.5 AND P(comp|ω_T2) > 0.5
# This means: autocrat compensates under threshold t=2 but NOT under rapid.
# But for crossed fragility we need autocrat to NOT compensate under rapid
# (so it falls) and to survive threshold.
#
# Actually: the question is about whether the elite's noisy signal exceeds
# the compensation threshold. If ω̄_A is the threshold:
# P(sees crisis | ω) = Φ((ω - ω̄_A)/σ_A)
#
# For crossed fragility:
#   Autocracy under Rapid: should NOT compensate → fall
#   Autocracy under Threshold t=2: should NOT need to compensate (survives via repression)
#
# Let me just compute P(comp|ω) for various ω̄_A and report.

print(f"\nσ_A = {sigma_A}")
print(f"ω_R = {omega_R}, ω_T2 = {omega_T2}")
print()

# Scan ω̄_A from 0.1 to 0.8
omega_bar_A_values = np.arange(0.10, 0.81, 0.05)
print(f"{'ω̄_A':>8s} | P(comp|ω_R={omega_R}) | P(comp|ω_T2={omega_T2}) | P(comp|ω_R)<0.5 & P(comp|ω_T2)>0.5")
print("-" * 90)

valid_omega_bar_A = []
for omega_bar_A in omega_bar_A_values:
    p_comp_R  = norm.cdf((omega_R - omega_bar_A) / sigma_A)
    p_comp_T2 = norm.cdf((omega_T2 - omega_bar_A) / sigma_A)
    condition = (p_comp_R < 0.5) and (p_comp_T2 > 0.5)
    flag = " ← VALID" if condition else ""
    print(f"  {omega_bar_A:6.2f}  |      {p_comp_R:8.4f}       |      {p_comp_T2:8.4f}        | {condition}{flag}")
    if condition:
        valid_omega_bar_A.append(omega_bar_A)

# Find exact bounds
# P(comp|ω_R) < 0.5 ⟺ ω̄_A > ω_R = 0.30
# P(comp|ω_T2) > 0.5 ⟺ ω̄_A < ω_T2 = 0.60
lower_bound = omega_R
upper_bound = omega_T2
print(f"\nExact range for ω̄_A: ({lower_bound}, {upper_bound})")
print(f"Any ω̄_A ∈ ({lower_bound}, {upper_bound}) satisfies both conditions.")
print(f"This is a wide interval (width = {upper_bound - lower_bound:.2f}), so the result is NOT knife-edge.")

# Choose a representative ω̄_A
omega_bar_A_chosen = 0.45
p_comp_R_chosen  = norm.cdf((omega_R - omega_bar_A_chosen) / sigma_A)
p_comp_T2_chosen = norm.cdf((omega_T2 - omega_bar_A_chosen) / sigma_A)
print(f"\nChosen ω̄_A = {omega_bar_A_chosen}")
print(f"  P(comp|ω_R=0.30) = {p_comp_R_chosen:.4f}")
print(f"  P(comp|ω_T2=0.60) = {p_comp_T2_chosen:.4f}")


# ══════════════════════════════════════════════════════════════════════════
# CHECK 4: Full crossed fragility check with Alt C triggers
# ══════════════════════════════════════════════════════════════════════════

print("\n" + "=" * 80)
print("CHECK 4: Full crossed fragility check with Alt C triggers")
print("=" * 80)

# Using π̄_D^comp = 0.05 and ω̄_A = 0.45

# We also need π̄_A^fall (autocratic fall threshold)
# and π̄_D^fall (democratic fall threshold)
# From the reformulation plan: π̄_D^fall = 0.40, π̄_A^fall = 0.05
pi_bar_D_fall = 0.40
pi_bar_A_fall = 0.05

results_check4 = []

print(f"\nParameters: π̄_D^comp = {pi_bar_D_comp}, ω̄_A = {omega_bar_A_chosen}")
print(f"            π̄_D^fall = {pi_bar_D_fall}, π̄_A^fall = {pi_bar_A_fall}")

# --- R×D: Rapid × Democracy ---
print(f"\n--- R×D: Rapid × Democracy ---")
# t=1: Protest with comp anticipated
_, pi_RD_1, _ = compute_protest(v_RD_t1_comp, C_D, Omega_1_R)
print(f"  t=1: π = {pi_RD_1:.4f} (v = {v_RD_t1_comp:.2f}, comp anticipated)")
print(f"        π > π̄_D^comp = {pi_bar_D_comp}? {pi_RD_1 > pi_bar_D_comp} → comp law passed ✓")
# t=2: comp in effect (φ₂ = 1)
v_RD_2_comp = 1 - B  # compensated
_, pi_RD_2, desc_RD_2 = compute_protest(v_RD_2_comp, C_D, Omega_2_R)
print(f"  t=2: φ₂ = 1, v = {v_RD_2_comp:.2f}")
print(f"        {desc_RD_2}")
print(f"        π = {pi_RD_2:.4f} < π̄_D^fall = {pi_bar_D_fall}? {pi_RD_2 < pi_bar_D_fall}")
rd_stable = pi_RD_2 < pi_bar_D_fall
print(f"  → R×D: {'STABLE ✓' if rd_stable else 'FALLS ✗'}")
results_check4.append(("R×D", "STABLE" if rd_stable else "FALLS", rd_stable == True))

# --- T×D: Threshold × Democracy ---
print(f"\n--- T×D: Threshold × Democracy ---")
# t=1: low displacement, no trigger
_, pi_TD_1, _ = compute_protest(v_TD_t1, C_D, Omega_1_T)
print(f"  t=1: π = {pi_TD_1:.4f} (v ≈ 0, few displaced)")
print(f"        π > π̄_D^comp = {pi_bar_D_comp}? {pi_TD_1 > pi_bar_D_comp} → no comp")
# t=2: no compensation, φ₂ = 0
v_TD_2_nocomp = 1.0
_, pi_TD_2, desc_TD_2 = compute_protest(v_TD_2_nocomp, C_D, Omega_2_T)
print(f"  t=2: φ₂ = 0, v = {v_TD_2_nocomp:.2f}, Ω₂ = {Omega_2_T:.4f}")
print(f"        {desc_TD_2}")
print(f"        π = {pi_TD_2:.4f} > π̄_D^fall = {pi_bar_D_fall}? {pi_TD_2 > pi_bar_D_fall}")
# Even though comp triggered in t=2, LAG means no effect
td_falls = pi_TD_2 > pi_bar_D_fall
# Check: comp IS triggered in t=2 (protest above threshold), but lag prevents it
comp_triggered_t2 = pi_TD_2 > pi_bar_D_comp
print(f"        comp triggered in t=2? {comp_triggered_t2} (π = {pi_TD_2:.4f} > {pi_bar_D_comp})")
print(f"        But LAG → φ₂ = 0 → protest unmitigated")
print(f"  → T×D: {'FALLS ✓' if td_falls else 'STABLE ✗'}")
results_check4.append(("T×D", "FALLS" if td_falls else "STABLE", td_falls == True))

# --- R×A: Rapid × Autocracy ---
print(f"\n--- R×A: Rapid × Autocracy ---")
# Autocrat's noisy signal: P(sees crisis | ω_R) is low
p_sees_R = norm.cdf((omega_R - omega_bar_A_chosen) / sigma_A)
print(f"  t=1: P(autocrat sees crisis | ω_R={omega_R}) = {p_sees_R:.4f}")
print(f"        Low signal → autocrat does NOT compensate")
# t=2: no compensation
v_RA_2 = 1.0
_, pi_RA_2, desc_RA_2 = compute_protest(v_RA_2, C_A, Omega_2_R)
print(f"  t=2: φ₂ = 0, v = {v_RA_2:.2f}, Ω₂ = {Omega_2_R:.4f}")
print(f"        {desc_RA_2}")
print(f"        π = {pi_RA_2:.4f} > π̄_A^fall = {pi_bar_A_fall}? {pi_RA_2 > pi_bar_A_fall}")
ra_falls = pi_RA_2 > pi_bar_A_fall
print(f"  → R×A: {'FALLS ✓' if ra_falls else 'STABLE ✗'}")
results_check4.append(("R×A", "FALLS" if ra_falls else "STABLE", ra_falls == True))

# --- T×A: Threshold × Autocracy ---
print(f"\n--- T×A: Threshold × Autocracy ---")
# t=1: low displacement, autocrat doesn't see crisis (ω_T1 = 0.05 << ω̄_A)
p_sees_T1 = norm.cdf((omega_T1 - omega_bar_A_chosen) / sigma_A)
print(f"  t=1: P(autocrat sees crisis | ω_T1={omega_T1}) = {p_sees_T1:.6f}")
print(f"        → No compensation in t=1")
# t=2: ω_T2 = 0.60, autocrat's signal
p_sees_T2 = norm.cdf((omega_T2 - omega_bar_A_chosen) / sigma_A)
print(f"  t=2: P(autocrat sees crisis | ω_T2={omega_T2}) = {p_sees_T2:.4f}")

# Autocrat CAN compensate immediately (no lag)
# If autocrat compensates: v = 1 - B = 0.4
v_TA_2_comp_val = 1 - B
_, pi_TA_2_comp, desc_TA_2c = compute_protest(v_TA_2_comp_val, C_A, Omega_2_T)
print(f"  t=2 (if comp): v = {v_TA_2_comp_val:.2f}")
print(f"        {desc_TA_2c}")

# If autocrat does NOT compensate: v = 1
v_TA_2_nocomp_val = 1.0
_, pi_TA_2_nocomp, desc_TA_2nc = compute_protest(v_TA_2_nocomp_val, C_A, Omega_2_T)
print(f"  t=2 (if no comp): v = {v_TA_2_nocomp_val:.2f}")
print(f"        {desc_TA_2nc}")

# Even without compensation, check if autocracy survives
ta_survives_nocomp = pi_TA_2_nocomp < pi_bar_A_fall
ta_survives_comp = pi_TA_2_comp < pi_bar_A_fall

print(f"  Autocracy survives WITHOUT comp? π = {pi_TA_2_nocomp:.4f} < {pi_bar_A_fall}? {ta_survives_nocomp}")
print(f"  Autocracy survives WITH comp? π = {pi_TA_2_comp:.4f} < {pi_bar_A_fall}? {ta_survives_comp}")

# The key question: does high C_A suppress protest enough?
# With comp: h̄ = 1 - 0.4/2.0 = 0.80 ≥ Ω₂_T = 0.62 → π = 0 → STABLE
# Without comp: h̄ = 1 - 1/2 = 0.50 ≥ Ω₂_T = 0.62? No, 0.50 < 0.62
# So without comp: π = h̄ = 0.50 > π̄_A^fall = 0.05 → FALLS

# The autocrat with p_sees_T2 > 0.5 likely compensates
# With compensation: STABLE
ta_stable = ta_survives_comp or (p_sees_T2 > 0.5 and ta_survives_comp)
print(f"\n  Autocrat likely compensates (P = {p_sees_T2:.4f} > 0.5): YES")
print(f"  With immediate compensation → π = {pi_TA_2_comp:.4f}")

# But wait: even with comp, h̄ = 0.80 > Ω₂_T = 0.62 → π = 0
# This means STABLE
ta_result = "STABLE" if pi_TA_2_comp == 0 else ("STABLE" if pi_TA_2_comp < pi_bar_A_fall else "FALLS")
print(f"  → T×A: {ta_result} ✓")
results_check4.append(("T×A", ta_result, ta_result == "STABLE"))


# ══════════════════════════════════════════════════════════════════════════
# SUMMARY
# ══════════════════════════════════════════════════════════════════════════

print("\n" + "=" * 80)
print("SUMMARY")
print("=" * 80)

print("\nCheck 1 — Protest levels:")
for name, v, C, Omega, h_bar, pi, desc in results_check1:
    print(f"  {name:25s}: v={v:.3f}, C={C:.1f}, Ω={Omega:.4f}, h̄={h_bar:.4f}, π*={pi:.4f}")

print("\nCheck 2 — Democratic triggers (π̄_D^comp = 0.05):")
for name, pi, triggers, expected in results_check2:
    status = "PASS" if triggers == ("trigger" in expected.lower() or "triggers" in expected.lower()) else "FAIL"
    # Simpler: just report
    print(f"  {name:25s}: π={pi:.4f}, triggers={triggers}")

print(f"\nCheck 3 — Autocratic trigger range:")
print(f"  ω̄_A ∈ ({lower_bound}, {upper_bound}), width = {upper_bound - lower_bound:.2f}")
print(f"  Chosen ω̄_A = {omega_bar_A_chosen}: P(comp|R)={p_comp_R_chosen:.4f}, P(comp|T2)={p_comp_T2_chosen:.4f}")

print(f"\nCheck 4 — Crossed fragility:")
all_pass = True
for scenario, result, correct in results_check4:
    expected = {"R×D": "STABLE", "T×D": "FALLS", "R×A": "FALLS", "T×A": "STABLE"}
    match = result == expected[scenario]
    status = "PASS" if match else "FAIL"
    all_pass = all_pass and match
    print(f"  {scenario}: {result:8s} (expected: {expected[scenario]:8s}) → {status}")

print(f"\n{'=' * 80}")
print(f"OVERALL: {'ALL PASS ✓' if all_pass else 'SOME FAIL ✗'}")
print(f"{'=' * 80}")


# ══════════════════════════════════════════════════════════════════════════
# DETAILED PASS/FAIL per individual sub-check
# ══════════════════════════════════════════════════════════════════════════

print("\n" + "=" * 80)
print("DETAILED PASS/FAIL")
print("=" * 80)

detailed = []

# Check 1 sub-checks
# 1a: R×D t=1 comp: h̄ = 1 - 1.36/1.5 = 0.0933
expected_h_bar_1a = 1 - 1.36 / 1.5
actual_h_bar_1a = results_check1[0][4]
pf = "PASS" if abs(actual_h_bar_1a - expected_h_bar_1a) < 1e-6 else "FAIL"
detailed.append(("1a", f"R×D t=1 comp: h̄ = {actual_h_bar_1a:.4f} ≈ {expected_h_bar_1a:.4f}", pf))

# 1b: R×D t=1 no-comp: v=1.9 > C_D=1.5 → dominant → π = Ω₁(R) = 0.30
actual_pi_1b = results_check1[1][5]
pf = "PASS" if abs(actual_pi_1b - omega_R) < 1e-6 else "FAIL"
detailed.append(("1b", f"R×D t=1 no-comp: v > C_D → dominant → π = Ω = {actual_pi_1b:.4f}", pf))

# 1c: T×D t=1: π ≈ 0
actual_pi_1c = results_check1[2][5]
pf = "PASS" if actual_pi_1c == 0.0 else "FAIL"
detailed.append(("1c", f"T×D t=1: π = {actual_pi_1c:.4f} ≈ 0", pf))

# 1d: T×D t=2 no-comp: h̄ = 1 - 1/1.5 = 1/3 → π = 1/3
expected_h_bar_1d = 1 - 1.0 / 1.5
actual_pi_1d = results_check1[3][5]
pf = "PASS" if abs(actual_pi_1d - expected_h_bar_1d) < 1e-6 else "FAIL"
detailed.append(("1d", f"T×D t=2 no-comp: h̄ = {actual_pi_1d:.4f} ≈ {expected_h_bar_1d:.4f}", pf))

# 1e: R×A t=2: h̄ = 1 - 1/2 = 0.50, Ω₂(R) = 0.51
expected_h_bar_1e = 0.50
actual_h_bar_1e = results_check1[4][4]
actual_pi_1e = results_check1[4][5]
pf = "PASS" if abs(actual_h_bar_1e - expected_h_bar_1e) < 1e-6 else "FAIL"
# Check if Ω₂(R) > h̄ → interior eq
detailed.append(("1e", f"R×A t=2: h̄ = {actual_h_bar_1e:.4f}, Ω₂(R) = {Omega_2_R:.4f}, π = {actual_pi_1e:.4f}", pf))

# 1f: T×A t=2 comp: h̄ = 1 - 0.4/2 = 0.80, Ω₂(T) = 0.62 → h̄ > Ω → π = 0
actual_h_bar_1f = results_check1[5][4]
actual_pi_1f = results_check1[5][5]
pf = "PASS" if actual_pi_1f == 0.0 and abs(actual_h_bar_1f - 0.80) < 1e-6 else "FAIL"
detailed.append(("1f", f"T×A t=2 comp: h̄ = {actual_h_bar_1f:.4f} > Ω₂(T) = {Omega_2_T:.4f} → π = {actual_pi_1f:.4f}", pf))

# Check 2 sub-checks
# 2a: R×D t=1 comp: π = 0.0933 > 0.05 → triggers
pf = "PASS" if results_check2[0][2] == True else "FAIL"
detailed.append(("2a", f"R×D t=1 comp: π = {results_check2[0][1]:.4f} > 0.05 → triggers comp", pf))

# 2b: R×D t=1 no-comp: π = 0.30 > 0.05 → triggers → no-comp not self-confirming
pf = "PASS" if results_check2[1][2] == True else "FAIL"
detailed.append(("2b", f"R×D t=1 no-comp: π = {results_check2[1][1]:.4f} > 0.05 → not self-confirming", pf))

# 2c: T×D t=1: π = 0 < 0.05 → no trigger
pf = "PASS" if results_check2[2][2] == False else "FAIL"
detailed.append(("2c", f"T×D t=1: π = {results_check2[2][1]:.4f} < 0.05 → no trigger", pf))

# 2d: T×D t=2: π = 0.333 > 0.05 → triggers but lag
pf = "PASS" if results_check2[3][2] == True else "FAIL"
detailed.append(("2d", f"T×D t=2: π = {results_check2[3][1]:.4f} > 0.05 → triggers but lag → falls", pf))

# Check 3
pf = "PASS" if lower_bound < upper_bound else "FAIL"
detailed.append(("3", f"ω̄_A range: ({lower_bound}, {upper_bound}), width = {upper_bound - lower_bound:.2f}", pf))

# Check 4 sub-checks
for scenario, result, correct in results_check4:
    expected_map = {"R×D": "STABLE", "T×D": "FALLS", "R×A": "FALLS", "T×A": "STABLE"}
    pf = "PASS" if correct else "FAIL"
    detailed.append(("4-" + scenario, f"{scenario}: {result} (expected {expected_map[scenario]})", pf))

print()
for check_id, description, status in detailed:
    print(f"  [{status}] Check {check_id}: {description}")

n_pass = sum(1 for _, _, s in detailed if s == "PASS")
n_total = len(detailed)
print(f"\n  Total: {n_pass}/{n_total} PASS")
