# Prompt de Continuação — IA-dem Paper v2

**Data**: 2026-05-02
**Estado**: Paper v2 reescrito (corpo completo), revisado (Edmans 7.5, Formal 7.2), 5 prioridades Edmans resolvidas. Provas P1-P3 derivadas e revisadas (PASS WITH CONCERNS). Exploração paramétrica feita.

## Para iniciar nova sessão, cole isto:

---

Continuar trabalho no paper IA-dem. Ler:
1. `CLAUDE.md` (estado do projeto)
2. Plano atual: `~/.claude/plans/whimsical-doodling-quiche.md`
3. Reviews mais recentes: `quality_reports/2026-05-02_review-formal-model-v2.md` e `quality_reports/2026-05-02_edmans-review-v2.md`
4. Modelo autoritativo: `notes/analytical_formalization.md` (v5, NÃO paper.Rmd para detalhes do modelo)

## Decisões pendentes (do autor)

1. **C_A = 2.0** (recomendado): voltar de 1.65 para 2.0. Evita dominant strategy para todo δ ≤ 1. Single-state π* = 0.5 >> 0.05 sob rapid. Atualizar paper.Rmd + provas.

2. **T×A t=1 knife-edge**: π = 0.05 = π̄_A^fall. Mudar π̄_A^fall para 0.06 ou usar desigualdade estrita.

## TODO lista (ordem de prioridade)

### Imediato (esta sessão)
- [ ] Implementar C_A = 2.0 se autor aprovar (atualizar paper.Rmd, provas, example numérico)
- [ ] Incorporar provas formais P1-P3 no Appendix do paper (source: `notes/formal_proofs_P1_P3.md`)
- [ ] Criar figuras de exploração paramétrica no estilo PowerBayesianPersuasion (source: `figures/fig_parameter_space_v2.R`)
- [ ] Inserir figuras no paper

### Antes da submissão
- [ ] Micro-fundar g(σ_A): derivar ω̄_A da otimização da elite, não apenas assumir g'>0
- [ ] Appendix B: complementaridade extensions (Y+ sob rapid, heterogeneidade setorial)
- [ ] Appendix C: multi-period extension (T > 2, esboçado em v5)
- [ ] Trigger endógeno: derivar que cada regime otimalmente escolhe voice vs technocratic (TODO, não bloqueante para JOP/BJPS)
- [ ] Lean verification para modelo v2

### Skill a criar
- [ ] Criar skill `formal-model-presentation` combinando:
  - 5 heurísticas PowerBayesianPersuasion (boundaries, phase transitions, parametric windows, piecewise curves, open set proofs)
  - Critérios Hirsch & Shotts de exposição (model setup ≤1.5pp, intuition BEFORE results, explicit mapping model→reality, real data in figures)
  - Análise detalhada está em: resultado do agente Explore desta sessão (não salvo em arquivo — precisa ser recriado a partir de `quality_reports/` no PowerBayesianPersuasion)

## Arquivos-chave

| Arquivo | Conteúdo |
|---------|----------|
| `paper.Rmd` | Paper v2 (versão ativa) |
| `notes/analytical_formalization.md` | Modelo v5 autoritativo |
| `notes/formal_proofs_P1_P3.md` | Provas derivadas (PASS WITH CONCERNS) |
| `notes/formalization_CA_sigmaA_v5.md` | Sweet spot + amplification (PASS WITH CONCERNS) |
| `notes/review_proofs_P1P3_analytical.md` | Revisão analítica das provas |
| `notes/review_proofs_P1P3_numerical.md` | Revisão numérica das provas |
| `notes/review_CA_sigmaA_v5_analytical.md` | Revisão analítica sweet spot |
| `notes/review_CA_sigmaA_v5_numerical.md` | Revisão numérica sweet spot |
| `figures/fig_parameter_space_v2.R` | Script de exploração paramétrica |
| `quality_reports/2026-05-02_edmans-review-v2.md` | Edmans 7.5/10 |
| `quality_reports/2026-05-02_review-formal-model-v2.md` | Formal Model 7.2/10 |
| `notes/policy-implications-draft.md` | Notas de policy (draft) |
| `notes/calibration_literature.md` | Calibração empírica |

## Regras críticas (de CLAUDE.md e memória)
- Modelo autoritativo = `notes/analytical_formalization.md`, NÃO paper.Rmd
- Selectorate é UMA primitiva, TRÊS consequências (info, speed, fiscal)
- Triggers assimétricos: democracia = voice (π), autocracia = technocratic (ω̃_S)
- Agente que escreve ≠ agente que revisa
- Todo código salvo em script antes de rodar
- Reviews salvos em disco (quality_reports/ ou notes/)
