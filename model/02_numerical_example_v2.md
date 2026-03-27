# Exemplo Numérico v2: Modelo com Efetividade Repressiva Variável (η)

**Mudança em relação a v1**: Adição de η(tipo de choque) — efetividade da capacidade repressiva depende da coordenação de E, que depende do tipo de trajetória.

---

## 1. Setup

### Agentes
- **E** (expostos): perdem renda com automação
- **N** (não-expostos): economicamente passivos no baseline

### Timing (dois períodos)

Em cada período t:
1. Perda ℓ_t realizada para E
2. Regime responde (compensação ou repressão)
3. E decide entre M (moderado) e R (radical)

### Trajetórias (exógenas, Gans & Goldfarb 2026)

| Trajetória | ℓ₁ | ℓ₂ |
|------------|-----|-----|
| Rápida     | L   | 0   |
| Threshold  | 0   | L   |

### Payoffs para E

**Democracia:**
- U_E(M) = w_E − ℓ_t(1 − φ_t)
- U_E(R) = θ(w_E + w_N) − k

**Autocracia:**
- U_E(M) = w_E − ℓ_t
- U_E(R) = θ(w_E + w_N) − k − κ₀·η_t

Onde:
- φ_t ∈ [0,1]: capacidade compensatória (democracia)
- κ₀ > 0: capacidade repressiva permanente (autocracia)
- η_t ∈ (0,1]: efetividade repressiva no período t
- θ ∈ (0,1): fração do output capturada por E sob R
- k > 0: custo de transição de regime

### Assimetria estrutural entre regimes

| | Democracia | Autocracia |
|--|--|--|
| Instrumento | φ (compensação) | κ₀·η (repressão) |
| Opera sobre | U_E(M) — torna status quo melhor | U_E(R) — torna revolta mais cara |
| Construção | Reativa (requer crise observada) | Permanente (aparato de segurança) |
| Variável | φ depende de ℓ_t observado | η depende do tipo de choque |

---

## 2. Mecanismo central: coordenação de E

**Inovação do modelo**: A efetividade da repressão depende da capacidade de coordenação dos trabalhadores expostos, que depende do tipo de choque:

**Choque rápido (ℓ₁ = L):**
- Crise visível, compartilhada, prolongada
- E tem experiência comum → facilita coordenação
- Agravo é legítimo aos olhos de N, forças de segurança, comunidade internacional
- → η_R < 1 (repressão degradada)

Mecanismos de degradação:
- Forças de segurança relutam em reprimir causa visivelmente justa
- Pressão internacional e midiática
- Deserção e defecção dentro do aparato repressivo
- E consegue organizar oposição (sindicatos, partidos, protestos)

**Choque threshold (ℓ₂ = L, após ℓ₁ = 0):**
- Crise súbita, sem antecedente, desorientadora
- E não tem experiência prévia de perda → coordenação difícil
- Pode ser enquadrada como "emergência" ou ameaça externa
- → η_T = 1 (repressão efetiva)

Mecanismos de efetividade:
- Desorientação impede formação de movimento coletivo
- Autocrata pode enquadrar narrativa (culpar inimigos externos, "sabotagem")
- Forças de segurança não veem oposição organizada → reprimem indivíduos dispersos
- Custos de coordenação para E são altos (sem experiência prévia, sem redes)

---

## 3. Regras de investimento

### Democracia: compensação reativa

- Se ℓ_t > 0: governo observa crise → mobiliza compensação φ_t = φ̄ ao custo c_D(φ̄) = φ̄²
- Se ℓ_t = 0: sem base política → φ_t = 0
- Capacidade persiste: φ construído em t=1 disponível em t=2

Justificativa: compensação financiada por taxação de N. N (maioria) só aceita taxação quando instabilidade é observável.

### Autocracia: repressão permanente

- κ₀ mantido como política permanente (exógeno)
- Efetividade: κ_efetivo = κ₀ · η(tipo de choque no período)
- Sem investimento adicional reativo no baseline

Justificativa: aparato de segurança existe independente de choques econômicos. Sua efetividade varia com condições sociais (coordenação de E).

---

## 4. Condições de estabilidade

### Variável auxiliar

Δ ≡ θ(w_E + w_N) − k − w_E

Condições para modelo interessante: Δ < 0 (estável sem automação) e |Δ| < L (automação pode desestabilizar).

### Democracia estável em t se:

w_E − ℓ_t(1 − φ_t) ≥ θW − k

Quando ℓ_t > 0:

**φ_t ≥ 1 + Δ/ℓ_t ≡ φ̄**

### Autocracia estável em t se:

w_E − ℓ_t ≥ θW − k − κ₀·η_t

Quando ℓ_t > 0:

**κ₀ ≥ (Δ + ℓ_t) / η_t ≡ κ̄ / η_t**

Equivalentemente: κ₀·η_t ≥ κ̄ onde κ̄ = Δ + L.

---

## 5. Parâmetros

| Parâmetro | Valor | Interpretação |
|-----------|-------|---------------|
| w_E | 1 | Salário base expostos |
| w_N | 1 | Salário base não-expostos |
| L | 1 | Magnitude do choque |
| θ | 0.5 | Fração capturada por E sob R |
| k | 0.4 | Custo de transição |
| κ₀ | 0.8 | Capacidade repressiva permanente |
| η_R | 0.5 | Efetividade sob choque rápido |
| η_T | 1.0 | Efetividade sob choque threshold |

### Derivados

| Variável | Valor | Cálculo |
|----------|-------|---------|
| Δ | −0.4 | 0.5·2 − 0.4 − 1 |
| φ̄ | 0.6 | 1 + (−0.4)/1 |
| κ̄ | 0.6 | −0.4 + 1 |
| κ̄/η_R | 1.2 | 0.6/0.5 |

---

## 6. Resultados: Matriz 2×2

### (A) Rápida + Democracia → ESTÁVEL ✓

t=1: ℓ₁ = L = 1. Crise visível → governo constrói φ = 0.6.

- U_E(M) = 1 − 1·(1−0.6) = **0.6**
- U_E(R) = 0.5·2 − 0.4 = **0.6**
- E indiferente → estável (com φ marginalmente > φ̄)

t=2: ℓ₂ = 0 → estável trivialmente.

**Lógica**: Crise observável → sinal político → compensação → E não se radicaliza.

---

### (B) Rápida + Autocracia → INSTÁVEL ✗

t=1: ℓ₁ = L = 1. E organizado (crise visível) → η = 0.5.

- κ_efetivo = 0.8 · 0.5 = **0.4**
- κ̄ = **0.6**
- 0.4 < 0.6 → repressão insuficiente

Payoffs:
- U_E(M) = 1 − 1 = **0**
- U_E(R) = 0.6 − 0.4 = **0.2**
- U_E(R) > U_E(M) → E escolhe R

**Lógica**: Crise visível + compartilhada → E se coordena → repressão degradada → autocrata não consegue conter oposição organizada.

---

### (C) Threshold + Democracia → INSTÁVEL ✗

t=1: ℓ₁ = 0. Sem crise → φ = 0.

t=2: ℓ₂ = L = 1. Precisa φ ≥ 0.6. Tem φ = 0.

- U_E(M) = 1 − 1 = **0**
- U_E(R) = 0.5·2 − 0.4 = **0.6**
- U_E(R) > U_E(M) → E escolhe R

**Lógica**: Sem sinal em t=1 → sem investimento em compensação → quando choque chega em t=2, é tarde demais → E se radicaliza.

---

### (D) Threshold + Autocracia → ESTÁVEL ✓

t=1: ℓ₁ = 0. Sem choque.

t=2: ℓ₂ = L = 1. E desorientado (choque súbito) → η = 1.

- κ_efetivo = 0.8 · 1.0 = **0.8**
- κ̄ = **0.6**
- 0.8 ≥ 0.6 → repressão suficiente

Payoffs:
- U_E(M) = 1 − 1 = **0**
- U_E(R) = 0.6 − 0.8 = **−0.2**
- U_E(M) > U_E(R) → E escolhe M

**Lógica**: Choque súbito + desorientador → E não se coordena → repressão efetiva → autocrata contém descontentamento disperso.

---

### Tabela resumo

|  | Rápida (ℓ₁=L, ℓ₂=0) | Threshold (ℓ₁=0, ℓ₂=L) |
|--|:---:|:---:|
| **Democracia** | **ESTÁVEL** (compensação reativa) | **INSTÁVEL** (sem sinal → sem compensação) |
| **Autocracia** (κ₀=0.8) | **INSTÁVEL** (repressão degradada: κ_ef=0.4 < 0.6) | **ESTÁVEL** (repressão efetiva: κ_ef=0.8 ≥ 0.6) |

**RESULTADO CRUZADO CONFIRMADO.**

---

## 7. Condições gerais para o resultado cruzado

### Democracia

- Rápida: ESTÁVEL sse φ̄ ≤ 1. Condição: |Δ| > 0 (Δ < 0), sempre satisfeita.
- Threshold: INSTÁVEL sse φ(0) = 0. Satisfeito pela premissa de investimento reativo.

→ Democracia SEMPRE exibe o padrão (estável/rápida, instável/threshold) sob as premissas do modelo.

### Autocracia

- Rápida: INSTÁVEL sse κ₀·η_R < κ̄, i.e., κ₀ < κ̄/η_R
- Threshold: ESTÁVEL sse κ₀·η_T ≥ κ̄, i.e., κ₀ ≥ κ̄ (com η_T = 1)

→ Resultado cruzado para autocracia quando:

### **κ̄ ≤ κ₀ < κ̄/η_R**

### Três regimes de κ₀

| Intervalo | Rápida | Threshold | Tipo |
|-----------|--------|-----------|------|
| κ₀ < κ̄ | Instável | Instável | Autocracia fraca |
| **κ̄ ≤ κ₀ < κ̄/η_R** | **Instável** | **Estável** | **Autocracia moderada (cruzado)** |
| κ₀ ≥ κ̄/η_R | Estável | Estável | Autocracia forte |

Com os números: κ̄ = 0.6, κ̄/η_R = 1.2.

- κ₀ < 0.6: autocracia fraca (falha em ambos)
- 0.6 ≤ κ₀ < 1.2: **resultado cruzado**
- κ₀ ≥ 1.2: autocracia forte (sobrevive a ambos)

O intervalo cruzado tem largura κ̄·(1/η_R − 1) = 0.6·(2−1) = 0.6. Quanto menor η_R (mais a coordenação degrada repressão), mais largo o intervalo cruzado.

---

## 8. Estática comparativa

### Em η_R (efetividade sob choque rápido)

- η_R → 0: repressão completamente ineficaz sob rápida. κ̄/η_R → ∞. Mesmo autocracias extremamente fortes caem sob rápida. Intervalo cruzado [κ̄, ∞).
- η_R → 1: repressão igualmente eficaz sob ambos os choques. κ̄/η_R → κ̄. Intervalo cruzado colapsa a zero. Sem diferenciação por trajetória para autocracias.
- **Interpretação**: η_R captura quão vulneráveis são autocracias a oposição organizada. Autocracias com forças de segurança profissionalizadas/leais têm η_R mais alto; autocracias dependentes de recrutamento amplo têm η_R mais baixo.

### Em L (magnitude do choque)

- φ̄ = 1 − |Δ|/L: crescente em L, converge a 1 para L grande.
- κ̄ = L − |Δ|: linear crescente em L.
- Para L fixo e κ₀ fixo: conforme L sobe, κ̄ sobe e eventualmente κ₀ < κ̄ → autocracia entra no regime "fraca."

**L* (threshold do threshold):**
- Autocracia sai do intervalo cruzado (torna-se fraca) quando κ₀ < κ̄, i.e., L > κ₀ + |Δ|.
- Com κ₀ = 0.8, |Δ| = 0.4: L* = 1.2. Para L > 1.2, autocracia moderada vira fraca.

### Em Δ (atratividade de R sem automação)

- Δ = θW − k − w_E. Mais negativo → R menos atraente → ambos os regimes mais estáveis.
- θ↑ ou k↓ ou w_E↓ → Δ↑ → mais instável.
- **Desigualdade**: Se w_E cai (expostos mais pobres), Δ sobe → instabilidade aumenta.

### Em κ₀ (capacidade repressiva permanente)

- κ₀ ↑ → autocracia mais estável (move do regime fraco → cruzado → forte).
- Custo de manutenção implícito (não modelado no baseline): autocracias pagam custo permanente para manter κ₀. Esse custo "desperdiçado" em tempos de paz é o preço do seguro contra choques threshold.

---

## 9. Bem-estar

### Payoffs de E sob estabilidade

| Cenário | u_E(M) Democracia | u_E(M) Autocracia |
|---------|:-:|:-:|
| Sem choque (ℓ=0) | 1 | 1 |
| Com choque, regime estável | w_E − L(1−φ̄) = **0.6** | w_E − L = **0** |
| Com choque, regime instável | COLAPSO | COLAPSO |

### Análise

**Estabilidade autocrática = estabilidade sem bem-estar.** Sob threshold + autocracia estável: E absorve 100% da perda (u_E = 0). Não revolta porque revoltar é pior (u_E(R) = −0.2). O regime sobrevive mas os cidadãos sofrem integralmente.

**Estabilidade democrática = estabilidade com bem-estar.** Sob rápida + democracia estável: E é compensado (u_E = 0.6). A compensação é o mecanismo de estabilidade E o mecanismo de bem-estar — são o mesmo.

### Tragédia da responsividade democrática

A mesma propriedade que torna democracias boas (responsividade a demandas) as torna frágeis a choques delayed. Se a democracia PUDESSE investir preventivamente, produziria resultado superior (compensação) — mas o mecanismo político estruturalmente não permite.

### Tragédia da repressão autocrática

A mesma propriedade que torna autocracias resilientes a choques delayed (repressão permanente) as torna vulneráveis a choques visíveis (repressão degrada contra oposição organizada). E a estabilidade quando alcançada não beneficia os cidadãos.

---

## 10. Proposições (informais, a serem formalizadas)

### P1. Fragilidade cruzada

Para κ₀ ∈ [κ̄, κ̄/η_R):
- (a) Sob deslocamento rápido, democracia é estável e autocracia é instável.
- (b) Sob automação threshold, democracia é instável e autocracia é estável.

### P2. Canal de coordenação

A assimetria emerge porque choques rápidos facilitam coordenação coletiva de E (degradando repressão, η_R < 1), enquanto choques threshold a impedem (mantendo repressão efetiva, η_T = 1). A coordenação de E é a variável mediadora entre tipo de choque e tipo de regime.

### P3. Vantagem comparativa institucional

Cada regime tem vantagem comparativa para um tipo de choque:
- Democracia: vantagem sob choques observáveis (canaliza coordenação em compensação)
- Autocracia: vantagem sob choques delayed (repressão efetiva contra desorientação)

### P4. Custo de bem-estar da estabilidade autocrática

Condicional à sobrevivência do regime: u_E(M|D, estável) > u_E(M|A, estável) para todos os parâmetros onde ambos poderiam sobreviver. Democracias produzem mais bem-estar que autocracias quando estáveis.

### P5. Threshold do threshold

Existe L* = κ₀ + |Δ| tal que para L > L*, a autocracia moderada perde estabilidade sob threshold (entra no regime "fraca"). Choques muito grandes excedem até a capacidade repressiva permanente.

### P6. Largura do intervalo cruzado

O intervalo de κ₀ que gera resultado cruzado tem largura κ̄·(1/η_R − 1). Quanto mais a coordenação degrada repressão (η_R menor), mais amplo o conjunto de autocracias que exibem o padrão cruzado.

---

## 11. Extensões identificadas

### E1. Investimento de emergência em t=2 (γ < 1)

Permitir investimento em t=2 com efetividade reduzida γ. Democracia poderia construir compensação de emergência: φ_ef = γ·φ. Resultado: democracia sobrevive threshold se γ·φ ≥ φ̄. Modera R2 (democracia nem sempre falha sob threshold) mas preserva a assimetria (autocracia não precisa de γ — tem κ₀).

### E2. N ativo

N vota sobre φ e prefere φ baixo (paga custo sem benefício). Reforça resultado C (democracia falha sob threshold): N ativamente bloqueia investimento.

### E3. Endogeneizar κ₀

Autocrata escolhe κ₀ ex ante ao custo c_0(κ₀). Trade-off: κ₀ alto → seguro contra choques delayed mas caro de manter. Permite comparar eficiência social dos regimes.

### E4. Incerteza sobre trajetória

Regime não sabe se enfrentará rápida ou threshold. Democracia investe φ proporcional à probabilidade esperada de choque. Resultado: com incerteza, democracia investe parcialmente → pode sobreviver threshold com sorte.

### E5. Autocrata com compensação parcial

Autocrata oferece transferências ψ < φ além de repressão: U_E(M|A) = w_E − ℓ + ψ·ℓ. Melhora bem-estar sob autocracia estável mas não muda qualitativamente o resultado cruzado (repressão continua sendo o instrumento marginal).

---

## 12. Próximo passo

Formalizar o modelo geral: substituir parâmetros numéricos por gerais, derivar proposições P1–P6 com provas, e verificar robustez das condições para o resultado cruzado.
