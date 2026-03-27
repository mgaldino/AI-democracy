# Exemplo Numérico: Modelo de Dois Períodos

## 1. Setup

### Agentes
- **E** (expostos à automação): massa μ_E
- **N** (não-expostos): massa μ_N > μ_E. N é economicamente passivo (não perde renda com automação) mas participa de decisões políticas.

### Timing (dois períodos, t ∈ {1, 2})

Em cada período t:
1. Perda ℓ_t é realizada para grupo E
2. Regime investe em capacidade (se aplicável)
3. E decide entre M (moderado/status quo) e R (radical/colapso institucional)

### Trajetórias de automação (exógenas, de Gans & Goldfarb 2026)

| Trajetória | ℓ₁ | ℓ₂ | Interpretação |
|------------|-----|-----|---------------|
| Rápida | L | 0 | Deslocamento imediato, absorvido depois |
| Threshold | 0 | L | Complementaridade inicial, substituição súbita |

### Payoffs para E

**Sob M (moderado):**
- Democracia: u_E(M) = w_E − ℓ_t(1 − φ_t), onde φ_t ∈ [0,1] é capacidade compensatória
- Autocracia: u_E(M) = w_E − ℓ_t (sem compensação)

**Sob R (radical — colapso institucional):**
- Democracia: u_E(R) = θ(w_E + w_N) − k
- Autocracia: u_E(R) = θ(w_E + w_N) − k − κ_t, onde κ_t é capacidade repressiva

**Interpretação dos parâmetros:**
- φ reduz o sofrimento de E (compensação direta) → opera no lado de M
- κ aumenta o custo de revolta para E (repressão) → opera no lado de R
- θ ∈ (0,1): fração do output total que E captura sob regime radical
- k > 0: custo de transição (violência, incerteza, destruição de capital)

**Assimetria estrutural:** Democracia torna M mais atraente (compensa). Autocracia torna R mais custoso (reprime). Ambos estabilizam, mas por canais opostos.

---

## 2. Condições de Estabilidade

### Definição auxiliar

Δ ≡ θ(w_E + w_N) − k − w_E

Δ é o "ganho líquido de revolta na ausência de automação e compensação/repressão." Para o modelo ser interessante:
- Δ < 0 (regime estável sem automação)
- |Δ| < L (automação pode desestabilizar)

### Democracia estável em t se:

w_E − ℓ_t(1 − φ_t) ≥ θ(w_E + w_N) − k

⟹ φ_t ≥ 1 + Δ/ℓ_t ≡ φ̄(ℓ_t) (quando ℓ_t > 0)

Quando ℓ_t = 0: estável sempre (Δ < 0).

### Autocracia estável em t se:

w_E − ℓ_t ≥ θ(w_E + w_N) − k − κ_t

⟹ κ_t ≥ Δ + ℓ_t ≡ κ̄(ℓ_t) (quando ℓ_t > 0)

Quando ℓ_t = 0: estável se κ_t ≥ Δ (satisfeito quando Δ < 0 e κ_t ≥ 0).

---

## 3. Regras de Investimento

### Premissa central: a diferença entre regimes é QUANDO e COMO investem em capacidade.

### Democracia: investimento reativo

**Regra:** φ_t é construído em resposta a perdas OBSERVADAS. Se ℓ_t = 0, não há base política para investir → φ_t = 0.

**Justificativa estrutural:** Compensação é financiada por taxação, que requer aprovação majoritária. N (maioria) só aprova taxação quando a instabilidade é observável — i.e., quando E está perdendo renda e ameaça R. Se ℓ_t = 0, E não ameaça R, N não vê razão para pagar → φ_t = 0.

**Formalmente:**
- Se ℓ_t > 0: governo escolhe φ_t = φ̄(ℓ_t) ao custo c_D(φ) = φ²
- Se ℓ_t = 0: φ_t = 0

**Propriedade de robustez:** O resultado qualitativo se mantém para QUALQUER regra de investimento monotônica φ(ℓ) tal que φ(0) = 0. A versão binária é a mais stark (Dixit).

### Autocracia: capacidade repressiva permanente + investimento adicional

**Regra:** Autocrata mantém capacidade repressiva permanente κ₀ > 0 por razões de segurança geral do regime (independente de automação). Quando observa ℓ_t > 0, pode investir capacidade adicional Δκ.

**Justificativa estrutural:** Autocracias mantêm aparato de segurança (forças armadas, polícia secreta, sistemas de vigilância) como política permanente. Essa capacidade existe independentemente de choques econômicos e não requer mandato popular.

**Formalmente:**
- Capacidade total: κ_t = κ₀ + Δκ_t
- Se ℓ_t > 0: Δκ_t escolhido para atingir κ̄ se necessário, ao custo c_A(Δκ) = Δκ²/α, onde α captura eficiência repressiva
- Se ℓ_t = 0: Δκ_t = 0 (mantém apenas κ₀)
- κ₀ é exógeno (parâmetro estrutural do regime autocrático)

### Persistência de capacidade

Capacidade construída em t=1 persiste em t=2. Capacidade NÃO pode ser construída do zero em t=2 (simplificação stark). Isto captura: programas sociais levam tempo para implementar; aparatos repressivos levam tempo para montar; resposta de emergência é sistematicamente inferior a capacidade institucionalizada.

---

## 4. Parâmetros Numéricos

| Parâmetro | Valor | Interpretação |
|-----------|-------|---------------|
| w_E | 1 | Salário base dos expostos |
| w_N | 1 | Salário base dos não-expostos |
| L | 1 | Magnitude do choque de automação |
| θ | 0.5 | Fração do output capturada por E sob R |
| k | 0.4 | Custo de transição de regime |

### Derivados

- Δ = θ(w_E + w_N) − k − w_E = 0.5·2 − 0.4 − 1 = **−0.4**
- Δ < 0 ✓ (regime estável sem automação)
- |Δ| = 0.4 < L = 1 ✓ (automação pode desestabilizar)
- φ̄ = 1 + (−0.4)/1 = **0.6** (democracia precisa compensar 60% das perdas)
- κ̄ = −0.4 + 1 = **0.6** (autocracia precisa de 0.6 de capacidade repressiva)

---

## 5. Resultados: Matriz 2×2

### (A) Rápida + Democracia

- t=1: ℓ₁ = 1. Governo observa crise → constrói φ = 0.6. Custo = 0.36.
  - u_E(M) = 1 − 1·(1−0.6) = 0.6
  - u_E(R) = 0.5·2 − 0.4 = 0.6
  - E indiferente → estabilidade marginal (com φ marginalmente acima de 0.6, estável).
- t=2: ℓ₂ = 0. Estável trivialmente.
- **→ ESTÁVEL**

### (B) Rápida + Autocracia

- t=1: ℓ₁ = 1. Autocrata tem κ₀ + pode investir Δκ.
  - Se κ₀ ≥ 0.6: Δκ = 0. Estável sem custo adicional.
  - Se κ₀ < 0.6: Δκ = 0.6 − κ₀. Custo = (0.6 − κ₀)²/α.
    - u_E(M) = 1 − 1 = 0
    - u_E(R) = 0.6 − κ₀ − Δκ = 0.6 − 0.6 = 0
    - E indiferente → estável marginal.
- t=2: ℓ₂ = 0. Estável.
- **→ ESTÁVEL** (para qualquer κ₀, desde que Δκ seja factível)

### (C) Threshold + Democracia ⚠️

- t=1: ℓ₁ = 0. Sem crise → sem investimento. φ = 0.
- t=2: ℓ₂ = 1. Precisa φ ≥ 0.6. Tem φ = 0.
  - u_E(M) = 1 − 1·(1−0) = 0
  - u_E(R) = 0.6
  - u_E(R) > u_E(M) → E escolhe R.
- **→ INSTÁVEL**

### (D) Threshold + Autocracia

- t=1: ℓ₁ = 0. Sem investimento adicional. Mantém κ₀.
- t=2: ℓ₂ = 1. Precisa κ ≥ 0.6. Tem κ = κ₀.
  - u_E(M) = 1 − 1 = 0
  - u_E(R) = 0.6 − κ₀
  - Estável se 0 ≥ 0.6 − κ₀, i.e., κ₀ ≥ 0.6.

Três sub-cenários:
- **κ₀ = 0.9 (autocracia forte, e.g., China):** κ₀ > 0.6 → **ESTÁVEL**
- **κ₀ = 0.6 (autocracia moderada):** κ₀ = κ̄ → **ESTÁVEL (marginal)**
- **κ₀ = 0.3 (autocracia fraca):** κ₀ < 0.6 → **INSTÁVEL**

### Tabela resumo

|  | Rápida (ℓ₁=L, ℓ₂=0) | Threshold (ℓ₁=0, ℓ₂=L) |
|--|:---:|:---:|
| **Democracia** | ESTÁVEL | **INSTÁVEL** |
| **Autocracia forte** (κ₀ ≥ κ̄) | ESTÁVEL | ESTÁVEL |
| **Autocracia fraca** (κ₀ < κ̄) | ESTÁVEL | **INSTÁVEL** |

---

## 6. Resultados (proposições informais)

### R1. Sob deslocamento rápido, TODOS os regimes sobrevivem.

Choques observáveis geram resposta imediata em ambos os regimes: democracias compensam, autocracias reprimem (+ κ₀).

### R2. Sob automação threshold, democracias SEMPRE falham.

A democracia não pode investir em capacidade compensatória sem crise observada (φ(0) = 0). Quando o choque chega em t=2, é tarde demais.

### R3. Sob automação threshold, a autocracia sobrevive SE E SOMENTE SE κ₀ ≥ κ̄(L).

A sobrevivência autocrática depende da capacidade repressiva PERMANENTE exceder o limiar gerado pelo choque de automação.

### R4 (Corolário). Existe L* = κ₀ − Δ tal que:
- Para L ≤ L*: apenas democracia falha sob threshold
- Para L > L*: ambos os regimes falham sob threshold

Com os parâmetros numéricos e κ₀ = 0.9:
L* = 0.9 − (−0.4) = 1.3

Para choques de automação L ≤ 1.3, a autocracia forte sobrevive enquanto a democracia colapsa. Para L > 1.3, ambos colapsam.

### R5. Sob deslocamento rápido, tipo de regime é irrelevante para estabilidade.

Ambos os regimes podem responder a choques observáveis. A distinção entre regimes só importa sob choques delayed.

---

## 7. Estática Comparativa

### Em L (magnitude do choque)
- φ̄(L) = 1 + Δ/L. Crescente em L quando Δ < 0 (mais compensação necessária para choques maiores).
  - Mais precisamente: φ̄ = 1 − |Δ|/L. Para L → ∞, φ̄ → 1. Para L → |Δ|, φ̄ → 0.
- κ̄(L) = Δ + L = L − |Δ|. Linear crescente em L.
- L* = κ₀ + |Δ|. O threshold do threshold — acima dele, mesmo autocracias fortes caem.

### Em κ₀ (capacidade repressiva permanente)
- ∂(estabilidade autocrática)/∂κ₀ > 0: autocracias mais repressivas são mais resilientes.
- L* é linear crescente em κ₀: autocracias mais fortes sobrevivem choques maiores.

### Em Δ (atratividade de R sem automação)
- Δ mais negativo (revolta mais custosa) → φ̄ e κ̄ menores → ambos os regimes mais estáveis.
- Determinantes de Δ: θ (quanto E captura sob R), k (custo de transição), w_E (renda base).
  - Desigualdade (w_N >> w_E): aumenta θ relativo, torna R mais atraente → Δ sobe → mais instável.
  - Custo de revolução alto (k grande): Δ cai → mais estável.

### Em θ (captura redistributiva sob R)
- θ alto → Δ alto → φ̄ e κ̄ altos → mais instável.
- Interpretação: quando o regime radical promete mais a E (populismo, redistribuição forçada), a estabilidade requer mais compensação ou mais repressão.

---

## 8. Bem-estar

Mesmo quando a autocracia SOBREVIVE sob threshold, o bem-estar de E é pior que sob democracia (quando esta sobrevive):

| Cenário | u_E na democracia | u_E na autocracia |
|---------|:-:|:-:|
| Rápida, t=1 (ℓ=L) | w_E − L(1−φ̄) = 1 − 0.4 = **0.6** | w_E − L = **0** |
| Threshold, t=2 (ℓ=L) | COLAPSO (φ=0) | **0** (sobrevive mas E perde tudo) |
| Sem choque (ℓ=0) | w_E = **1** | w_E = **1** |

**Insight:** A estabilidade autocrática sob threshold é "estabilidade sem bem-estar" — o regime sobrevive mas os cidadãos sofrem integralmente o choque. A repressão previne a revolta mas não alivia o sofrimento.

**Tragédia da responsividade democrática:** A mesma propriedade que torna democracias boas (responsividade a demandas) as torna frágeis (não agem sem demanda). Se a democracia PUDESSE investir preventivamente, produziria resultado superior (compensação) — mas estruturalmente não pode.

---

## 9. Discussão

### Premissas e limitações

| Premissa | Papel no modelo | Relaxável? |
|----------|----------------|-----------|
| Sem investimento em t=2 | Torna threshold fatal para democracias | Sim — permitir investimento de emergência com custo premium (γ) |
| N passivo | Simplifica investimento democrático | Sim — N ativo bloqueia φ alto (fortalece resultado) |
| κ₀ exógeno | Autocracias diferem em repressividade | Sim — endogeneizar κ₀ como escolha do autocrata antes do jogo |
| Trajetórias conhecidas ex ante | Agentes sabem se é rápida ou threshold | Não — se incerto, democracia investiria parcialmente |
| Dois períodos | Captura timing mas não dinâmica longa | Sim — extensão com T períodos |

### Extensão prioritária: investimento de emergência em t=2

Permitir que ambos os regimes invistam em t=2 com efetividade γ ∈ (0,1):

- Democracia: efetiva capacity = γ · φ. Precisa γ · φ ≥ φ̄ → φ ≥ φ̄/γ. Custo: (φ̄/γ)².
- Autocracia: κ₀ + γ · Δκ ≥ κ̄. Se κ₀ < κ̄: Δκ ≥ (κ̄ − κ₀)/γ.

Resultado modificado: democracia sobrevive threshold SE γ é alto o suficiente E o custo (φ̄/γ)² é factível. Autocracias continuam com vantagem do κ₀ (não precisa de γ).

A conclusão qualitativa se mantém: autocracias com κ₀ ≥ κ̄ não precisam de resposta de emergência; democracias sempre dependem dela.

### Extensão prioritária: N ativo

Se N vota e N > E (maioria), N bloqueia investimento em φ quando o custo líquido para N excede o benefício de estabilidade.

N aceita taxação τ para financiar φ quando: custo de instabilidade para N > τ.

Sob threshold em t=1: E não ameaça R → custo de instabilidade = 0 para N → N bloqueia qualquer τ > 0 → φ = 0.

Resultado: N ativo REFORÇA o resultado R2 (democracia falha sob threshold). A falha não é só "sem pressão" — é ativamente bloqueada pela maioria.

---

## 10. Próximos passos formais

1. **Generalizar o modelo**: Substituir parâmetros numéricos por gerais. Derivar proposições com provas.
2. **Verificar a assimetria é robusta**: Testar com investimento de emergência (γ), N ativo, e incerteza sobre trajetória.
3. **Endogeneizar κ₀**: O autocrata escolhe κ₀ ex ante dado um custo de manutenção. Isso permite comparar a eficiência social dos regimes (democracia paga menos em repressão permanente mas é mais frágil).
4. **Conectar com a literatura**: Formalizar a relação com Fernandez & Rodrik (1991), Alesina & Drazen (1991), Acemoglu & Robinson (2006).
