# IA-dem — AI Automation, Regime Type, and Democratic Fragility

## Projeto

Paper teórico-formal na tradição OEP (Open Economy Politics) sobre como diferentes trajetórias de automação por IA afetam a estabilidade de democracias vs. autocracias.

**Autor**: Cientista político (não economista). A economia é premissa importada; a contribuição é a camada política.

## Pergunta central

> Dadas duas trajetórias estilizadas de automação por IA — deslocamento rápido vs. automação com threshold (O-Ring) — qual tipo de regime, democracia ou autocracia, é mais frágil sob cada cenário, e por quê?

## Mecanismo

**Intuição central (a ser formalizada):** Choques rápidos facilitam coordenação — o que democracias canalizam em compensação e autocracias não conseguem reprimir. Choques threshold impedem coordenação — o que paralisa democracias (sem sinal para agir) e favorece autocracias (repressão funciona contra população desorientada).

Dois sub-mecanismos interagem:
1. **Democracia — compensação reativa**: requer sinal político (crise observada) para mobilizar investimento em φ. Funciona quando E está coordenado (rápida). Falha quando não há sinal (threshold).
2. **Autocracia — repressão com efetividade variável**: capacidade repressiva permanente κ₀, mas sua efetividade η depende da coordenação de E. Efetiva contra população desorientada (threshold: η=1). Degradada contra oposição organizada e visível (rápida: η<1) — soldados se recusam a atirar, pressão internacional, deserção.

**Resultado-alvo (cruzado)**:

| | Rápida | Threshold |
|--|:---:|:---:|
| Democracia | Estável | Instável |
| Autocracia | Instável | Estável |

## Modelo base

- Premissa econômica: Gans & Goldfarb (2026), O-Ring Automation
- 2 períodos (t=1, t=2)
- 2 grupos: expostos (E), não-expostos (implícitos — W é parâmetro, N não aparece na formalização)
- 2 trajetórias: rápida (ℓ(1)=L, ℓ(2)=0) vs. threshold (ℓ(1)=0, ℓ(2)=L)
- 2 regimes: democracia (estabilidade via φ — compensação) e autocracia (estabilidade via κ — contenção)
- φ endógeno: construído em resposta a choque observado (reativo)
- κ = κ₀ · η(tipo de choque): capacidade permanente κ₀ com efetividade η variável
  - η(rápida) < 1: repressão degradada contra oposição organizada
  - η(threshold) = 1: repressão efetiva contra população desorientada

## MVP — Paper mínimo viável

O paper na sua forma mais enxuta:

| Elemento | Conteúdo |
|----------|----------|
| Pergunta | Sob threshold vs. deslocamento rápido, qual regime é mais frágil? |
| Mecanismo | Mismatch entre timing do choque e timing da resposta institucional |
| Teste mínimo | Modelo 2 períodos × 2 trajetórias × 2 regimes com φ e κ endógenos |
| Resultado esperado | Resultado CRUZADO: democracia estável sob rápida / instável sob threshold; autocracia o inverso. |
| Contribuição | Primeiro modelo ligando *forma* da trajetória de automação à estabilidade comparada de regimes. OEP aplicada a IA. |

## O que está FORA do MVP

- Competição eleitoral (paper separado)
- Grupos heterogêneos (paper separado)
- Calibração empírica (paper futuro)
- Elasticidade de demanda como mecanismo separado (é parâmetro, não seção)
- Dinâmica com mais de 2 períodos
- N ativo (vota sobre φ, prefere φ baixo) — extensão pós-MVP (ver D4)

## Decisões de design (formal-model-design reviews: 5/10 → 7.5/10 → 8.5/10)

**Review v1 (sketch, 5/10)**: φ e κ exógenos — mecanismo narrado, não operando no modelo.
**Review v2 (modelo resolvido, 7.5/10)**: Resultado cruzado confirmado. Fraqueza: A3 e A4 assumidas, não derivadas.
**Review v3 (modelo completo, 8.5/10)**: Microfundações em apêndice, P7-P8 formalizadas, tipologia 5 tipos. Fraqueza remanescente: instrumentos regime-específicos por construção.
Pareceres em quality_reports/2026-03-27_formal-model-design-v2.md e v3.md.

### D1. Eliminar o economicismo — especificar trajetórias diretamente

NÃO modelar A, λ, ε. Definir perdas exogenamente por trajetória:
- Rápida: ℓ(1) = L, ℓ(2) = 0
- Threshold: ℓ(1) = 0, ℓ(2) = L

Justificar com uma frase citando Gans & Goldfarb. A economia é premissa OEP, não objeto do modelo.

### D2. Mecanismos de resposta por regime

**Democracia — compensação reativa**:
- φ construído em resposta a ℓ_t observado. Se ℓ_t = 0, φ = 0 (sem base política para taxar N e compensar E).
- Justificativa: compensação requer aprovação majoritária (N > E). N só aceita taxação quando instabilidade é observável.
- Resultado: funciona sob rápida (ℓ₁ = L → sinal → φ = φ̄). Falha sob threshold (ℓ₁ = 0 → sem sinal → φ = 0).

**Autocracia — repressão permanente com efetividade variável**:
- κ₀ > 0 mantido como política permanente (segurança do regime, independente de choques econômicos).
- Efetividade depende da coordenação de E: κ_efetivo = κ₀ · η(tipo).
- η(rápida) < 1: choques visíveis e compartilhados facilitam coordenação de E → repressão degradada (deserção, pressão internacional, legitimidade do agravo).
- η(threshold) = 1: choques súbitos e desorientadores dificultam coordenação → repressão efetiva.
- Resultado: falha sob rápida (κ_efetivo = κ₀·η < κ̄). Funciona sob threshold (κ_efetivo = κ₀ ≥ κ̄).

**Fonte da assimetria**: NÃO é sobre quem tem mais capacidade. É sobre como o TIPO DE CHOQUE interage com o MECANISMO DE RESPOSTA de cada regime. Coordenação de E é a variável mediadora.

**Condição para resultado cruzado**: κ̄ ≤ κ₀ < κ̄/η(rápida). Autocracias nesse intervalo (a maioria dos casos reais) exibem o padrão cruzado.

### D3. Definir U_E(R) com precisão

R = colapso institucional com redistribuição forçada e destruição de valor:

U_E(R) = θ·(w_E + w_N) - k

Onde θ = fração do output total capturada por E sob regime radical, k = custo de transição. E escolhe R quando ℓ_E - c_E é grande o suficiente para compensar k.

### D4. N eliminado da formalização (sugestão 3 do review v2)

N não aparece em nenhuma equação. W é parâmetro. A3 justificada diretamente: "compensação democrática requer legitimidade política que só emerge sob crise observada." N entra apenas na microfundação de A3 (modelo de votação — Step 5 do plano).

### D5. Resultado cruzado (target)

O resultado-alvo é:

> *Proposição*: Para κ₀ ∈ [κ̄, κ̄/η), sob deslocamento rápido a democracia é estável e a autocracia instável; sob automação threshold, a democracia é instável e a autocracia estável.

Isso produz VANTAGEM COMPARATIVA por tipo de choque: democracias processam melhor choques observáveis; autocracias processam melhor choques delayed.

**Lição do exemplo numérico v1** (01_numerical_example.md): sem η, o modelo produzia "ambos frágeis" sob threshold (exceto autocracia forte com κ₀ ≥ κ̄ — resultado tautológico). O parâmetro η (efetividade repressiva variável) é o que gera a assimetria derivada em vez de assumida.

### D6. Modelo unificado

Democracia e autocracia devem ser UM modelo com tipo de regime como parâmetro, não dois modelos separados (Seções 4 e 6 do sketch antigo).

## Plano de trabalho (ordem de execução)

1. ~~**Exemplo numérico v1**~~ — FEITO. Sem η → resultado fraco.
2. ~~**Exemplo numérico v2**~~ — FEITO. Com η → resultado cruzado confirmado.
3. ~~**Formalizar modelo geral**~~ — FEITO (model/03_formal_model.md). 6 proposições com provas.
4. ~~**Avaliar com `/formal-model-design` v2**~~ — FEITO (quality_reports/2026-03-27_formal-model-design-v2.md). Score 7.5/10.
5. ~~**Microfundar A3**~~ — FEITO (model/04a_microfoundation_A3_sketch.md). Modelo de votação: N veta τ quando ℓ=0 (sem ameaça credível). SPE único. Scope condition: γ ≥ φ̄·c.
6. ~~**Microfundar η (A4)**~~ — FEITO (model/04b_microfoundation_A4_sketch.md). Global games (Morris & Shin). σ(rápida)≈0 → common knowledge → coordenação → η_R<1. σ(threshold) grande → incerteza estratégica → falha de coordenação → η_T=1. Insight: mecanismo é informacional, não preferencial.
7. ~~**Desenvolver extensão φ₀ formalmente**~~ — FEITO. Proposição 7 (welfare state como seguro) + Proposição 8 (equivalência funcional φ₀ ≈ κ₀ com gap de welfare) + Corolário 2 (tipologia completa 5 tipos). N eliminado da formalização (W como parâmetro). Microfundações referenciadas como apêndices.
8. ~~**Posicionar na literatura formal**~~ — FEITO. 15 refs essenciais + 3 em nota de rodapé. Przeworski (2005, 2000, 1982) incorporado como predecessores formais centrais. Novidade confirmada: ninguém formalizou trajetória × regime.
9. ~~**Formatar como paper**~~ — FEITO (paper.md). Intro lidera com P8. Estrutura: §1 Intro, §2 Model, §3 Results (P1-P6), §4 Extension (P7-P8 + tipologia completa), §5 Discussion, §6 Conclusion, Appendices A-B. 16 referências (15 + Przeworski & Limongi 1997 em nota).
10. **(Futuro)** Extensão com instrumentos mistos — especialização endógena.
11. **(Futuro)** Operacionalizar mapeamento empírico: φ₀ como gasto social/PIB, κ₀ como gasto segurança/PIB.
12. **(Futuro)** Extensão com incerteza sobre trajetória — P10 (under-insurance racional) + Corolário 4 (zona de fragilidade racional). Endereça crítica do Edmans sobre distância premissas→conclusões. Plano detalhado em: `~/.claude/plans/compressed-noodling-penguin.md`.

## Agenda de pesquisa (papers futuros)

**Paper 2: AI Surveillance and Repressive Capacity**
- Canal: IA → vigilância → η_R ↑ → crossed fragility shrinks
- Pergunta: como AI surveillance altera a resiliência relativa de regimes? Existe σ* acima do qual crossed fragility desaparece?
- Mecanismo: surveillance permite identificação preventiva de dissidentes → repressão eficaz mesmo contra oposição coordenada → η_R → 1
- Assimetria: autocracias deployam sem restrição; democracias limitadas por privacy laws (σ_D < σ_A)
- Resultado esperado: para σ ≥ σ*, autocracias estáveis sob AMBAS as trajetórias. Vantagem democrática sob rapid eliminada pela tecnologia.
- Refs: Beraja, Yang & Yuchtman (2023); Feldstein (2019); Guriev & Treisman (2019, 2022); Dragu & Lupu (2021)
- Status: ideação feita, formalização pendente

**Paper 3: Interação automação × surveillance — qual domina?**
- Combina paper 1 (automação desestabiliza) e paper 2 (surveillance estabiliza)
- Pergunta: quando ambos os canais operam simultaneamente, qual efeito domina?
- Depende de papers 1 e 2 publicados/circulando
- Status: conceitual apenas

**Extensão do paper 1 (não paper separado): Sistema eleitoral e resiliência democrática**
- Interpretar φ₀ como determinado pelo sistema eleitoral: PR → φ₀ alto (welfare universal) = democracia forte; majoritário → φ₀ baixo = democracia fraca
- Opção A (agora/R&R): parágrafo na Discussion conectando tipologia a Iversen & Soskice (2006), Hall & Soskice (2001), Rogowski (1987). ~5 frases.
- Opção B (se reviewer pedir): extensão formal com dois sub-tipos de democracia parametrizados por (φ₀, velocidade de A3). ~1-1.5 páginas.
- Resultado previsível como standalone ("PR → welfare → resiliência") — não justifica paper separado. Valioso como interpretação empírica dentro do paper 1.
- Ideia para futuro: se velocidade de resposta (rápida/localizada vs lenta/universal) gerar resultado cruzado *dentro de democracia*, aí vira paper. Requer endogeneizar A3 ao sistema eleitoral.
- Refs: Iversen & Soskice (2006), Cusack/Iversen/Soskice (2007), Rogowski (1987), Hiscox (2002), Rickard (2018), Hall & Soskice (2001), Rodden (2019)
- Variação paralela entre autocracias (Geddes 1999/2003) — simétrica mas projeto separado

## Diretrizes de apresentação do paper

- **Liderar a introdução com P8**: "We show that comprehensive social insurance achieves the same institutional resilience as repressive capacity — without the human cost."
- **Estrutura**: (1) Modelo base + P1-P6; (2) Extensão φ₀ + P7-P8; (3) Corolários e tipologia; (4) Apêndices com microfundações (04a, 04b).
- P7-P8 são EXTENSÃO, apresentadas APÓS P1-P6, não intercaladas nas observações.

## Posicionamento

**Tradição**: OEP — pegar modelo econômico como dado, derivar implicações político-institucionais.

**Debates**:
- Automação e desigualdade política (Acemoglu & Robinson, Boix, Ansell & Samuels)
- Resiliência institucional comparada (Svolik, Geddes, Gandhi & Przeworski)
- OEP e preferências derivadas de choques econômicos (Hiscox, Scheve & Slaughter, Walter)

**Target journals**: APSR, AJPS, IO, JOP, BJPS

**Referências essenciais (15 + 1 nota de rodapé)**:

*Regime stability e choques*:
1. Acemoglu & Robinson (2006) — principal conversa: choques transitórios → regime change. Nós: forma da trajetória importa, não só transitoriedade.
2. Przeworski (2005/2006) — predecessor formal: democracia auto-sustentável. Nós estendemos: adicionamos choques, trajetória, welfare state.
3. Przeworski et al. (2000) — puzzle empírico que formalizamos: democracias morrem sob crises, autocracias resilientes.
4. Przeworski & Wallerstein (1982) — compromisso de classe: ancestral conceitual de P7-P8 (welfare = forma institucional do compromisso).
5. Svolik (2012) — mecanismo complementar (agência autocrata-elite vs. nosso: contenção autocrata-massa).
6. Boix (2003) — redistribuição e democracia.

*Coordenação e ação coletiva*:
7. Kuran (1991) — preference falsification, cascatas. Threshold = pluralistic ignorance.
8. Edmond (2013) — global games e regime change. Base do apêndice 04b.
9. Chwe (2001) — common knowledge como pré-condição. Rápida = common knowledge do agravo.

*Welfare state como seguro*:
10. Moene & Wallerstein (2001) — welfare como seguro social. Nós: welfare como seguro *institucional*.
11. Desai, Olofsgård & Yousef (2009) — authoritarian bargains. Diretamente relevante para P8.

*OEP e premissa econômica*:
12. Lake (2009) — OEP método.
13. Gans & Goldfarb (2026) — premissa econômica (O-Ring automation).
14. Acemoglu & Restrepo (2020) — automação e emprego.
15. Autor, Levy & Murnane (2003) — task-based framework.

*Nota de rodapé*:
- Przeworski & Limongi (1997) — precursor empírico do 2000: desenvolvimento não causa transição para democracia, mas democracias ricas sobrevivem mais. Income threshold finding.
- Fernandez & Rodrik (1991), Alesina & Drazen (1991) — mecanismos adjacentes (status quo bias, war of attrition). Conexão mas mecanismo diferente.

**Posicionamento relativo a modelos formais próximos**:
- Acemoglu & Robinson (2006): choques transitórios → regime change. Nós: forma da trajetória (rápida vs threshold), não só transitoriedade binária. Resultado cruzado é novo.
- Przeworski (2005/2006): democracia auto-sustentável como equilíbrio. Nós: adicionamos choques exógenos, trajetória como variável, welfare state como mecanismo, coordenação como mediadora. Ele é estático em renda; nós somos dinâmicos em choques.
- Przeworski & Wallerstein (1982): compromisso de classe (trabalhadores consentem ao capitalismo em troca de proteção). Nosso P7-P8 formaliza: welfare state é a forma institucional desse compromisso que previne defecção para R sob choques.
- Svolik (2012): estabilidade autocrática como problema de agência (autocrata vs elite). Nosso: problema de contenção (autocrata vs massa). Complementares.
- Kuran (1991) + Edmond (2013) + Chwe (2001): coordenação como mediadora. Nós aplicamos ao contexto de automação com trajetórias diferenciadas.

## Regras para este projeto

- A economia é INPUT, não contribuição. Não tentar melhorar o modelo de automação.
- Trajetórias de perda são exógenas: ℓ(1)=L, ℓ(2)=0 (rápida) ou ℓ(1)=0, ℓ(2)=L (threshold). Não modelar A, λ, ε.
- φ reativo (construído em resposta a choque observado). κ permanente com efetividade η variável por tipo de choque.
- Não expandir além do MVP sem resolver D1–D6.
- Exemplo numérico ANTES de modelo geral (Varian).
- N passivo no baseline; N ativo é extensão pós-MVP.
- Um modelo unificado com regime como parâmetro, não dois modelos separados.
