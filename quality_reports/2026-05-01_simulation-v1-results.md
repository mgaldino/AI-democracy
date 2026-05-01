# Simulação v1 — Resultados e Diagnóstico

**Data**: 2026-05-01
**Script**: `model/12_simulation_reformulated.py`
**Status**: Fragilidade cruzada NÃO confirmada

## Parâmetros

```
omega_H=0.40, omega_L=0.05, sigma=0.15
C_D=1.5, C_A=2.0, B=0.6, delta=0.9
pi_fall_D=0.40, pi_fall_A=0.05
p_R=0.30, p_T=0.30, p_N=0.40
tau_D=0.01, tau_A=0.10
h(π) = π (linear)
```

## Resultados

| Cenário | π₁ | comp₁ | π₂ | Outcome | Esperado | OK? |
|---------|-----|-------|-----|---------|----------|-----|
| R × D | 0.4000 | False | 0.3333 | STABLE | STABLE | ✓ |
| R × A | 0.0518 | False | — | FALLS_T1 | FALLS | ✓ |
| T × D | 0.0500 | False | 0.0000 | STABLE | FALLS | ✗ |
| T × A | 0.0007 | False | 0.0000 | STABLE | STABLE | ✓ |

## Diagnóstico

### Problema 1: T×D — ninguém protesta em t=2

Workers em t=2 atribuem P(N)=0.57, P(T)=0.43. Sob N, Ω₂(N)=0.0975 (poucos deslocados). A incerteza T vs N dilui o E[π] esperado pelo trabalhador marginal:

- Max E[π | d=1, s*] ≈ 0.33 (atingido em s* ≈ 0.20-0.25)
- h̄_D = 0.333
- Margem: 0.33 - 0.333 < 0 → impossível coordenar

**Causa raiz**: a incerteza sobre θ=N "contamina" a coordenação. Mesmo trabalhadores deslocados com sinais altos (que sabem que provavelmente estão em T) não conseguem esperar protesto suficiente porque a fração N com poucos deslocados arrasta E[π] para baixo.

### Problema 2: R×D — incumbente NÃO compensa (ΔP=0)

Sem compensação, π₂(R×D) = 0.333 < π̄_D^fall = 0.40. Democracia sobrevive SEM compensar → ΔP = 0 → sem incentivo para compensar.

**Causa raiz**: π̄_D^fall = 0.40 é alto demais. Para o canal "compensação estabiliza democracia" funcionar, precisa: π₂(sem comp) > π̄_D^fall > π₂(com comp).

### Observações para calibração futura

1. **Não-deslocados não protestam em t=2**: v=0 para não-deslocados no último período (sem futuro). Isso limita π ≤ Ω₂. Se mesmo pequena fração de não-deslocados protestasse (solidariedade, medo generalizado), π poderia exceder Ω₂, relaxando a constraint.

2. **h(π)=π pode ser fraca demais**: Complementaridade estratégica linear. Com h(π) = π^α (α > 1, sub-quadrática), a safety in numbers tem efeito de "tipping point" — convexidade implica E[h(π)] ≥ h(E[π]) por Jensen, facilitando coordenação quando expectativa de protesto é moderada-alta. Testar h(π) = π^(3/2) como intermediário.

3. **σ=0.15 pode ser ruidoso demais**: Gap entre ω_H e ω_L é 0.35. Com σ=0.15, SNR ≈ 2.3. Sinais mais precisos (σ=0.10, SNR=3.5) ajudariam workers a distinguir T de N em t=2.

4. **P(N)=0.40 pode ser alto demais**: Quanto maior P(N), mais a incerteza dilui a coordenação. Reduzir P(N) ajudaria T×D.

## Sensibilidade C_A

Nenhum valor de C_A ∈ [1.5, 3.0] gera fragilidade cruzada com estes parâmetros. Para C_A ≤ 2.2: autocracia cai (R×A), mas T×D não cai. Para C_A ≥ 2.3: nem autocracia cai.
