# Parecer de Exposicao do Modelo (Varian / Thomson / Board)

**Manuscrito**: "AI and Regime Stability: How Selectorate Size Shapes the Political Consequences of Automation"
**Autores**: Galdino & Mignozzetti
**Data**: 2026-05-02
**Avaliador**: Teorico senior (exposicao e comunicacao)
**Referencia metodologica**: Varian (1997/2016), Thomson (1999), Board & Meyer-ter-Vehn (2018)

---

## Score Global: 7.5 / 10

O manuscrito esta acima da media de submissoes em CP com modelo formal no quesito exposicao, mas apresenta problemas que, se corrigidos, elevariam significativamente a clareza e o impacto da leitura. A principal virtude e a presenca de um walkthrough verbal completo (Section 2) antes da formalizacao --- exatamente o que Varian recomenda. O principal defeito e a extensao: o resultado central (crossed fragility) aparece apenas na pagina ~20-22 (dependendo da compilacao), e ha redundancia substancial entre a Section 2 verbal, o exemplo numerico (3.8), e os enunciados formais (Section 4). O leitor le a mesma logica tres vezes em estilos diferentes sem ganho marginal de compreensao na terceira passagem.

---

## ME1. Estrutura do paper (gancho, resultado antes p.15, fluxo logico)

**Score: 7/10**

### Pontos fortes
- O gancho da introducao e eficaz: abre com declaracoes concretas de CEOs (Amodei, Altman), depois pivota para "we ask a different question." Essa inversao e boa pratica --- ancora o leitor no debate publico antes de introduzir a contribuicao teorica.
- O fluxo Introduction -> Logica Verbal (Sec 2) -> Modelo (Sec 3) -> Resultados (Sec 4) -> Extensao -> Discussion -> Conclusion segue a sequencia Varian de "exemplo antes de generalidade."
- A tabela de timeline do jogo (Table 1) e a tabela de 4 cenarios (Table 2) sao excelentes auxilios de leitura.

### Problemas
1. **Resultado principal chega tarde**. A Proposition 3 (crossed fragility) aparece so apos toda a Section 3 (Environment, Information, Protest, Regime Differences, Stability, Timing, Assumptions, Numerical Example --- ~8 paginas de setup). Mesmo com a Section 2 verbal anunciando o resultado, o leitor que quer ver o enunciado formal precisa esperar demais. Varian (2016): "State the result first; then set up the model to prove it." O paper faz o oposto: setup extenso, resultado ao final.
2. **Tres passagens redundantes**. A logica de crossed fragility aparece verbalmente (Sec 2.3, ~2pp), numericamente (Sec 3.8, ~2pp), e formalmente (Sec 4.3, ~1p). A primeira passagem e necessaria (Varian: verbal intuicao primeiro). A terceira e necessaria (enunciado formal). Mas o exemplo numerico, encaixado dentro da Section 3 (modelo), repete a logica da Section 2 com numeros que nao adicionam muita intuicao alem do que o verbal ja forneceu. O exemplo seria mais util se viesse *depois* do resultado formal, como verificacao, ou se fosse significativamente mais conciso.
3. **Section 2 e longa para uma "preview"**. Com ~3.5 paginas (Sec 2.1-2.3 mais a subseccao de ironia), a Section 2 e quase um mini-paper autonomo. O leitor chega ao fim da Section 2 sentindo que ja entendeu tudo, e a motivacao para enfrentar a formalizacao diminui. Thomson (1999) e Board (2018) recomendam que a intuicao verbal seja concisa o suficiente para criar curiosidade sobre a formalizacao, nao para substitui-la.
4. **Roadmap paragraph e mecanico**. "Section 2 develops... Section 3 formalizes... Section 4 derives... Section 5 discusses." Este paragrafo nao contem informacao que o leitor nao possa inferir do indice. Varian (1997): roadmaps so se justificam quando indicam *surpresas* no fluxo --- e.g., "Readers familiar with global games may skip Section 3.2."

### Sugestao
Condensar Section 2 para ~1.5pp focando na intuicao *que nao seria obvia* a partir do modelo formal (a ironia estrutural, a inversao de vantagens). Mover o exemplo numerico para logo apos Proposition 3, como verificacao. Isso puxa o resultado formal para antes da pagina 15.

---

## ME2. Introducao (contribuicao clara, sem laundry lists, conteudo essencial)

**Score: 8/10**

### Pontos fortes
- A contribuicao e claramente enunciada: crossed fragility pattern como funcao de selectorate size.
- Os quatro resultados estao listados de forma compacta (paragrafos 4-7 da intro). Cada um tem um enunciado verbal claro seguido de mecanismo em uma frase.
- O gap na literatura e identificado com precisao: regime stability literature trata shocks como uniformes; automation literature nao cruza trajectoria com regime type; selectorate theory nao aplica a automation.
- A frase "We ask a different question: what are the *political* consequences of these two economic scenarios?" e um pivot eficaz que posiciona a contribuicao.

### Problemas
1. **O abstract e longo demais**. Tem ~280 palavras e inclui detalhes do exemplo numerico (30%, 25%, 60%, 91%). Abstracts em top journals de CP ficam tipicamente em 100-150 palavras. O exemplo numerico no abstract e incomum e pode ser lido como falta de confianca na intuicao verbal --- como se os numeros fossem necessarios para convencer. Varian: "The abstract should state the question, the approach, and the main result. Nothing else."
2. **A intro tem uma mini laundry list de literatura**. O terceiro paragrafo cita 11 referencias em 7 linhas. Cada uma recebe meia frase de contextualizacao. Isso se aproxima do "miniature literature review" que Edmans critica. Melhor: fundir em 2-3 frases de gap sem listar autores individualmente, remetendo a Section 2 para a discussao detalhada.
3. **Falta o "so what" empirico concreto**. A intro menciona que crossed fragility e um resultado novo, mas nao da ao leitor um caso empirico breve que mostre plausibilidade. Uma frase como "China's response to the 2008 economic crisis --- decree-speed compensation --- versus India's slower legislative route illustrates the speed asymmetry the model formalizes" daria concretude ao gancho. Board (2018): "Antes de qualquer formalizacao, o leitor precisa acreditar que o fenomeno e real."

### Sugestao
Cortar o abstract para ~150 palavras (remover os numeros). Condensar o paragrafo de literatura em 2-3 frases de gap. Adicionar 1-2 frases de ilustracao empirica no paragrafo do mecanismo.

---

## ME3. Escrita e estilo (frases curtas, sucinto, footnotes parcimonioso)

**Score: 8/10**

### Pontos fortes
- A prosa e predominantemente clara e direta. Frases como "The first shock is a steady rain; the second is a dam that breaks" sao memoraveis e comunicam o mecanismo de forma instantanea.
- O uso de italico para termos tecnicos na primeira ocorrencia (*selectorate*, *voice*, *crossed fragility*) e consistente e ajuda o leitor.
- O estilo narrativo da Section 2 (quatro cenarios) e envolvente: cada cenario recebe um mini-narrativa com tensao e resolucao. Isso e exatamente o que Varian e Board recomendam para motivar um modelo.
- A prosa evita jargao excessivo. "Safety in numbers" e preferivel a "strategic complementarity in protest participation." Bom.

### Problemas
1. **Algumas frases sao longas e carregadas**. Exemplo (linha 69): "Crucially, the workers who are gaining from AI do not want to pay higher taxes to compensate the few who are losing --- the prosperity of the complementary phase actively blocks preventive investment in social insurance." Sao 38 palavras com um travessao e dois clausulas subordinadas. Melhor dividir em duas frases.
2. **Footnotes**: ha poucas (5-6 no corpo), o que e positivo. Porem, a footnote 1 (sobre os tres estados) contem informacao substantiva que deveria estar no corpo --- ela justifica uma decisao de design fundamental (por que tres estados e nao dois). Footnotes para decisoes estruturais sao um erro de exposicao (Thomson 1999): se a decisao e importante o suficiente para justificar, ela merece um paragrafo no corpo; se nao e, corte a footnote.
3. **Repeticao de mecanismo**. A frase "the prosperity of the complementary phase blocks preventive investment" ou variantes dela aparece pelo menos 6 vezes no manuscrito (abstract, intro, Sec 2.3, Sec 3.8, Sec 4.3, Conclusion). Na terceira ocorrencia o leitor ja internalizou; na sexta, sente-se patronizado. Confie no leitor.
4. **Referencia a "v5 model"** (linhas 350, 436). Isso e linguagem de working version que nao deveria aparecer no manuscrito. O leitor nao sabe o que e v5.

### Sugestao
Buscar e eliminar todas as referencias a versoes ("v5"). Mover a footnote 1 para o corpo. Fazer uma passagem de "repeticao hunt" para frases-mecanismo que aparecem mais de 3 vezes --- manter as 2 melhores instancias, cortar o resto.

---

## ME4. Extensao e quando parar (resultado principal antes p.15, extensoes justificadas)

**Score: 6.5/10**

### Pontos fortes
- O paper para no lugar certo quanto a *escopo de resultados*: P1-P5, C1, mais welfare comparison e tipologia de autocracias. Nao ha overclaim. A conclusao nao promete mais do que o modelo entrega.
- As extensoes (Section 5) sao relegadas a uma unica pagina e claramente marcadas como tal.
- Os Appendices contem provas que nao atrapalham o corpo.

### Problemas
1. **Resultado principal muito adiante no texto**. Contando cuidadosamente: Title (1p), Abstract (~0.3p), Introduction (~2.5p), Section 2 (~3.5p), Section 3.1-3.7 (~7p), Section 3.8 Numerical Example (~2p). Total ate o inicio dos resultados formais (Section 4): ~15-16 paginas. Proposition 3 (crossed fragility) aparece na pagina ~17-18. Isso e o *limite* do que Varian permite. Board (2018) diz explicitamente: "Se o resultado principal nao apareceu ate a pagina 12, algo esta errado com a estrutura."
2. **O modelo e apresentado de forma completa antes de qualquer resultado**. Todas as 9 assumptions (A1-A9), todas as definicoes, toda a informacao, todo o timing, todo o exemplo numerico --- tudo vem antes do primeiro Lemma. Isso e a "monografia" style que Thomson critica. O leitor precisa memorizar um inventario completo de ingredientes antes de ver qualquer payoff intelectual. Uma alternativa (Thomson 1999): apresentar o modelo em camadas --- setup basico, primeiro resultado, depois refinar o modelo para resultados adicionais.
3. **Section 3.4 (Regime Differences) e longa**. Com ~2.5pp, esta subseccao contem: cost of protest (1 paragrafo), institutional speed (1 paragrafo), compensation trigger (4 paragrafos incluindo derivacao do evidence threshold), dictator's dilemma (2 paragrafos), complementarity income (1 paragrafo). A derivacao do evidence threshold e a demonstracao do dictator's dilemma sao essencialmente o conteudo do Lemma 1 --- que depois e re-enunciado formalmente na Section 4.1. Isso e duplicacao: o leitor le a derivacao duas vezes.
4. **Appendices B e C sao [TODO]**. Isso sinaliza ao leitor (e ao referee) que o paper esta incompleto. Melhor remover as referencias a estes appendices ate que estejam prontos, ou substituir por uma frase generica ("extensions are available on request").

### Sugestao
(a) Mover o exemplo numerico (Sec 3.8) para apos Proposition 3, como verificacao do resultado formal. (b) Integrar a derivacao do evidence threshold e do dictator's dilemma diretamente no Lemma 1, eliminando a duplicacao com Sec 3.4. (c) Reescrever Sec 3.4 como uma descricao *curta* das tres diferencas regime-especificas (1 paragrafo cada), remetendo as derivacoes para as provas formais. (d) Remover os [TODO] dos appendices.

---

## ME5. Uso de exemplos e intuicao (concretos, linguagem simples, geometricos)

**Score: 7.5/10**

### Pontos fortes
- A metafora "steady rain vs. dam that breaks" e excelente. Ela codifica a diferenca entre trajetorias em uma imagem visual que o leitor carrega por todo o paper.
- Os quatro cenarios narrativos da Section 2.3 funcionam bem como "worked examples" qualitativos. Cada um e uma mini-historia com agentes reconheciveis (workers, the elite, the legislature) e um outcome claro (stable/falls). Isso e precisamente o que Varian (2016) recomenda: "Tell the story of the model before writing it down."
- O exemplo numerico (Sec 3.8) e completo: fornece todos os parametros, calcula as derivadas, e chega aos quatro outcomes. Um leitor que nao consegue seguir a formalizacao pode seguir os numeros.
- A Table 3 (Mechanism per cell) resume o mecanismo por cenario de forma compacta e eficaz.

### Problemas
1. **Nenhuma figura geometrica acompanha a intuicao**. O paper tem 2 figuras (fig_CA_sweet_spot.pdf e fig_sigma_amplification.pdf), ambas de resultados derivados (Corollary 1 e Proposition 5). Nenhuma figura ilustra o *resultado principal* (crossed fragility). Uma figura 2x2 mostrando, por exemplo, o path temporal de protesto em cada cenario (com o threshold de fall e o threshold de compensation marcados) daria ao leitor uma ancora visual para o mecanismo central. Varian (1997): "If you can draw a picture, draw it." Board (2018): "Geometric intuition, where possible, is worth more than algebra." O resultado central do paper nao tem representacao visual.
2. **O exemplo numerico e extenso mas nao explorado**. Os numeros sao apresentados e computados, mas nao ha analise de sensibilidade inline. "What happens if $C_A$ increases to 1.8?" "What if $\omega_R = 0.15$ instead of 0.30?" A ausencia de variacao parametrica no exemplo faz com que ele pareca arbitrario --- o leitor nao sabe se os resultados dependem criticamente dos valores escolhidos. Varian: "The best numerical examples are those where the reader can see what happens when you wiggle the parameters."
3. **Falta um running example compacto**. O paper tem um exemplo numerico completo na Section 3.8 e exemplos verbais na Section 2.3, mas nao tem um *running example* conciso que apareca repetidamente ao longo do texto. A pratica recomendada (Thomson 1999) e introduzir um caso "toy" no inicio (e.g., 2 workers, 2 periodos, parametros inteiros simples) e reaproveita-lo sempre que um novo conceito e introduzido. Isso da ao leitor um "caso base" mental.
4. **Falta ancoragem empirica especifica**. As analogias empiricas (financial crises, climate, pandemics) aparecem so na conclusao. Um exemplo empirico *concreto* na Section 2 --- como a automacao no setor manufatureiro vs. a automacao no setor juridico --- daria ao leitor uma referencia real para as duas trajetorias. O paper apoia-se inteiramente em exemplos estilizados.

### Sugestao
(a) Adicionar uma figura 2x2 do path de protesto nos quatro cenarios como a *primeira* figura do paper (apos Sec 2.3 ou no inicio de Sec 4). (b) Incluir 2-3 variantes parametricas no exemplo numerico mostrando robustez. (c) Adicionar um paragrafo empirico na Section 2 com exemplos concretos de setores/paises. (d) Considerar um mini-example "toy" (2 workers, parametros inteiros) na abertura da Section 3.

---

## Veredicto Geral sobre Exposicao

O manuscrito esta bem escrito para os padroes de CP com modelo formal. A prosa e clara, os mecanismos sao explicados com metaforas eficazes, e a estrutura geral segue as recomendacoes de Varian (exemplo antes de generalidade). No entanto, o paper sofre de um problema de *excesso de redundancia vertical*: a mesma logica (crossed fragility) e apresentada verbalmente (Sec 2), numericamente (Sec 3.8), e formalmente (Sec 4), sem que cada passagem adicional faca um trabalho substancialmente diferente. O resultado e um paper que parece mais longo do que precisa ser, com o resultado principal chegando tarde demais.

A principal recomendacao estrutural e: **condensar Section 2 e mover o exemplo numerico para apos Proposition 3**. Isso reduziria o path ate o resultado central de ~17 para ~12 paginas, eliminaria a sensacao de redundancia, e daria ao leitor um payoff intelectual mais cedo.

O segundo deficit e visual: o resultado principal nao tem representacao grafica. Uma figura 2x2 com paths de protesto seria mais valiosa que qualquer das figuras atuais (que ilustram resultados derivados, nao o resultado central).

---

## Top 5 Sugestoes de Melhoria

### 1. Puxar o resultado principal para antes da pagina 12
**Como**: Condensar Section 2 de ~3.5pp para ~1.5pp. Mover o exemplo numerico (Sec 3.8) para apos Proposition 3 (como verificacao, nao como preview). Integrar a derivacao do evidence threshold (Sec 3.4) diretamente no Lemma 1, eliminando duplicacao. O objetivo e que P3 apareca na pagina 11-12.

### 2. Adicionar uma figura do resultado principal (crossed fragility)
**Como**: Criar uma figura 2x2 mostrando o path temporal de protesto ($\pi_t$) em cada cenario, com linhas horizontais para $\bar{\pi}_x^{\text{fall}}$ e $\bar{\pi}_x^{\text{comp}}$. O leitor deve poder olhar para a figura e *ver* a crossed fragility sem ler uma linha de texto. Esta deve ser a Figura 1, nao a Figure dos sweet spots.

### 3. Cortar o abstract para 150 palavras e remover os numeros do exemplo
**Como**: Manter: pergunta, abordagem (selectorate + 2 trajetorias), resultado principal (crossed fragility pattern), implicacao de politica. Cortar: detalhes numericos (30%, 25%, 91%), mecanismos secundarios (tipologia de autocracias, welfare comparison), termos tecnicos excessivos (O-Ring framework).

### 4. Eliminar repeticao do mecanismo "prosperity trap"
**Como**: Buscar a frase "prosperity of the complementary phase" e suas variantes. Manter as 2 instancias mais eficazes (provavelmente Section 2.3 e Proposition 1(b)). Nas demais ocorrencias, referenciar o conceito por nome ("the prosperity trap, Section X") sem re-explicar.

### 5. Adicionar ancoragem empirica concreta na Section 2
**Como**: Apos explicar as duas trajetorias (Sec 2.1), incluir 1-2 paragrafos com exemplos empiricos reconheciveis: automacao de manufatura (rapid displacement, comparar com o Rust Belt), automacao de diagnostico medico ou codificacao (threshold: AI complementa primeiro, depois substitui). Citar um ou dois estudos empiricos que documentem cada padrao. Isso converte a narrativa estilizada em algo tangivel.

---

## Notas Adicionais

- **Referencia a "v5 model"** nas linhas 350 e 436: remover. Linguagem de versao interna nao deve aparecer no manuscrito.
- **Appendices B e C ([TODO])**: remover as referencias ou completar. Sinalizam incompletude ao referee.
- **Footnote 1**: promover para o corpo do texto. A justificativa de 3 estados e uma decisao de design importante que merece paragrafo, nao nota de rodape.
- **Comparative statics table** (Section 4.4): e util como referencia rapida, mas nao substitui uma *discussao* das estaticas comparativas mais importantes. Atualmente, a tabela aparece e o texto salta para o sweet spot. Os parametros mais novos ($\gamma$, $\delta$) mereceriam 1-2 frases de intuicao cada.
