# Parecer de Apresentacao Tecnica (Thomson / Board)

**Manuscrito**: "AI and Regime Stability: How Selectorate Size Shapes the Political Consequences of Automation"
**Autores**: Galdino & Mignozzetti
**Data**: 2026-05-02
**Avaliador**: Teorico senior (apresentacao tecnica)
**Frameworks**: Thomson (1999) "Young Person's Guide to Writing Economic Theory"; Board & Meyer-ter-Vehn (2018) "Writing Economic Theory Papers"

---

## Score Global: 6.5/10

O manuscrito apresenta uma ideia forte --- crossed fragility entre regime e trajetoria de automacao --- mas a apresentacao tecnica compromete a forca do modelo. A ordem de exposicao inverte a logica canonica (exemplo numerico ANTES do modelo formal, mas DEPOIS das definicoes formais, gerando confusao sobre o que e primitiva vs. resultado). A notacao e parcimoniosa mas inconsistente em pontos criticos. As provas sao mais verbais do que matematicas, o que e aceitavel para CP, mas falta rigor em passos cruciais. Os resultados sao bem organizados em tabelas-resumo, porem os enunciados formais misturam condicoes parametricas com intuicao verbal de um modo que dificulta a verificacao independente.

---

## Estrutura do Modelo

O modelo e um jogo de dois periodos ($t \in \{1,2\}$) com um continuo de trabalhadores $i \in [0,1]$ e um incumbente (governo) estrategico. A natureza sorteia um tipo de automacao $\theta \in \{R, T, N\}$ (rapida, threshold, nenhuma) nao observado por ninguem. Cada trabalhador recebe um sinal privado $s_{it}$ e observa seu status de deslocamento $d_{it}$. Trabalhadores decidem se protestam ($a_{it} \in \{0,1\}$); o protesto agregado $\pi_t$ interage com um trigger de compensacao assincrono por regime (voice em democracia, avaliacao tecnocratica em autocracia). O conceito de equilibrio e implicitamente Nash Bayesiano com coordenacao via global games (sinais privados + safety in numbers), embora isso nunca seja declarado formalmente como definicao de equilibrio.

**Jogadores**: Trabalhadores $i \in [0,1]$ (estrategicos); Incumbente/governo (estrategico, reage a $\pi_t$ ou $\tilde{\omega}_S$); Elite autocratica (decide autorizacao fiscal); Natureza ($\theta$).

**Acoes**: Trabalhadores: $a_{it} \in \{0,1\}$ (protestar ou nao). Incumbente: compensar ou nao ($\text{comp}_t$). Elite: autorizar ou nao (em autocracia).

**Informacao**: $\theta$ nao observado. Cada trabalhador observa $(d_{it}, s_{it})$. Incumbente democratico observa $\pi_t$ (protesto agregado). Elite autocratica observa $\tilde{\omega}_S = \omega_t + \sigma_A \zeta$.

**Preferencias**: Trabalhadores: $v_i - C_x(1 - h(\pi_t))$ se protesta, 0 se nao. Incumbente: quer sobreviver (implicito). Nao ha funcao utilidade explicita para o incumbente.

**Timing**: 7 passos por periodo (Table 1). Displacement, sinais, protesto, trigger, compensacao, fall check, payoffs.

**Conceito de equilibrio**: Nao declarado explicitamente. Implicitamente, e um equilibrio de cutoff em estrategias de threshold (via global games / safety in numbers), mas nao ha Definicao formal de equilibrio.

---

## Scorecard

| Dimensao | Score | Observacao |
|----------|:-----:|-----------|
| D2. Apresentacao do modelo | 6/10 | Ordem nao-canonica: verbal walkthrough (Sec 2) antes do modelo, exemplo numerico dentro do modelo (Sec 3.8), extensoes misturadas com resultados |
| D3. Notacao | 7/10 | Parcimoniosa e reconhecivel, mas inconsistencias ($\omega_R$ vs $\omega_H$; $\omega_{T2}$ nao definido formalmente; $\bar{\omega}_D$ aparece sem definicao) |
| D4. Definicoes | 5/10 | Conceito de equilibrio ausente como Definicao formal; definicao de crossed fragility aparece DEPOIS das proposicoes que a usam |
| D5. Enunciado dos resultados | 7/10 | Boa estrutura paralela (L1, R1, P1-P5, C1), takeaway messages claros em tabelas, mas condicoes parametricas insuficientemente precisas |
| D6. Provas | 5/10 | Predominantemente verbais; passos nao numerados; sem QED marks consistentes; provas de P1-P3 sao sketches, nao demonstracoes |
| D7. Figuras e diagramas | 6/10 | Duas figuras presentes (sweet spot + sigma amplification), mas faltam figuras essenciais: game tree, timeline visual, mapa parametrico no corpo do texto |
| D8. Assumptions | 7/10 | Bem agrupadas (A1-A9), motivadas verbalmente, mas falta ordenacao por plausibilidade e A8 e muito pesada (combina varias condicoes) |
| D9. Exemplos e aplicacoes | 7/10 | Exemplo numerico bem construido com 4 cenarios, parametros razoaveis, mas naming dos parametros poderia ser mais mnemonica |

---

## Analise Detalhada

### D2. Apresentacao do modelo (6/10)

**Problema central: ordem nao-canonica.** Thomson (1999, Sec 3) e Board & Meyer-ter-Vehn (2018, Sec 2) sao inequivocos: a ordem canonica e (1) modelo formal completo com todas as primitivas, (2) resultados, (3) exemplos/aplicacoes. O manuscrito faz:

1. Introducao (Sec 1) --- OK
2. Logica verbal da crossed fragility (Sec 2, ~4 paginas) --- verbal walkthrough
3. Modelo formal (Sec 3, com exemplo numerico embutido em 3.8) --- modelo + exemplo misturados
4. Resultados (Sec 4)
5. Extensao de politica publica (Sec 5)
6. Discussao (Sec 6)

**Problemas especificos:**

(a) **Secao 2 e uma longa motivacao que repete o que Sec 3-4 formalizam.** Thomson adverte contra "motivation creep": "Don't explain at length why the problem is important or where the model comes from BEFORE presenting the model." A Secao 2 tem 4 subsecoes e ~4 paginas que narram os 4 cenarios informalmente. Isso e aceitavel como "roadmap" se condensado em 1-1.5 paginas, mas 4 paginas duplicam o conteudo dos resultados.

(b) **Exemplo numerico (Sec 3.8) aparece DENTRO do modelo, antes dos resultados.** Varian (1997) recomenda "example first, then model" --- mas isso significa que o exemplo vem como *motivacao* antes da formalizacao, nao embutido na secao de modelo depois de 7 subsecoes de primitivas. Se a ideia e Varian, o exemplo deveria abrir a Secao 3 ("Before formalizing, consider the following..."); na posicao atual, o leitor ja leu 7 subsecoes de setup e ainda nao viu um resultado formal, e entao recebe um exemplo que ilustra resultados nao demonstrados.

(c) **Baseline vs. extensoes nao esta claro.** A Secao 5 ("Extension: Policy Implications") e mais um corolario/remark do que uma extensao. O Remark 2 (standing compensatory capacity) e trivial dado o modelo. Nao ha extensao substantiva que modifique o jogo (multi-periodo, N ativo, populismo --- tudo e mencionado como "TODO" no Appendix). Board & Meyer-ter-Vehn enfatizam que extensoes devem ser modelos que estendem o baseline, nao observacoes de politica publica.

**Recomendacao:** Condensar Secao 2 para 1-1.5 paginas de "intuition roadmap" (um paragrafo por cenario). Mover o exemplo numerico para o inicio da Secao 3 (antes do modelo formal) ou para imediatamente apos P3 (como ilustracao do resultado principal). Renomear Secao 5 para "Remark" ou absorve-la na Discussao.

---

### D3. Notacao (7/10)

**Parcimonia:** Boa. O modelo usa poucos simbolos para os mecanismos centrais. A escolha de $x \in \{D, A\}$ para regime e $\theta \in \{R, T, N\}$ para tipo de automacao e reconhecivel.

**Problemas de consistencia:**

(a) **$\omega_H$ vs. $\omega_R$ vs. $\omega_{T2}$**: A tabela do modelo (Sec 3.1) define $\omega_H$ e $\omega_L$ como primitivas. O exemplo numerico (Sec 3.8) usa $\omega_R = 0.30$ e $\omega_{T2} = 0.60$. No corpo dos resultados, $\omega_R$ e $\omega_{T2}$ sao usados extensivamente, mas esses nao sao os mesmos que $\omega_H$. A relacao e: sob $\theta = R$, $\omega_1 = \omega_2 = \omega_H$, e $\omega_R$ parece ser um alias para $\omega_H$. Mas sob $\theta = T$, $\omega_2 = \omega_H$ tambem, entao $\omega_{T2}$ deveria ser igual a $\omega_H$, e no entanto o exemplo numerico atribui $\omega_R = 0.30$ e $\omega_{T2} = 0.60$, que sao valores diferentes. Isso contradiz a tabela do modelo, que diz que ambos os tipos usam $\omega_H$ no periodo de crise. Ou $\omega_H$ varia por tipo (o que invalidaria a tabela), ou o exemplo numerico esta usando notacao inconsistente. Este e o problema notacional mais serio do manuscrito.

(b) **$\bar{\omega}_D$ nunca e definido.** Aparece pela primeira vez em Sec 3.4 ("The ordering $\bar{\omega}_D < \omega_R < \bar{\omega}_A(\sigma_A) < \omega_{T2}$") e na prova de L1(c), mas nao ha definicao formal. O que e o evidence threshold democratico? No modelo, democracia usa voice trigger ($\pi_t > \bar{\pi}_D^{\text{comp}}$), nao um threshold de $\omega$. Entao $\bar{\omega}_D$ e o $\omega$ implicito que gera protesto suficiente para ativar voice? Se sim, isso deveria ser derivado explicitamente.

(c) **$\omega_0$**: Definido como "evidence threshold with perfect information" na Sec 3.4, mas nao aparece nas assumptions (A1-A9). E uma primitiva? Se sim, deveria estar em A8. Se e derivado, de que?

(d) **$\Omega_t$ vs. $\omega_t$**: $\Omega_t$ e o estoque acumulado de deslocados (definido em R1), $\omega_t$ e a taxa de fluxo. A distincao e clara conceitualmente, mas a notacao (maiuscula/minuscula do mesmo simbolo) e propensa a confusao visual, especialmente em subscripts.

(e) **$\varphi_t$ vs. $\text{comp}_t$**: Ambos indicam compensacao, mas $\text{comp}_t$ e o trigger (decisao de compensar) e $\varphi_t$ e a disponibilidade efetiva (que depende do lag). A distincao e util mas nao e enfatizada suficientemente. Em varias passagens, o leitor pode confundir as duas.

**Mnemonics:** Razoaveis. $C$ para custo, $B$ para beneficio, $D/A$ para democracia/autocracia, $v$ para valor expressivo. $h$ para safety-in-numbers nao e intuitivo. $\mathcal{F}$ para capacidade fiscal mencionada no CLAUDE.md nao aparece no texto --- boa decisao de simplificacao.

---

### D4. Definicoes (5/10)

**Problema grave: conceito de equilibrio ausente.** O manuscrito nunca define formalmente o conceito de equilibrio usado. A Secao 3.3 introduz o payoff de protesto ($v_i > C_x(1 - h(\pi_t))$) e a "standard coordination motive," mas nao ha:

- Definicao: "A strategy profile $\{a_i^*\}$ is a Bayesian Nash equilibrium if..."
- Declaracao de unicidade ou multiplicidade
- Referencia ao tipo de equilibrio (monotone cutoff, symmetric BNE, etc.)

O CLAUDE.md menciona "Coordenacao via global games (Morris & Shin 2003)" e "Laplacian property," mas o texto do paper nao usa o termo "global games" em nenhum momento, nao cita Morris & Shin, e nao discute a unicidade do equilibrio derivada da estrutura informacional. Isso e uma omissao critica para qualquer leitor familiarizado com a literatura.

**Definicao de crossed fragility aparece DEPOIS de P3.** A "Definition" (crossed fragility) aparece na linha 291, mas P1 (linha 268) e P2 (linha 279) ja usam o conceito implicitamente. Thomson (1999): "Define before you use." A definicao deveria preceder P1.

**Ausencia de destaque tipografico consistente.** As assumptions (A1-A9) usam bold para o label, o que e bom. Mas a definicao de crossed fragility usa "Definition." em bold sem numeracao. Lemma 1, Propositions, Remarks e Corollary sao todos em bold com numeracao --- consistente. A definicao deveria ser "Definition 1" para uniformidade.

**Definicoes implicitas nao declaradas:**
- $\Omega_t$ (estoque acumulado) e definido inline em R1, nao como definicao destacada
- $v_i$ (valor expressivo) e definido inline em Sec 3.3, OK para uma expressao simples
- $\bar{\pi}_D^{\text{comp}}$ e mencionado mas nunca definido em termos de primitivas do modelo

---

### D5. Enunciado dos resultados (7/10)

**Pontos positivos:**
- Estrutura paralela entre P1 e P2 (mesma estrutura (a)/(b) com direcoes opostas) --- excelente
- P3 sintetiza P1 e P2 de forma limpa
- Tabela 3 resume o padrao cruzado com mecanismo por celula --- muito eficaz
- Takeaway messages sao claros tanto nas proposicoes quanto na Introducao

**Problemas:**

(a) **Condicoes parametricas imprecisas em P3.** O enunciado diz "there exist parameter ranges for $(C_A, C_D, \bar{\pi}_D^{\text{fall}}, \bar{\pi}_A^{\text{fall}}, \omega_H, \omega_L, B)$ such that..." Isso e uma proposicao existencial, nao construtiva. Board & Meyer-ter-Vehn (2018): "State conditions, not just existence." O leitor quer saber: quais sao as condicoes necessarias e suficientes? A prova lista 5 condicoes (i)-(v), mas nao traduz em desigualdades sobre primitivas. Compare com Acemoglu & Robinson (2001) ou Boix (2003), onde as condicoes de transicao sao desigualdades explicitas.

(b) **P4 (welfare comparison) e trivial.** A diferenca de welfare vem inteiramente de $\Omega_2^R > \Omega_2^T$ (Remark 1), que e mecanico. O resultado nao depende de nenhum mecanismo politico --- e pura aritmetica de absorbing displacement. Apresenta-lo como Proposition sugere um resultado mais profundo do que e. Deveria ser um Remark ou Corollary.

(c) **P5 mistura intuicao com enunciado.** Os itens (a), (b), (c) de P5 nao sao enunciados formais com condicoes precisas; sao descricoes verbais de estatica comparativa. Compare: "As $\sigma_A$ increases, the probability of elite-authorized compensation under rapid displacement decreases" --- isso deveria ser $\partial p_R / \partial \sigma_A < 0$ com condicao suficiente explicita.

(d) **O Corollary 1 (sweet spot) e mais importante que P4 e P5.** O resultado sobre a tipologia de autocracias (open / intermediate / totalitarian) e substantivo e original. Deveria ser promovido a Proposition.

---

### D6. Provas (5/10)

**Ratio math/linguagem natural:** As provas sao predominantemente verbais, com poucas linhas de algebra. Isso pode ser aceitavel em CP (onde o publico nao espera provas ao estilo de Econometrica), mas compromete a verificabilidade.

**Problemas especificos:**

(a) **Prova de L1:** Adequada. A algebra de $\bar{\omega}_A(\sigma_A) = \omega_0 + g(\sigma_A)$ e a monotonia de $\Phi$ sao claras. O argumento de que $\underline{\sigma} < \bar{\sigma}$ segue de $\omega_R < \omega_{T2}$. Esta e a melhor prova do paper.

(b) **Prova de R1 (absorptive composition):** Clara e completa. Algebra simples e correta.

(c) **Prova de P1:** Sketch, nao prova. "Credible commitment reduces $v_{i1}$, keeping $\pi_1 < \bar{\pi}_D^{\text{fall}}$" --- isso requer demonstracao de que a reducao e suficiente. O argumento depende de um equilibrio de coordenacao que nao foi caracterizado formalmente. "In $t = 2$, $v = 1 - B$, protest contained" --- por que $1 - B$ e suficiente? Depende de $C_D$ e $\bar{\pi}_D^{\text{fall}}$, e a prova nao verifica isso.

(d) **Prova de P2:** Mesmo problema. "Protest exceeds $\bar{\pi}_A^{\text{fall}}$" e afirmado sem demonstracao. O argumento depende de $C_A$ estar no sweet spot (C1), que so e enunciado DEPOIS de P2.

(e) **Prova de P3:** Cita 5 condicoes (i)-(v) e diz "jointly satisfiable for a non-degenerate set of parameters." Aponta para o exemplo numerico. Isso e um argumento de existencia por exemplo, nao uma prova construtiva. Aceitavel para CP se as condicoes forem claramente listadas --- e sao --- mas a afirmacao "The result is not knife-edge: it holds for an open set in parameter space" requer um argumento topologico que nao e fornecido.

(f) **Provas de C1 e P5 no Appendix:** Melhor qualidade que as do texto principal. A prova de C1 usa IVT corretamente. A prova de P5 tem algebra explicita com derivadas. Ambas poderiam servir de modelo para as provas do corpo.

**Steps numerados:** Nenhuma prova usa steps numerados. Thomson recomenda numerar passos em provas longas.

**QED marks:** $\blacksquare$ e usado consistentemente. Bom.

---

### D7. Figuras e diagramas (6/10)

**Presentes:**
1. Fig: Sweet spot de $C_A$ (Sec 4.5) --- util, mostra a regiao de operacao
2. Fig: $\sigma_A$ amplification (Sec 4.6) --- util, dois paineis mostrando aprovacao e threshold

**Ausentes (e necessarios):**

(a) **Game tree ou timeline visual.** A Table 1 lista os 7 passos do timing, mas um diagrama de timeline (ao estilo de Acemoglu & Robinson ou Bolton & Dewatripont) seria muito mais eficaz. O manuscrito descreve um jogo sequencial complexo --- displacement, sinais, protesto, trigger, compensacao, fall check --- e o leitor precisa de uma representacao visual.

(b) **Mapa parametrico.** A interacao entre $C_A$, $\sigma_A$, $\omega_R$, $\omega_{T2}$ define o espaco onde crossed fragility opera. Uma figura mostrando as regioes no espaco $(\sigma_A, C_A)$ ou $(\omega_R, \sigma_A)$ seria esclarecedora --- e o CLAUDE.md e a pasta `figures/` sugerem que `fig_parametric_space.pdf` existe mas nao e referenciado no texto.

(c) **Income paths.** O arquivo `fig_income_paths.pdf` existe em `figures/` mas nao e referenciado. Uma figura mostrando as trajetorias de renda sob rapid vs. threshold seria valiosa para a Secao 2.1.

(d) **Diagrama de mecanismo.** O arquivo `fig_mechanism_flow.pdf` existe mas nao e referenciado. O flow inferencial (Sec 6.2: trajectory -> displacement -> protest -> trigger -> fall) seria ideal como diagrama.

**Labels e formatacao:** As duas figuras presentes tem captions informativos e labels adequados.

**Recomendacao:** Incluir pelo menos: (i) game timeline visual, (ii) income paths figure, (iii) parametric space map. Os PDFs ja existem na pasta `figures/` --- basta referencia-los no texto.

---

### D8. Assumptions (7/10)

**Agrupamento:** As 9 assumptions estao na Sec 3.7, agrupadas sequencialmente. Isso e melhor do que distribuir pelo texto, mas Thomson recomenda agrupar por *tipo*: primitivas do modelo (A1, A2, A3, A6, A9), regime differences (A4, A5), e informacao (A8).

**Motivacao:** Cada assumption tem uma justificativa verbal inline --- A2 explica por que 3 estados sao necessarios, A7 explica persistencia da compensacao, etc. Bom.

**Problemas:**

(a) **A8 e composta.** Combina: (i) distribuicao do ruido ($\zeta \sim \Phi$), (ii) threshold funcional ($\bar{\omega}_A = \omega_0 + g(\sigma_A)$), (iii) monotonia ($g' > 0, g(0) = 0$), (iv) condicao de base ($\omega_0 < \omega_R$), (v) restricao parametrica ($\sigma_A \in (\underline{\sigma}, \bar{\sigma})$). Board & Meyer-ter-Vehn: "Each assumption should be a single, testable condition." A8 deveria ser decomposta em pelo menos 3 assumptions separadas.

(b) **Ordem de plausibilidade.** Thomson recomenda ordenar do mais plausivel ao menos plausivel. A ordem atual segue a apresentacao do modelo (displacement, prior, signal, cost, resilience, compensation, persistence, elite info, complementarity), que e razoavel, mas nao sinaliza ao leitor quais assumptions sao fortes vs. fracas. A8 (sweet spot parametrico) e A9 (complementarity income) sao as mais restritivas e deveriam vir por ultimo com discussao explicita de sua forca.

(c) **A7 (persistencia) e forte e pouco discutida.** "Once compensation is activated, it persists" --- isso exclui a possibilidade de que o incumbente retira compensacao apos a crise passar. Em um modelo de 2 periodos, a assumption e quase vacua (compensacao em $t=1$ persiste em $t=2$, mas nao ha $t=3$). Vale notar essa vacuidade.

---

### D9. Exemplos e aplicacoes (7/10)

**Pontos positivos:**
- O exemplo numerico (Sec 3.8) cobre os 4 cenarios sistematicamente
- Parametros sao razoaveis e interpretaveis ($\omega_R = 0.30$, $\omega_{T2} = 0.60$, $B = 0.6$)
- A Table 2 resume os resultados do exemplo com notacao consistente
- A aplicacao de politica publica (Sec 5) e concreta e relevante

**Problemas:**

(a) **Naming dos parametros poderia ser mais mnemonica.** $\bar{\pi}_D^{\text{fall}} = 0.20$ e $\bar{\pi}_A^{\text{fall}} = 0.05$ sao dados numericamente, mas o leitor nao sabe o que "20% de protesto" significa concretamente. Um comentario do tipo "equivalent to X million people in a country of Y" ou "comparable to the Arab Spring protest rates" ajudaria a ancorar.

(b) **Falta verificacao de consistencia cruzada no exemplo.** O manuscrito afirma "protest remains below $\bar{\pi}_D^{\text{fall}} = 0.20$" para democracia sob rapid $t=1$, mas nao calcula $\pi_1$ explicitamente. O argumento e verbal ("credible commitment reduces $v_{i1}$"). Para um exemplo numerico, o leitor espera numeros --- todos eles.

(c) **O exemplo poderia explorar o knife-edge.** O que acontece se $\omega_R = 0.35$ em vez de 0.30? Se $\sigma_A = 0.20$ em vez de 0.15? Uma mini-analise de sensibilidade dentro do exemplo mostraria que o resultado nao e knife-edge (como P3 afirma) e daria ao leitor confianca nos ranges parametricos.

---

## Inventario de Notacao

| Simbolo | Definicao | Secao | Observacoes |
|---------|-----------|-------|-------------|
| $t \in \{1, 2\}$ | Periodo | 3.1 | OK |
| $i \in [0,1]$ | Indice do trabalhador | 3.1 | OK |
| $x \in \{D, A\}$ | Tipo de regime | 3.1 | OK, mnemonico |
| $\theta \in \{R, T, N\}$ | Tipo de automacao | 3.1 | OK |
| $(p_R, p_T, p_N)$ | Prior sobre $\theta$ | 3.1 | OK |
| $\omega_t$ | Taxa de deslocamento no periodo $t$ | 3.1 | OK |
| $\omega_H, \omega_L$ | Taxas alta/baixa de deslocamento | 3.1 | **Conflito**: Aparece na tabela do modelo, mas o corpo usa $\omega_R$, $\omega_{T2}$ como se fossem diferentes |
| $\omega_R$ | Taxa de deslocamento sob rapid | 3.8, 4.x | **Nao definido formalmente**. Parece ser alias para $\omega_H$, mas $\omega_R \neq \omega_{T2}$ no exemplo ($0.30 \neq 0.60$), o que contradiz a tabela (ambos usam $\omega_H$) |
| $\omega_{T1}, \omega_{T2}$ | Taxas threshold $t=1, t=2$ | 3.8 | $\omega_{T1} = \omega_L$, $\omega_{T2} = \omega_H$ pela tabela, mas no exemplo $\omega_{T2} = 0.60 \neq \omega_R = 0.30 = \omega_H$(?). Contradiz a tabela formal |
| $\omega_N$ | Taxa sob no shock | 3.8 | $= \omega_L$ pela tabela |
| $d_{it}$ | Indicador de deslocamento | 3.1 | OK |
| $s_{it}$ | Sinal privado | 3.2 | OK |
| $\sigma$ | Desvio padrao do ruido do sinal privado | 3.2 | OK |
| $\varepsilon_{it}$ | Ruido idiosincratico do sinal | 3.2 | OK |
| $F$ | CDF do ruido | 3.2 | OK |
| $f$ | Densidade de $F$ | 3.2 | OK |
| $y_{it}$ | Renda por periodo | 3.1 | OK |
| $B$ | Compensacao (fracao da renda) | 3.1 | OK, mnemonico |
| $\varphi_t$ | Disponibilidade de compensacao | 3.1 | OK |
| $\text{comp}_t$ | Trigger de compensacao | 3.4 | Distinto de $\varphi_t$ (trigger vs. efetividade) |
| $Y^+$ | Renda de complementaridade | 3.1/3.4 | $= 1 + \gamma$. OK |
| $\gamma$ | Ganho de complementaridade | 3.1 | OK |
| $v_i$ | Valor expressivo de protesto | 3.3 | OK |
| $\delta$ | Fator de desconto | 3.3 | OK |
| $C_x$ | Custo de protesto regime-especifico | 3.3 | OK, $C_A > C_D$ |
| $h(\pi)$ | Funcao safety-in-numbers | 3.3 | $h(\pi) = \pi$ no baseline. Nao intuitivo |
| $a_{it}$ | Acao de protesto | 3.3 | OK |
| $\pi_t$ | Protesto agregado | 3.3 | OK |
| $\bar{\pi}_D^{\text{comp}}$ | Threshold de voice em democracia | 3.4 | **Nunca definido em termos de primitivas** |
| $\bar{\pi}_D^{\text{fall}}$ | Resiliencia institucional democratica | 3.5 | OK, parametro |
| $\bar{\pi}_A^{\text{fall}}$ | Resiliencia institucional autocratica | 3.5 | OK, parametro |
| $\tilde{\omega}_S$ | Avaliacao ruidosa da elite | 3.4 | OK |
| $\sigma_A$ | Ruido da avaliacao da elite | 3.4 | OK, mas dual-use (ruido E parametro de tamanho do selectorado) |
| $\zeta$ | Ruido normal padrao | 3.4 | OK |
| $\Phi$ | CDF normal padrao | 3.4 | OK |
| $\bar{\omega}_A(\sigma_A)$ | Evidence threshold autocratico | 3.4 | OK |
| $\omega_0$ | Evidence threshold com info perfeita | 3.4 | **Nao aparece em A1-A9**; primitiva nao declarada |
| $g(\sigma_A)$ | Funcao de ruido adicional | 3.4 | OK |
| $\alpha_1$ | Parametro linear de $g$ | 3.4 | OK |
| $\underline{\sigma}, \bar{\sigma}$ | Limites do sweet spot de $\sigma_A$ | 3.4 | OK |
| $\Omega_t$ | Estoque acumulado de deslocados | 4.2 | OK, mas notacao proxima de $\omega_t$ |
| $\bar{\omega}_D$ | "Evidence threshold democratico"(?) | 3.4 | **Nunca definido formalmente**. Aparece na ordering key mas nao tem definicao |
| $C_A^{\min}, C_A^{\max}$ | Limites do sweet spot de $C_A$ | 4.5 | OK |
| $C_A^{\text{dom}}$ | Upper bound analitico (dominancia) | App A | OK |
| $\pi^*$ | Protesto de equilibrio | App A | OK, mas nunca definido no corpo |
| $\tau$ | Taxa de subsidiacao | CLAUDE.md | **Nao aparece no paper** |
| $c_s$ | Custo de taxacao | CLAUDE.md | **Nao aparece no paper** |

**Total**: ~40 simbolos. Aceitavel para a complexidade do modelo, mas ha inconsistencias serias em $\omega_H/\omega_R/\omega_{T2}$ e definicoes ausentes ($\bar{\omega}_D$, $\omega_0$ como assumption).

---

## Analise Resultado-a-Resultado

### Lemma 1 (Dictator's dilemma)

**Enunciado:** Bem estruturado em 3 partes (a, b, c). A parte (c) sintetiza a ordering key. Claro.

**Prova:** Adequada. A algebra e simples e correta. O argumento de non-emptiness ($\underline{\sigma} < \bar{\sigma}$) segue de $\omega_R < \omega_{T2}$.

**Problema:** O Lemma usa $\omega_R$ e $\omega_{T2}$ como se fossem parametros distintos, mas a tabela do modelo define ambos como $\omega_H$. Se $\omega_R = \omega_{T2} = \omega_H$, a ordering $\omega_R < \omega_{T2}$ e contradita. **Isso sugere que o modelo real e mais rico que a tabela** --- possivelmente $\omega_H$ difere por tipo (rapid: $\omega_H^R$; threshold: $\omega_H^T$) --- mas essa distincao nao e formalizada.

**Veredicto:** Correto SE $\omega_R \neq \omega_{T2}$, o que requer corrigir a tabela do modelo.

### Remark 1 (Absorptive composition)

**Enunciado:** Claro e preciso. Formato adequado para um remark (resultado mecanico, nao politico).

**Prova:** Completa e correta. Algebra elementar.

**Veredicto:** Sem problemas.

### Proposition 1 (Democratic fragility pattern)

**Enunciado:** Estrutura (a)/(b) clara. Mas as condicoes sao "Under A1-A7" sem especificar quais parametros sao necessarios para cada parte. Compare com a prova de P3 que lista 5 condicoes explicitas --- P1 deveria fazer o mesmo.

**Prova:** Sketch. (a) afirma que "credible commitment reduces $v_{i1}$" e "keeping $\pi_1 < \bar{\pi}_D^{\text{fall}}$" sem demonstrar. Nao ha calculo de $\pi_1$ como funcao de $C_D$, $v_i$, $\omega_R$. (b) afirma que "with $v = 1$, $\pi_2 > \bar{\pi}_D^{\text{fall}}$" sem derivar $\pi_2$ do modelo.

**Problema critico:** A prova de (a) depende de um equilibrio de coordenacao que nunca foi caracterizado. Qual e o cutoff $s^*$ sob o qual trabalhadores protestam? Como $\pi_1$ e derivado desse cutoff? Sem essa derivacao, a prova e um argumento verbal, nao uma demonstracao.

**Veredicto:** Argumento verbal plausivel, mas nao e prova formal.

### Proposition 2 (Autocratic fragility pattern)

**Enunciado:** Paralelo a P1. Bom.

**Prova:** Mesmos problemas de P1. (a) afirma "protest exceeds $\bar{\pi}_A^{\text{fall}}$" sem calculo. (b) afirma "$v = 1 - B$, $\pi < \bar{\pi}_A^{\text{fall}}$" sem derivacao.

**Problema adicional:** A prova de (a) cita "Corollary 1: $C_A$ in sweet spot" --- mas C1 so e enunciado na Secao 4.5, DEPOIS de P2. Referencia circular.

**Veredicto:** Sketch com referencia circular.

### Proposition 3 (Crossed fragility)

**Enunciado:** Existencial ("there exist parameter ranges"). Aceitavel para CP, mas Board & Meyer-ter-Vehn preferem condicoes construtivas.

**Prova:** Lista 5 condicoes (i)-(v) e aponta para o exemplo numerico. Isso e prova por exemplo, nao prova geral. A afirmacao "holds for an open set in parameter space" nao e demonstrada.

**Veredicto:** Argumento de existencia valido (o exemplo numerico e um ponto no espaco parametrico), mas a generalidade e afirmada sem prova. Para CP, aceitavel se o autor reconhecer a limitacao.

### Proposition 4 (Welfare cost)

**Enunciado:** Claro e preciso. A formula e correta.

**Prova:** Correta. Algebra simples.

**Problema:** Resultado trivial. A diferenca vem inteiramente de $\Omega_2^R > \Omega_2^T$ (R1), que e mecanico. Nao envolve nenhum mecanismo politico. Deveria ser Remark.

**Veredicto:** Correto mas inflado.

### Corollary 1 (Sweet spot of $C_A$)

**Enunciado:** Bem definido. $C_A^{\min}$, $C_A^{\max}$, condicao de non-emptiness.

**Prova (Appendix):** Usa IVT corretamente. Bounds analiticos ($C_A^{\text{dom}}$) e numericos. Completa.

**Problema:** Deveria ser Proposition, nao Corollary. E o resultado que gera a tipologia de autocracias, que e uma contribuicao substantiva.

**Veredicto:** Bom resultado, bem demonstrado, mal categorizado.

### Proposition 5 ($\sigma_A$ amplification)

**Enunciado:** 3 partes (a, b, c). Verbal, nao formal (sem derivadas parciais explicitas).

**Prova (Appendix):** Adequada. A algebra de $z_R$ e $z_T$ e clara. A condicao suficiente em (a) e explicita. (b) e (c) seguem da monotonia.

**Problema:** O enunciado de (b) diz "$p_T$ remains above $1/2$ provided $\omega_{T2}$ is sufficiently above $\bar{\omega}_A(\sigma_A)$" --- isso e uma tautologia ($p_T > 1/2$ iff $\omega_{T2} > \bar{\omega}_A$). O resultado substantivo e que, para a faixa empiricamente relevante de $\sigma_A$, a condicao e satisfeita --- mas isso depende de calibracao, nao de teoria.

**Veredicto:** Estatica comparativa correta, mas parcialmente tautologica.

### Remark 2 (Standing compensatory capacity)

**Enunciado:** Claro e intuitivo. "Pre-committed insurance bypasses the prosperity trap."

**Prova:** "Follows immediately." OK --- e trivial dado o modelo.

**Veredicto:** Adequado como Remark.

---

## Sugestoes Construtivas

### Prioridade 1 (resolver antes de submissao)

1. **Resolver a inconsistencia $\omega_H / \omega_R / \omega_{T2}$.** A tabela do modelo (Sec 3.1) diz que tanto rapid quanto threshold usam $\omega_H$ no periodo de crise, mas o corpo usa $\omega_R$ e $\omega_{T2}$ como valores distintos. Opcoes: (a) abandonar $\omega_H/\omega_L$ e usar diretamente $\omega_R, \omega_{T1}, \omega_{T2}$ como primitivas com $\omega_{T2} > \omega_R > \omega_{T1}$; (b) redefinir a tabela com dois niveis distintos ($\omega_H^R$, $\omega_H^T$). A opcao (a) e mais limpa.

2. **Definir formalmente o conceito de equilibrio.** Antes da Secao 3.3 (ou no inicio dela), incluir: "Definition 1 (Equilibrium). A monotone strategy profile $\{a_i^*(s_i)\}$ is a Bayesian Nash equilibrium if..." e citar Morris & Shin (2003) ou a referencia canonica de global games usada.

3. **Definir $\bar{\omega}_D$ explicitamente.** Se e o $\omega$ que gera protesto suficiente para voice trigger em democracia, derivar da equacao de protesto. Se e simplesmente $\bar{\pi}_D^{\text{comp}}$ traduzido para o espaco de $\omega$, dizer isso.

4. **Mover a Definicao de crossed fragility para antes de P1.**

5. **Incluir $\omega_0$ nas assumptions.** Se e primitiva, deve estar em A8 (ou A8a). Se e derivado, mostrar a derivacao.

### Prioridade 2 (melhorar substancialmente)

6. **Fortalecer as provas de P1 e P2.** Derivar $\pi_t$ como funcao de $(C_x, v_i, \omega_t)$ no equilibrio de cutoff. Mostrar o cutoff $s^*$ e o protesto resultante. Isso conecta a estrutura de global games ao resultado de crossed fragility.

7. **Decompor A8** em 3 assumptions separadas: (A8a) distribuicao do ruido, (A8b) threshold funcional, (A8c) restricao parametrica.

8. **Incluir figuras existentes.** Os PDFs `fig_income_paths.pdf`, `fig_mechanism_flow.pdf`, `fig_parametric_space.pdf` ja existem em `figures/` e seriam valiosos no texto.

9. **Promover C1 a Proposition** e rebaixar P4 a Remark.

10. **Condensar Secao 2** de ~4 paginas para ~1.5 paginas. Manter os 4 cenarios como paragrafos curtos, remover a subsecao 2.2 (redundante com Sec 3.4).

### Prioridade 3 (polish)

11. **Numerar steps nas provas mais longas** (P3, C1, P5).

12. **Adicionar mini-sensibilidade no exemplo numerico** ($\omega_R = 0.25, 0.30, 0.35$; $\sigma_A = 0.10, 0.15, 0.20$) para demonstrar robustez.

13. **Usar notacao mais distintiva para $\Omega_t$ vs. $\omega_t$** --- considerar $D_t$ (displaced stock) ou $S_t$ (stock) para o acumulado.

14. **Reordenar A1-A9** por plausibilidade, com as mais restritivas (A8, A9) por ultimo e discussao explicita de sua forca.

15. **Formalizar o enunciado de P5** com derivadas parciais explicitas: $\frac{\partial p_R}{\partial \sigma_A} < 0$ e $\frac{\partial |\mathcal{I}|}{\partial \sigma_A} > 0$.

---

## Resumo Executivo

O manuscrito tem uma ideia forte e uma estrutura de resultados bem organizada (L1, R1, P1-P5, C1), com tabelas-resumo eficazes e um exemplo numerico ilustrativo. Os principais problemas de apresentacao tecnica sao: (1) inconsistencia notacional critica em $\omega_H/\omega_R/\omega_{T2}$ que mina a coerencia formal do modelo; (2) ausencia de definicao formal de equilibrio, essencial para um modelo de coordenacao; (3) provas de P1-P3 que sao sketches verbais, nao demonstracoes; (4) ordem de exposicao nao-canonica com Secao 2 excessivamente longa. Os itens (1)-(3) sao resolviveis sem alterar o modelo ou os resultados. O score 6.5/10 reflete um manuscrito com bom conteudo mas apresentacao tecnica que precisa de trabalho antes de submissao a um journal com expectativas formais (JOP, BJPS, AJPS).
