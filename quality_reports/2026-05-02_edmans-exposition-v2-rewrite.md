# Parecer de Exposition (Framework Edmans) -- v2 Rewrite

**Manuscrito**: "AI and Regime Stability: How Selectorate Size Shapes the Political Consequences of Automation"
**Autores**: Galdino & Mignozzetti
**Data**: 2026-05-02
**Avaliador**: Editor simulado (APSR/AJPS/JOP tier)
**Versao**: v2 rewrite (draft -- placeholders de figuras e seções pendentes)

---

## Score: 7.5/10

O score reflete um draft em estagio intermediario. A escrita e forte, a estrutura e clara, e a contribuicao e comunicada de forma eficaz na introducao. Porem, o manuscrito sofre com: (1) ausencia de figuras (5 placeholders), (2) uma secao inteira de placeholder (Section 5 -- Policy Implications), (3) dois TODOs no appendix, (4) redundancia significativa entre Secoes 2 e 3, e (5) ausencia de numeros memoraveis no abstract. Se as figuras e secoes pendentes forem implementadas e a redundancia resolvida, o score sobe para 8.0--8.5 sem dificuldade.

---

## Avaliacao por dimensao

### Clareza [Boa]

#### Qualidade da escrita

A prosa e consistentemente boa -- clara, precisa, sem floreios desnecessarios. O manuscrito le bem, com frases curtas e diretas na maioria das secoes. Nao identifiquei typos ou erros gramaticais significativos.

**Pontos fortes:**
- A metafora "steady rain vs. dam that breaks" (l.21) e eficaz e memoravel.
- A ironia estrutural e bem comunicada: "Each type of automation generates the type of crisis that exploits the weakness of the opposite regime" (l.73).
- A secao de timing (3.6) e exemplarmente clara -- 7 passos numerados, sem ambiguidade.
- O exemplo numerico (3.8) e bem executado: parametros razoaveis, 4 cenarios narrados passo a passo.

**Problemas especificos:**

1. **Inconsistencia notacional menor.** A variavel $\omega_t$ e usada tanto como "displacement probability" (l.82, tabela) quanto como "displacement rate" (l.111, l.146). Escolher um termo e usar consistentemente.

2. **Frase longa e sintaticamente complexa no abstract.** A sentenca que comeca com "Democracies are stable under gradual displacement, where the voice mechanism activates compensation in time, but fragile under threshold automation, where the prosperity of the complementary phase blocks preventive investment and the institutional lag prevents reactive compensation" tem 40 palavras e 3 clausulas relativas encaixadas. O abstract tem 5 sentencas deste tipo. Sugestao: quebrar em sentencas mais curtas.

3. **"v5 model" no corpo do texto (l.320).** Referencia a versao interna que nao faz sentido para o leitor externo. Remover.

4. **"Section 3.8" referenciada na prova de P3 (l.283).** E uma referencia ao exemplo numerico, o que e correto, mas o leitor precisa de uma subsubsecao com titulo claro para que a referencia funcione como ancora.

#### Significancia substantiva

**Ausencia de numeros memoraveis no abstract.** O abstract descreve o resultado qualitativo ("crossed fragility pattern") mas nao oferece nenhum numero que permita ao leitor dimensionar o fenomeno. Nao ha calibracao, nao ha "the crossed fragility interval spans X% of the parameter space" ou "under baseline parameters, protest reaches Y in democracy-threshold but only Z in autocracy-rapid." Um paper teorico puro pode dispensar numeros, mas o abstract ficaria mais forte com pelo menos uma quantificacao do exemplo numerico, como: "Under baseline calibration, threshold automation generates protest 3x above democratic resilience while remaining invisible to the autocratic elite."

**O exemplo numerico (3.8) fornece numeros concretos ($\Omega_2 = 0.51$, $\Omega_2 = 0.62$, $Y^+ = 1.3$) mas nao os sintetiza em uma frase de impacto.** O leitor tem que fazer a aritmetica mentalmente. Sugestao: ao final do exemplo, adicionar um paragrafo sintetico: "Under these parameters, the crossed fragility gap is X: democracy falls under threshold with protest at Y vs. resilience at Z, while autocracy falls under rapid with protest at W vs. resilience at V."

#### Precisao da linguagem

**Geralmente precisa, com excecoes pontuais:**

1. **"the few who are displaced are scattered among beneficiaries with no grievance" (l.69).** Impreciso: os beneficiarios tem *no grievance* ou *no displacement-related grievance*? A formulacao sugere que nenhum trabalhador prosperante tem queixa de nenhum tipo, o que e uma afirmacao forte demais. Sugestao: "scattered among beneficiaries who face no displacement-related loss."

2. **"GDP collapses, factories close" (l.71, l.348).** Repete-se duas vezes com formulacao quase identica. Alem de redundante, "GDP collapses" e linguagem forte para um choque setorial. Se o modelo trata de automacao em setores especificos, o impacto e em output setorial, nao necessariamente PIB. Sugestao: "output in exposed sectors collapses" ou qualificar com "aggregate output falls sharply."

3. **"Convincing twenty generals is a meeting. Convincing a legislature is a process" (l.55).** Estilosa e eficaz como intuicao, mas imprecisa como descricao. "Convincing twenty generals" pode envolver purgas, jogos de poder, e conspiracoes -- dificilmente "a meeting." A frase minimiza a complexidade da politica intra-elite autocratica. Sugestao: adicionar qualificacao: "Once the decision is made within the ruling coalition, implementation is immediate --- decree, not legislation."

4. **"the same deliberative process that makes democracies responsive also makes them slow" (l.55-56, repetido l.134).** Precisamente a mesma sentenca aparece duas vezes (Section 2.2 e Section 3.4). Redundancia literal.

---

### Extensao [Longo]

#### Introducao

A introducao ocupa linhas 1--35, aproximadamente 2.5 paginas (12pt, 1in margins). Isso esta dentro do limite recomendado de ~6 paginas. A introducao e bem estruturada: motivacao (l.1--2), puzzle (l.3), gap (l.3), modelo (l.4), quatro resultados (l.5--8), roadmap (l.9).

**Problema:** A introducao teria mais impacto se incluisse um exemplo empirico ou historico concreto. O paragafo de motivacao cita CEOs e relatories de industria, mas nao cita nenhum caso historico de automacao causando instabilidade politica. Um paragrafo curto sobre, e.g., a Revolucao Industrial e as revoltas ludistas, ou a automacao agricola nos EUA e o conservadorismo rural, ancoraria o argumento na realidade. O manuscrito cita @FinseraasNyhus2025 e @DasguptaRamirez2025 apenas no final; trazer evidencia empirica para a intro daria mais peso.

#### Notas de rodape

O manuscrito tem 3 notas de rodape em ~420 linhas de texto (excluindo appendix). Isso esta bem abaixo do maximo recomendado de ~1/pagina. As notas sao bem calibradas: a nota 1 (necessidade de 3 estados) e substantiva e justifica uma decisao de modelagem; a nota 2 (informatividade de $d_{it}$) e tecnica e bem posicionada; a nota 3 (protesto nao e bem publico) resolve uma objecao previsivel. Nenhuma nota deveria estar no corpo principal e nenhuma e frivolous.

**Avaliacao: Excelente.**

#### Extensoes desnecessarias

1. **Section 2 vs. Section 3: redundancia substancial.** Este e o principal problema de extensao do manuscrito. A Section 2 ("The Logic of Crossed Fragility") desenvolve verbalmente toda a logica do modelo em ~3.5 paginas. A Section 3 formaliza o modelo e o exemplo numerico (3.8) reconta os 4 cenarios novamente. O leitor le a mesma narrativa tres vezes:
   - Section 2.3 (l.64--73): 4 cenarios verbais, ~3 paginas
   - Section 3.8 (l.197--211): 4 cenarios numericos, ~1.5 pagina
   - Section 4 Proofs (P1, P2): 4 cenarios formais, ~1.5 pagina

   A redundancia total e de ~3 paginas. Para um paper teorico-formal, a secao verbal (2) e valiosa -- ela segue a recomendacao de Varian e Dixit de motivar informalmente antes de formalizar. Mas o exemplo numerico (3.8) e as provas de P1/P2 repetem o conteudo sem adicionar insight novo alem da precisao formal. Sugestao: condensar P1/P2 proofs para que referenciem o exemplo numerico e a secao verbal em vez de recontar a narrativa. Algo como: "The proof follows the logic of Section 2.3, which we now verify formally for each condition."

2. **Section 5 (Policy Implications) e placeholder.** Em sua forma atual, adiciona zero conteudo. Se a versao final nao tiver contribuicao substantiva nesta secao, ela deveria ser incorporada como paragrafo final da Conclusion (que ja tem o argumento de policy na l.384).

3. **Appendix B e C sao TODOs.** Isso e aceitavel para um draft, mas deve ser resolvido antes de submissao. Os titulos ("Complementarity extensions" e "Multi-period extension") sao vagos -- se sao extensoes que nao testam hipotese nova, considerar se sao necessarios.

4. **Tabela de comparative statics (Section 4.5).** A tabela com 10 parametros e informativa, mas o texto que a acompanha (l.298--311) e zero: apenas uma tabela sem discussao. Comparative statics em papers formais precisam de texto explicativo que destaque os resultados nao-obvios. Sugestao: adicionar 2--3 paragrafos discutindo os comparative statics mais importantes ($\gamma$, $\sigma_A$, $\delta$) e o que eles implicam para o argumento central. Os outros parametros podem ficar na tabela sem comentario.

---

### Citacoes [Adequadas, com problemas pontuais]

#### Problemas especificos

1. **Bibliografia magra.** O manuscrito cita ~15 referencias no corpo principal. Para submissao a um top journal de CP, isso e insuficiente. O Edmans review v8 ja recomendou expandir para 35--40 refs. Faltam:
   - Acemoglu & Robinson (2001, "A Theory of Political Transitions") -- o paper canonical de regime change que usa shocks economicos
   - Boix (2003) -- teoria alternativa de regime change baseada em desigualdade
   - Meltzer & Richard (1981) -- redistribuicao sob democracia (relevante para o argumento fiscal)
   - Besley & Persson (2011) -- state capacity e compensacao fiscal
   - Alesina & Tabellini (1990) -- politica fiscal sob democracia
   - Frey & Osborne (2017) -- o paper empirico mais citado sobre automacao e empregos
   - Webb (2020) -- automacao e impacto ocupacional
   - Autor, Dorn & Hanson (2013) -- China shock e consequencias politicas
   - Colantone & Stanig (2018) -- trade shocks e populismo
   A ausencia de Frey & Osborne (2017) e particularmente notavel -- e o estudo empirico mais influente sobre automacao e empregos, e a omissao e conspicua.

2. **@GansGoldfarb2026 -- data futura.** A referencia central do modelo e citada como 2026. Se e working paper, fine; se e publicacao, verificar se a data esta correta. Um leitor pode estranhar uma referencia futura.

3. **@Przeworski2005 -- uso generico.** A citacao (l.23) e para o argumento de que "the regime stability literature treats shocks as uniform events defined by magnitude." Isso e uma leitura possivel mas imprecisa de Przeworski -- que trata de transicoes de regime condicionadas a nivel de renda, nao de "shocks uniformes." O ponto do autor e valido (a literatura nao distingue trajetorias), mas a citacao especifica pode ser contestada por um referee que conhece Przeworski bem. Sugestao: citar Przeworski com mais precisao: "treats economic crises as exogenous events whose political consequences depend on magnitude and level of development, not on their temporal profile."

4. **@Hirschman1970 -- uso acertado.** A referencia a voice/exit e central e bem articulada com o modelo.

5. **@Wintrobe1998 e @EgorovGurievSonin2009 -- uso acertado.** O dictator's dilemma e bem fundamentado.

---

## Veredicto geral sobre exposition

O manuscrito esta bem escrito para um draft v2. A prosa e clara, a estrutura e logica, e a contribuicao ("crossed fragility") e comunicada com forca na introducao. Os principais problemas de exposicao sao: (1) ausencia de figuras -- um paper com 5 placeholders de figuras perde a dimensao visual inteira, e as figuras sao essenciais para comunicar o resultado 2x2 e as comparative statics; (2) redundancia entre as secoes 2, 3.8, e 4 -- o leitor le a mesma narrativa de 4 cenarios tres vezes sem acrescimo proporcional; (3) ausencia de numeros memoraveis no abstract e no sumario do exemplo numerico; (4) bibliografia magra para um top journal (~15 refs vs. 35--40 esperados); (5) Section 5 placeholder e appendix TODOs criam impressao de incompletude que pode irritar um editor. Resolvidos esses pontos, o manuscrito tem potencial para atingir 8.5--9.0 em exposition. A qualidade da prosa, a estrutura da introducao, e a clareza do modelo formal sao pontos fortes genuinos.

---

## Top 5 sugestoes de melhoria

1. **Implementar as 5 figuras.** A contribuicao "crossed fragility" e inerentemente visual (2x2, tipologia de autocracias, amplificacao por sigma_A). Sem as figuras, o argumento depende inteiramente de texto, o que e uma perda massiva. Prioridade maxima: a Figura 2x2 (crossed fragility pattern) e a Figura de comparative statics. Cada figura deve ser autocontida com caption explicativo.

2. **Eliminar a redundancia da narrativa de 4 cenarios.** O leitor nao precisa ler 3 versoes da mesma historia. Opcoes: (a) manter Section 2.3 como intuicao verbal completa, condensar o exemplo numerico (3.8) para uma tabela com parametros e resultados (sem recontar a narrativa), e reduzir P1/P2 proofs a verificacao formal que referencia Section 2.3; (b) alternativamente, eliminar Section 2.3 e fazer o exemplo numerico carregar a intuicao. A opcao (a) e preferivel para um paper que segue Varian/Dixit.

3. **Adicionar numeros memoraveis ao abstract e ao sumario do exemplo numerico.** Exemplos: "Under baseline calibration, threshold automation generates protest 4x above democratic resilience ($\pi = 0.20$) while the same crisis remains invisible to the autocratic elite ($P(\tilde{\omega}_S > \bar{\omega}_A) < 0.25$ under rapid)." O abstract nao precisa de muitos numeros, mas precisa de pelo menos um que ancore a contribuicao quantitativamente.

4. **Expandir a bibliografia para 30--40 refs.** Adicionar os papers canonicos de regime change (Acemoglu & Robinson 2001, Boix 2003), redistribuicao (Meltzer & Richard 1981), automacao empirica (Frey & Osborne 2017, Autor/Dorn/Hanson 2013), e trade-politics (Colantone & Stanig 2018). Isso nao e padding -- e o minimo para posicionar o paper na literatura e sinalizar que os autores conhecem o campo.

5. **Resolver os placeholders e TODOs.** Section 5 (Policy Implications) deve ser escrita ou eliminada (incorporando o conteudo na Conclusion). Os dois appendix TODOs devem ser implementados ou removidos do manuscrito. Um editor que ve "[PLACEHOLDER]" e "[TODO]" em um manuscrito submetido assume descuido -- mesmo sabendo que e draft, a impressao e negativa. Se as extensoes nao sao prontas, remover os titulos e menciona-las apenas na Discussion como "work in progress."

---

## Sugestoes adicionais (menores, nao prioritarias)

6. Remover a referencia a "v5 model" (l.320) -- linguagem interna.
7. Resolver a duplicacao literal da frase sobre deliberative process (l.55-56 e l.134).
8. Na comparative statics table (4.5), adicionar texto interpretativo para $\gamma$, $\sigma_A$, e $\delta$.
9. Precisar a citacao de Przeworski (l.23) -- "level of development" vs. "magnitude of shocks."
10. Revisar "GDP collapses" (l.71, 348) -- calibrar a linguagem ao escopo setorial do modelo.
