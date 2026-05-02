# IA-dem — AI Automation, Regime Type, and Crossed Fragility

## Projeto

Paper teórico-formal na tradição OEP sobre como trajetórias de automação por IA afetam a estabilidade de democracias vs. autocracias. **Autor**: cientista político (não economista). A economia é premissa importada; a contribuição é a camada política.

**Benchmark de exposição**: Hirsch & Shotts (2025) AJPS; Myerson (2008) APSR. Ver `Papers/references/benchmark_library.md` Gênero 1.

## Pergunta central

> Dadas duas trajetórias de automação — deslocamento rápido vs. threshold (O-Ring) — qual tipo de regime é mais frágil sob cada cenário, e por quê?

## Modelo (reformulado — v2)

- Premissa econômica: Gans & Goldfarb (2026), O-Ring Automation
- 2 períodos, 3 estados θ ∈ {R, T, N} (rápido, threshold, sem choque), não observado
- Choque individual: d_{it} ~ Bernoulli(ω_t), absorvente. Sinal composto bayesiano (d_i + s_i)
- **Primitiva única**: tamanho do selectorate (coalizão de apoio, Bueno de Mesquita et al.). Dela derivam três consequências:
  - (1) Informação: selectorate grande → protesto como sinal claro (C_D < C_A)
  - (2) Velocidade: selectorate pequeno → decreto; grande → legislação (lag)
  - (3) Política fiscal: compensação sai do selectorate. Em democracia, selectorate inclui eleitores (elites + trabalhadores) — se não sofrem, não querem pagar. Em autocracia, selectorate é elite pequena — se não vê crise, não autoriza gasto; ditador que gastar sem justificativa visível é removido pela elite.
- Protesto expressivo + safety in numbers h(π). Incumbente estratégico com Bayesian updating
- Mecanismo de queda único: π > π̄_x^fall (protesto excede resiliência institucional)
- **Fragilidade cruzada**: gradual → democracia estável (vê crise e compensa a tempo), autocracia cai (crise moderada invisível para elite, acumula deslocados sem compensação). Threshold → democracia cai (prosperidade da complementaridade elimina voz política, nenhuma infraestrutura de compensação montada, lei chega tarde), autocracia estável (crise massiva impossível de ignorar, elite vê e autoriza, decreto imediato)
- **Armadilha da prosperidade**: sob threshold t=1, complementaridade faz maioria prosperar → eleitores bloqueiam compensação preventiva → democracia vulnerável quando limiar é cruzado
- Formal: global games (Morris & Shin 2003), F logística, h(π)=π linear (baseline)
- Notação: x ∈ {D,A} para regime, i para worker, F para CDF de ruído
- Plano completo: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`

## Resultados (paper.Rmd)

| Resultado | Conteúdo | Lean |
|-----------|----------|------|
| L1-L2 | Equilíbrio de coordenação (global games) | Verificado (SupermodularGames lib) |
| P1-P3 | Crossed fragility | Verificado |
| P4 | Welfare cost = κ̄ | Verificado |
| C1-C2 | Comparative statics (threshold of thresholds, crossed interval width) | Verificado |
| P5-P6 | Welfare state como seguro institucional | Verificado |
| P7 | Fiscal fragility endógena | Verificado |
| Coord. Conditions | Dominance regions, q*, single-crossing | Verificado |

**17/17 verificados em Lean 4.** L1-L2 via biblioteca SupermodularGames (dependência local). Dashboard: `formal_proofs/DASHBOARD.md`

## Review status

### Formal Model Review (v4, 2026-04-02)

| Dimensão | Score |
|----------|-------|
| Design | 8/10 |
| Apresentação técnica | 7.5/10 |
| Exposição | 7.5/10 |
| **Global** | **7.7/10** |

Parecer completo: `quality_reports/2026-04-02_review-formal-model-v4.md`

### Edmans Review (v8, 2026-04-06)

| Dimensão | Score | Evolução vs v6 |
|----------|-------|-----------------|
| Contribution | 7.0/10 | +0.5 |
| Execution | 8.0/10 | +0.5 |
| Exposition | 8.0/10 | +0.5 |
| **Global** | **7.5/10** | **+0.3** |

**Decisão editorial**: R&R minor. Recomendação: JOP/BJPS.
**Prioridades Edmans**: (1) expandir bib 35-40 refs; (2) remark sobre δ; (3) condensar — FEITO (Section 2, Limitations); (4) clarificar link verbal heterogeneidade→ruído; (5) quantificação no abstract.

**Resolvidos (2026-04-06)**: polish completo (h axiomática, calibração paramétrica, C1-C5), Section 2.3-2.4 condensada (~2pp economizadas), Limitations movidas para Conclusion.

## Plano de trabalho

~~1-9~~: FEITOS (exemplos numéricos, modelo formal, microfundações, paper formatado).

10. **(PRIORITÁRIO — REFORMULAÇÃO)** Reformulação do modelo. Primitivas: C_A > C_D (custo de protesto → informação) + velocidade de resposta (autocracia rápida, democracia lenta). Dictator's dilemma (informacional) + lag regime-específico. 3 estados: θ ∈ {R, T, N}. Protesto expressivo v_i = perda presente + δ·E[perda futura]. B = benefit (compensação universal). Título-semente: "AI and Regime Stability: Responsiveness and Speed to Economic Shocks". Plano: `quality_reports/plans/2026-05-01_reformulacao-modelo.md`. Status: conceitual COMPLETO, implementação pendente.
11. **(Suspenso)** Desconto temporal δ ∈ (0,1]. Depende da reformulação — δ já entra na nova estrutura via utilidade intertemporal.
12. **(Futuro)** Instrumentos mistos — especialização endógena.
13. **(Futuro)** Incerteza sobre trajetória — agora parte do modelo base (θ ∈ {rápido, threshold} não observado).
14. **(Suspenso)** Populismo P9 — plataforma endógena. Sketch: `model/07_populism_platform_choice_sketch.md`. Decisão pendente: texto principal vs appendix. Aguarda reformulação.

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
- **Separação implementação/revisão**: Quem implementa, NÃO revisa. Quem revisa, NÃO implementa. Agentes diferentes para cada papel.
- **Código em disco**: Todo código (simulação, análise, figuras) DEVE ser salvo em arquivo (script) no projeto. NUNCA rodar código inline (via Bash) sem antes salvar o script. Reprodutibilidade exige script em disco.
- **Validação obrigatória**: Todo código em R deve ser validado por agente com skill `review-r`. Todo código em Python deve ser validado por agente com skill `review-python`. Validação ANTES de rodar/commitar.
- **Resultados SEMPRE em disco**: Todo resultado de simulação, calibração ou análise numérica DEVE ser salvo em arquivo `.md` (tipicamente `quality_reports/`). NUNCA deixar resultados apenas no output do terminal. Salvar ANTES de reportar ao usuário.
