# IA-dem — AI Automation, Regime Type, and Crossed Fragility

## Projeto

Paper teórico-formal na tradição OEP sobre como trajetórias de automação por IA afetam a estabilidade de democracias vs. autocracias. **Autor**: cientista político (não economista). A economia é premissa importada; a contribuição é a camada política.

## Pergunta central

> Dadas duas trajetórias de automação — deslocamento rápido vs. threshold (O-Ring) — qual tipo de regime é mais frágil sob cada cenário, e por quê?

## Modelo

- Premissa econômica: Gans & Goldfarb (2026), O-Ring Automation
- 2 períodos, 2 trajetórias, 2 regimes, 1 grupo exposto (E)
- ω_t contínuo (fundamental do jogo de coordenação), ℓ_t = L·1[ω_t ≥ ω̄] (perda binária nos payoffs)
- Coordenação via global games (Morris & Shin 2003). Mecanismo central: sob rapid, E é homogêneo (todos deslocados) → sinais clustered → coordenação fácil. Sob threshold, E é fragmentado (ganhadores + perdedores, β_i heterogêneo) → sinais dispersos via h(Var(β)) → coordenação falha. σ_τ > σ_r DERIVADO de Var(β) > 0 (Prop 8), não assumido (antigo A6). Aggrievement (P&T 2017) removido do modelo — mencionado como extensão futura na Discussion.
- Prior uniforme impróprio (A3). Restrição π̄ < b_x/(b_x + m) (A4). Laplacian property para estática comparativa.
- Notação: x ∈ {D,A} para regime, i para worker, F para CDF de ruído, 𝓕 para capacidade fiscal, τ_t para taxa de subsídio, c_s para custo de taxação

## Resultados (paper.Rmd)

| Resultado | Conteúdo | Lean |
|-----------|----------|------|
| L1-L2 | Equilíbrio de coordenação (global games) | Verificado (SupermodularGames lib) |
| P1-P3 | Crossed fragility | Verificado |
| P4 | Welfare cost = κ̄ | Verificado |
| R1-R2 | Comparative statics | Verificado |
| P5-P6 | Welfare state como seguro institucional | Verificado |
| P7 | Fiscal fragility endógena | Verificado |
| Coord. Conditions | Dominance regions, q*, single-crossing | Verificado |

**17/17 verificados em Lean 4.** L1-L2 via biblioteca SupermodularGames (dependência local). Dashboard: `formal_proofs/DASHBOARD.md`

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
- Plausibilidade da restrição paramétrica pós-Prop 8: Prop 8 garante σ_τ > σ_r, mas NÃO que σ_0 < σ̂_x < h(Var(β)). Isso é condição paramétrica (análoga a A2). Referee pode perguntar: "para quais Var(β), σ_0 realistas a condição vale?" Exemplo numérico responde parcialmente (α=15, Var=0.03). Adicionar na Discussion: calibração informal (quais setores têm Var(β) alto? serviços profissionais sim, manufatura menos) + frase explícita sobre o que a microfundação compra ("reduces assumptions from 7 to 6, grounds informational bridge in observable economic structure").
- Eliminar α do Appendix D: usar apenas propriedade axiomática "h crescente, h(0) = σ_0" para Prop 8. A forma funcional sqrt(σ_0² + α²v) vira *um* exemplo ilustrativo, não *a* especificação. α deixa de ser parâmetro do modelo.

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

L1-L2 (global games) formalizados via biblioteca SupermodularGames (dependência local em `../../../SupermodularGames`). CoordinationLemmas.lean faz a ponte: importa `participationRate_strictAntiOn` (L2) e `coordination_unique_cutoff` (L1), e deriva `rapid_coordination_succeeds` e `threshold_coordination_fails`. CoordinationConditions.lean verifica as condições algébricas (dominance regions, q*, single-crossing).

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
- Trajetórias de renda são exógenas. Rápida: y_1=y_2=w_E-L (deslocamento uniforme). Threshold: y_1=w_E+β_i (complementaridade heterogênea); em t=2, E é MISTO — fração deslocada (y=w_E-L) e fração ainda em complementaridade (y=w_E+β_i). **NÃO** tratar threshold t=2 como deslocamento uniforme de todos em E.
- Editar paper.Rmd (canônico), não paper.md (gerado).
- Um modelo unificado com regime como parâmetro, não dois modelos separados.
- N passivo no baseline; N ativo é extensão pós-MVP.
- Exemplo numérico ANTES de modelo geral (Varian).
