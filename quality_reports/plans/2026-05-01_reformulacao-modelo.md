# Plano: Reformulação do Modelo — Microfundamentação Individual + Incumbente Estratégico

**Status**: DRAFT — conceitual completo, formalização pendente de implementação no paper
**Data**: 2026-05-01 (atualizado ao longo do dia)
**Título-semente**: "AI and Regime Stability: Responsiveness and Speed to Economic Shocks"

## Objetivo

Reformular o modelo do paper IA-dem para resolver fragilidades de microfundamentação: (1) choque agregado ω_t com decisão individual; (2) decisão de protestar depende do estado agregado, não da situação individual; (3) N passivo; (4) A7 imposta. A reformulação mantém a fragilidade cruzada com mecanismo mais limpo.

## Intuição central (linguagem natural)

Democracias e autocracias diferem em DUAS dimensões:
- **Responsiveness (informação)**: democracia vê a crise com clareza (protesto aberto = sinal bom). Autocracia é cega (repressão suprime o sinal que o ditador precisaria — dictator's dilemma).
- **Speed (velocidade de resposta)**: autocracia age rápido quando decide agir (decreto, sem legislatura). Democracia age devagar (debate, legislação, coalizão).

A ironia: velocidade sem informação é inútil (autocracia não sabe no que responder). Informação sem velocidade é insuficiente sob surpresa (democracia vê mas não consegue agir a tempo).

**Fragilidade cruzada**: sob choque rápido (visível), democracia vê e responde (devagar, mas a tempo). Autocracia não vê e desperdiça sua velocidade. Sob choque threshold (surpresa), democracia vê tarde demais e não consegue agir a tempo. Autocracia reprime o protesto (menor, por causa do custo alto de protestar) e sobrevive.

## Modelo Formal

### Primitivas

- Continuum de trabalhadores i ∈ [0,1]
- Dois períodos t ∈ {1, 2}
- Renda de emprego normalizada: Y = 1
- B ∈ (0, 1) = benefit (compensação universal para deslocados)
- Incumbente (governo) — jogador estratégico

### Natureza e trajetórias — três estados

- θ ∈ {R, T, N} — rápido, threshold, sem choque. Não observado.
  - P(θ = R) = p_R, P(θ = T) = p_T, P(θ = N) = p_N = 1 - p_R - p_T
- (ω₁, ω₂)|θ:
  - θ = R (rápido): (ω_H, ω_H) — choque persistente
  - θ = T (threshold): (ω_L, ω_H) — choque atrasado
  - θ = N (sem choque): (ω_L, ω_L) — calma permanente
- ω_H > ω_L > 0. Determinístico dado θ.
- Cada trabalhador: d_{it} ~ Bernoulli(ω_t), iid condicional em ω_t.

**Por que três estados (não dois):** Com apenas θ ∈ {R, T}, E[ω₂] = ω_H sob ambos → a incerteza sobre θ não diferencia expectativas futuras. O terceiro estado (N) torna a ambiguidade genuína: ω₁ baixo pode ser "tudo bem" (N) ou "bomba-relógio" (T). Sem N, calma no t=1 sempre precede tempestade — não há incerteza real.

### Informação

- Trabalhador i observa: d_{it} e s_{it} = ω_t + σε_{it}, ε ~ F (contínua, simétrica, MLRP, suporte pleno).
- Sinal composto: d_{it} é informativo sobre ω_t (Bernoulli likelihood). Trabalhador combina d_{it} + s_{it} via updating bayesiano.
- Incumbente observa π_t (protesto agregado) após trabalhadores agirem. Não observa θ nem ω_t.

### Updating sobre θ (agora com 3 estados)

Após (d_{i1}, s_{i1}), o trabalhador atualiza sobre θ:

P(θ | d, s) ∝ P(d, s | θ) · P(θ)

Onde P(d, s | θ) = [ω_t(θ)]^d · [1-ω_t(θ)]^{1-d} · f((s - ω_t(θ))/σ)/σ

O updating agora diferencia expectativas futuras:

E[ω₂ | d_{i1}, s_{i1}] = P(R | d, s) · ω_H + P(T | d, s) · ω_H + P(N | d, s) · ω_L
                        = [P(R | d, s) + P(T | d, s)] · ω_H + P(N | d, s) · ω_L

Se ω₁ parece alto → P(R) sobe → E[ω₂] alto (perto de ω_H)
Se ω₁ parece baixo → P(N) sobe → E[ω₂] cai (mais perto de ω_L)

**A ambiguidade é genuína**: ω₁ baixo pode ser T (bomba-relógio) ou N (tudo bem). Trabalhador faz média ponderada e subestima o risco futuro sob threshold.

### Diferença entre regimes — duas primitivas

| Primitiva | Democracia | Autocracia |
|-----------|-----------|------------|
| Custo de protesto C_x | C_D (baixo) | C_A (alto) |
| Velocidade de resposta | **Lenta** (comp_t → φ_{t+1}) | **Rápida** (comp_t → φ_t) |

**Custo de protesto** gera: protesto maior em democracia → melhor sinal para incumbente (responsiveness) → dictator's dilemma na autocracia.

**Velocidade** gera: autocracia pode compensar no MESMO período; democracia só no PRÓXIMO. O lag democrático é micro-fundado como propriedade do processo institucional (legislação, debate, coalizão), não da tecnologia de compensação. Autocracias decidem por decreto.

### Timing dentro de cada período

1. Natureza: d_{it} realizado para cada i
2. Sinais: trabalhador observa (d_{it}, s_{it})
3. Protesto: cada i escolhe a_{it} ∈ {0,1}. π_t = ∫ a_{it} di
4. Incumbente observa π_t, decide comp_t ∈ {0,1}
5. Se comp_t = 1:
   - Autocracia: φ_t = 1 (imediato). Crise desarmada no MESMO período.
   - Democracia: φ_{t+1} = 1 (lag). Crise persiste NESTE período, compensação chega no próximo.
   - Em t=2, comp_2 em democracia não tem efeito (sem t=3).
6. Se crise continua (não compensou ou lag) e π_t > π̄_x^fall → regime cai
7. Payoffs realizados.

### Mecanismo de queda — único, baseado em protesto

**Condição formal única**: regime cai iff **π_t > π̄_x^fall** e crise não foi resolvida (φ_t = 0).

Um mecanismo, dois parâmetros:
- π̄_x^fall = resiliência institucional (parâmetro primitivo do regime, π̄_D^fall > π̄_A^fall)
- π_t = protesto agregado (determinado por v_i, C_x, ω_t, h(π) — tudo endógeno)

O que difere entre cenários NÃO é o mecanismo de queda — é o **tamanho de π**, que resulta da interação informação × velocidade × trajetória:

```
┌────────────┬──────────────────┬────────────────┬─────────────────┬────────────────────────────────────────────────────────────┐
│   Regime   │    Informação    │   Velocidade   │    Vantagem     │                      Vulnerabilidade                       │
├────────────┼──────────────────┼────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
│ Democracia │ Alta (C_D baixo) │ Baixa (lag)    │ Crises visíveis │ Crises surpresa                                            │
├────────────┼──────────────────┼────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
│ Autocracia │ Baixa (C_A alto) │ Alta (decreto) │ —               │ Crises persistentes (velocidade desperdiçada por cegueira) │
└────────────┴──────────────────┴────────────────┴─────────────────┴────────────────────────────────────────────────────────────┘
```

**Rapid t=2, autocracia**: v acumulado (2 períodos sem compensação) + degradação repressiva → π_A sobe → excede π̄_A^fall (baixo).

**Threshold t=2, democracia**: v de perda presente sem compensação (promessa não crível, sem t=3) → π_D naturalmente alto (C_D baixo) → excede π̄_D^fall (alto, mas π_D é maior ainda).

**Rapid t=2, democracia**: compensação ativa (φ_2=1) → v reduzido → π_D cai → abaixo de π̄_D^fall.

**Threshold t=2, autocracia**: v de 1 período apenas + C_A alto → π_A baixo → abaixo de π̄_A^fall (capacidade repressiva intacta).

**π̄_x^fall como primitiva**: democracias são desenhadas para absorver protesto (liberdade de expressão, accountability, canais institucionais, eleições). Autocracias são frágeis quando não conseguem reprimir (Geddes 1999: colapso súbito). O parâmetro é defensável como propriedade institucional do regime.

**Por que democracia sobrevive rapid t=1?** Embora a compensação só chegue em t=2 (lag), a PROMESSA crível de compensação (governo visível respondendo) defusa parcialmente o protesto em t=1. Trabalhadores toleram 1 período de hardship se sabem que ajuda vem.

### Payoffs do trabalhador

**Renda per-período:**

y_{it} = (1 - d_{it}) + B · d_{it} · φ_t

| Estado | Renda |
|--------|-------|
| Empregado (d=0) | 1 |
| Deslocado, compensado (d=1, φ=1) | B |
| Deslocado, não compensado (d=1, φ=0) | 0 |

**Valor expressivo — função da perda esperada:**

v_i = (1 - y_{it}) + δ · E[(1 - y_{i,t+1}) | d_{it}, s_{it}]

- Deslocado sem comp (y=0): v = 1 + δ·E[perda futura]
- Empregado (y=1): v = 0 + δ·E[perda futura] = δ·P(deslocado em t+1)·(1-Bφ)
- Sob rápido t=1 (deslocado, E[ω₂] ≈ ω_H): v ≈ 1 + δ (alta raiva + medo do futuro)
- Sob threshold t=2 (deslocado, sem futuro): v = 1 (raiva sem medo — game ends)

v incorpora δ operacionalmente: trabalhador que espera mais deslocamento futuro tem mais raiva HOJE.

**Protesto:**

Custo efetivo: C_x · (1 - h(π_t)), com h(π) = π (linear, baseline).

Protesta iff v_i > C_x · (1 - E[h(π_t) | info])

Sem free-rider: v é privado (raiva expressiva), compensação é consequência da decisão do incumbente.

**Utilidade lifetime:**

U_i = [y_{i1} + a_{i1}·Π_{i1}] + δ · E[y_{i2} + a_{i2}·Π_{i2} | d_{i1}, s_{i1}]

### Payoffs do incumbente

Após observar π_t:

max_{comp_t} V · P(sobrevive | comp_t) - comp_t · ω̂_t · B

- V = valor de permanecer no poder
- ω̂_t = estimativa de ω baseada em π_t
- Compensar reduz protesto futuro (ou presente, se autocracia) → aumenta P(sobrevive)

O dictator's dilemma: I(C_x) = |∂π*/∂ω| é decrescente em C_x. Com C_A alto, π é pouco informativo sobre ω → ω̂_A é impreciso → incumbente não consegue calibrar resposta.

### Fragilidade cruzada — mecanismo completo

**Rápido (ω_H, ω_H):**
- t=1: ω_H → muitos deslocados
  - Democracia: π_D grande (C_D baixo) → incumbente VÊ crise → comp_1=1 → φ_2=1 (lag) → promessa crível defusa protesto em t=1 → sobrevive t=1
  - Autocracia: π_A pequeno (C_A alto) → incumbente NÃO VÊ → comp_1=0 → reprime → sobrevive t=1 mas gasta capacidade repressiva
- t=2: ω_H
  - Democracia: φ_2=1 → compensados → v baixo → protesto reduzido → **ESTÁVEL**
  - Autocracia: sem compensação + capacidade repressiva degradada → π_A excede π̄_A^fall → **CAI**

**Threshold (ω_L, ω_H):**
- t=1: ω_L → poucos deslocados → ambos sem crise → ninguém compensa
- t=2: ω_H, sem compensação prévia
  - Democracia: π_D grande → incumbente vê → comp_2=1 → mas LAG → sem efeito em t=2 → protesto descontido → π_D > π̄_D^fall → **CAI**
  - Autocracia: π_A pequeno (C_A alto) → abaixo π̄_A^fall → capacidade repressiva intacta (não usou em t=1) → **ESTÁVEL**

### Condições paramétricas para fragilidade cruzada

Em linguagem de parâmetros:

**(i)** π_D(ω_H, v=1+δ) ≤ π̄_D^fall — democracia absorve protesto em t=1 (rapid) quando promessa de compensação defusa. MAS π_D(ω_H, v=1) > π̄_D^fall — sem promessa (threshold t=2), protesto excede.

**(ii)** π_A(ω_H, v=1+δ) > π̄_A^fall (com degradação) — autocracia não sobrevive 2 períodos de crise sem compensação. MAS π_A(ω_H, v=1) ≤ π̄_A^fall — autocracia sobrevive 1 período (threshold t=2, repressão intacta).

**(iii)** ω_L gera protesto pequeno → ambos sobrevivem t=1 sob threshold.

### Lemas e proposições planejados

**Lema 1 (Dictator's dilemma):** I(C_x) = |∂π*/∂ω| é decrescente em C_x. Protesto é sinal mais informativo de ω em democracia.

**Lema 2 (Degradação repressiva):** Capacidade repressiva efetiva em t=2 é decrescente no esforço repressivo em t=1. Sob rápido (2 períodos de crise), π̄_A^fall(t=2) < π̄_A^fall(t=1).

**Proposição (Zona de compensação):** Largura da zona de compensação do incumbente é decrescente em C_x (informacional) e crescente na velocidade de resposta. Zona estreita/inexistente para autocracia.

**Proposição (Fragilidade cruzada):** Sob condições (i)-(iii), democracia é estável sob rápido e instável sob threshold; autocracia exibe o padrão inverso.

### Robustez

- Não knife-edge: resultado robusto para faixa de C_A/C_D e π̄_D^fall/π̄_A^fall.
- δ é operacional: quanto maior δ, maior a diferença entre v(rapid t=1) e v(threshold t=2), mais robusta a fragilidade cruzada.
- Extensão T > 2 períodos em appendix.

## Tabela de notação

| Símbolo | Significado |
|---------|------------|
| θ ∈ {R, T, N} | Tipo de automação (rápido/threshold/sem choque), não observado |
| p_R, p_T, p_N | Prior sobre θ |
| ω_t ∈ [0,1] | Probabilidade de deslocamento no período t |
| ω_H, ω_L | Choques alto/baixo (ω_H > ω_L) |
| d_{it} ∈ {0,1} | Estado individual: deslocado ou não |
| s_{it} | Sinal contínuo: s = ω_t + σε_i |
| σ | Ruído do sinal |
| a_{it} ∈ {0,1} | Ação: protestar ou não |
| π_t | Protesto agregado: ∫ a_{it} di |
| v_i | Valor expressivo: perda presente + δ·E[perda futura] |
| C_x | Custo de repressão (C_A > C_D) |
| h(π) = π | Safety in numbers (linear, baseline) |
| B ∈ (0,1) | Benefit: compensação universal para deslocados |
| φ_t ∈ {0,1} | Compensação disponível no período t |
| δ ∈ (0,1] | Fator de desconto intertemporal |
| V | Valor de permanecer no poder (incumbente) |
| comp_t | Decisão do incumbente: compensar (1) ou não (0) |
| π̄_x^fall | Resiliência institucional a protesto (π̄_D^fall > π̄_A^fall) |
| I(C_x) | Informativeness do protesto: |∂π*/∂ω| |

**Removidos da versão anterior**: f_x (capacidade fiscal), ω̄_x^fall = f_x/B (threshold fiscal). Substituídos por velocidade de resposta + π̄_x^fall institucional.

## Itens resolvidos

- [x] Estrutura do sinal composto → sinal bayesiano (d_i + s_i)
- [x] Distribuição (ω_1, ω_2) | θ → determinística, 3 estados (R, T, N)
- [x] Payoff do trabalhador → intertemporal com δ; v_i = perda presente + δ·E[perda futura]
- [x] Problema do incumbente → otimização explícita, sequencial, compensação binária
- [x] Mecanismo de seleção → global games, complementaridade via h(π)
- [x] Motivação do protesto → expressivo (sem free-rider)
- [x] Prior sobre θ → (p_R, p_T, p_N), 3 estados
- [x] Payoffs formais → y, v, Π, U escritos
- [x] h(π) → linear (baseline, pode mudar depois)
- [x] Diferença entre regimes → C_x (informação) + velocidade de resposta (lag regime-específico)
- [x] Mecanismo de queda → protesto não-respondido > π̄_x^fall (institucional, não fiscal)
- [x] Autocracia cai sob rápido → degradação repressiva em 2 períodos
- [x] Democracia cai sob threshold → lag impede resposta em t=2

## Próximos passos (implementação)

- [ ] Escrever o modelo formal no paper.Rmd (reescrever Sections 3-4)
- [ ] Formalizar degradação repressiva (K_t ou η_t)
- [ ] Derivar cutoff do global game com h(π) = π e v_i como função de perda
- [ ] Derivar proposições (fragilidade cruzada, zona de compensação, estática comparativa)
- [ ] Exemplo numérico (Varian: antes do modelo geral)
- [ ] Verificação Lean (após formalização estável)
- [ ] Appendix: inferência bayesiana do incumbente (Camada 3)
- [ ] Appendix: extensão T > 2 períodos
- [ ] Formalizar "promessa crível" que defusa protesto em rapid t=1

## Questões abertas

- Especificidade IA: mecanismo é genérico. Defender via framing (incerteza sobre tipo de automação).
- h(π) linear: pode precisar de forma côncava. Testar.
- Não-deslocado protesta? Via v_i = δ·E[perda futura]. Efeito de segunda ordem.
- π̄_x^fall: parâmetro institucional. Derivar de algo? Ou aceitar como primitiva do regime?
- "Promessa crível" de compensação em rapid t=1: precisa formalizar como reduz protesto. Opções: v_i cai quando governo anuncia comp; ou π̄_D^fall efetivo sobe quando governo está respondendo.
- Degradação repressiva: formalizar como K_2 = K_1 - g(π_1), onde g é custo da repressão.

## Decisões de design (alternativas descartadas)

### Decisão: Estrutura do sinal
- **Escolha**: Sinal composto bayesiano. d_i + s_i via updating.
- **Descartado**: Sinal separado do estado — contradiz intuição.

### Decisão: Distribuição (ω_1, ω_2) | θ — 3 estados
- **Escolha**: θ ∈ {R, T, N}. R=(ω_H,ω_H), T=(ω_L,ω_H), N=(ω_L,ω_L). Determinístico.
- **Descartado**: 2 estados (R, T) — E[ω₂] = ω_H sempre, incerteza sobre θ não diferencia expectativas. N é necessário para ambiguidade genuína ("calma = tudo bem ou bomba-relógio?").
- **Descartado**: Estocástica (Beta) — complexidade sem ganho.

### Decisão: Payoff do trabalhador
- **Escolha**: v_i = (1-y_{it}) + δ·E[(1-y_{i,t+1})]. Intertemporal, δ operacional.
- **Descartado**: v fixo (estático) — δ não entra, fragilidade cruzada não diferencia por expectativas.
- **Descartado**: v só perda presente — não-deslocado nunca protesta, perde canal "medo do futuro".

### Decisão: Problema do incumbente
- **Escolha**: Otimização explícita, sequencial.
- **Descartado**: Regra mecânica — era problema do modelo original.

### Decisão: Compensação
- **Escolha**: Binária, transfere B a todos deslocados (universal).
- **Descartado**: Contínua — corner solution. Club good — artificial.

### Decisão: Motivação do protesto
- **Escolha**: Expressivo (v_i privado) + safety in numbers.
- **Descartado**: Club good, protesto estratégico — free-rider problem.

### Decisão: Diferença entre regimes — velocidade + informação
- **Escolha**: DUAS primitivas: (1) C_A > C_D (custo de protesto → qualidade da informação). (2) Velocidade de resposta (autocracia = mesmo período, democracia = próximo período).
- **Descartado**: Capacidade fiscal (f_D > f_A) como diferenciador — empiricamente questionável, gera inconsistência no timing da queda (autocracia cai mecanicamente em t=1, democracia não cai nunca). Substituída por velocidade.
- **Descartado**: Mecanismos opostos como primitiva (modelo original) — assumido, não derivado.
- **Descartado**: Custo relativo dos instrumentos — menos parcimonioso.
- **Insight**: Velocidade sem informação é inútil. Informação sem velocidade é insuficiente sob surpresa.

### Decisão: Mecanismo de queda
- **Escolha**: Protesto não-respondido excede resiliência institucional (π > π̄_x^fall). Autocracia cai sob rápido por degradação repressiva (2 períodos). Democracia cai sob threshold por lag (sem t=3).
- **Descartado**: Queda puramente fiscal (ω·B > f_x) — autocracia cai mecanicamente em t=1 (step 4 dispara antes do incumbente decidir); democracia não cai nunca sob threshold (fiscal não dispara). Inconsistente.
- **Descartado**: Defecção militar — adiciona jogador.

### Decisão: Lag de compensação — regime-específico
- **Escolha**: Democracia: lag de 1 período (legislação, debate, coalizão). Autocracia: sem lag (decreto).
- **Descartado**: Lag universal (propriedade da tecnologia) — não diferencia regimes, e empiricamente autocracias agem mais rápido (COVID-19: China vs Itália).

### Decisão: Notação de compensação
- **Escolha**: B (benefit).
- **Descartado**: c (cost), T (time), τ (tax rate).

## Referências-chave

- Kuran (1991) — preference falsification, surprise revolutions
- Wintrobe (1998) — dictator's dilemma
- Geddes (1999) — authoritarian collapse patterns
- Svolik (2012) — politics of authoritarian rule
- Egorov, Guriev, Sonin (2009) — dictator's information problem
- Lorentzen (2014) — strategic censorship, China
- Morris & Shin (2003) — global games
- Acemoglu & Robinson (2006) — regime transitions

## Verificação final
- [x] Fragilidade cruzada emerge de interação velocidade × informação
- [x] Modelo fecha sem A7 — lag é propriedade do regime democrático, não axioma
- [x] Microfundamentação individual — choque individual, decisão individual
- [x] Incumbente estratégico — otimização sequencial
- [x] Dictator's dilemma preservado — informacional
- [x] Free-rider resolvido — protesto expressivo
- [x] Incerteza sobre θ genuína — 3 estados (R, T, N)
- [x] δ operacional — v_i inclui expectativa futura
- [ ] Degradação repressiva — precisa formalizar
- [ ] Promessa crível em rapid t=1 — precisa formalizar
- [ ] π̄_x^fall — parâmetro ou derivado?
