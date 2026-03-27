# Carta Editorial --- Revisao de Modelo Formal

**Referencias**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decisao: R&R minor

## Scores consolidados

| Dimensao              | Score | Rating   |
|-----------------------|-------|----------|
| Design do modelo      | 8/10  | Forte |
| Apresentacao tecnica  | 7/10  | Adequada com lacunas endereçaveis |
| Exposicao             | 8/10  | Boa |
| **Global**            | **7.5/10**  | **Promissor --- publicavel apos revisao focada** |

## Sintese editorial

Este paper faz uma contribuicao genuina ao conectar a economia da automacao por IA com a politica comparada de estabilidade de regimes, produzindo um resultado de "fragilidade cruzada" que e teoricamente elegante e empiricamente sugestivo. O design do modelo e a principal forca: parcimonioso (5 premissas, 8 proposicoes), com mecanismo claramente isolado (coordenacao como variavel mediadora com efeitos opostos por regime) e processo de construcao exemplar. O resultado normativo sobre equivalencia funcional welfare state/repressao (P7-P8) e potencialmente o insight mais impactante.

Os tres pareceristas convergem em dois pontos criticos. Primeiro, **faltam exemplos numericos no corpo do texto** --- o paper vai do modelo abstrato as proposicoes sem nunca mostrar os numeros concretos que tornariam os resultados imediatamente tangiveis. Segundo, **as provas sao excessivamente telegraficas** (estimadas em ~25% linguagem natural contra 52-63% recomendados por Thomson). Ambos os problemas sao inteiramente de apresentacao, nao de substancia, e endereçaveis em uma revisao focada.

Problemas de notacao (colisao do simbolo $R$, inconsistencia de subscripts em $\eta$, definicao tardia de "estabilidade") sao menores mas cumulativamente reduzem a acessibilidade. A introducao e eficiente mas poderia ser mais enxuta no tratamento da literatura e mais generosa com intuicao concreta.

## Hierarquia aplicada: Design > Apresentacao > Exposicao

A hierarquia opera favoravelmente. O design (8/10) e suficientemente forte para justificar investimento pleno em melhorar apresentacao e exposicao. O bottleneck **nao** e o design --- e a apresentacao tecnica (7/10), especificamente provas telegraficas e ausencia de exemplos. A exposicao (8/10) ja esta em nivel adequado. A recomendacao e clara: investir na apresentacao tecnica (provas, notacao, exemplos) sem tocar no design do modelo.

## Prioridades para revisao

### 1. Inserir exemplo numerico worked-out no corpo do texto (consenso dos 3 pareceristas)

Apos as Assumptions (A1-A5), incluir um bloco "**Example**" com parametros concretos percorrendo os quatro cenarios (democracia x autocracia x rapid x threshold). Usar os mesmos valores da Figura 1 ($L=1$, $|\Delta|=0.4$, $\eta_R=0.5$, $\kappa_0=0.8$). Thomson: "Nothing helps the reader more than a well-chosen example." Estimativa: meia pagina, impacto alto.

### 2. Expandir provas com linguagem natural (Parecerista Tecnico)

Alvo: 50-60% linguagem natural (vs. ~25% atual). Cada prova deveria ter: (i) frase de roadmap, (ii) conectivos explicando o mecanismo economico, (iii) referencia explicita a qual assumption esta operando em cada step. P1 e P3 sao as mais importantes --- o leitor de CP precisa entender *por que* o resultado emerge, nao apenas verificar a algebra.

### 3. Resolver colisoes notacionais (Parecerista Tecnico)

- $R$ (acao radical) vs $R$ (subscript rapid em $\eta_R$): renomear acao para $P$ ("protest") ou usar $\eta^{rap}$
- $\eta_t$ (payoff) vs $\eta(j)$ (A4) vs $\eta_T$ (apendice): uniformizar para $\eta_r$/$\eta_\tau$ em todo o manuscrito
- $\tau$ (trajetoria threshold) vs $\tau_t$ (taxa de imposto no Apendice A): renomear taxa para $s_t$
- $c$ usado com significados distintos nos Apendices A e B

### 4. Explicitar fronteira insight-novo vs formalizacao (Parecerista de Design)

Na introducao, dedicar 2-3 frases a: "A intuicao de que crises visiveis facilitam coordenacao vem de Chwe (2001) e Kuran (1991). A intuicao de que democracias sao frageis a choques vem de Przeworski et al. (2000). A contribuicao deste paper e a *interacao*: o padrao cruzado e a identificacao de $\eta_R$ como parametro governante." Neutraliza a objecao "this is obvious."

### 5. Adicionar diagrama de timing e matriz 2x2 visual (Pareceristas de Exposicao e Tecnico)

- Timeline mostrando a sequencia dentro de cada periodo (choque → resposta → decisao M/R)
- Diagrama 2x2 {rapid, threshold} x {democracy, autocracy} com cores para estavel/instavel sob crossed fragility

## Recomendacao estrategica ao autor

O paper esta em condicao de submissao apos as revisoes acima. O design e forte (8/10) e nao precisa ser alterado. As deficiencias sao **todas** de apresentacao --- provas, notacao, exemplos, figuras. Estimativa de esforço: 1-2 dias de trabalho focado.

**Target journals (em ordem de fit):**
- **JOP** ou **BJPS**: melhor fit para modelo formal de CP comparada com implicacoes de policy. O resultado normativo (P7-P8) e atraente para esses journals.
- **AJPS**: possivel se o mapeamento empirico for fortalecido (operacionalizar $\varphi_0$ e $\kappa_0$).
- **APSR**: exigiria maior sofisticacao na distancia premissas-conclusoes --- considerar apos feedback dos journals acima.
- **IO**: se o paper for reenquadrado com enfase na competicao geopolitica EUA-China.

O caminho mais produtivo: implementar as 5 prioridades, submeter a JOP ou BJPS, e simultaneamente preparar o companion empirico que fortaleceria uma submissao futura a AJPS.

---

## Parecer completo --- Design do Modelo

# Parecer de Design do Modelo (Dixit / Varian / Board)

## Score: 8/10

## O modelo em uma frase

Um modelo de dois periodos compara a estabilidade de democracias e autocracias frente a dois tipos de trajetoria de automacao por IA (rapida vs. threshold), mostrando que a capacidade de coordenacao dos trabalhadores afetados gera um padrao de "fragilidade cruzada" entre regimes.

## Tipo de contribuicao (Board & Meyer-ter-Vehn)

**Nova lente sobre forcas politicas conhecidas + predicoes empiricas novas.** O paper nao propoe uma pergunta inteiramente nova (estabilidade de regimes frente a choques economicos e um tema classico), mas oferece uma lente nova: a interacao entre a *forma temporal* do choque e o tipo de regime. A contribuicao principal e isolar uma forca politica especifica --- a coordenacao dos afetados como variavel mediadora --- e mostrar que ela opera em direcoes opostas conforme o regime.

## Avaliacao por dimensao

### MD1. Qualidade da pergunta [Adequada, com potencial para Excelente]

A pergunta e genuina, oportuna, e compreensivel para nao-especialistas. Ponto a fortalecer: a distincao entre insight novo e formalizacao de intuicao pre-existente precisa ser mais explicita. A ideia de que democracias sao frageis a crises (Przeworski et al. 2000) e que visibilidade importa para coordenacao (Chwe, Kuran) ja existiam. O que e novo e a *interacao* gerando o padrao cruzado.

### MD2. Simplicidade e KISS [Excelente]

Maior virtude do paper. Passa o teste Schelling-Spence: remover qualquer componente ($\eta_R$, reatividade de A3, dois periodos) elimina o resultado cruzado. Cabe em menos de 4 paginas. Premissas stark no sentido positivo de Dixit.

### MD3. Isolamento do mecanismo [Excelente]

Coordenacao como variavel mediadora com efeitos opostos sobre cada regime: em democracias *ajuda* (ativa compensacao), em autocracias *atrapalha* (degrada repressao). A nota de rodape sobre mecanismo informacional vs preferencial e crucial e bem articulada.

### MD4. Riqueza de insights [Rica]

8 proposicoes, tipologia de 5 tipos, welfare gap exato ($= \bar{\kappa}$), equivalencia funcional welfare/repressao, transferibilidade para outros choques. A frase "stability without welfare" e publicavel.

### MD5. Tipo de contribuicao [Nova lente + Forca isolada + Predicoes empiricas]

Classificacao multipla. Nao e pergunta inteiramente nova nem contribuicao tecnica. A forca esta na combinacao.

### MD6. Processo de construcao [Maduro]

Exemplos numericos (v1, v2) antes de generalizar. Iteracao com refinamento (v1 sem $\eta$ → v2 com $\eta$). Baseline + extensao. Microfundacoes como apendices. Processo exemplar.

## Sugestoes construtivas

1. Explicitar fronteira insight-novo vs formalizacao na introducao
2. Adicionar extensao curta com incerteza sobre trajetorias
3. Explorar interacoes na estatica comparativa (efeito de $L$ condicional a $\eta_R$)
4. Discutir premissa de instrumentos exclusivos com mais peso
5. Considerar exemplo numerico no corpo do texto
6. Refinar microfundacao de A4 no apendice (derivar $x^*$ em forma fechada)

---

## Parecer completo --- Apresentacao Tecnica

# Parecer de Apresentacao Tecnica (Thomson / Board)

## Score: 7/10

O manuscrito e claro para um paper formal de CP, com provas concisas e estrutura logica bem articulada. As deficiencias concentram-se em lacunas de notacao, ausencia de exemplos numericos, e provas excessivamente telegraficas.

## Estrutura do modelo

Grupo $E$ (trabalhadores expostos) escolhe $M$ ou $R$ em cada periodo. Governo democratico/autocratico parametrizado (nao modelado como agente estrategico no baseline). Informacao completa no baseline; sinais privados nos apendices. Timing: dois periodos, choques exogenos. Conceito de equilibrio: nao declarado no baseline (decision theory); SPE e BNE nos apendices.

## Scorecard

| Dimensao | Veredicto | Comentario |
|----------|-----------|------------|
| D2. Apresentacao | Adequado | Quase canonica, ~2.5pp, mas falta declarar conceito de equilibrio |
| D3. Notacao | Precisa melhorar | Colisao $R$ (acao/rapid), inconsistencia $\eta$, $\bar{\kappa}$ com dupla forma |
| D4. Definicoes | Precisa melhorar | "Estabilidade" definida tardiamente, limiares nomeados apos uso |
| D5. Resultados | Adequado | Boa estrutura Board, falta formato paralelo P1/P2 |
| D6. Provas | Precisa melhorar | ~25% linguagem natural vs 52-63% recomendado |
| D7. Figuras | Adequado | Uma boa figura, faltam diagrama de timing e matriz 2x2 |
| D8. Assumptions | Adequado | Ordem sensata, motivacao proporcional, falta exemplo unificado |
| D9. Exemplos | Precisa melhorar | Nenhum exemplo numerico no corpo |

## Sugestoes construtivas (priorizadas)

1. Inserir exemplo numerico worked-out apos A5
2. Expandir provas com linguagem natural (alvo 50-60%)
3. Resolver colisao $R$: renomear acao radical para $P$
4. Adicionar diagrama de timing
5. Uniformizar notacao de $\eta$ em todo o manuscrito
6. Resolver colisao $\tau$/$\tau_t$ e $c$/$c$ nos apendices
7. Definir estabilidade antes de A1
8. Declarar explicitamente ausencia de conceito de equilibrio no baseline

---

## Parecer completo --- Exposicao

# Parecer de Exposicao do Modelo (Varian / Thomson / Board)

## Score: 8/10

## Avaliacao por dimensao

### ME1. Estrutura [Excelente]

Gancho na primeira frase. Resultado principal (P3) antes da p.5. Fluxo limpo: Modelo → Resultados base → Extensao → Discussao → Conclusao. Baseline resolvido antes de extensoes. Microfundacoes nos apendices.

### ME2. Introducao [Adequada]

Contribuicao clara nos primeiros paragrafos. Estrutura: resultado → contexto → modelo → resultados → roadmap. Ponto de melhoria: segundo paragrafo e mini-lit-review que interrompe momentum (5 referencias em um paragrafo). Paragrafo sobre Przeworski-Wallerstein poderia ir para Discussion.

### ME3. Escrita e estilo [Adequado]

Frases curtas em geral. Nenhuma frase comecando com simbolo. Consistencia de voz. Footnotes com parcimonia (3 no corpo). Repeticao entre abstract e primeira frase da introducao.

### ME4. Extensao [Enxuto]

~12-15 paginas formatadas. Provas de 1-3 linhas no corpo. Conclusao compacta. Segue "once you've made your point, stop" (Varian).

### ME5. Exemplos e intuicao [Precisa melhorar]

Dimensao mais fraca. Nenhum exemplo numerico motivador. Nenhum exemplo empirico concreto para o mecanismo. Nenhum cenario narrativo no inicio. Proposicoes 5-6 com explicacao insuficiente.

## Top 5 sugestoes

1. Exemplo numerico worked-out apos P3 (mesmos parametros da Figura 1)
2. Paragrafo motivador concreto no inicio da introducao ("Imagine dois paises...")
3. Encurtar segundo paragrafo da introducao (mover parte da lit review)
4. Adicionar diagrama 2x2 de crossed fragility
5. Eliminar repeticao entre abstract e primeira frase da introducao
