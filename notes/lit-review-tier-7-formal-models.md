# Tier 7 — Modelos formais relacionados (que coexistem com IA-dem v3)

**Data**: 2026-05-03
**Skill**: lit-review (manual, focado em diagnóstico técnico)
**Contexto**: Reframing v3 (interview-reframing.md). v2 (selectorate como primitiva, global games sobre coordenação individual) abandonado em 2026-05-03. v3 herda Acemoglu & Robinson (AER 2000) + Bonomi-Gennaioli-Tabellini (QJE 2021) como microfundações; usa Rogowski (1989) como estilo de argumento.

**Pergunta organizadora**: Quais frameworks formais coexistem com IA-dem v3, e por que NÃO são adotados — apesar de algumas terem servido o v2?

---

## 1. Boix, C. (2003). *Democracy and Redistribution*. Cambridge UP.

### Modelo formal
- **Primitivas**: distribuição de renda, mobilidade de capital (especificidade do ativo), poder coercitivo da elite.
- **Mecanismo**: jogo entre elite rica e maioria pobre. Mobilidade de capital alta → ameaça redistributiva sob democracia é baixa → elite aceita democracia. Igualdade alta → mesmo resultado por outra rota.
- **Equilíbrio**: democracia surge quando mobilidade × igualdade reduz custo de redistribuição abaixo do custo de repressão.
- **Variáveis-chave**: σ (especificidade do ativo), μ (renda mediana / renda média), τ* (taxa redistributiva preferida pelo mediano).

### Uso em IA-dem v2
Limitado. Boix entrava como referência de fundo no debate sobre desigualdade-democratização (Debate 1 do lit-review tech-shocks), mas não como microfundação ativa. v2 não usava capital mobility como variável.

### Uso em IA-dem v3
Não-uso direto. Mas o **estilo Boix** (estrutura econômica → distribuição de preferências → equilíbrio institucional) é congruente com Rogowski 1989 — ambos são "estrutura econômica gera coalizão". v3 está mais próximo de Rogowski porque trabalha em coalizões setoriais (estrutura de tarefa), não em classes definidas por renda agregada.

### Razão da decisão
- **Por que não adotar Boix como microfundação**: Boix é um **modelo estático de transição** (autocracia ↔ democracia em equilíbrio). v3 trabalha *dentro* de regimes estáveis com choque tecnológico durante a vida do regime. Boix não tem estrutura temporal sequencial — não modela "quando o choque chega depois do equilíbrio se formou".
- **Em uma frase**: Boix prediz quando regimes mudam dado o equilíbrio inicial; v3 pergunta como regimes lidam com choques *depois* do equilíbrio inicial.

---

## 2. Ansell, B. W., & Samuels, D. J. (2014). *Inequality and Democratization*. Cambridge UP.

### Modelo formal
- **Primitivas**: três grupos (elite incumbente, elite emergente, massas), dois setores com taxas de crescimento diferentes, taxação regressiva sob autocracia.
- **Mecanismo**: contraposição direta a Boix/A&R. Não é a massa pobre ameaçando expropriação que força democracia — é a **elite emergente que demanda proteção contra expropriação pela elite incumbente**. Democracia parcial como contrato de proteção entre elites.
- **Equilíbrio**: rising income inequality (não land inequality) promove democratização porque cria nova elite com interesse na restrição constitucional do poder fiscal incumbente.

### Uso em IA-dem v2
Nenhum. v2 trabalhava em regimes estáveis e não modelava emergência de novas elites econômicas.

### Uso em IA-dem v3
Não-uso, mas **paralelo conceitual interessante**: a tipologia A vs B do v3 distingue choques que fragmentam coalizões existentes (Tipo A) vs choques que **criam novas coalizões** sequencialmente (Tipo B fase 2). Ansell-Samuels também foca em emergência de coalizão nova. Diferença: Ansell-Samuels modela emergência de **elite produtiva**; v3 modela emergência de **coalizão de perdedores**.

### Razão da decisão
- **Por que não adotar**: Ansell-Samuels é, como Boix, modelo de **transição estática** entre regimes. v3 não é sobre transição — é sobre *fragilidade* de regimes existentes sob choque trajetorial.
- **Tese de Ansell-Samuels (rising inequality → democracy) cortaria contra o v3**: se v3 dissesse "rising inequality from AI fragiliza democracias", entraria em conflito direto. v3 contorna isso ao focar não no nível de desigualdade mas na **estrutura temporal** do choque.

---

## 3. Svolik, M. W. (2012). *The Politics of Authoritarian Rule*. Cambridge UP.

### Modelo formal
- **Primitivas**: dois conflitos endógenos do autoritarismo. (i) controle sobre massas (problema de repressão); (ii) power-sharing com elites (problema de credibilidade entre ditador e coalizão de apoio).
- **Mecanismo**: violência como árbitro último; ausência de enforcement de terceiros para acordos entre ditador e elite. Equilíbrio depende de capacidade do ditador de comprometer-se com power-sharing (sem o que elite o derruba).
- **Equilíbrio**: variedade institucional autoritária (autocracia personalista vs party-based vs militar) emerge endogenamente do problema de credibilidade.

### Uso em IA-dem v2
Implícito mas não formal. v2 importava intuição "ditador removido pela elite se gastar sem justificativa visível" da estrutura de Svolik (problema power-sharing). Mas não usava modelo formal de Svolik.

### Uso em IA-dem v3
**Substancial via A&R 2000**. A&R 2000 já trabalha com commitment problem entre regime e massa — Svolik adiciona commitment problem *intra-elite*, que v3 não modela. v3 herda A&R, e Svolik fica como background literature sobre por que o lado autoritário é credibilidade-constrangido.

### Razão da decisão
- **Por que não adotar Svolik diretamente**: o foco de Svolik é micropolítica intra-elite autoritária (purgas, sucessão, coup-proofing). v3 não modela isso. v3 só precisa de "autocracia tem commitment failure quando massa coordena" — isso já é A&R 2000.
- **Risco de adotar Svolik**: ampliaria o lado autoritário do paper desnecessariamente. Decisão do autor: autocracia é contraste estrutural, não protagonista paritário (interview-reframing seção "Autocracia").

---

## 4. Bueno de Mesquita, B., Smith, A., Siverson, R. M., & Morrow, J. D. (2003). *The Logic of Political Survival*. MIT Press.

### Modelo formal
- **Primitivas**: selectorate (S) — corpo formal que escolhe líderes; winning coalition (W) — subconjunto mínimo cujo apoio o líder precisa; W/S ratio determina probabilidade de membro defector ser substituído.
- **Mecanismo**: líder aloca recursos entre bens públicos (consumidos por todos) e bens privados (consumidos só pela coalizão vencedora). W grande → bens públicos eficientes (porque privados precisariam ser divididos por muitos); W pequeno → bens privados (eficiente comprar lealdade de poucos).
- **Equilíbrio**: democracia ≈ S grande, W grande → bens públicos altos; autocracia ≈ S grande, W pequeno → bens privados altos, accountability baixa. "Loyalty norm" via W/S é o preço-sombra da defection.

### Uso em IA-dem v2
**Era a primitiva única**. v2 tentou derivar TRÊS frições do tamanho da coalizão:
1. **Informação**: selectorate grande → custo de protesto C_D < C_A (porque protesto democrático é menos arriscado, sinaliza melhor)
2. **Velocidade**: selectorate pequeno → decreto rápido; selectorate grande → legislação lenta
3. **Política fiscal**: compensação sai do selectorate. Em D, eleitores parte do selectorate → bloqueio se não sofrem. Em A, elite pequena → autoriza só se vê crise.

### Uso em IA-dem v3
**ABANDONADO INTEGRALMENTE.** Selectorate desaparece da microfundação. Diferenças regime entram via (i) A&R commitment para queda autocrática e (ii) BGT identity para erosão democrática.

### Razão da decisão
Ver seção dedicada abaixo ("Por que selectorate foi abandonado").

---

## 5. Morris, S., & Shin, H. S. (2003). Global games: Theory and applications. *Advances in Economics and Econometrics* Vol. 1.

### Modelo formal
- **Primitivas**: jogo de coordenação com dois equilíbrios (run/no-run, attack/no-attack, protest/no-protest), ruído iid no sinal privado sobre fundamental θ.
- **Mecanismo**: cada agente recebe sinal x_i = θ + ε_i. Estratégia ótima é cutoff: agir se x_i > x*. Limite ε → 0 seleciona equilíbrio único via global-game refinement.
- **Equilíbrio**: cutoff único θ* tal que P(maioria age | θ*) = ponto de indiferença. Análise comparativa estática limpa: dθ*/dω, dθ*/dC etc.

### Uso em IA-dem v2
**Era a microfundação de coordenação de protesto**. v2 modelava protesto como global game: cada trabalhador recebe sinal d_i (choque individual) + s_i (sinal sobre estado θ ∈ {R, T, N}); decide protestar se sinal composto > cutoff. h(π) safety-in-numbers; F logística para ruído. Permitia derivar π(θ, x) closed-form e comparar D vs A via parâmetros (C_x, σ_x, π̄_x^fall).

### Uso em IA-dem v3
**ABANDONADO** como microfundação de coordenação. Substituído por:
- **Democracia**: median voter sobre construção de infraestrutura compensatória (votação institucional, não coordenação descentralizada)
- **Autocracia**: A&R commitment (coordenação massiva sob ameaça de revolução)

### Razão da decisão
Ver seção dedicada abaixo ("Por que global games foi abandonado").

---

## Por que selectorate (BdM et al 2003) foi abandonado — diagnóstico técnico

### Problema 1: Três frições não independentes apresentadas como derivações de uma primitiva
A primitiva é **W (tamanho da coalizão)**, mas as três frições que v2 derivava (informação, velocidade, fiscal) **não são logicamente derivadas de W** — são adicionadas como axiomas paralelos. O paper anunciava unificação que o modelo não entregava:
- Informação (C_D < C_A): vem de Tilly, Tarrow, da literatura de protesto, não de W. Pode ser estipulada sem W.
- Velocidade: vem de literatura institucionalista (veto players, Tsebelis), não de W. Decreto vs lei é separação institucional, não tamanho de coalizão.
- Fiscal: argumento de bloqueio em D ("eleitores parte do selectorate") confunde **selectorate de BdM (corpo de seleção)** com **eleitorado** (coletivo de votação). BdM trata selectorate como variável categórica institucional, não como "população completa de eleitores".

**Diagnóstico**: v2 usava "selectorate" como label retórico para uma colagem de 3 frições heterogêneas. Não era unificação genuína.

### Problema 2: Provas não fechavam
Quality reports (`quality_reports/04_propositions_1_2`, `05_proposition_3_crossed_fragility`, `06_corollary_1_sweet_spot_CA`, `07_proposition_5_sigma_amplification`) mostraram que crossed fragility (P3) só se sustentava em janela paramétrica estreita. A margem R×A em t=1 era 0.009 (CLAUDE.md project memory). Sweet spot de C_A precisava de truques de ajuste.

**Diagnóstico**: quando uma proposição central só sobrevive em margem de 0.009, isso é sinal de que **o mecanismo unificador não é o mecanismo verdadeiro**. v3 (interview) revelou: o mecanismo verdadeiro é estrutura temporal do choque (sequencial vs concorrente), não tamanho de coalizão.

### Problema 3: A intuição do autor nunca casou com o resultado formal
Memory note `feedback_selectorate_primitive` registra: "ONE primitive (selectorate size), THREE consequences (info, speed, fiscal). Autocracy survives threshold via compensation, NOT repression." Mas a interview revelou que essa intuição é fragile — a passagem "selectorate → fiscal → compensação" requer que o ditador internalize que NÃO compensar leva à derrubada. Em v3, isso vira A&R commitment direto: ditador concede em fase 2 sob ameaça revolucionária. Sem precisar passar por selectorate.

### Problema 4: Selectorate é primitiva *cross-sectional*, não trajetorial
BdM constroem comparativa estática de regimes (W grande vs W pequeno em steady state). v2 forçou selectorate a fazer trabalho dinâmico — predizer resposta a choque tecnológico ao longo de duas fases. Era uso fora do escopo. BdM não modelam *trajetória* de qualquer coisa.

### Conclusão técnica
Selectorate foi abandonado porque **(i) não unificava de fato as três frições; (ii) provas dependiam de margens estreitas; (iii) primitiva cross-sectional não suportava análise trajetorial; (iv) intuição verbal correta era diretamente capturada por A&R + BGT, sem o detour selectorate**.

---

## Por que global games (Morris-Shin 2003) foi abandonado — diagnóstico técnico

### Problema 1: Coordenação descentralizada não é o mecanismo democrático real em v3
v2 modelava queda democrática como **coordenação de protesto** (massa decide simultaneamente). v3 reformulou: queda democrática é **erosão populista via voto** (BGT 2021) — mediano vota plataforma populista quando estrutura econômica torna identidade cultural saliente. O voto agregado **não é jogo de coordenação com cutoff**. É escolha de plataforma sob preferência endógena.

**Diagnóstico**: global games é a ferramenta certa para currency attacks, bank runs, revoluções massivas. Não é a ferramenta certa para erosão eleitoral gradual. Aplicar global games à erosão democrática é forçar a ferramenta.

### Problema 2: Para autocracia, A&R commitment já basta
v2 usava global games também para queda autocrática (revolução coordenada). Mas A&R 2000 já modela isso minimalmente: massa coordena (assumido) → ameaça revolução → ditador concede ou reprime conforme custo relativo. v3 não precisa do refinement de seleção de equilíbrio que global games oferece — basta a comparação custo de concessão vs custo de repressão.

**Diagnóstico**: global games é overkill quando o paper-pai (A&R) já dispensou a seleção de equilíbrio via assumption.

### Problema 3: Closed-form trajetorial era impossível
v2 tentou derivar π(θ, x, t) com θ ∈ {R, T, N}, t ∈ {1, 2}, x ∈ {D, A} — seis cenários, cada um com cutoff próprio. O resultado foi 17 lemmas/proposições/corolários (`paper.Rmd` v2). Multistate equilibrium derivations (D1-D3) precisaram appendix B inteiro.

**Diagnóstico**: complexidade explodia. Cada parâmetro adicional no global game (σ_D vs σ_A, C_D vs C_A, ω_R vs ω_T, π̄_D^fall vs π̄_A^fall) multiplicava o espaço analítico. v3 corta isso ao trocar coordenação por (i) median voter D, (ii) commitment A — ambas com closed-form simples e estática comparativa transparente.

### Problema 4: Sinais bayesianos individuais (d_i + s_i) não eram empiricamente disciplinados
v2 estipulava que cada trabalhador atualiza belief sobre θ via Bayes a partir de seu choque pessoal d_i e sinal público s_i. Isso é elegante teoricamente mas (i) requer assumption sobre prior sobre θ, (ii) introduz σ_x como parâmetro livre, (iii) acumula erro analítico em multi-state. CLAUDE.md project memory registra "Bayesian updating do incumbente" e "sinais individuais d_i + s_i (composto bayesiano)" entre os elementos cortados.

**Diagnóstico**: o ganho informacional (modelar incerteza) não compensava o custo analítico. v3 elimina incerteza sobre θ ao tornar trajetória observada (autor decidiu: tipologia A vs B é estrutural, não estado escondido).

### Conclusão técnica
Global games foi abandonado porque **(i) coordenação descentralizada não é o mecanismo D em v3 (erosão eleitoral é); (ii) A&R já cobre A sem refinement; (iii) closed-form em 6 cenários colapsava; (iv) sinais bayesianos eram complexidade não-empírica**. Ferramenta correta para o problema errado.

---

## Frameworks alternativos que IA-dem v3 poderia ter usado, mas não usa

### Alternativa 1: Boix capital mobility com "AI capital ultra-móvel"
Imaginável: AI faz capital ainda mais móvel → reduz pressão redistributiva → estabiliza democracias.
- **Por que não**: estático, ignora estrutura temporal do choque (Tipo A vs B). Boix não distingue entre "choque hoje, completo hoje" vs "choque hoje, manifesto em 5 anos".
- **A&R + BGT é melhor**: porque trabalha *dentro* de regime existente sob choque temporalmente estruturado.

### Alternativa 2: Ansell-Samuels com elite tech emergente vs elite legacy
Imaginável: AI cria nova elite (Big Tech) que demanda proteção contra elite legacy (industrial). Daria democratização em autocracias e estabilização em democracias.
- **Por que não**: o paper não é sobre **transição** (que é o foco de Ansell-Samuels). E não há evidência de que Big Tech demanda proteção via democratização — Big Tech opera sob ambos regimes.
- **A&R + BGT é melhor**: porque o objeto é fragilidade de regime, não emergência de regime.

### Alternativa 3: Svolik full power-sharing model + IA aumenta poder do ditador
Imaginável: IA dá ao ditador surveillance + capacidade de bypass elite → enfraquece commitment do ditador com elite → instabilidade autocrática.
- **Por que não**: é o tema do **Paper 2 da agenda futura** (CLAUDE.md: "AI Surveillance and Repressive Capacity"). Misturar isso ao paper 1 confundiria as duas hipóteses.
- **A&R + BGT é melhor para paper 1**: porque foca no mecanismo econômico (deslocamento → coalizão → fragilidade), separável do mecanismo informacional/repressivo.

### Alternativa 4: BdM selectorate + AI altera W endogenamente
Imaginável: AI deslocamento muda quem está na coalizão vencedora (de trabalhadores qualificados para detentores de capital + tech workers). Endogeneizar W como função do choque.
- **Por que não**: é precisamente o que v2 tentou. Selectorate é cross-sectional, não trajetorial. Já diagnosticado acima.
- **A&R + BGT é melhor**: porque trata coalizão como saída do choque, não como mediação informacional dele.

### Alternativa 5: Acemoglu-Restrepo task-based model + voting
Imaginável: importar Acemoglu-Restrepo (task-based automation) + acrescentar voto sobre redistribuição.
- **Por que não**: é o que v3 **faz parcialmente** via Gans-Goldfarb (2026), que é variante O-Ring de modelo task-based. Acemoglu-Restrepo não tem estrutura O-Ring sequencial, então não distingue Tipo A vs Tipo B. Gans-Goldfarb sim.
- **A&R + BGT + Gans-Goldfarb é melhor**: combina estrutura econômica certa (Gans-Goldfarb) com microfundação política certa (A&R + BGT).

### Por que A&R + BGT é o pareamento certo
- **A&R 2000 (commitment failure)**: dá saída autocrática a baixo custo analítico. Não compete com nada importante. É a "default option" para "regime cai sob ameaça redistributiva massiva".
- **BGT 2021 (identity politics)**: dá saída democrática que **não é coordenação de protesto**. Crucial: BGT modela como economia muda o que é saliente politicamente. Quando complementaridade prospera maioria (Tipo B fase 1), saliência econômica baixa → identidade cultural sobe → erosão populista emerge antes mesmo do deslocamento. Isso é exatamente a **prosperity trap** que v3 quer formalizar.
- **O ajuste é não-trivial**: BGT trabalha estática (uma eleição). v3 precisa estendê-lo para duas fases (1: complementaridade; 2: deslocamento). Mas a estrutura BGT é compatível — saliência se atualiza entre fases.

---

## Web search 2023-2026: nada se aproxima do framework v3

A busca por modelos formais combinando structural change + coalition formation + temporal sequencing em 2023-2026 não retornou paper análogo. Encontrados:

- **AI & Social Media (Acemoglu, Ozdaglar, Siderius 2025)**: trata polarização via algoritmos, não estrutura de coalizão sob choque trajetorial.
- **Identity Politics (Gennaioli & Tabellini 2025 Econometrica Presidential Address)**: extensão da agenda BGT, **reforça** a microfundação herdada por v3 sem competir com a contribuição.
- **Acemoglu-Restrepo Automation and Rent Dissipation (2024 NBER WP 32536)**: foco em desigualdade salarial, não em coalizão política.
- **Working papers sobre AI e democracia (Carnegie, Brookings 2025-2026)**: descritivos, não formais.
- **Yang 2025 (AJPS)**: "authoritarian data problem" — dimensão informacional, não estrutural-trabalhista.

**Implicação**: v3 ocupa nicho não preenchido. Coalition absence + sequential displacement + welfare politics ainda não foi formalizado em modelo de regime. Risco de antecipação (interview-reframing seção "Riscos") permanece baixo após esta busca.

---

## Recomendação ao autor

### O que assumir como dado
1. **Selectorate (BdM 2003) está fora**. Não tentar ressuscitar como microfundação. Pode aparecer em footnote como literatura precursora descartada explicitamente.
2. **Global games (Morris-Shin 2003) está fora como mecanismo de queda**. Pode sobreviver como ferramenta auxiliar em appendix se necessário (ex: para um cenário específico de revolução em A), mas não como spine do modelo.
3. **A&R 2000 + BGT 2021 + Gans-Goldfarb 2026 + Rogowski 1989** é a herança canônica. Releitura é pré-requisito (interview-reframing item 5).

### Pontos de atenção técnica
1. **BGT é estático em duas dimensões (econômico × cultural). v3 precisa de extensão temporal**. Esta é a parte não-trivial. Recomendação: ler BGT cuidadosamente e mapear: o que muda entre fase 1 (complementaridade) e fase 2 (threshold cruzado) na função de saliência? Provável: saliência econômica é function de (∂y/∂t), saliência cultural é function de prosperidade absoluta. Em fase 1 (prosperidade alta, ∂y/∂t baixo), saliência cultural domina → erosão. Em fase 2 (prosperidade colapsa), saliência econômica volta — mas tarde demais, pois plataforma populista já se consolidou.

2. **A&R 2000 commitment se aplica fase 2 de Tipo B**. Fase 1 não tem ameaça revolucionária em A (massa próspera ou neutra). Fase 2 sim (deslocamento súbito). Recomendação: explicitar que A&R é invocado *condicionalmente* em fase 2, não como mecanismo de fase 1. Fase 1 em A é estável por inação.

3. **Boix, Ansell-Samuels, Svolik podem aparecer como parágrafo de related work, não como microfundação**. Citar para mostrar que v3 conhece o terreno; explicar em uma linha por que cada um não é a ferramenta certa (estático, transição, micropolítica intra-elite).

4. **Risco residual**: Iversen-Soskice (Democracy and Prosperity, 2019) ainda não foi descartado tecnicamente. interview-reframing item 4 ("verificar se já capturam Tipo B em alguma forma") permanece pendente. Recomendação: priorizar leitura de Iversen-Soskice cap. 4-5 antes de remodelagem. Se eles trabalham steady-state como esperado, OK; se trabalham trajetória, é antecipação séria.

### Questões abertas para o autor decidir
1. Manter "regime" como variável binária (D vs A) ou tratar como espectro? BdM/Boix/Ansell-Samuels usam binário; A&R também. v3 herda binário. Decisão default: manter.
2. Modelar autocracia explicitamente como contraste, ou só citar A&R 2000 e gastar tinta em D? interview-reframing diz "2-3 páginas". Recomendação: 2-3 páginas conceituais + appendix técnico se prova for necessária.
3. Lean verification suspensa até modelo v3 estabilizar — confirmado por CLAUDE.md. Não tentar verificar parcial.

---

## Referências citadas neste documento

- Acemoglu, D., Ozdaglar, A., & Siderius, J. (2025). AI and Social Media: A Political Economy Perspective. NBER WP 33892.
- Acemoglu, D., & Restrepo, P. (2024). Automation and Rent Dissipation. NBER WP 32536.
- Acemoglu, D., & Robinson, J. A. (2000). Why Did the West Extend the Franchise? *QJE* (background commitment problem).
- Acemoglu, D., & Robinson, J. A. (2000). Political Losers as a Barrier to Economic Development. *AER* P&P.
- Ansell, B. W., & Samuels, D. J. (2014). *Inequality and Democratization*. Cambridge UP.
- Boix, C. (2003). *Democracy and Redistribution*. Cambridge UP.
- Bonomi, G., Gennaioli, N., & Tabellini, G. (2021). Identity, Beliefs, and Political Conflict. *QJE* 136(4): 2371-2411.
- Bueno de Mesquita, B., Smith, A., Siverson, R. M., & Morrow, J. D. (2003). *The Logic of Political Survival*. MIT Press.
- Gennaioli, N., & Tabellini, G. (2025). Presidential Address: Identity Politics. *Econometrica* 93(6): 1937-1967.
- Morris, S., & Shin, H. S. (2003). Global Games: Theory and Applications. *Advances in Economics and Econometrics* Vol. 1.
- Rogowski, R. (1989). *Commerce and Coalitions*. Princeton UP.
- Svolik, M. W. (2012). *The Politics of Authoritarian Rule*. Cambridge UP.
- Yang, E. (2025). The Authoritarian Data Problem. *AJPS*.

## Sources web search

- [Selectorate theory - Wikipedia](https://en.wikipedia.org/wiki/Selectorate_theory)
- [Retesting Selectorate Theory (NYU)](https://as.nyu.edu/content/dam/nyu-as/faculty/documents/retesting.pdf)
- [Identity, Beliefs, and Political Conflict (QJE 2021)](https://academic.oup.com/qje/article/136/4/2371/6368349)
- [Presidential Address: Identity Politics (Econometrica 2025)](https://onlinelibrary.wiley.com/doi/10.3982/ECTA22269?af=R)
- [Global Games: Theory and Applications (Morris-Shin)](https://economics.mit.edu/sites/default/files/publications/morris-globalgamestheoryandapplications.pdf)
- [Inequality and Democratization (Ansell-Samuels)](http://cpd.berkeley.edu/wp-content/uploads/2014/12/AnsellSamuelsFinalMSFeb14.pdf)
- [Democracy and Redistribution (Boix)](https://www.princeton.edu/~cboix/dem-redis.html)
- [The Politics of Authoritarian Rule (Svolik)](https://www.cambridge.org/core/books/politics-of-authoritarian-rule/7F78A8828A5714F0BE74E44A90A44868)
- [Automation and Rent Dissipation (Acemoglu-Restrepo NBER 32536)](https://www.nber.org/papers/w32536)
