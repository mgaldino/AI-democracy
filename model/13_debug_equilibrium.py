"""
Debug: por que R×A t=1 retorna "ninguém protesta"?
Teste direto das funções do modelo.
"""
import sys
import numpy as np
import importlib.util

spec = importlib.util.spec_from_file_location(
    "sim", "model/12_simulation_reformulated.py"
)
sim = importlib.util.module_from_spec(spec)
spec.loader.exec_module(sim)

p = sim.Params()
prior = sim.get_prior(p)

print("=== DEBUG: R×A t=1 ===")
print(f"Params: C_A={p.C_A}, sigma={p.sigma}, h_alpha={p.h_alpha}")
print(f"Prior: {prior}")

v = 1.0 + p.delta  # v_no_comp = 1.9
C_x = p.C_A  # 2.0
hbar = sim.h_bar(v, C_x)
print(f"v={v}, C_A={C_x}, h̄={hbar}")

# Testar E[h(π)] em vários pontos
print("\nE[h(π)] para vários s*:")
print(f"{'s*':>8} {'E_h':>10} {'obj':>10}")
for s in np.linspace(-3, 3, 61):
    E_h = sim.expected_h_pi_at_cutoff(s, 1, p, prior)
    print(f"{s:8.3f} {E_h:10.6f} {E_h - hbar:10.6f}")

# Max E_h
test_pts = np.linspace(-2, 2, 50)
E_h_vals = [sim.expected_h_pi_at_cutoff(s, 1, p, prior) for s in test_pts]
max_E_h = max(E_h_vals)
max_s = test_pts[np.argmax(E_h_vals)]
print(f"\nmax E[h(π)] = {max_E_h:.6f} at s*={max_s:.3f}")
print(f"h̄ = {hbar:.6f}")
print(f"Equilíbrio existe? {max_E_h > hbar}")

# Resolver equilíbrio
s_star = sim.solve_cutoff(1, p, v, C_x, prior)
print(f"\nsolve_cutoff retorna: {s_star}")
if s_star is not None and s_star != float('inf'):
    pi = sim.realized_pi(s_star, 1, "R", p)
    print(f"π realizado (θ=R): {pi:.6f}")
