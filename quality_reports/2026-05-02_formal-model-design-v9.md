# Parecer de Design do Modelo (Dixit / Varian / Board)

**Manuscrito**: "AI and Regime Stability: How Selectorate Size Shapes the Political Consequences of Automation"
**Autores**: Galdino & Mignozzetti
**Data do parecer**: 2026-05-02
**Versao avaliada**: paper.Rmd (v5 Alt C, pos-reformulacao)

---

## Score: 7.5 / 10

---

## O modelo em uma frase

Um modelo de dois periodos com triggers de compensacao assimetricos por regime (voz democratica vs. avaliacao tecnocratica autocratica) mostra que democracias sao frageis sob automacao por limiar (a prosperidade da fase complementar bloqueia a resposta preventiva) e autocracias sao frageis sob deslocamento gradual (a bolha informacional impede a elite de ver a crise acumulada).

## Tipo de contribuicao (Board & Meyer-ter-Vehn)

**Pergunta nova + forca politica isolada.** O paper identifica uma pergunta genuinamente nova --- como a *trajetoria temporal* do choque economico interage com o tipo de regime para determinar estabilidade --- e isola uma forca politica (o tamanho do seletorado como meta-primitiva que gera simultaneamente vantagem informacional, velocidade de resposta, e politica fiscal). Nao e uma aplicacao de modelo existente a novo contexto; e uma estrutura original que gera um resultado qualitativo (fragilidade cruzada) que nao aparece na literatura anterior.

---

## Avaliacao por dimensao

### MD1. Qualidade da pergunta --- Excelente

A pergunta e forte em todas as subdimensoes:

**Puzzle genuino.** A literatura de estabilidade de regimes trata choques economicos como eventos uniformes definidos por magnitude (Acemoglu & Robinson, Boix, Przeworski). A literatura de automacao distingue trajetorias (Gans & Goldfarb, Frey & Osborne) mas nao as conecta com tipo de regime. A pergunta --- "qual regime e mais fragil sob cada trajetoria?" --- emerge naturalmente da intersecao dessas duas literaturas, e a resposta nao e obvia *a priori*. Um leitor informado poderia razoavelmente esperar que democracias fossem mais estaveis sob ambas as trajetorias (por serem mais responsivas) ou que autocracias fossem mais estaveis (por serem mais rapidas). O resultado cruzado e surpresa genuina.

**Compreensibilidade.** A pergunta e compreensivel para nao-especialistas: "a IA vai desestabilizar democracias ou ditaduras?" E uma pergunta que um jornalista consegue formular e que um policymaker quer resposta.

**Relevancia ("por que se importar?").** O paper articula bem a relevancia: a IA e a disrupcao economica mais discutida do momento, e a pergunta sobre seus efeitos politicos e urgente. A introducao conecta com declaracoes de CEOs de IA e com projecoes de impacto laboral.

**Insight novo vs. formalizacao de intuicao existente.** Este e o ponto mais forte. A fragilidade cruzada nao e uma intuicao ja articulada informalmente na literatura. A ideia de que democracias sao *mais* vulneraveis que autocracias sob um tipo especifico de choque (threshold) e genuinamente contra-intuitiva. A "armadilha da prosperidade" --- a fase complementar bloqueia ativamente a resposta preventiva --- e um insight original que emerge do modelo e nao de literatura previa.

**Reserva menor**: A conexao com a realidade empirica e necessariamente especulativa, dado que a automacao por IA em larga escala ainda nao ocorreu. O paper e honesto sobre isso, mas a pergunta carrega um risco inerente de ser "prematura" para revisores empiricamente orientados.

### MD2. Simplicidade e KISS --- Adequada (com reservas)

**Premissas stark.** O modelo faz varias escolhas simplificadoras corretas:
- Dois periodos, nao T periodos
- Regime como parametro (x in {D,A}), nao dois modelos separados
- Renda normalizada a 1
- Deslocamento individual Bernoulli
- Safety in numbers linear (h(pi) = pi)

Estas sao decisoes saudaveis no espirito Varian: o modelo nao tenta ser realista, tenta isolar um mecanismo.

**Teste Schelling-Spence.** O modelo passa o teste em varios componentes:
- *Remover a diferenca de velocidade (lag)?* Democracia sobreviveria threshold t=2 (compensaria imediatamente) --- o resultado desaparece. Necessario.
- *Remover a assimetria informacional (sigma_A = 0)?* Elite veria a crise moderada e compensaria --- autocracia sobreviveria rapid. Necessario.
- *Remover a complementaridade (gamma = 0)?* A armadilha da prosperidade enfraquece, mas o mecanismo central (lag + ausencia de infraestrutura previa) persiste. Gamma reforza, mas nao e essencial. **Candidato a remocao no baseline.**
- *Remover o terceiro estado (N)?* Sem N, baixo deslocamento em t=1 sinalizaria univocamente T, e a elite atualizaria corretamente. Necessario para a ambiguidade genuina.
- *Remover o sinal continuo s_{it}?* A informacao privada entra via d_{it} e s_{it}, mas o updating do trabalhador sobre theta usa ambos. Contudo, o mecanismo central (protest --> trigger) nao parece depender criticamente de s_{it} para funcionar --- d_{it} sozinho ja e informativo. O sinal continuo parece mais necessario para a estrutura de global games (cutoff strategies) do que para o mecanismo politico.

**Reservas sobre complexidade:**

1. **Tres canais derivados vs. tres mecanismos independentes.** O paper argumenta que informacao, velocidade, e politica fiscal sao "derivados" do tamanho do seletorado. Em principio, sim. Na pratica, cada um entra no modelo como um parametro ou regra separada (C_A vs C_D; lag vs imediato; voice trigger vs assessment trigger). O leitor pode questionar se isso e realmente *um* mecanismo ou *tres* mecanismos empacotados sob um rotulo. Dixit (2015, Cap. 5) adverte contra modelos que parecem simples mas tem multiplas engrenagens --- cada uma necessaria para o resultado, o que torna o insight menos afiado. A resposta honesta e: o modelo precisa de tres canais porque o resultado cruzado exige tanto assimetria informacional quanto assimetria de velocidade. Um modelo so com informacao ou so com velocidade nao gera fragilidade cruzada. Isso e defensavel, mas deve ser explicitado como custo de complexidade.

2. **Tres estados de natureza (R, T, N).** A justificativa e boa (sem N, nao ha ambiguidade genuina), mas adiciona complexidade ao updating. Num modelo de 2 periodos com 3 estados, o numero de cenarios a rastrear (4 celulas x 2 periodos x 2 regimes) ja e elevado. O paper lida bem com isso via tabelas resumo, mas a carga cognitiva e real.

3. **Gamma (complementaridade) e delta (desconto).** Gamma entra apenas no trigger democratico via custo fiscal; delta entra na utilidade expressiva. Ambos reforcam resultados existentes sem gerar insights novos proprios. Pelo principio KISS, gamma poderia ser relegado a extensao e delta fixado em 1 no baseline. O paper ja trata gamma como "entra via trigger", mas formalmente e um parametro adicional que o leitor deve rastrear.

### MD3. Isolamento do mecanismo --- Adequada

**Mecanismo central.** O mecanismo politico central esta claramente articulado: o tamanho do seletorado determina (a) quao bem o regime *ve* a crise (informacao) e (b) quao rapido ele *responde* (velocidade). Crises graduais favorecem quem ve melhor. Crises subitas favorecem quem responde mais rapido. Cada regime e vulneravel ao tipo de crise que neutraliza sua vantagem institucional.

**Isolamento.** O modelo isola o mecanismo da seguinte forma: remover a diferenca de seletorado (C_A = C_D, lag = 0, sigma_A = 0) e os regimes tornam-se identicos, a fragilidade cruzada desaparece (Proposicao 5, discussao). Isso e o teste correto.

**Reservas:**

1. **Triggers assimetricos como "conteudo institucional" vs. premissa imposta.** O paper argumenta que o trigger democratico (voz) e o autocratico (avaliacao tecnocratica) sao o "conteudo institucional" do modelo, nao uma conveniencia. A argumentacao e boa, mas permanece a questao: estes triggers sao *derivados* do tamanho do seletorado ou *escolhidos* para gerar o resultado desejado? Uma derivacao mais forte mostraria que um regime com seletorado grande *otimamente* usa protesto como sinal (porque e o canal mais informativo disponivel), enquanto um regime com seletorado pequeno *otimamente* usa indicadores economicos (porque protesto suprimido e uninformativo). O paper reconhece isso como limitacao (Secao 5), mas e uma limitacao significativa: sem essa derivacao, o modelo e vulneravel a critica de que os triggers foram escolhidos para produzir o resultado.

2. **Incumbent passivo vs. estrategico.** O incumbent decide comp_t apos observar pi_t, mas a decisao e essencialmente mecanica: comp = 1 iff trigger ativado. O papel estrategico do incumbent e limitado. Nos triggers atuais, a democracia compensa iff pi > pi_bar^comp (mecanico), e a autocracia compensa iff omega_S > omega_bar_A (mecanico, baseado em sinal ruidoso). Nao ha dilema genuino do incumbente --- nao ha trade-off entre compensar e reprimir, entre gastar e investir em outra coisa. A reformulacao planejada (quality_reports/plans/2026-05-01) endogeneiza a decisao do incumbente via inferencia bayesiana sobre omega a partir de pi, o que e uma melhoria importante. Mas no manuscrito atual, o "incumbente estrategico" e mais rotulo que substancia.

3. **Separacao dos canais.** O modelo atribui informacao a C_x (custo de protesto), velocidade a lag/decreto, e politica fiscal a trigger assimetrico. Mas na realidade, estes canais interagem: um regime com informacao ruim *e tambem* um regime onde o custo de protesto e alto, *e tambem* um regime com lag zero. O modelo nao permite variar um canal mantendo os outros fixos (exceto C_A e sigma_A na estatica comparativa). Uma proposicao que mostrasse "se mantivermos informacao constante e variarmos apenas velocidade, o resultado X muda de direção Y" daria ao leitor confianca de que os canais sao genuinamente separaveis.

### MD4. Riqueza de insights --- Adequada

**Alem da pergunta original.** O modelo gera varios insights alem da fragilidade cruzada:

1. **Tipologia de autocracias** (Corolario 1): autocracias "abertas" (C_A baixo), intermediarias (sweet spot), e totalitarias (C_A alto). Apenas as intermediarias exibem fragilidade cruzada. Isso e um resultado genuinamente util que conecta com a classificacao de Geddes (1999) e gera predicoes testáveis: regimes com capacidade repressiva intermediaria sao os mais vulneraveis a deslocamento gradual.

2. **Amplificacao pelo seletorado** (Proposicao 5): reduzir o seletorado amplifica ambos os lados da fragilidade cruzada simultaneamente --- mais cego a crises moderadas E mais rapido em crises massivas. "Dois lados da mesma moeda institucional" e uma formulacao elegante.

3. **Custo de bem-estar** (Proposicao 4): mesmo quando ambos os regimes sobrevivem sua trajetoria favoravel, trabalhadores estao melhor na democracia. Resultado de composicao (Remark 1), nao de compensacao. Contra-intuitivo e informativo.

4. **Remark 2 (seguro social pre-comprometido)**: democracia com compensacao automatica e estavel sob ambas as trajetorias. Implicacao direta para policy.

**Resultados contra-intuitivos.** O resultado mais contra-intuitivo e que a *prosperidade* (fase complementar) e a vulnerabilidade da democracia: e precisamente o periodo de bonanca que impede a construcao da infraestrutura de seguro social. Isso inverte a intuicao usual de que prosperidade e boa para estabilidade.

**Reservas:**

1. **Estatica comparativa limitada.** A tabela de estatica comparativa (Secao 4.4) lista 10 parametros com efeitos monotonocos. Nenhum gera trade-off nao-obvio: C_A sobe, protesto cai; sigma_A sobe, elite fica mais cega. As direcoes sao todas intuitivas. Falta um resultado do tipo "aumentar X melhora o regime numa dimensao mas piora em outra." A amplificacao de sigma_A (Proposicao 5) chega perto, mas o trade-off (mais cego E mais rapido) ja esta embutido na premissa.

2. **Ausencia de extensoes substantivas.** Os appendices "Complementarity extensions" e "Multi-period extension" estao marcados como [TODO]. Para um paper de teoria, extensoes que relaxam premissas e mostram robustez ou novos resultados sao esperadas. A ausencia delas enfraquece a percepcao de "riqueza".

### MD5. Tipo de contribuicao (Board & Meyer-ter-Vehn) --- Excelente

O paper se encaixa no tipo **"Pergunta nova com forca politica isolada"** --- a categoria mais valorizada por Board & Meyer-ter-Vehn.

- **Pergunta nova**: sim. Nenhum modelo formal na literatura conecta trajetoria temporal de automacao com estabilidade de regime.
- **Modelo novo**: sim, mas construido com pecas conhecidas (seletorado, global games, triggers, lag).
- **Forca politica isolada**: o tamanho do seletorado como gerador simultaneo de informacao, velocidade, e politica fiscal. A "ironia estrutural" --- cada vantagem institucional e tambem uma vulnerabilidade --- e a forca isolada.
- **Aplicacao importante**: IA e a aplicacao mais saliente do momento, mas o resultado se generaliza (crises financeiras, pandemias, mudanca climatica --- qualquer choque com perfil temporal assimetrico).

A combinacao pergunta-nova + forca-isolada + aplicacao-relevante e forte. O paper nao esta meramente formalizando intuicao previa; o resultado cruzado e genuinamente novo.

### MD6. Processo de construcao --- Adequada

**Exemplos concretos antes de generalizar.** O paper segue o conselho de Varian: a Secao 2 ("The Logic of Crossed Fragility") apresenta a logica verbal antes da formalizacao, e a Secao 3.8 (exemplo numerico) fornece parametros concretos que o leitor pode rastrear. Este e um ponto forte --- o leitor entende o resultado *antes* de ver as provas.

**Baseline + extensoes.** A estrutura e baseline (modelo principal) + extensoes (Secao 4: policy implications, Remark 2). Contudo, as extensoes sao limitadas: apenas Remark 2 (seguro pre-comprometido) e realmente desenvolvida. Os appendices prometidos (complementaridade, multi-periodo) estao ausentes.

**Casos especiais informativos.**
- C_A = C_D: regimes identicos, fragilidade cruzada desaparece (implicitamente na tipologia).
- sigma_A = 0: elite com informacao perfeita, veria crise moderada.
- gamma = 0: armadilha da prosperidade enfraquece.

Estes casos sao mencionados mas nao explorados formalmente como lemas separados. No espirito Dixit/Varian, dedicar um paragrafo a cada caso degenerado ajudaria o leitor a entender o que cada premissa "esta fazendo" no modelo.

**Reservas:**

1. **Secao 2 vs. Secao 3: redundancia.** A Secao 2 (logica verbal, ~3 paginas) repete quase exatamente o conteudo que a Secao 3 formaliza e que a Secao 4 demonstra. O conselho de Varian e "exemplo concreto antes de generalizar," nao "exposicao verbal completa antes de formalizacao completa." A Secao 2 poderia ser condensada a 1-1.5 paginas focando apenas na intuicao do resultado cruzado, deixando os detalhes para as proposicoes.

2. **Exemplo numerico bem escolhido.** Os parametros do exemplo numerico sao razoaveis e os resultados sao faceis de rastrear. O paper poderia explorar mais o exemplo: "o que acontece se mudarmos omega_R de 0.30 para 0.15?" ou "com que valor de C_A a autocracia sobrevive rapid?" Estes exercicios ajudariam o leitor a sentir a sensibilidade do resultado.

---

## Veredicto geral sobre design

O design do modelo e **solido e bem motivado**, com uma pergunta forte, um resultado central genuinamente novo (fragilidade cruzada), e uma meta-primitiva (tamanho do seletorado) que organiza os mecanismos de forma coerente. O paper segue as melhores praticas de Varian (exemplo antes de teoria), Dixit (premissas stark), e Board (forca politica isolada).

As fragilidades de design sao de dois tipos:

**Tipo 1: Profundidade mecanica.** O modelo opera com tres canais (informacao, velocidade, politica fiscal) que sao declarados como derivados do seletorado mas formalizados como parametros independentes. O trigger assimetrico e o componente mais vulneravel: e "conteudo institucional" ou "escolha de modelagem que gera o resultado"? A derivacao endogena dos triggers (mencionada como limitacao) resolveria isso e elevaria o paper significativamente.

**Tipo 2: Riqueza das extensoes.** O modelo gera um resultado central forte mas poucas ramificacoes formais. A estatica comparativa e monotona; as extensoes estao incompletas. Para um paper de teoria em top journal, espera-se que o modelo "fale alem da pergunta" com mais substancia --- resultados inesperados que emergem quando se relaxa premissas, trade-offs nao-obvios na estatica comparativa, ou aplicacoes que o autor nao previu inicialmente.

**Avaliacao global**: o design e suficientemente forte para publicacao em journals como JOP, BJPS, ou CPS. Para APSR/AJPS, os triggers assimetricos precisariam de fundamentacao mais profunda, e as extensoes precisariam ser completadas. O score de 7.5 reflete um modelo com pergunta excelente e mecanismo claro, mas com profundidade mecanica e riqueza de extensoes aquem do necessario para os top 2.

---

## Sugestoes construtivas

### Prioridade alta

1. **Derivar os triggers endogenamente.** Mostrar que um regime com seletorado grande *otimamente* usa protesto como sinal primario (porque e o canal mais informativo), enquanto um regime com seletorado pequeno *otimamente* se apoia em indicadores economicos (porque protesto suprimido e uninformativo). Isso pode ser feito como um lema de "escolha otima de canal" antes do modelo principal: dado o tamanho do seletorado S, o regime escolhe o trigger que maximiza a probabilidade de deteccao dado o trade-off entre custo de informacao e velocidade de resposta. Se os triggers emergem otimamente, a critica de "resultado embutido nas premissas" desaparece.

2. **Completar pelo menos uma extensao substantiva.** A extensao multi-periodo ou a extensao de complementaridade setorial daria "profundidade" ao modelo. A extensao multi-periodo e a mais natural: num modelo de T periodos, a democracia pode construir infraestrutura gradualmente sob rapid, e a autocracia acumula deslocados por mais periodos, o que testaria se o resultado de 2 periodos e robusto ou artefato da estrutura temporal minima.

3. **Explorar a estatica comparativa de forma mais rica.** Identificar pelo menos um parametro com efeito ambiguo ou nao-monotono. Candidato: B (nivel de compensacao). B alto reduz v e estabiliza ambos os regimes quando compensam --- mas tambem aumenta o custo fiscal, tornando a compensacao menos provavel de ser autorizada (se o incumbente for sensivel ao custo). Se o modelo endogeneizasse o custo fiscal de B, poderia emergir um B* otimo que nao e trivialmente "o mais alto possivel."

### Prioridade media

4. **Separar canais com proposicoes dedicadas.** Adicionar duas proposicoes contrafactuais: (a) "Se mantivermos informacao constante (sigma_A = 0) mas variarmos velocidade, o que muda?" (b) "Se mantivermos velocidade constante (ambos com lag) mas variarmos informacao, o que muda?" Isso mostraria ao leitor quais resultados dependem de qual canal e fortaleceria a afirmacao de que o seletorado gera mecanismos genuinamente distintos.

5. **Condensar a Secao 2.** A logica verbal e bem escrita mas redundante com o resto do paper. Reduzir a 1-1.5 paginas: manter a "ironia" central e os quatro cenarios em forma esquematica, eliminar a exposicao detalhada de cada regime (que e repetida na Secao 3 e nas provas).

6. **Explorar o exemplo numerico.** Adicionar 2-3 exercicios de sensibilidade: variar C_A e mostrar a transicao do sweet spot; variar omega_R e mostrar quando a fragilidade cruzada colapsa; variar sigma_A e mostrar a amplificacao. Estes exercicios podem ser figuras simples que dao ao leitor intuicao sobre a robustez parametrica.

### Prioridade baixa

7. **Simplificar gamma no baseline.** Considerar gamma = 0 no baseline e adicionar gamma > 0 como extensao/robustez. O mecanismo central (lag + ausencia de infraestrutura previa) funciona sem gamma; gamma apenas reforza a armadilha da prosperidade via oposicao fiscal. Remover gamma do baseline simplificaria a apresentacao sem perder o resultado principal.

8. **Renomear "Remark 1" como "Lema".** A composicao absorvente (Omega_2^rapid > Omega_2^threshold) e um resultado tecnico que sustenta as proposicoes. Chama-lo de "Remark" subestima sua importancia e confunde o leitor sobre a hierarquia dos resultados.

9. **Discutir a extensao de "exit" (Hirschman).** O modelo usa "voice" mas nao "exit." Sob automacao, trabalhadores podem migrar (exit) em vez de protestar (voice). Em democracias, exit e mais facil; em autocracias, emigracao e restrita. Isso geraria um canal adicional que reforçaria a fragilidade cruzada (exit alivia pressao em democracias, mas nao em autocracias). Mesmo como discussao verbal, isso conectaria o modelo mais profundamente a Hirschman.

---

## Resumo dos scores por dimensao

| Dimensao | Score | Justificativa |
|----------|-------|---------------|
| MD1. Qualidade da pergunta | Excelente | Puzzle genuino, insight novo, relevancia alta |
| MD2. Simplicidade e KISS | Adequada | Premissas stark, mas tres canais + gamma/delta adicionam carga |
| MD3. Isolamento do mecanismo | Adequada | Mecanismo claro, mas triggers assimetricos sao premissa, nao derivacao |
| MD4. Riqueza de insights | Adequada | Tipologia e amplificacao sao bons, mas estatica comparativa monotona e extensoes incompletas |
| MD5. Tipo de contribuicao | Excelente | Pergunta nova + forca isolada + aplicacao importante |
| MD6. Processo de construcao | Adequada | Exemplo antes de teoria (bom), mas redundancia verbal e extensoes ausentes |

---

*Parecer elaborado segundo principios de Dixit (2015) "The Art of Modeling", Varian (1997/2016) "How to Build an Economic Model", e Board & Meyer-ter-Vehn (2018) "Writing Economic Theory Papers".*
