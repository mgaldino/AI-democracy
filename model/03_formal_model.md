# Modelo Formal: AI Automation, Regime Type, and Crossed Fragility

---

## 1. Ambiente

### Agentes e períodos

- Dois períodos: t ∈ {1, 2}
- Grupo E (expostos à automação): afetados pelo choque. Demais agentes da economia são implícitos no parâmetro W.
- Tipo de regime: i ∈ {D, A} (democracia, autocracia).

### Trajetórias de automação

Perdas exógenas para E (premissa OEP importada de Gans & Goldfarb 2026):

| Trajetória j | ℓ₁ | ℓ₂ |
|-------------|-----|-----|
| Rápida (r) | L | 0 |
| Threshold (τ) | 0 | L |

onde L > 0 é a magnitude do choque.

### Preferências de E

Em cada período t, cada membro de E escolhe entre M (moderado/status quo) e R (radical/ruptura institucional).

**Democracia:**

$$u_E(M \mid D, t) = w_E - \ell_t(1 - \varphi_t)$$

$$u_E(R \mid D, t) = \theta W - k$$

**Autocracia:**

$$u_E(M \mid A, t) = w_E - \ell_t$$

$$u_E(R \mid A, t) = \theta W - k - \kappa_0 \cdot \eta_t$$

onde:
- $w_E > 0$: renda base de E
- $W > w_E$: output total per capita da economia
- $\varphi_t \in [0,1]$: capacidade compensatória (democracia)
- $\kappa_0 > 0$: capacidade repressiva permanente (autocracia)
- $\eta_t \in (0,1]$: efetividade repressiva no período t
- $\theta \in (0,1)$: fração do output capturada por E sob R
- $k > 0$: custo de transição de regime

### Variável auxiliar

$$\Delta \equiv \theta W - k - w_E$$

$\Delta$ é o ganho líquido de revolta na ausência de automação e compensação/repressão.

---

## 2. Premissas

**A1 (Estabilidade sem automação).**
$\Delta < 0$.

Sem choque de automação, E prefere M sob ambos os regimes. O regime é inerentemente estável.

**A2 (Automação pode desestabilizar).**
$\Delta + L > 0$, equivalentemente $L > |\Delta|$.

O choque de automação é grande o suficiente para potencialmente desestabilizar o regime.

**A3 (Compensação democrática é reativa).**
$$\varphi_t = \begin{cases} \bar{\varphi} & \text{se } \ell_t > 0 \\ 0 & \text{se } \ell_t = 0 \end{cases}$$

onde $\bar{\varphi} \equiv 1 + \Delta/L = 1 - |\Delta|/L$.

A democracia constrói capacidade compensatória em resposta a perdas observadas. Sem crise observada, sem investimento. Justificativa: compensação democrática requer legitimidade política — autorização legislativa, mobilização fiscal — que só emerge sob crise observável. Padrão histórico: programas sociais surgem após crises (New Deal, welfare state pós-WWII), não antes. Para microfundação formal via modelo de votação, ver Apêndice (model/04a).

**Observação.** Sob A1 e A2: $\bar{\varphi} = 1 - |\Delta|/L \in (0,1)$. A compensação necessária é factível.

**A4 (Efetividade repressiva depende do tipo de choque).**

Para a autocracia, a efetividade da repressão no período onde $\ell_t = L$ depende da trajetória:

$$\eta(r) = \eta_R \in (0,1) \quad \text{(rápida: repressão degradada)}$$

$$\eta(\tau) = \eta_T = 1 \quad \text{(threshold: repressão efetiva)}$$

Justificativa: Choques rápidos são visíveis e compartilhados → near-common knowledge do agravo → E se coordena → oposição organizada degrada efetividade repressiva (deserção, pressão internacional, legitimidade do agravo). Choques threshold são súbitos e desorientadores → incerteza estratégica → E não se coordena → repressão efetiva contra dissidência dispersa. Para microfundação formal via global games (Morris & Shin), ver Apêndice (model/04b).

**A5 (Capacidade é estoque de t=1).**
Capacidade construída em t=1 persiste em t=2. Não há construção de nova capacidade em t=2.

---

## 3. Condições de estabilidade

**Definição.** O regime $i$ é *estável sob trajetória $j$* se $u_E(M \mid i, t) \geq u_E(R \mid i, t)$ para todo $t \in \{1,2\}$.

### 3.1 Democracia

**Quando $\ell_t = 0$:**

$u_E(M) = w_E > w_E + \Delta = u_E(R)$ (por A1). Estável. $\square$

**Quando $\ell_t = L$ e $\varphi_t = \bar{\varphi}$:**

$u_E(M) = w_E - L(1 - \bar{\varphi}) = w_E - L + L\bar{\varphi} = w_E + \Delta = u_E(R)$. Estável (com igualdade). $\square$

**Quando $\ell_t = L$ e $\varphi_t = 0$:**

$u_E(M) = w_E - L$. $u_E(R) = w_E + \Delta$. Estável sse $w_E - L \geq w_E + \Delta$, i.e., $\Delta + L \leq 0$. Contradiz A2. **Instável.** $\square$

### Limiar compensatório

$$\bar{\varphi} = 1 - \frac{|\Delta|}{L}$$

### 3.2 Autocracia

**Quando $\ell_t = 0$:** Estável (mesma lógica, reforçada por $\kappa_0 \cdot \eta > 0$). $\square$

**Quando $\ell_t = L$:**

$u_E(M) = w_E - L$. $u_E(R) = w_E + \Delta - \kappa_0 \cdot \eta_t$.

Estável sse:

$$\kappa_0 \cdot \eta_t \geq \Delta + L \equiv \bar{\kappa}$$

### Limiar repressivo

$$\bar{\kappa} = \Delta + L = L - |\Delta|$$

**Observação.** Sob A2: $\bar{\kappa} > 0$. Repressão positiva é necessária.

### Limiares sobre κ₀

Sob trajetória rápida ($\eta = \eta_R$): estável sse $\kappa_0 \geq \bar{\kappa}/\eta_R$

Sob trajetória threshold ($\eta = 1$): estável sse $\kappa_0 \geq \bar{\kappa}$

Como $\eta_R < 1$: $\bar{\kappa}/\eta_R > \bar{\kappa}$. A autocracia precisa de MAIS capacidade para sobreviver à rápida que à threshold.

---

## 4. Proposições

### Proposição 1 (Padrão democrático)

*Sob A1–A3 e A5:*
*(a) A democracia é estável sob a trajetória rápida.*
*(b) A democracia é instável sob a trajetória threshold.*

**Prova.**

(a) Rápida. t=1: $\ell_1 = L > 0 \Rightarrow \varphi_1 = \bar{\varphi}$ (por A3). Pelo §3.1, estável. t=2: $\ell_2 = 0 \Rightarrow$ estável por A1. $\blacksquare$

(b) Threshold. t=1: $\ell_1 = 0 \Rightarrow \varphi_1 = 0$ (por A3). t=2: $\ell_2 = L$ e $\varphi_2 = 0$ (por A5, sem capacidade construída). Pelo §3.1 (caso $\varphi = 0, \ell = L$): instável. $\blacksquare$

---

### Proposição 2 (Padrão autocrático)

*Sob A1, A2, A4:*
*(a) A autocracia é estável sob a trajetória rápida sse $\kappa_0 \geq \bar{\kappa}/\eta_R$.*
*(b) A autocracia é estável sob a trajetória threshold sse $\kappa_0 \geq \bar{\kappa}$.*

**Prova.**

(a) Rápida. t=1: $\ell_1 = L$, $\eta = \eta_R$. Pelo §3.2: estável sse $\kappa_0 \cdot \eta_R \geq \bar{\kappa}$. t=2: $\ell_2 = 0 \Rightarrow$ estável. Combinando: estável sse $\kappa_0 \geq \bar{\kappa}/\eta_R$. $\blacksquare$

(b) Threshold. t=1: $\ell_1 = 0 \Rightarrow$ estável. t=2: $\ell_2 = L$, $\eta = 1$. Pelo §3.2: estável sse $\kappa_0 \geq \bar{\kappa}$. $\blacksquare$

---

### Proposição 3 (Fragilidade cruzada)

*Sob A1–A5, se $\kappa_0 \in [\bar{\kappa},\; \bar{\kappa}/\eta_R)$:*

*(a) Sob deslocamento rápido: democracia é estável e autocracia é instável.*
*(b) Sob automação threshold: democracia é instável e autocracia é estável.*

**Prova.**

O intervalo é não-vazio: $\eta_R < 1 \Rightarrow \bar{\kappa}/\eta_R > \bar{\kappa}$.

(a) Democracia estável por P1(a). Autocracia: $\kappa_0 < \bar{\kappa}/\eta_R \Rightarrow$ instável por P2(a). $\blacksquare$

(b) Democracia instável por P1(b). Autocracia: $\kappa_0 \geq \bar{\kappa} \Rightarrow$ estável por P2(b). $\blacksquare$

---

### Proposição 4 (Custo de bem-estar da estabilidade autocrática)

*Condicional à sobrevivência do regime, o bem-estar de E é estritamente maior sob democracia que sob autocracia:*

$$u_E(M \mid D, \text{estável}) - u_E(M \mid A, \text{estável}) = \bar{\kappa} > 0$$

**Prova.**

Democracia estável (rápida, t=1): $u_E(M \mid D) = w_E - L(1 - \bar{\varphi}) = w_E + \Delta$.

Autocracia estável (threshold, t=2): $u_E(M \mid A) = w_E - L$.

Diferença: $(w_E + \Delta) - (w_E - L) = \Delta + L = \bar{\kappa} > 0$ (por A2). $\blacksquare$

**Interpretação:** A estabilidade autocrática é "estabilidade sem bem-estar." O gap de bem-estar é exatamente $\bar{\kappa}$ — o limiar repressivo. Quanto maior o choque necessário para desestabilizar, maior a diferença de bem-estar entre os regimes quando estáveis.

---

### Proposição 5 (Threshold do threshold)

*Defina $L^* \equiv \kappa_0 + |\Delta|$. Para $L > L^*$, a autocracia é instável sob a trajetória threshold.*

**Prova.**

Autocracia estável sob threshold sse $\kappa_0 \geq \bar{\kappa} = \Delta + L = L - |\Delta|$.

$L > L^* = \kappa_0 + |\Delta| \Rightarrow L - |\Delta| > \kappa_0 \Rightarrow \bar{\kappa} > \kappa_0$. Instável. $\blacksquare$

**Interpretação:** Para choques suficientemente grandes, a capacidade repressiva permanente é insuficiente mesmo sob condições favoráveis (η = 1). O "threshold do threshold" é o ponto onde automação excede a repressão.

---

### Proposição 6 (Largura do intervalo cruzado)

*O conjunto de valores de $\kappa_0$ que geram o resultado cruzado (P3) tem largura:*

$$|I_{\text{cross}}| = \bar{\kappa} \cdot \frac{1 - \eta_R}{\eta_R}$$

*Esta largura é:*
*(a) Crescente em $\bar{\kappa}$ (choques maiores ampliam o intervalo).*
*(b) Decrescente em $\eta_R$ (repressão mais eficaz sob rápida estreita o intervalo).*
*(c) Zero quando $\eta_R = 1$ (sem diferenciação de efetividade, sem cruzamento).*

**Prova.**

$|I_{\text{cross}}| = \bar{\kappa}/\eta_R - \bar{\kappa} = \bar{\kappa}(1/\eta_R - 1) = \bar{\kappa}(1 - \eta_R)/\eta_R$.

(a) $\partial |I|/\partial \bar{\kappa} = (1-\eta_R)/\eta_R > 0$. (b) $\partial |I|/\partial \eta_R = -\bar{\kappa}/\eta_R^2 < 0$. (c) $\eta_R = 1 \Rightarrow |I| = 0$. $\blacksquare$

**Interpretação:** η_R é o parâmetro-chave. Ele captura quão vulnerável é a repressão autocrática a oposição organizada. Quanto menor η_R, maior a faixa de autocracias que exibem o padrão cruzado.

---

### Proposição 7 (Welfare state como seguro contra choques delayed)

*Generalize A3 permitindo capacidade compensatória permanente $\varphi_0 \geq 0$ (welfare state pré-existente):*

$$\varphi_t = \max\left(\varphi_0,\; \bar{\varphi} \cdot \mathbf{1}[\ell_t > 0]\right)$$

*Então:*
*(a) A democracia é estável sob a trajetória threshold sse $\varphi_0 \geq \bar{\varphi}$.*
*(b) Para $\varphi_0 < \bar{\varphi}$, a Proposição 1 se mantém inalterada.*
*(c) Para $\varphi_0 \geq \bar{\varphi}$, a democracia é estável sob ambas as trajetórias.*

**Prova.**

(a) Threshold. t=1: $\ell_1 = 0 \Rightarrow$ estável por A1. t=2: $\ell_2 = L$. Capacidade disponível: $\varphi_2 = \varphi_0$ (sem choque em t=1, sem investimento reativo, mas welfare state permanente fornece $\varphi_0$). Estável sse $\varphi_0 \geq \bar{\varphi}$. $\blacksquare$

(b) Se $\varphi_0 < \bar{\varphi}$: sob threshold, t=2 tem $\varphi_2 = \varphi_0 < \bar{\varphi}$ → instável. Sob rápida, t=1 tem $\varphi_1 = \max(\varphi_0, \bar{\varphi}) = \bar{\varphi}$ → estável. Idêntico a P1. $\blacksquare$

(c) Se $\varphi_0 \geq \bar{\varphi}$: sob ambas as trajetórias, $\varphi_t \geq \varphi_0 \geq \bar{\varphi}$ no período com choque → estável. $\blacksquare$

**Interpretação:** $\varphi_0$ é o análogo democrático de $\kappa_0$. Ambos representam *capacidade institucional permanente* que funciona como seguro contra choques delayed: $\kappa_0$ via repressão (autocracia), $\varphi_0$ via proteção social (democracia). Democracias com welfare state abrangente ($\varphi_0 \geq \bar{\varphi}$) são funcionalmente equivalentes a autocracias fortes ($\kappa_0 \geq \bar{\kappa}$) em termos de resiliência — mas com bem-estar superior (P4).

---

### Proposição 8 (Equivalência funcional φ₀ e κ₀)

*Defina:*
- *Democracia forte: $\varphi_0 \geq \bar{\varphi}$*
- *Autocracia forte: $\kappa_0 \geq \bar{\kappa}/\eta_R$*

*Ambos os regimes "fortes" são estáveis sob ambas as trajetórias. Mas o bem-estar de E difere:*

$$u_E(M \mid D\text{-forte, threshold}) = w_E - L(1-\varphi_0) \geq w_E + \Delta$$

$$u_E(M \mid A\text{-forte, threshold}) = w_E - L$$

*A diferença é $L\varphi_0 \geq L\bar{\varphi} = L - |\Delta| = \bar{\kappa} > 0$.*

**Prova.**

Democracia forte sob threshold: $u_E = w_E - L(1-\varphi_0)$. Como $\varphi_0 \geq \bar{\varphi} = 1 - |\Delta|/L$: $u_E \geq w_E - L \cdot |\Delta|/L = w_E - |\Delta| = w_E + \Delta$.

Autocracia forte sob threshold: $u_E = w_E - L$.

Diferença: $\geq (w_E + \Delta) - (w_E - L) = \bar{\kappa} > 0$. $\blacksquare$

**Interpretação:** Welfare state e repressão são funcionalmente equivalentes como mecanismo de *estabilização*, mas não de *bem-estar*. A democracia forte estabiliza E E compensa. A autocracia forte estabiliza mas E absorve a perda integralmente. O argumento normativo para welfare state como seguro é que ele compra a mesma resiliência da repressão — sem o custo humano.

---

## 5. Corolários: Tipologias

**Corolário 1** (Tipologia autocrática). Sob A1–A5, combinando P1, P2 e P3:

| Tipo | Condição | Rápida | Threshold |
|------|----------|:------:|:---------:|
| Democracia ($\varphi_0 = 0$) | (por A3) | Estável | Instável |
| Autocracia fraca | $\kappa_0 < \bar{\kappa}$ | Instável | Instável |
| **Autocracia moderada** | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$ | **Instável** | **Estável** |
| Autocracia forte | $\kappa_0 \geq \bar{\kappa}/\eta_R$ | Estável | Estável |

O padrão cruzado (P3) se aplica à comparação **democracia (sem welfare state) vs. autocracia moderada**.

**Corolário 2** (Tipologia completa com φ₀). Combinando P1, P2, P3 e P7:

| Tipo | Condição | Rápida | Threshold |
|------|----------|:------:|:---------:|
| **Democracia forte** | $\varphi_0 \geq \bar{\varphi}$ | Estável | Estável |
| **Democracia fraca** | $\varphi_0 < \bar{\varphi}$ | Estável | **Instável** |
| Autocracia fraca | $\kappa_0 < \bar{\kappa}$ | Instável | Instável |
| **Autocracia moderada** | $\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$ | **Instável** | **Estável** |
| **Autocracia forte** | $\kappa_0 \geq \bar{\kappa}/\eta_R$ | Estável | Estável |

O padrão cruzado se aplica à comparação **democracia fraca vs. autocracia moderada**.

**Democracias fortes** e **autocracias fortes** são ambas resilientes — mas diferem em bem-estar (P8).

**Mapeamento empírico sugerido:**

| Tipo teórico | Exemplos candidatos |
|-------------|---------------------|
| Democracia forte ($\varphi_0 \geq \bar{\varphi}$) | Escandinávia, Alemanha (welfare state abrangente) |
| Democracia fraca ($\varphi_0 < \bar{\varphi}$) | EUA, Reino Unido (welfare state residual) |
| Autocracia moderada ($\bar{\kappa} \leq \kappa_0 < \bar{\kappa}/\eta_R$) | China, Rússia, Irã |
| Autocracia forte ($\kappa_0 \geq \bar{\kappa}/\eta_R$) | Coreia do Norte, Arábia Saudita |
| Autocracia fraca ($\kappa_0 < \bar{\kappa}$) | Autocracias competitivas pré-Primavera Árabe |

---

## 6. Observações

### 6.1 Robustez de A3

A Proposição 1 não requer a forma funcional específica de A3. Basta que a função de investimento satisfaça $\varphi(0) = 0$ e $\varphi(L) \geq \bar{\varphi}$. Qualquer regra de investimento monotônica com essas propriedades produz o mesmo resultado qualitativo.

### 6.2 Welfare state como seguro

A extensão φ₀ está formalizada como Proposições 7 e 8 (§4) e gera a tipologia completa no Corolário 2 (§5). O resultado central: φ₀ é o análogo democrático de κ₀ — ambos são capacidade institucional permanente que funciona como seguro contra choques delayed, mas com consequências de bem-estar opostas.

### 6.3 Papel estrutural de η_R

η_R = 1 elimina o resultado cruzado (P6c). Nesse caso, a trajetória não importa para autocracias — e o modelo colapsa para a versão v1 (sem diferenciação).

η_R é o que torna o modelo não-trivial. Empiricamente, η_R captura:
- Profissionalização das forças de segurança (↑ η_R)
- Coesão étnica/ideológica militar-regime (↑ η_R)
- Isolamento internacional (↑ η_R: menos pressão externa)
- Tecnologia de vigilância (↑ η_R)
- Legitimidade do regime (↑ η_R)

Autocracias totalitárias (Coreia do Norte: η_R ≈ 1) raramente exibem o cruzamento. Autocracias sultanísticas ou competitivas (pré-Primavera Árabe: η_R baixo) são mais suscetíveis.

### 6.4 As duas tragédias

**Tragédia da responsividade democrática:** A mesma propriedade que torna democracias boas para os cidadãos (responsividade a demandas → compensação) as torna frágeis a choques delayed (sem demanda → sem ação).

**Tragédia da repressão autocrática:** A mesma propriedade que torna autocracias resilientes a choques delayed (repressão permanente → contenção) as torna (i) vulneráveis a choques visíveis (repressão degrada contra oposição organizada) e (ii) incapazes de beneficiar cidadãos mesmo quando estáveis (repressão ≠ compensação).

### 6.5 Insight transferível

O resultado cruzado generaliza além de IA/automação. Para qualquer choque econômico com duas trajetórias possíveis (observável vs. delayed), o modelo prevê que:

- Instituições responsivas (democracias, organizações com feedback loops) processam melhor choques observáveis
- Instituições com capacidade permanente (autocracias, organizações com estruturas fixas de segurança) processam melhor choques delayed

A **coordenação dos afetados** é a variável mediadora: choques observáveis a facilitam (beneficiando instituições que canalizam coordenação); choques delayed a impedem (beneficiando instituições que operam independente de coordenação).

---

## 7. Estática comparativa resumida

| Parâmetro | Efeito sobre estabilidade | Interpretação |
|-----------|---------------------------|---------------|
| L ↑ | $\bar{\varphi}$ ↑, $\bar{\kappa}$ ↑ → ambos mais frágeis | Choques maiores desestabilizam ambos |
| η_R ↓ | $\bar{\kappa}/\eta_R$ ↑ → intervalo cruzado amplia | Autocracias mais vulneráveis a oposição organizada |
| θ ↑ | Δ ↑ → $\bar{\varphi}$ ↑, $\bar{\kappa}$ ↑ | R mais atraente → mais instabilidade |
| k ↑ | Δ ↓ → $\bar{\varphi}$ ↓, $\bar{\kappa}$ ↓ | R mais custoso → mais estabilidade |
| κ₀ ↑ | Autocracia mais estável | Move de fraca → moderada → forte |
| φ₀ ↑ | Democracia mais estável sob threshold (P7) | Welfare state como seguro — análogo funcional de κ₀ |

---

## 8. Apêndices disponíveis

- **Microfundação de A3** (model/04a): Modelo de votação. SPE: maioria não-exposta veta taxação sem crise; aceita taxação mínima sob crise credível.
- **Microfundação de A4/η** (model/04b): Global games (Morris & Shin). Precisão do sinal determina coordenação → η endógeno.

## 9. Próximos passos

1. Posicionar formalmente na literatura: Fernandez & Rodrik (1991), Alesina & Drazen (1991), Acemoglu & Robinson (2006), Svolik (2012)
2. Formatar como seções de paper (Introduction, Model, Results, Discussion)
3. Discutir implicações empíricas refinadas
4. (Futuro) Extensão com instrumentos mistos — especialização endógena
