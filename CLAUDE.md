# IA-dem — AI Automation, Regime Type, and Crossed Fragility

## Projeto

Paper teórico-formal na tradição OEP sobre como trajetórias de automação por IA afetam a estabilidade de democracias vs. autocracias. **Autor**: cientista político (não economista). A economia é premissa importada; a contribuição é a camada política.

## Pergunta central

> Dadas duas trajetórias de automação — deslocamento rápido vs. threshold (O-Ring) — qual tipo de regime é mais frágil sob cada cenário, e por quê?

## Modelo

- Premissa econômica: Gans & Goldfarb (2026), O-Ring Automation
- 2 períodos, 2 trajetórias, 2 regimes, 1 grupo exposto (E)
- ω_t contínuo (fundamental do jogo de coordenação), ℓ_t = L·1[ω_t ≥ ω̄] (perda binária nos payoffs)
- Coordenação via global games (Morris & Shin 2003): σ baixo → coordenação → {φ ativa em D, η degrada em A}; σ alto → falha → {φ = 0 em D, η = 1 em A}
- Prior uniforme impróprio (A3). Restrição π̄ < b_x/(b_x + m) (A4). Laplacian property para estática comparativa.
- Notação: x ∈ {D,A} para regime, i para worker, F para CDF de ruído, 𝓕 para capacidade fiscal, τ_t para taxa de subsídio, c_s para custo de taxação

## Resultados (paper.Rmd)

| Resultado | Conteúdo | Lean |
|-----------|----------|------|
| L1-L2 | Equilíbrio de coordenação (global games) | Hipóteses |
| P1-P3 | Crossed fragility | Verificado |
| P4 | Welfare cost = κ̄ | Verificado |
| R1-R2 | Comparative statics | Verificado |
| P5-P6 | Welfare state como seguro institucional | Verificado |
| P7 | Fiscal fragility endógena | Verificado |
| Coord. Conditions | Dominance regions, q*, single-crossing | Verificado |

**15/17 verificados em Lean 4.** Dashboard: `formal_proofs/DASHBOARD.md`

## Review status (v4, 2026-04-02)

| Dimensão | Score |
|----------|-------|
| Design | 8/10 |
| Apresentação técnica | 7.5/10 |
| Exposição | 7.5/10 |
| **Global** | **7.7/10** |

**Decisão**: R&R minor. Parecer completo: `quality_reports/2026-04-02_review-formal-model-v4.md`

**Resolvidos nesta sessão**: ω binário→contínuo, unicidade verificada, Lemma 2 reescrito (Laplacian), 3 figuras de mecanismo, colisões de notação (i/x, F/𝓕, s/τ, c/c_s), intro reescrita.

**Pendentes (polish, não blocking)**:
- Unbundle A3/A4 (separar condições de regularidade de restrições paramétricas)
- Mover P7/Corollary 3 para apêndice (confirmatório, dilui 2a metade)
- Promover Remarks 1-2 a Corollaries (citabilidade)

## Plano de trabalho

~~1-9~~: FEITOS (exemplos numéricos, modelo formal, microfundações, paper formatado).

10. **(PRIORITÁRIO)** Desconto temporal δ ∈ (0,1]. Verificar se P4/P6 mudam com δ<1.
11. **(Futuro)** Instrumentos mistos — especialização endógena.
12. **(Futuro)** Incerteza sobre trajetória — P10 + Corolário 4. Plano: `~/.claude/plans/compressed-noodling-penguin.md`.
13. **(Em progresso)** Populismo P9 — plataforma endógena. Sketch: `model/07_populism_platform_choice_sketch.md`. Decisão pendente: texto principal vs appendix.

## Verificação Formal (Lean 4)

```bash
cd formal_proofs && lake build
```

Arquivos em `formal_proofs/FormalProofs/`: Basic, Remarks, Prop1-Prop7, CoordinationConditions.
Imports em `FormalProofs.lean`. Dashboard e proof index com hashes de conteúdo.

L1-L2 (global games) não formalizáveis sem infraestrutura nova (Mathlib não tem global games). Condições algébricas verificadas em CoordinationConditions.lean; contração/unicidade como citação a M-S Theorem 2.2.

## Agenda de pesquisa (papers futuros)

**Paper 2: AI Surveillance and Repressive Capacity**
- IA → vigilância → η_R ↑ → crossed fragility shrinks
- Status: ideação feita, formalização pendente

**Paper 3: Interação automação × surveillance**
- Status: conceitual apenas

**Extensão do paper 1: Sistema eleitoral e resiliência democrática**
- φ₀ como determinado pelo sistema eleitoral (PR vs majoritário)

## Regras para este projeto

- A economia é INPUT. Não tentar melhorar o modelo de automação.
- Trajetórias de renda são exógenas (estado absorvente): rápida y_1=y_2=w_E-L; threshold y_1=w_E+β, y_2=w_E-L.
- Editar paper.Rmd (canônico), não paper.md (gerado).
- Um modelo unificado com regime como parâmetro, não dois modelos separados.
- N passivo no baseline; N ativo é extensão pós-MVP.
- Exemplo numérico ANTES de modelo geral (Varian).
