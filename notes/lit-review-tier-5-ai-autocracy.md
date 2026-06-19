# Tier 5 — AI, autocracia, vigilancia

**Data**: 2026-05-03
**Contexto**: Lit review sistematica para o Paper IA-dem (Paper 1: foco democracia/Tipo B; Paper 2 da agenda: AI surveillance + autocracia).
**Pergunta-chave**: existe tensao entre "AI fortalece autocracia" (Beraja et al) e "autocracia falha por commitment problem sob choque rapido" (A&R 2000)? Paper 1 deve engajar ou pular Tier 5?

---

## Paper 1 — Beraja, Kao, Yang & Yuchtman (2023). AI-tocracy. *QJE* 138(3): 1349-1402

### Argumento central
Existe um *feedback loop mutuamente reforcador* entre IA (especificamente reconhecimento facial) e regimes autocraticos, demonstrado empiricamente no caso da China. O loop tem dois bracos:
1. **Politica → Tecnologia**: instabilidade local (unrest) leva a maior procurement de IA pelo governo.
2. **Tecnologia → Politica**: maior procurement de IA suprime unrest subsequente E simultaneamente acelera a inovacao das firmas contratadas (49% mais produtos em 2 anos), criando vantagem comparativa em surveillance AI.

A novidade analitica e mostrar que a tecnologia nao e apenas *insumo* da repressao mas que a propria repressao gera *demanda industrial* que retroalimenta capacidade tecnologica, criando um equilibrio "AI-tocracy" auto-reforcador.

### Mecanismo
- Vigilancia preventiva: deteccao de protestos via reconhecimento facial + GDELT-mensuravel reduz custos de identificacao de dissidentes.
- Procurement como subsidio implicito de R&D: contratos governamentais financiam aprendizado de firmas que depois exportam (ver Beraja, Kao, Yang, Yuchtman 2024 sobre exportacao de surveillance state).
- Janela temporal: dados 2014-2020 cobrem 9.267 incidentes de unrest, periodo de consolidacao do estado de vigilancia chines pos-Xinjiang.
- **Importante**: o mecanismo e sobre *unrest politico*, nao sobre *choque economico*. O paper nao endogeneiza a fonte do unrest (greves trabalhistas, protestos etnicos, descontentamento economico ficam todos agregados sob "incidentes").

### Implicacao para autocracia sob choque economico
**Implicacao direta limitada, mas sugestiva**: se choque economico gera unrest, o feedback loop AI-tocracy pode amortecer a transmissao unrest→regime change. IA aumenta a η_R (capacidade repressiva) endogenamente. Para o IA-dem, isso sugere que autocracias com vantagem comparativa em surveillance AI (China e seus importadores) podem ter π̄_A^fall mais alto que autocracias pre-AI.

Porem o paper NAO mostra:
- Se o loop funciona sob choque *massivo* tipo deslocamento rapido (Tipo A) — todos os incidentes sao locais e relativamente pequenos.
- Se funciona sob choque *threshold/sequencial* (Tipo B) — o periodo de dados e antes do AI labor displacement em escala.
- Se a vigilancia detecta *coordination latente* (gente que ainda nao protestou) ou apenas reage a protestos ja iniciados.

### Tensao com A&R 2000
**Tensao moderada, nao frontal**. A&R 2000 supoe que a elite nao consegue se comprometer com redistribuicao futura porque, quando a ameaca passa, ela tem incentivo de reneger. AI-tocracy nao resolve diretamente o commitment problem — resolve um problema *upstream*: aumenta a probabilidade de que a ameaca nunca atinja massa critica. Em linguagem do IA-dem: AI nao muda o πbar^fall via credible commitment, muda a *distribuicao de protesto* π baixando a probabilidade de massa critica.

Mas: se o choque for grande o suficiente para que mesmo com vigilancia avancada o protesto exceda capacidade de monitoramento (information cascade, Yang 2025 abaixo), o problema A&R volta com toda a forca, agora *amplificado* porque o regime investiu em surveillance e nao em capacidade compensatoria. **Implicacao**: AI-tocracy estabiliza autocracias contra choques pequenos/medios mas pode aumentar a fragilidade em choques grandes via mis-investment.

---

## Paper 2 — Yang, E. (2025). The limits of AI for authoritarian control. *AJPS* (forthcoming, doi 10.1111/ajps.70045)

### Argumento central
**Status confirmado**: aceito em AJPS, doi 10.1111/ajps.70045 (online 2025). Versao working paper de maio 2025 disponivel em eddieyang.net.

A IA nao e tao util para controle autoritario quanto Beraja et al sugerem, por uma razao endogena ao proprio regime: a *autoritarian data problem*. O comportamento estrategico dos cidadaos sob repressao (auto-censura, preference falsification, linguagem codificada) degrada os dados de treinamento. Como resultado, **mais repressao → menos sinal nos dados → IA pior**.

Crucialmente: a degradacao e *pior em momentos de crise*, exatamente quando o regime mais precisa da IA. Em crises, information cascades e revelation of regime weakness fazem cidadaos *abandonarem* preference falsification, mudando a distribuicao de linguagem online em formas que a IA treinada em dados pre-crise classifica mal.

### Mecanismo
- Cidadaos como agentes estrategicos: aprendem o que a IA censura e adaptam linguagem.
- Treinamento em dados endogenos: o regime so observa o que cidadaos *expressam*, nao o que pensam.
- Acuracia decai com nivel de repressao: evidencia experimental + dados de censura no Weibo vs Twitter.
- Em crises: comportamento estrategico colapsa (revelation), mas o modelo treinado nao se adapta a tempo.
- Mitigacao parcial: dados de plataformas internacionais (Twitter) ajudam mas nao fecham o gap.

### Implicacao para autocracia sob choque economico
**Implicacao direta forte**: choque economico massivo (Tipo A rapido) gera exatamente o tipo de crise em que a authoritarian data problem morde mais. Quando deslocamento atinge massa critica, cidadaos abandonam auto-censura → IA classifica mal → vigilancia falha exatamente quando o regime mais precisa.

Para o IA-dem, isso *fortalece* o argumento de que autocracia e fragil sob Tipo A (deslocamento rapido visivel): a infraestrutura de vigilancia que protegia contra unrest cotidiano falha sistematicamente em momentos de cascade. Yang fornece microfundacao para "η_R nao e constante — colapsa sob crise".

### Tensao com A&R 2000
**Complementar, nao tensao**. Yang nao trata commitment, mas reforca o canal que A&R supoe: em crise grande, repressao falha → autocracia precisa decidir entre concessao (com problema de commitment) e queda. Yang mostra *por que* a repressao falha endogenamente em crise. A&R explica *o que acontece depois* que falha.

Yang tambem oferece um contraste empirico explicito a Beraja et al: a inferencia de "AI fortalece autocracia" baseada em dados normais subestima a falha em crise. Isso e o ponto preciso onde IA-dem pode ancorar Paper 2.

---

## Paper 3 — Guriev & Treisman (2019). Informational Autocrats. *JEP* 33(4): 100-127

### Argumento central
Ditaduras modernas em sua maioria nao sao mais baseadas em repressao em massa mas em *manipulacao de informacao*. "Informational autocrats" inflam artificialmente sua popularidade convencendo o publico de que sao competentes — usando propaganda, cooptacao da elite, censura sutil. Diferente de "overt dictators" (Coreia do Norte, Eritreia), informational autocrats (Putin pre-2014, Erdogan, Orban, Chavez) buscam *manter a aparencia* democratica.

### Mecanismo
- Ditador tem tipo desconhecido (competente vs incompetente).
- Cidadaos inferem competencia de tres sinais: padrao de vida, propaganda estatal, mensagens da elite informada via media independente.
- Ditador investe em propaganda + co-opting/silenciar elite informada.
- Repressao visivel sinaliza incompetencia (porque competente nao precisa) → ditador minimiza repressao visivel.
- Equilibrio: massa apoia, elite ceptica mas comprada/silenciada.

### Implicacao para autocracia sob choque economico
**Implicacao distintiva**: o vinculo entre padrao de vida e legitimidade e *direto*. Choque economico que reduz padrao de vida materialmente (Tipo A rapido) destroi um dos tres sinais de competencia → propaganda precisa compensar — mas propaganda e *menos critica* quando dados materiais contradizem. Informational autocrats sao *mais fragis sob choque economico visivel* que old-style dictators que ja se baseavam em repressao crua.

Para Tipo B (threshold/prosperity trap em autocracia): durante a fase de complementaridade, padrao de vida sobe → sinal de competencia reforcado → autocracia *mais estavel* exatamente nessa fase. Quando o threshold e cruzado, queda no padrao de vida e abrupta → propaganda nao consegue compensar → fragilidade abrupta.

Isso da uma versao autocratica da "prosperity trap" do Tipo B: durante complementaridade, autocrata informacional acumula legitimidade que despreza investimento em capacidade compensatoria (igual ao mediano democratico). Quando o threshold cai, infraestrutura compensatoria nao existe e legitimidade colapsa.

### Tensao com A&R 2000
**Reformulacao, nao tensao direta**. A&R 2000 pensa autocracia como elite vs massa com transferencia de poder via democratizacao. Guriev-Treisman pensa autocracia como ditador vs elite informada vs massa, com o canal de queda sendo *informacional* (massa percebe incompetencia) em vez de *redistributivo* (elite cede poder para evitar revolucao).

Para IA-dem, ambos podem coexistir: A&R 2000 e o canal estrutural sob choque grande (commitment falha → revolucao); Guriev-Treisman e o canal informacional sob choque qualquer (legitimidade colapsa). Choque rapido visivel ataca ambos os canais simultaneamente.

---

## Paper 4 — Guriev & Treisman (2020). A theory of informational autocracy. *JPubE* 186: 104158

### Argumento central
Formalizacao do argumento de 2019. Modelo com ditador que escolhe portfolio de instrumentos: propaganda, censura de media independente, cooptacao de elite, repressao policial. Cada instrumento tem custo financiado as custas do consumo publico. **Resultado central**: informational autocracies prevalecem sobre old-style violent dictatorships quando a elite informada e *suficientemente grande* (para que repressao seja muito cara) mas *nao tao grande* a ponto de nao poder ser comprada/censurada. Acima desse limite, democracia.

### Mecanismo
- Ditador maximiza utilidade (poder + rendas) sob restricao de ser deposto se massa percebe baixa competencia.
- Tres tecnologias de controle: propaganda (afeta sinal direto), censura (afeta sinal da elite), repressao (afeta custo de protesto), cooptacao (transforma elite em aliada paga).
- Comparative statics: quanto mais elite informada, menos eficiente repressao; quanto mais conectividade, mais cara censura; quanto maior renda, mais barata cooptacao.
- Equilibrio com tres regimes possiveis: overt dictatorship (elite pequena, repressao pura), informational autocracy (elite media, mix), democracia (elite grande, controle informacional impossivel).

### Implicacao para autocracia sob choque economico
- **Choque que destroi rendas**: cooptacao fica mais cara → ditador desloca para repressao → mas se elite e grande, repressao tambem nao funciona → transicao para democracia.
- **Choque que aumenta visibilidade da incompetencia**: propaganda menos eficiente → mesmo equilibrio se desestabiliza.
- **Implicacao chave para IA-dem**: o portfolio otimo do ditador e *endogeno ao choque*. Sob choque economico grande, AI surveillance sozinha nao basta — e preciso aumentar tambem cooptacao da elite, que custa rendas que estao caindo. Restricao orcamentaria do ditador morde dupla. Conexao com "selectorate fiscal" do modelo IA-dem v3 anterior.

### Tensao com A&R 2000
A&R 2000 tem dois agentes (elite, massa); Guriev-Treisman 2020 tem tres (ditador, elite informada, massa). A&R 2000 supoe que elite e *unitaria* e enfrenta commitment problem com massa. GT 2020 mostra que o ditador pode *dividir a elite* via cooptacao seletiva, deslocando o problema. Ambos chegam a previsao similar (autocracia fragil sob choque grande) mas via canais diferentes.

Para IA-dem: se Paper 1 quer ser parsimonioso, A&R 2000 basta. Se Paper 2 vai a fundo, GT 2020 da microfundacao mais rica da escolha de instrumentos.

---

## Sintese: como autocracias respondem a choques tecnologicos?

### Quadro consolidado

| Canal de fragilidade | Microfundacao | Como AI surveillance afeta | Sob Tipo A (rapido) | Sob Tipo B (threshold) |
|---|---|---|---|---|
| **Commitment problem** (A&R 2000) | Elite nao consegue se comprometer com compensacao futura → revolucao racional | Indireta: AI baixa probabilidade de massa critica, mas nao resolve commitment | Fragil — choque grande supera vigilancia | Estavel ate threshold; abrupta depois |
| **Informational legitimidade** (GT 2019/2020) | Massa infere competencia de padrao de vida + propaganda + elite | AI ajuda na propaganda e censura, mas authoritarian data problem (Yang 2025) | Fragil — padrao de vida cai, propaganda perde tracao | Estavel na fase de complementaridade; abrupta no threshold |
| **Surveillance / repressive capacity** (Beraja et al 2023) | Vigilancia preventiva detecta coordinacao | Diretamente fortalecida por AI procurement loop | Falha em massa critica (Yang 2025) | Funciona enquanto crise nao e visivel |
| **Authoritarian data problem** (Yang 2025) | Cidadaos estrategicos degradam dados de treino | Limita IA exatamente em crise | Falha mais aguda — cascade colapsa modelo | Pode funcionar bem na fase 1; falha no threshold |

### Padrao consistente entre os quatro papers
**Autocracias modernas (informational + surveillance-capable) sao MAIS estaveis que old-style autocracies sob choques pequenos/medios mas potencialmente IGUAIS ou MAIS fragis sob choques grandes/visiveis**. A razao: o investimento em controle informacional e surveillance gera complacencia institucional quanto a capacidade compensatoria, e os instrumentos modernos (propaganda, AI censura, cooptacao) tem caracteristica comum de degradar nao-linearmente sob crise.

### Implicacao para a tipologia IA-dem
A tipologia Tipo A vs Tipo B funciona em autocracias com adaptacoes:
- **Tipo A em autocracia**: (i) authoritarian data problem (Yang) faz vigilancia falhar em cascade; (ii) propaganda perde tracao com sinal material adverso (GT 2019); (iii) commitment problem residual (A&R 2000) — autocracia fragil. Resultado: autocracia *cai* sob Tipo A, ainda que com lag maior que democracia se vigilancia funcionar inicialmente.
- **Tipo B em autocracia**: (i) durante complementaridade, autocrata informacional acumula legitimidade; (ii) infraestrutura compensatoria nao se forma (igual ao mediano democratico); (iii) no threshold, colapso abrupto duplo (legitimidade + commitment). Resultado: autocracia tambem fragil sob Tipo B, possivelmente *mais* que democracia porque elite informacional foi cooptada e nao tem voz para sinalizar crise antecipadamente.

**A "prosperity trap" do Paper 1 nao e exclusiva de democracia**. Aplica-se a *qualquer regime onde o mediano da coalizao de apoio prospera durante a fase 1*. Em autocracia informacional, a "coalizao de apoio" e a massa cuja legitimidade vem do padrao de vida — exatamente quem prospera em complementaridade.

---

## Para o Paper 1 IA-dem: engajar ou pular?

### Recomendacao: **engajar minimamente, mas com precisao**

O Paper 1 foca democracia/Tipo B. Autocracia entra como contraste citando A&R 2000. Recomendacao concreta:

**Pular**:
- Beraja et al 2023 detalhado (Paper 2 da agenda)
- GT 2020 modelo formal (Paper 2)
- Discussao de portfolio de instrumentos do ditador

**Engajar (1 paragrafo, 2-3 referencias)**:
- Citar GT 2019 *uma vez* para justificar que autocracias modernas sao informacionais e nao puramente repressivas. Justifica por que A&R 2000 sozinho e insuficiente: o canal de queda nao e so revolucao mas tambem colapso de legitimidade informacional.
- Citar Yang 2025 *uma vez* para justificar por que vigilancia AI nao salva autocracia sob choque grande — fornece o "trip wire" empirico que impede o leitor de pensar "mas a China tem AI surveillance, isso nao muda tudo?".
- Manter A&R 2000 como microfundacao primaria do canal autocratico, pelos motivos do reframing: parcimonia e ja na bibliografia.

**Texto sugerido (esboco) para a secao de autocracia (Sec ~3 ou ~5 do Paper 1)**:

> "Modelamos a saida autocratica via commitment problem (Acemoglu & Robinson 2000): sob choque economico grande, a elite nao consegue se comprometer com compensacao futura, gerando colapso. Reconhecemos que autocracias contemporaneas sao em geral informacionais (Guriev & Treisman 2019), nao puramente repressivas, e que a expansao de surveillance AI poderia em principio amortecer transmissao de protesto a queda (Beraja et al 2023). Mas evidencia recente sugere que essa capacidade *colapsa* exatamente sob crises de larga escala, quando o comportamento estrategico dos cidadaos degrada os dados de treino (Yang 2025). Essa fragilidade da vigilancia em crise garante que o canal A&R permanece operativo no caso de choque rapido, e nos preserva o foco na arquitetura de coalizao da democracia."

Isso adiciona 3 referencias, fecha um buraco previsivel de revisor ("AI surveillance muda tudo, certo?"), e nao desvia do argumento central.

### O que NAO fazer no Paper 1
- Nao formalizar surveillance: amplia o modelo, suga atencao do Tipo B em democracia.
- Nao discutir trade-off entre instrumentos do ditador (GT 2020): topico de Paper 2.
- Nao tratar Tipo B em autocracia detalhadamente: contraste estrutural basta. Mencionar em uma frase ("o argumento de coalition absence se aplica analogamente a autocracias informacionais cuja base de legitimidade prospera durante complementaridade — desenvolvemos isso em trabalho subsequente") e suficiente.

---

## Para o Paper 2 da agenda: o que precisa ser construido?

### Pergunta de pesquisa Paper 2
Como a expansao de AI surveillance afeta a relacao tradicional entre choque economico e estabilidade autocratica?

### Roadmap

**Bloco 1 — Microfundacao herdada (replicar receita do Paper 1)**
1. Beraja et al 2023 → AI-tocracy feedback loop como primitiva de η_R endogena
2. GT 2019/2020 → portfolio de instrumentos do ditador (propaganda, censura, cooptacao, repressao)
3. Yang 2025 → authoritarian data problem como mecanismo de degradacao em crise
4. A&R 2000 → canal de queda residual quando os tres anteriores falham

**Bloco 2 — Contribuicao original possivel**
- **Tese candidata 1**: AI surveillance gera *over-investment* em vigilancia que reduz elasticidade de resposta a choques. Autocracias com alta capacidade AI sao *mais* fragis sob Tipo A grande, nao menos. Empirico: comparar volatilidade de regime entre autocracias high-AI (China) vs low-AI (Russia, Iran) sob choques economicos pos-2018.
- **Tese candidata 2**: Tipo B em autocracia informacional e qualitativamente novo: complementaridade gera *consenso ilusorio* (preference falsification + dados degradados sub-reportam dissent), de modo que ate o ditador nao sabe o tamanho real da fragilidade. No threshold, colapso e ainda mais abrupto que em democracia.
- **Tese candidata 3** (mais ambiciosa): exportacao de surveillance AI (Beraja et al 2024) como mecanismo de *contaminacao* de fragilidade — paises importadores adquirem a infraestrutura mas nao a capacidade industrial, ficando expostos ao authoritarian data problem sem o feedback loop de inovacao.

**Bloco 3 — Estrategia formal**
- Estender modelo IA-dem v3 (selectorate + instrumentos fiscais) para incluir vigilancia como instrumento adicional do incumbente autocratico.
- Variavel de escolha: mix entre vigilancia e compensacao, sob restricao orcamentaria.
- Resultado-chave esperado: existencia de "surveillance trap" analoga a "prosperity trap" — autocracia investe em vigilancia que e mal-adaptada a crise, e quando crise vem, capacidade compensatoria nao foi construida.
- 2 estados (Tipo A vs Tipo B) + 2 regimes (autocracia high-AI vs low-AI) + 1 instrumento adicional (vigilancia).

**Bloco 4 — Empirica complementar (se for paper teorico-empirico)**
- Dataset chave: V-Dem (regime + vigilancia) + Beraja et al data (AI procurement) + IMF labor exposure to AI (Cazzaniga et al 2024).
- Identificacao: choque exogeno (e.g., difusao de modelos de fundacao em setor especifico) interagido com nivel de capacidade AI do regime.

**Bloco 5 — Pre-requisitos**
- Paper 1 publicado ou avancado (estabelece a tipologia A vs B).
- Releitura aprofundada de GT 2020 (modelo formal completo).
- Consultar versao final publicada de Yang 2025 quando sair de "online first".
- Eventual contato com Yang ou Beraja para feedback antes de submeter.

### Encaixe com agenda existente
Conforme CLAUDE.md, a agenda tem:
- Paper 2: AI Surveillance and Repressive Capacity (status: ideacao feita, formalizacao pendente)
- Paper 3: Interacao automacao × surveillance (status: conceitual)

Sugestao de fundir os dois em um Paper 2 unico cujo *cerne* e Tipo A em autocracia high-AI vs low-AI, com Tipo B aparecendo como extensao. Paper 3 separado faz sentido apenas se a interacao tiver dinamica nao-trivial que nao caiba como secao.

---

## Referencias citadas neste documento

- Acemoglu, D., & Robinson, J. A. (2000). Why did the West extend the franchise? Democracy, inequality, and growth in historical perspective. *Quarterly Journal of Economics*, 115(4), 1167-1199.
- Beraja, M., Kao, A., Yang, D. Y., & Yuchtman, N. (2023). AI-tocracy. *Quarterly Journal of Economics*, 138(3), 1349-1402.
- Beraja, M., Kao, A., Yang, D. Y., & Yuchtman, N. (2024). Exporting the surveillance state via trade in AI. NBER WP 31676 / Brookings Papers.
- Cazzaniga, M., et al. (2024). Gen-AI: Artificial Intelligence and the Future of Work. IMF Staff Discussion Note.
- Guriev, S., & Treisman, D. (2019). Informational autocrats. *Journal of Economic Perspectives*, 33(4), 100-127.
- Guriev, S., & Treisman, D. (2020). A theory of informational autocracy. *Journal of Public Economics*, 186, 104158.
- Yang, E. (2025). The limits of AI for authoritarian control. *American Journal of Political Science* (forthcoming, doi 10.1111/ajps.70045). Working paper version: eddieyang.net/research/AI_dilemma.pdf.
- Adam, Z., & Golovics, J. (2025). Informational autocracy at work: Evidence from Hungarian anti-immigration campaigns. *Journal of Comparative Politics* (Sage).

---

## Notas de procedencia

- Conteudo construido a partir de WebSearch (sem WebFetch — permissao negada para PDFs diretos).
- Todas as quatro referencias do Tier 5 confirmadas: Beraja et al QJE 2023 (publicado), Yang AJPS 2025 (online first, doi confirmado), GT JEP 2019 (publicado), GT JPubE 2020 (publicado).
- Busca por papers 2024-2026 sobre "AI economic shock + autocracia + Tipo B" retornou *nenhum paper que cubra Tipo B em autocracia formalmente* — gap real, sustentando que Paper 2 da agenda pode reivindicar contribuicao original nesse espaco.
- Referencia adicional encontrada (Adam & Golovics 2025): aplicacao empirica de informational autocracy ao caso Hungria. Util como exemplo, nao como microfundacao.
