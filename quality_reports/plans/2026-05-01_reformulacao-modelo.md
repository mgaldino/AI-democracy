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

**Por que π difere entre rapid e threshold em t=2?** Dois mecanismos simétricos (aplicam a ambos os regimes):

1. **Deslocamento é absorvente.** Uma vez deslocado, permanece deslocado. Fração total de deslocados em t=2:
   - Rapid: ω_H + (1-ω_H)·ω_H = ω_H(2-ω_H) — acumulou de t=1
   - Threshold: ω_L + (1-ω_L)·ω_H — t=1 teve poucos
   - Rapid > threshold (porque ω_H > ω_L). Mais gente na rua sob rapid.

2. **v backward-looking.** Raiva inclui sofrimento passado:
   - v_i = (1 - y_{it}) + γ·(1 - y_{i,t-1}) [+ δ·E[perda futura]]
   - Deslocado em t=1 E t=2 (rapid): v = 1 + γ (raiva acumulada)
   - Deslocado só em t=2 (threshold): v = 1
   - Sob rapid, fração ω_H dos deslocados em t=2 tem v = 1+γ. Sob threshold, apenas ω_L.

**Resultado em cada cenário:**

**Rapid t=2, autocracia**: mais deslocados (absorção) + mais raivosos (backward-looking) → π_A sobe → excede π̄_A^fall (baixo). Sem degradação repressiva necessária — é composição + intensidade.

**Threshold t=2, autocracia**: menos deslocados + v = 1 (sem passado) + C_A alto → π_A baixo → abaixo de π̄_A^fall.

**Rapid t=2, democracia**: compensação ativa (φ_2=1) → v reduzido (renda B em vez de 0) → π_D cai → abaixo de π̄_D^fall.

**Threshold t=2, democracia**: sem compensação (lei aprovada em t=2 mas lag, sem t=3) → v = 1 + deslocados acumulam de ω_L (poucos, mas novos ω_H são muitos) + C_D baixo → π_D grande → excede π̄_D^fall.

**π̄_x^fall como primitiva**: democracias absorvem mais protesto (liberdade de expressão, accountability, canais institucionais). Autocracias são frágeis quando não conseguem reprimir (Geddes 1999). Defensável como propriedade institucional.

**Por que democracia sobrevive rapid t=1?** Democracia PASSA LEI de compensação em t=1 (compromisso legal, não mero anúncio). Lei entra em vigor em t=2 (lag institucional: regulamentação, orçamento, agências). Compromisso legal é crível → trabalhadores antecipam φ_2=1 → v_{i1} cai (expectativa de perda futura reduzida) → π_D em t=1 é tolerável. Artificial em modelo de 2 períodos; em T>2 seria mais natural.

### Payoffs do trabalhador

**Renda per-período:**

y_{it} = (1 - d_{it}) + B · d_{it} · φ_t

| Estado | Renda |
|--------|-------|
| Empregado (d=0) | 1 |
| Deslocado, compensado (d=1, φ=1) | B |
| Deslocado, não compensado (d=1, φ=0) | 0 |

**Valor expressivo — função da perda presente e futura (sem γ no baseline):**

v_i = (1 - y_{it}) + δ · E[(1 - y_{i,t+1}) | d_{it}, s_{it}]

Dois componentes: raiva presente + medo do futuro.

- Deslocado sem comp em t=1: v = 1 + δ·E[perda futura]
- Deslocado com comp em t=2: v = 1-B (compensado, sem futuro no modelo de 2 períodos)
- Deslocado sem comp em t=2: v = 1 (sem futuro)
- Empregado em t=1: v = 0 + δ·E[ω₂]·(1-B·E[φ₂])

v incorpora δ operacionalmente: trabalhador que espera mais deslocamento futuro tem mais raiva HOJE.

**Diferença entre rapid e threshold em t=2 SEM γ:** vem de dois canais:
1. **Composição** (deslocamento absorvente): Ω₂(rapid) = ω_H(2-ω_H) > Ω₂(threshold) = ω_L+(1-ω_L)·ω_H
2. **Compensação**: φ₂=1 sob rapid/democracia → v=1-B (menor) vs φ₂=0 sob threshold → v=1

γ (backward-looking) é extensão opcional no appendix que fortalece o resultado.

**Protesto:**

Custo efetivo: C_x · (1 - h(π_t)), com h(π) = π (linear, baseline).

Protesta iff v_i > C_x · (1 - E[h(π_t) | info])

Sem free-rider: v é privado (raiva expressiva), compensação é consequência da decisão do incumbente.

**Utilidade lifetime:**

U_i = [y_{i1} + a_{i1}·Π_{i1}] + δ · E[y_{i2} + a_{i2}·Π_{i2} | d_{i1}, s_{i1}]

### Payoffs do incumbente (V=1 normalizado, sem γ)

Após observar π_t, incumbente resolve:

**comp_t = 1 iff ΔP(π_t) > ω̂(π_t) · B**

Onde:

**Custo**: κ(π_t) = ω̂(π_t) · B
- ω̂(π_t) = (π*)⁻¹(π_t): incumbente inverte o mapping de equilíbrio π*(ω) para inferir ω
- π*(ω) = Ω · F((ω-s*)/σ) é crescente e invertível (∂π/∂ω > 0)

**Benefício**: ΔP(π_t) = P(π₂^comp < π̄_x^fall) - P(π₂^no < π̄_x^fall)
- π₂^comp: protesto em t=2 com v = 1-B (compensado)
- π₂^no: protesto em t=2 com v = 1 (não compensado)
- Probabilidade sobre incerteza residual de ω₂ via posterior sobre θ

**Inferência bayesiana do incumbente (Bayes puro, sem viés behavioral):**

P(θ | π_t) ∝ P(π_t | θ) · P(θ)

Com 3 estados e P(N) > 0:
- Autocracia: π_A é baixo SEMPRE (C_A alto). Observar π baixo não diferencia N de T de R. P(N | π_A) ≈ P(N) → quase não atualiza → alta prob de "sem crise" → não compensa.
- Democracia: π_D é informativo. π_D alto ↔ ω alto ↔ θ=R. P(R | π_D alto) sobe → ω̂ alto → compensa.

**Threshold de compensação (no espaço de ω):**

ω̄_x^comp: ΔP(ω̄_x^comp) = ω̄_x^comp · B

**Resultado**: ω̄_A^comp > ω̄_D^comp porque:
1. π_A é flat em ω (I(C_A) baixo) → ω̂ impreciso → P(N|π_A) alto → ΔP percebido baixo → threshold sobe
2. π_D é steep em ω (I(C_D) alto) → ω̂ preciso → P(R|π_D alto) alto → ΔP percebido alto → threshold baixo

Dictator's dilemma não é irracionalidade — é consequência racional de sinal suprimido + prior com P(N)>0.

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

**(i)** Democracia sobrevive rapid t=1: π_D(Ω₁=ω_H, v=1+δ(1-B)) ≤ π̄_D^fall — lei aprovada reduz v (promessa crível), protesto tolerável.

**(ii)** Democracia cai threshold t=2: π_D(Ω₂=ω_L+(1-ω_L)·ω_H, v=1) > π̄_D^fall — sem compensação, protesto excede.

**(iii)** Autocracia cai rapid t=2: π_A(Ω₂=ω_H(2-ω_H), v=1) > π̄_A^fall — composição (mais deslocados acumulados) empurra π acima do limiar baixo.

**(iv)** Autocracia sobrevive threshold t=2: π_A(Ω₂=ω_L+(1-ω_L)·ω_H, v=1) ≤ π̄_A^fall — menos deslocados + C_A alto → protesto contido.

**(v)** ω_L gera protesto pequeno → ambos sobrevivem t=1 sob threshold.

Nota: (iii) e (iv) usam o MESMO v=1 e o MESMO C_A. A diferença é APENAS Ω₂ (composição). Como ω_H(2-ω_H) > ω_L+(1-ω_L)·ω_H, existe faixa de π̄_A^fall que separa os dois → não knife-edge.

### Lemas e proposições planejados

**Lema 1 (Dictator's dilemma):** I(C_x) = |∂π*/∂ω| é decrescente em C_x. Protesto é sinal mais informativo de ω em democracia. Consequência: ω̄_A^comp > ω̄_D^comp.

**Lema 2 (Composição absorvente):** Com deslocamento absorvente, Ω₂(rapid) = ω_H(2-ω_H) > Ω₂(threshold) = ω_L+(1-ω_L)·ω_H. Dado mesmo v e mesmo C_x: π(rapid t=2) > π(threshold t=2). Simétrico entre regimes.

**Proposição (Zona de compensação):** ω̄_x^comp é crescente em C_x (Lema 1). Zona de compensação do incumbente depende da interação informação × velocidade. Autocracia: zona estreita (informação ruim) OU velocidade desperdiçada por cegueira.

**Proposição (Fragilidade cruzada):** Sob (i)-(v), democracia é estável sob rápido e instável sob threshold; autocracia exibe o padrão inverso.

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
| v_i | Valor expressivo: (1-y_{it}) + δ·E[(1-y_{i,t+1})] |
| Ω_t | Fração total de deslocados em t (absorvente: Ω₂ = ω₁ + (1-ω₁)·ω₂) |
| ω̄_x^comp | Threshold informacional de compensação (derivado) |
| C_x | Custo de repressão (C_A > C_D) |
| h(π) = π | Safety in numbers (linear, baseline) |
| B ∈ (0,1) | Benefit: compensação universal para deslocados |
| φ_t ∈ {0,1} | Compensação disponível no período t |
| δ ∈ (0,1] | Fator de desconto intertemporal |
| V | Valor de permanecer no poder (incumbente) |
| comp_t | Decisão do incumbente: compensar (1) ou não (0) |
| π̄_x^fall | Resiliência institucional a protesto (π̄_D^fall > π̄_A^fall) |
| I(C_x) | Informativeness do protesto: |∂π*/∂ω| |

**Removidos**: f_x (capacidade fiscal), ω̄_x^fall = f_x/B (threshold fiscal), γ (backward-looking, movido para appendix), V (normalizado a 1).

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
- [x] Autocracia cai sob rápido → composição (deslocamento absorvente). Simétrico. Sem degradação.
- [x] Democracia cai sob threshold → lag impede resposta em t=2
- [x] Promessa crível → lei aprovada em t=1, não anúncio
- [x] F(ε) → logística (closed-form)
- [x] γ eliminado do baseline → extensão (appendix). Composição + compensação suficientes.
- [x] V normalizado a 1. Threshold em termos de B.
- [x] Regra do incumbente → comp iff ΔP > ω̂·B. Derivada da otimização. ω̄_A^comp > ω̄_D^comp.
- [x] Inferência Bayes pura (sem viés behavioral). P(N)>0 + sinal suprimido faz o trabalho.
- [x] Persistência: φ uma vez ativado, permanece.

## Resumo para simulação (modelo completo, sem γ)

Parâmetros: ω_H, ω_L, σ, C_D, C_A, B, δ, π̄_D^fall, π̄_A^fall, p_R, p_T, p_N

**t=1:**
- Displaced: Ω₁ = ω₁
- v₁ = 1 + δ·(1 - B·E[φ₂|info]) [forward-looking]
- Solve s*₁ → π₁*(ω₁) = Ω₁ · F((ω₁-s*₁)/σ)
- Incumbent updates P(θ|π₁), decides comp₁

**t=2:**
- Displaced: Ω₂ = ω₁ + (1-ω₁)·ω₂ [absorvente]
- v₂ = 1 - B·φ₂ [φ₂ = comp₁ para democracia, comp₁ para autocracia]
- Solve s*₂ → π₂*(ω₂) = Ω₂ · F((ω₂-s*₂)/σ)
- Fall: π₂ > π̄_x^fall?

### Parâmetros baseline (simulação numérica)

```
omega_H = 0.40    # Deslocamento severo (40% por período de crise)
omega_L = 0.05    # Churn normal
sigma   = 0.15    # Ruído do sinal (SNR ≈ 2.3)
C_D     = 1.5     # Custo protesto democracia
C_A     = 2.0     # Custo protesto autocracia (ratio 1.33)
B       = 0.6     # Compensação (60% da renda)
delta   = 0.9     # Desconto (~5 anos/período)
pi_fall_D = 0.40  # Tolerância democracia (alta)
pi_fall_A = 0.05  # Tolerância autocracia (baixa, Chenoweth)
p_R     = 0.30    # Prior rapid
p_T     = 0.30    # Prior threshold
p_N     = 0.40    # Prior sem choque
tau_D   = 0.01    # Ruído observação incumbente (democracia ≈ 0)
tau_A   = 0.10    # Ruído observação incumbente (autocracia — dictator's dilemma)
```

**Quantidades derivadas:**
- Ω₂^rapid = 0.40×1.60 = 0.64
- Ω₂^threshold = 0.05 + 0.95×0.40 = 0.43
- h̄_A(t=2, v=1) = 0.50 ∈ (0.43, 0.64) ← condição-chave satisfeita
- h̄_D(t=2, comp) = 0.733 > 0.64 ← democracia estabilizada
- h̄_D(t=2, no comp) = 0.333 < 0.43 ← democracia vulnerável

**Verificação fragilidade cruzada (t=2):**
- Rapid + democracia (comp): h̄=0.733 > Ω₂=0.64 → sem protesto → ESTÁVEL ✓
- Rapid + autocracia (no comp): h̄=0.50 < Ω₂=0.64 → protesto > π̄_A=0.05 → CAI ✓
- Threshold + democracia (no comp): h̄=0.333 < Ω₂=0.43 → protesto > π̄_D=0.40 → CAI ✓
- Threshold + autocracia (no comp): h̄=0.50 > Ω₂=0.43 → sem protesto → ESTÁVEL ✓

**Nota**: Unicidade do equilíbrio a verificar numericamente (e provar analiticamente depois).

## Próximos passos (implementação)

- [ ] Escolher parâmetros numéricos e rodar simulação (exemplo Varian: antes do modelo geral)
- [ ] Escrever o modelo formal no paper.Rmd (reescrever Sections 3-4)
- [ ] Derivar cutoff do global game com h(π) = π, F logística — verificar se tem closed-form
- [ ] Derivar proposições (fragilidade cruzada, zona de compensação, estática comparativa)
- [ ] Verificação Lean (após formalização estável)
- [ ] Appendix: sinal mais preciso para deslocado de 2 períodos (relaxar premissa de σ igual)
- [ ] Appendix: inferência bayesiana do incumbente (Camada 3 detalhada)
- [ ] Appendix: extensão T > 2 períodos
- [ ] Extensão/Discussion: grupo exposto E ⊂ [0,1] com |E|=e<1. ω_H dentro de E → Ω₂ = e·ω_H(2-ω_H). Descola π̄_D^fall de ω_H. Baseline: leitura 1 (democracia robusta). Extensão: leitura 2 (bite empírico com e<1). Discutir implicações de policy sob cada pressuposto.

## Questões abertas

- Especificidade IA: mecanismo é genérico. Defender via framing (incerteza sobre tipo de automação).
- h(π) linear: pode precisar de forma côncava. Testar.
- Não-deslocado protesta? Via v_i = δ·E[ω₂]. Efeito de segunda ordem.
- π̄_x^fall: aceitar como primitiva institucional do regime.
- Unicidade do equilíbrio no global game com ω discreto: verificar numericamente.
- Prior conjugada? Se ω ~ Beta(a,b), d_i atualiza para Beta(a+d, b+1-d). Sinal contínuo s_i quebra conjugacy, mas pseudo-counts podem aproximar. Se funcionar, updating sequencial é analítico (sem root-finding) — posterior de t=1 vira prior de t=2, mesmo formato. Explorar na próxima sessão.
- **Bite empírico**: com só deslocados protestando, π ≤ Ω₂. Para democracia cair, π̄_D^fall < Ω₂, o que requer ω_H alto (possivelmente implausível: >50%). Duas leituras: (a) resultado — democracia é robusta, IA só ameaça sob hecatombe + surpresa; (b) limitação — sem bite empírico. Fix natural: reintroduzir grupo exposto E com |E| = e < 1, ω_H dentro de E. Ω₂ = e·ω_H(2-ω_H). Com e=0.3, ω_H=0.5: Ω₂=0.225. Mais plausível. Decisão pendente.

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
- **Escolha**: Único mecanismo: π > π̄_x^fall (protesto excede resiliência institucional). O que varia é o TAMANHO de π, determinado por composição (Ω₂) + compensação (v) + custo de protesto (C_x). Simétrico entre regimes.
- **Descartado**: Degradação repressiva — assimétrica sem justificativa.
- **Descartado**: Queda puramente fiscal — inconsistente no timing.
- **Descartado**: Defecção militar — adiciona jogador.

### Decisão: Por que autocracia cai sob rapid mas não threshold
- **Escolha**: Composição (deslocamento absorvente). Ω₂(rapid) = ω_H(2-ω_H) > Ω₂(threshold) = ω_L+(1-ω_L)·ω_H. Mesmo v, mesmo C_A → mais gente deslocada → mais protesto → excede π̄_A^fall sob rapid mas não threshold.
- **Descartado**: γ (backward-looking) — desnecessário no baseline; composição sozinha é suficiente. γ é extensão que fortalece.
- **Descartado**: Degradação repressiva — assimétrica sem justificativa.

### Decisão: Regra do incumbente
- **Escolha**: comp iff ΔP(π_t) > ω̂(π_t)·B. Bayes puro: incumbente atualiza P(θ|π_t). P(N)>0 + sinal suprimido (autocracia) → quase não atualiza → não compensa. Democracia: sinal informativo → atualiza → compensa. V normalizado a 1.
- **Descartado**: Regra mecânica (threshold exógeno) — não deriva o dictator's dilemma.
- **Descartado**: Viés behavioral — desnecessário, Bayes puro faz o trabalho.

### Decisão: γ (backward-looking)
- **Escolha**: Eliminado do modelo (baseline E appendix). Desnecessário.
- **Razão**: Composição (absorvente) + compensação (φ) suficientes. Um tipo, um cutoff, uma equação.

### Decisão: Sinal igual para deslocado de 1 ou 2 períodos
- **Escolha (baseline)**: Simplificação forte — sinal privado s_i = ω_t + σε_i é o mesmo independente da duração do deslocamento. Trabalhador de 2 períodos não tem sinal mais preciso que o de 1.
- **Extensão (appendix)**: Relaxar. Deslocado por 2 períodos acumula experiência → sinal mais preciso (σ menor) ou v com componente informacional backward-looking. Fortalece o resultado.

### Decisão: "Promessa crível" de democracia em rapid t=1
- **Escolha**: Democracia PASSA LEI em t=1 (compromisso legal). Lei entra em vigor em t=2 (lag institucional). Crível porque é lei, não anúncio. Trabalhadores antecipam φ_2=1 → v cai → π tolerável.
- **Descartado**: Mero anúncio — não crível em modelo de 2 períodos.
- **Nota**: Artificial em 2 períodos; em T>2 seria mais natural. Aceitar por agora.

### Decisão: F(ε) para o global game
- **Escolha**: Logística. Dá closed-form no global game (standard na literatura).
- **Alternativa**: Normal (mais comum em estatística, mas sem closed-form). Uniforme (simples, mas cauda leve).

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
- [x] Autocracia sob rapid → resolvido via composição + v backward-looking (sem degradação)
- [x] Promessa crível → lei aprovada em t=1 (compromisso legal)
- [x] F(ε) → logística
- [ ] π̄_x^fall — parâmetro ou derivado?
