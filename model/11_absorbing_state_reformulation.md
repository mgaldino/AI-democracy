# Reformulação: Estado Absorvente e Ganho de Complementaridade

## 1. Problema com a formulação atual

O modelo atual define trajetórias como:
- Rápida: $\ell_1 = L$, $\ell_2 = 0$
- Threshold: $\ell_1 = 0$, $\ell_2 = L$

Isso implica que (1) sob rápida, o deslocamento é temporário (trabalhador "recupera" renda em $t=2$), e (2) sob threshold, a fase complementar é neutra (nada acontece em $t=1$). Ambos são inconsistentes com Gans & Goldfarb (2026):
- Deslocamento por automação é permanente (estado absorvente): uma vez que IA substitui tarefas, o emprego não volta.
- Sob O-Ring, a fase complementar AUMENTA produtividade antes do threshold ser cruzado.

## 2. Reformulação proposta

Definir renda por período (exógena, premissa OEP):

**Rápida:**

$$y_1^r = w_E - L \qquad y_2^r = w_E - L$$

Deslocamento imediato e permanente.

**Threshold:**

$$y_1^\tau = w_E + g \qquad y_2^\tau = w_E - L$$

Ganho de complementaridade em $t=1$ ($g \geq 0$), seguido de deslocamento em $t=2$.

Onde $g \geq 0$ é o ganho de produtividade da fase complementar e $L > 0$ é a magnitude do deslocamento, com $L \leq w_E$.

## 3. Utilidade (nível, sem dependência de referência)

Sob $M$ em democracia, o trabalhador recebe sua renda do período mais compensação proporcional a qualquer perda abaixo do baseline:

$$u_E(M \mid D, t) = y_t^j + \varphi_t \cdot \max(0, \; w_E - y_t^j)$$

**Quando deslocado** ($y_t = w_E - L$):

$$u_E(M \mid D, t) = (w_E - L) + \varphi_t L = w_E - L(1-\varphi_t)$$

Idêntico à formulação atual.

**Quando em complementaridade** ($y_t = w_E + g$, threshold $t=1$):

$$u_E(M \mid D, t) = w_E + g$$

Sem perda, sem compensação necessária.

Sob $P$:

$$u_E(P \mid D, t) = \theta W - k$$

$$u_E(P \mid A, t) = \theta W - k - \kappa_0 \cdot \eta(\pi_t)$$

Inalterado.

## 4. Rederivação de P1-P4

### P1 (Fragilidade democrática)

**(a) Rápida + Democracia:**

- $t=1$: $y_1 = w_E - L$. Crise visível $\to$ $\sigma_r$ baixo $\to$ $\pi^* \geq \bar{\pi}$ $\to$ $\varphi_1 = \bar{\varphi}$. $u_E(M) = w_E - L(1-\bar{\varphi}) = w_E + \Delta = u_E(P)$. **Estável.**
- $t=2$: $y_2 = w_E - L$ (absorvente). Mas $\varphi_2 = \bar{\varphi}$ por A5 (capacidade persiste). $u_E(M) = w_E + \Delta = u_E(P)$. **Estável.**

Democracia estável em ambos os períodos. A persistência da compensação (A5) protege contra o estado absorvente.

**(b) Threshold + Democracia:**

- $t=1$: $y_1 = w_E + g$. $u_E(M) = w_E + g > w_E > \theta W - k$ (por A1, $\Delta < 0$). **Estável trivialmente.** Trabalhadores ativamente ganhando com IA — nenhuma crise, nenhuma mobilização, nenhuma compensação construída ($\varphi_1 = 0$).
- $t=2$: Threshold cruzado. $y_2 = w_E - L$. $\varphi_2 = 0$ por A5. $u_E(M) = w_E - L$, $u_E(P) = w_E + \Delta$. Estabilidade requer $-L \geq \Delta$, contradiz A2. **Instável.**

A desmobilização em $t=1$ é ativa, não passiva. Trabalhadores não estão apenas "sem crise" — estão ganhando. Isso é mais forte que $\ell_1 = 0$ e mais fiel à fase complementar de Gans & Goldfarb.

**P1 preservado.** ✓

### P2 (Fragilidade autocrática)

**(a) Rápida + Autocracia:**

- $t=1$: $y_1 = w_E - L$. $\sigma_r$ baixo $\to$ $\pi^* \geq \bar{\pi}$ $\to$ $\eta = \eta_r$. Estável iff $\kappa_0 \eta_r \geq \bar{\kappa}$.
- $t=2$: $y_2 = w_E - L$ (absorvente). Crise persiste, oposição permanece organizada. Mesma condição: $\kappa_0 \eta_r \geq \bar{\kappa}$.

Mesma condição em ambos os períodos. Na formulação anterior ($\ell_2 = 0$), $t=2$ era trivialmente estável. Agora precisa ser verificado, mas a condição é a mesma.

**(b) Threshold + Autocracia:**

- $t=1$: $y_1 = w_E + g$. Estável trivialmente.
- $t=2$: $y_2 = w_E - L$. $\sigma_\tau$ alto $\to$ $\pi^* < \bar{\pi}$ $\to$ $\eta = 1$. Estável iff $\kappa_0 \geq \bar{\kappa}$.

**P2 preservado.** ✓

### P3 (Fragilidade cruzada)

Para $\kappa_0 \in [\bar{\kappa}, \bar{\kappa}/\eta_r)$:

(a) Rápida: democracia estável (P1a), autocracia instável ($\kappa_0 < \bar{\kappa}/\eta_r$ $\to$ P2a falha).
(b) Threshold: democracia instável (P1b), autocracia estável ($\kappa_0 \geq \bar{\kappa}$ $\to$ P2b).

**P3 preservado.** ✓

### P4 (Custo de welfare da estabilidade autocrática)

Comparação entre cenários de sobrevivência:
- Democracia estável (rápida, qualquer $t$): $u_E = w_E + \Delta$ (com compensação $\bar{\varphi}$)
- Autocracia estável (threshold, $t=2$): $u_E = w_E - L$ (sem compensação)
- Diferença: $\Delta + L = \bar{\kappa} > 0$ por A2.

**P4 preservado.** ✓

## 5. O que muda formalmente

1. **Definição de trajetórias**: de "perdas por período" para "renda por período com estado absorvente"
2. **Novo parâmetro $g \geq 0$**: ganho de complementaridade sob threshold em $t=1$. Não afeta nenhuma condição de estabilidade (utilidade de nível). Afeta interpretação e extensão de populismo.
3. **Restrição $L \leq w_E$**: evita utilidade negativa sob $M$ sem compensação.
4. **Verificação em dois períodos sob rápida**: trivial porque A5 garante persistência de $\bar{\varphi}$ e $\kappa_0$ é estoque permanente.
5. **$\bar{\varphi}$ e $\bar{\kappa}$ inalterados**: dependem apenas de $L$ e $\Delta$, não de $g$.

## 6. O que NÃO muda

- Proposições P1-P4: preservadas exatamente
- Condições de estabilidade: idênticas
- $\bar{\varphi}$, $\bar{\kappa}$, $\Delta$: inalterados
- Extensão welfare state (P5-P6): inalterada ($\varphi_0$ bypassa o problema em qualquer período)
- P7 (fiscal fragility): inalterada
- Tipologia 5 tipos: inalterada
- Coordination framework: inalterado

## 7. Ganho interpretativo

1. **Mais fiel a Gans & Goldfarb**: deslocamento permanente + complementaridade com ganho
2. **Threshold $t=1$ mais forte**: não é "neutro" ($\ell_1 = 0$), é "positivo" ($y_1 = w_E + g$). A desmobilização é ativa, não passiva.
3. **Conexão com populismo**: $g$ é exatamente a fonte da heterogeneidade $\sigma_E$ na extensão populista. Trabalhadores que ganharam mais com complementaridade ($g_i$ alto) têm mais a perder com compensação uniforme.
4. **Estado absorvente justifica A5 mais naturalmente**: se o deslocamento é permanente, a compensação PRECISA ser permanente. A5 diz que construir capacidade permanente leva tempo.
5. **Sob rápida, A5 é benéfico**: capacidade construída em $t=1$ persiste para $t=2$, protegendo contra estado absorvente. Sob threshold, A5 é maléfico: janela fechou antes do choque. Simetria interpretativa limpa.

## 8. Exemplo numérico

Parâmetros do paper: $w_E = 1$, $W = 2$, $L = 1$, $\theta = 0.5$, $k = 0.4$, $\kappa_0 = 0.8$, $\eta_r = 0.5$.
Adicionar: $g = 0.3$.

**Rápida + Democracia:**

- $t=1$: $y_1 = 0$. Com $\varphi_1 = 0.6$: $u_E(M) = 0.6 = u_E(P)$. Estável.
- $t=2$: $y_2 = 0$ (absorvente). $\varphi_2 = 0.6$ (A5). $u_E(M) = 0.6$. Estável.

**Threshold + Democracia:**

- $t=1$: $y_1 = 1.3$. $u_E(M) = 1.3 > 0.6 = u_E(P)$. Estável. Trabalhadores ganhando.
- $t=2$: $y_2 = 0$. $\varphi_2 = 0$. $u_E(M) = 0 < 0.6 = u_E(P)$. Instável.

**Rápida + Autocracia:**

- $t=1$: $y_1 = 0$. $u_E(P) = 0.6 - 0.4 = 0.2 > 0 = u_E(M)$. Instável.
- $t=2$: Mesmo. Instável.

**Threshold + Autocracia:**

- $t=1$: $y_1 = 1.3$. Estável trivialmente.
- $t=2$: $y_2 = 0$. $u_E(P) = 0.6 - 0.8 = -0.2 < 0 = u_E(M)$. Estável.

Crossed fragility preservado. ✓

## 9. Decisões de design (aprovadas 2026-04-02)

### D7. Reinterpretação de $\sigma$ como previsibilidade pré-choque

$\sigma_j$ captura a previsibilidade do choque de automação *antes* de ele chegar, não a observabilidade *depois*.

- Sob rápida, a automação é visível enquanto se aproxima (fábricas fechando, adoção gradual). Trabalhadores se organizam *antes ou durante* o deslocamento. $\sigma_r$ baixo.
- Sob threshold, a fase complementar mascara o risco: trabalhadores percebem IA como benéfica até o threshold ser cruzado. O deslocamento é genuinamente inesperado — uma transição de fase, não uma tendência gradual. Cada trabalhador precisa avaliar rapidamente se os outros foram igualmente surpreendidos e estão dispostos a agir. $\sigma_\tau$ alto.

Essa reinterpretação preserva workers idênticos no baseline (sem necessidade de $g_i$ heterogêneo), não adiciona estrutura ao modelo, e está ancorada na mecânica O-Ring de Gans & Goldfarb: complementaridade mascara o risco vindouro. Conecta com Kuran (1991): sob threshold, cada trabalhador pode estar falsificando preferências e só descobre que outros também se sentem traídos quando é tarde demais para coordenar rapidamente.

### D8. $g$ como premissa econômica importada (OEP)

$g \geq 0$ permanece na definição de renda ($y_1^\tau = w_E + g$) como premissa importada de Gans & Goldfarb. $g$ NÃO entra em nenhuma condição de estabilidade (com utilidade de nível, a decisão M vs P em cada período depende apenas da renda naquele período).

$g$ faz trabalho em:
1. Comparações de welfare total entre trajetórias ($2w_E - 2L$ vs $2w_E + g - L$)
2. Interpretação (desmobilização ativa em $t=1$ sob threshold, não passiva)
3. Conexão com extensão de populismo ($g_i$ heterogêneo como fonte de $\sigma_E$)

$g$ NÃO faz trabalho em:
- Condições de estabilidade M vs P
- Provas de P1-P4
- Definição de $\bar{\varphi}$, $\bar{\kappa}$, $\Delta$

Isso é aceitável pelo padrão OEP: parâmetros econômicos importados que definem o cenário sem complicar o aparato político. Análogo a elasticidades de demanda em modelos OEP de comércio.

### D9. $L \leq w_E$ como restrição explícita

O choque de automação não pode exceder a renda pré-automação. Evita utilidade negativa sob $M$ sem compensação.

### D10. Heterogeneidade de $g_i$ permanece na extensão de populismo

Não fundir baseline com extensão. Workers idênticos no baseline. $g_i$ heterogêneo entra apenas na extensão populista (Appendix C / modelo 07). A modularidade baseline simples → extensões ricas é preservada.

## 10. Limitação residual

O mapeamento trajetória $\to$ $\sigma$ permanece reduced-form. A reinterpretação como "previsibilidade" (D7) melhora a ancoragem conceitual mas não elimina a reduced-form nature. Esse é o único residual: um primitivo informacional, em um lugar, para ambos os regimes. Dependência de referência (perda relativa a $w_E + g$) é extensão futura que fortaleceria o resultado sob threshold mas não é necessária para o baseline.
