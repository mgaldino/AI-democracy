# Plano: Seção verbal "Logic of Crossed Fragility" + reinterpretação de σ

**Status**: APPROVED
**Data**: 2026-04-03

## Objetivo

1. Adicionar nova Section 2 ("The Logic of Crossed Fragility") com walkthrough verbal do mecanismo, estilo Bonomi et al. (QJE 2021)
2. Criar figura de timeline do jogo
3. Corrigir ~18 passagens no paper que descrevem σ como "predictability/masking/surprise" em vez de heterogeneidade de experiências (winners vs losers)

## Interpretação correta de σ

**Rapid displacement**: perda generalizada e uniforme. Todos os workers de E experienciam a mesma coisa. Sinais clustered (σ baixo) porque experiências são homogêneas. Coordenação fácil.

**Threshold/O-ring**: fase complementar cria vencedores (firms produtivas, workers empregados com produtividade elevada) e perdedores dispersos. Quando threshold é cruzado, perdedores estão cercados por vencedores. Heterogeneidade de experiências dispersa sinais (σ alto). Coordenação difícil porque grievance não é compartilhada uniformemente — vencedores não têm incentivo para se juntar, e bloqueiam ação coletiva.

**O que NÃO é**: não é que workers não sabem que houve choque (isso é óbvio ex post). Não é que a trajetória "mascara" algo escondido. A fase complementar é genuinamente benigna até o threshold ser cruzado. σ captura dispersão de experiências, não incerteza informacional individual.

## Nova Section 2: "The Logic of Crossed Fragility"

### Estrutura

Prosa contínua, sem equações, ~3 páginas. Estilo expositivo-analítico (Bonomi et al.).

**Parágrafo de abertura**: Preview do que a seção faz — percorrer a lógica informal do modelo.

**Building block 1: Automation trajectories.**
- Rapid: todos perdem ao mesmo tempo. Experiência compartilhada, uniforme.
- Threshold/O-ring: AI complementa primeiro, criando vencedores. Quando threshold é cruzado, perdedores emergem dispersos entre vencedores. Firms produtivas estão fortes, empregados ganhando mais.

**Building block 2: From trajectories to coordination.**
- σ captura dispersão de experiências dentro da população.
- Rapid: experiência uniforme → sinais clustered → common knowledge of grievance → coordenação.
- Threshold: experiência heterogênea (vencedores + perdedores) → sinais dispersos → coordenação falha. Perdedores isolados entre vencedores.
- O link é informacional mas sobre heterogeneidade coletiva, não incerteza individual.

**Building block 3: Institutional responses depend on coordination.**
- Democracia: compensação requer coalizão visível + choque observado. Sem coordenação, não há demanda política, não há ação.
- Autocracia: repressão degrada quando oposição é organizada e visível. Sem coordenação, repressão mantém plena eficácia.
- Assimetria: democracia estabiliza tornando M atrativo (compensação); autocracia estabiliza tornando P custoso (repressão).

**Building block 4: The four scenarios.**
Walkthrough verbal dos 4 cenários (rapid×D, rapid×A, threshold×D, threshold×A):

1. *Democracy + rapid*: perda uniforme → workers coordenam → coalizão visível → maioria autoriza compensação → estável. Compensação persiste (capacidade institucional construída).

2. *Autocracy + rapid*: perda uniforme → workers coordenam → oposição visível → repressão degradada → se repressão insuficiente, instável.

3. *Democracy + threshold*: t=1 complementaridade, todos ganhando, nenhuma crise. Nenhuma capacidade compensatória construída. t=2 threshold cruzado, perdedores dispersos entre vencedores, coordenação falha, sem coalizão visível, sem demanda política. Janela de compensação fechou. Instável.

4. *Autocracy + threshold*: t=1 idem. t=2 threshold cruzado, perdedores dispersos, coordenação falha, repressão plena eficácia. Estável.

**Parágrafo de fechamento**: O resultado de crossed fragility emerge de um único objeto de equilíbrio (participação π*) gerado pela dispersão de experiências, processado por continuation maps institucionais distintas. A formalização na próxima seção torna isso preciso.

### Figura: Game Timeline

Dois painéis (rapid vs threshold), cada um mostrando os dois períodos:

```
RAPID DISPLACEMENT
t=1: Nature → ω high → displacement (all E lose)
     → uniform signals (σ_r low) → coordination succeeds (π ≥ π̄)
     → D: compensation activated | A: repression degraded
     → D: stable | A: unstable (if moderate)

t=2: Displacement persists → same coordination → same outcome
     D: capacity persists (A7) | A: opposition persists

THRESHOLD AUTOMATION  
t=1: Nature → ω low → complementarity (E gains β)
     → no grievance → no coordination needed
     → D: stable (no crisis) | A: stable (no crisis)
     → No compensatory capacity built

t=2: Nature → ω high → displacement (E loses L)
     → heterogeneous signals (σ_τ high) → coordination fails (π < π̄)
     → D: no compensation, A7 blocks | A: repression at full capacity
     → D: unstable | A: stable (if κ₀ ≥ κ̄)
```

## Passagens a corrigir (18 itens)

### Abstract (linha 14)
- **De**: "Threshold shocks produce strategic uncertainty that prevents coordination"
- **Para**: algo como "Threshold shocks disperse the affected among beneficiaries, preventing the uniform grievance that coordination requires"

### Introduction
- L19: "disoriented workers" → "dispersed workers" ou "workers scattered among beneficiaries"
- L25: "strategic uncertainty" → "heterogeneous experiences" framing
- L65: "how legible those losses are" → "how uniformly those losses are distributed"

### Model section (L71 — passagem principal)
- Reescrever parágrafo inteiro sobre σ. De "predictability before it arrives / masks the coming substitution / caught off guard" para interpretação de heterogeneidade.

### A6 (L115)
- "predictable/visible/approaching" → "uniform/shared"
- "masks the coming substitution" → remove

### Example (L125, L128)
- "Crisis visible, predictable" → "Crisis uniform, shared"
- "Workers surprised (shock unpredictable)" → "Workers dispersed among beneficiaries"

### Proofs (L160, L162, L170)
- "shock was predictable" → "displacement was uniform"
- "displacement was unpredictable" → "displaced workers dispersed among those still benefiting"

### Discussion/Conclusion
- L266: "disoriented dissent" → "dispersed dissent"
- L313: reframe "mapping from trajectory to signal noise"
- L339: "shocks differ in observability" → "shocks differ in the uniformity of their impact"

## Mudanças auxiliares

- **Roadmap na intro (L35)**: mencionar nova Section 2
- **Renumerar referências a seções** no texto todo (Model vira Section 3, Results vira Section 4, etc.)
- **Appendix A referência** (L351): "Section 2" → "Section 3"

## Verificação

- [ ] Paper compila sem erros
- [ ] Nova seção ~3 páginas
- [ ] Todas 18 passagens corrigidas
- [ ] Figura de timeline criada
- [ ] Nenhuma passagem restante com "predictability/masks/surprise/caught off guard"
- [ ] Seções renumeradas consistentemente
- [ ] grep final por "predictab|masks the|caught off guard|disoriented|unpredictab"
