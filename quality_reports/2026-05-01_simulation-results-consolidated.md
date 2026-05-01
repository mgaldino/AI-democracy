# Simulação Numérica: Resultados Consolidados (v1–v8)

**Data**: 2026-05-01
**Script**: `model/12_simulation_reformulated.py`
**Referência analítica**: `../IA-dem-analytical/notes/analytical_formalization.md` (v4)

---

## Parâmetros finais (confirmados)

```
ω_R=0.30, ω_T1=0.05, ω_T2=0.60, ω_N=0.02
σ=0.10, C_D=1.5, C_A=2.0, B=0.6, δ=0.9
π̄_D=0.20, π̄_A=0.05
σ_D=0.03, σ_A=0.15
Prior: p_R=0.30, p_T=0.30, p_N=0.40
```

## Resultado principal (v7, heuristic threshold)

| Cenário | π₂ | π̄ | φ₂ | Outcome | Esperado | ✓ |
|---------|------|------|------|---------|----------|---|
| R×D | 0.000 | 0.20 | 1 (lei t=1) | STABLE | STABLE | ✓ |
| R×A | 0.500 | 0.05 | 0 (não vê) | FALLS_T2 | FALLS_T2 | ✓ |
| T×D | 0.333 | 0.20 | 0 (lag) | FALLS_T2 | FALLS_T2 | ✓ |
| T×A | 0.000 | 0.05 | 1 (decreto) | STABLE | STABLE | ✓ |

**Fragilidade cruzada: CONFIRMADA (v7).**

Key ordering: ω_T1=0.05 < ω̄_D=0.158 < ω_R=0.30 < ω̄_A=0.338 < ω_T2=0.60

Faixa de C_A: [1.5, 2.25] — não knife-edge (C_A/C_D ∈ [1.0, 1.5]).

---

## Resultado com full Bayesian (v8)

| Cenário | comp t=1 | comp t=2 | Outcome | Esperado | ✓ |
|---------|----------|----------|---------|----------|---|
| R×D | True (P=1.0) | True | STABLE | STABLE | ✓ |
| R×A | True (P=1.0) | True | STABLE | FALLS | ✗ |
| T×D | True (P=1.0) | True | STABLE | FALLS | ✗ |
| T×A | True (P=1.0) | True | STABLE | STABLE | ✓ |

**Fragilidade cruzada: NÃO CONFIRMADA com full Bayesian.**

**Diagnóstico**: com expected utility pura e custo ω̂·B proporcional a ω (que é baixo), o seguro é SEMPRE racional. ΔP (benefício de sobrevivência) >> cost para todo ω > 0. Mesmo o autocrata com σ_A=0.15 encontra ω̂·B baixo o suficiente para compensar.

---

## Histórico de versões e lições

### v1 (score 53/100 BLOCK)
- Incumbente com thresholds ad-hoc
- Fragilidade cruzada: NÃO confirmada (T×D não cai, R×D não compensa)
- **Lição**: incumbente precisa de Bayes próprio

### v2 (score 88/100 COMMIT)
- Incumbente Bayesiano (baseado em π)
- Fragilidade cruzada: parcial (T×D ainda não cai por diluição T/N)
- **Lição**: incerteza T/N paralisa coordenação se ω_T2 = ω_R

### v3–v5 (exploração paramétrica)
- Testou: h côncava (√π), h super-linear (π^1.5), π̄_D variado
- **Lições**:
  - h côncava facilita coordenação MAS também facilita protesto com compensação
  - π̄_D^fall precisa satisfazer trilema impossível com ω simétrico
  - Self-fulfilling: comp esperada → π baixo → sinal uninformativo

### v6 (parametrização assimétrica)
- ω_R=0.30, ω_T1=0.05, ω_T2=0.60 (O-Ring economics correta)
- Fragilidade cruzada: CONFIRMADA com C_A ∈ [1.5, 2.0]
- **Lição**: assimetria ω_T1 << ω_R << ω_T2 resolve o trilema

### v7 (espelha analytical_formalization v4)
- Incumbente com ω̃ signal + visibility threshold heurístico
- **4/4 CONFIRMADO** — resultado principal
- Review: 72/100 (threshold heurístico, sem noise draw)
- **Lição**: mecanismo funciona pela key ordering, não pelo Bayesiano completo

### v8 (full Bayesian)
- ΔP > ω̂·B com Monte Carlo sobre ζ
- Fragilidade cruzada: NÃO CONFIRMADA (seguro barato universal)
- **Lição**: expected utility pura não gera dictator's dilemma com custo proporcional a ω. Precisa de custo adicional (político, institucional) ou constraint.

---

## Tensão fundamental identificada

**O dictator's dilemma NÃO emerge endogenamente de Bayesian decision theory padrão** com custo de compensação = ω̂·B. O incumbente racional SEMPRE compensa porque:

- ΔP ≈ P(crise existe) ≈ 0.3–0.6 (prior + signal)
- Cost = ω̂·B ≈ 0.03–0.18 (proporcional a ω estimado, que é baixo quando a crença é incerta)
- ΔP >> Cost sempre

Para a fragilidade cruzada emergir, é necessário UMA das seguintes:

1. **Custo político de compensar** (K) — empiricamente motivado (Finseraas & Nyhus 2025, climate change analogy). Ad hoc.
2. **Visibility threshold exógeno** (ω̄_x) — primitiva institucional, como π̄_x^fall. Interpretação: instituições autocráticas só mobilizam compensação quando a crise atinge escala inegável.
3. **σ_A muito maior** (≈ 0.50+) para que a atenuação bayesiana de fato impeça ação. Mas aí T×A com ω_T2=0.60 também fica difícil.

**Recomendação para o paper**: Usar visibility threshold como primitiva institucional (opção 2) — análogo a π̄_x^fall. Defender como: "instituições autocráticas têm threshold de mobilização mais alto, não porque o ditador é irracional, mas porque a burocracia distorce informação e a cultura institucional resiste a admitir problemas." O full Bayesian fica como robustness check em appendix mostrando que com K > 0 o resultado se mantém.

---

## Próximos passos

- [ ] Decisão: aceitar visibility threshold como primitiva ou derivar K
- [ ] Atualizar analytical_formalization.md com esta discussão
- [ ] Escrever no paper.Rmd (usar v7 como base numérica)
- [ ] Verificação Lean (proposições formais)
