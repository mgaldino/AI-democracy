# Parecer de Execution (Framework Edmans) — v9 (2026-05-02)

## Score: 7.5/10
## Tipo de paper: Teorico

## Resumo da estrategia

O paper constroi um modelo de dois periodos com tres estados da natureza (rapid, threshold, no shock), sinalizacao via global games, triggers de compensacao assimetricos por regime (voice em democracia, avaliacao tecnocratica em autocracia), e deslocamento absorvente. A estrategia de execucao e deduzir o padrao de fragilidade cruzada a partir de uma primitiva unica — o tamanho do selectorate — que gera tres consequencias (informacao, velocidade, politica fiscal). O resultado central (Proposicao 3) combina as Proposicoes 1-2, que por sua vez dependem do Lema 1 (dictator's dilemma) e do Remark 1 (composicao absorvente).

## Principio "Dados vs. Evidencia"

Em papers teoricos, o analogo do principio "dados nao sao evidencia" e: *premissas nao sao resultados*. A questao e se as premissas implicam os resultados de forma nao-trivial, ou se os resultados estao essencialmente embutidos nos axiomas.

O paper opera parcialmente em cada direcao. A cadeia inferencial principal — selectorate size → (C_A > C_D, lag, fiscal politics) → triggers assimetricos → fragilidade cruzada — e genuina na medida em que a combinacao de tres consequencias com duas trajetorias produz padroes que nenhuma premissa isolada garante. Contudo, A8 codifica *diretamente* a ordenacao-chave (omega_D < omega_R < omega_A < omega_T2) que produz o resultado central. Embora o paper afirme que essa ordenacao "e derivada de sigma_A > sigma_D", ela e declarada como *axioma*, nao como resultado. Este e o problema central de execucao.

## Avaliacao por dimensao

### T.1 Distancia premissas-conclusoes — 6.5/10

**A maior fragilidade do paper.** A questao e: quanto trabalho as premissas fazem para chegar ao resultado, e quanto o resultado ja esta assumido?

**Onde a distancia e satisfatoria:**

- A interacao entre trajetoria (rapid vs threshold) e regime gera quatro cenarios com resultados distintos, nenhum dos quais trivialmente obvio a partir de qualquer premissa isolada.
- O Remark 1 (composicao absorvente) e um resultado algebrico genuino: Omega_2^rapid > Omega_2^threshold segue de omega_H > omega_L, mas a consequencia para protesto nao e automatica.
- A "armadilha da prosperidade" (threshold t=1 em democracia) combina tres canais (falta de voice, politica fiscal, lag) de forma nao-trivial.
- O Corolario 1 (sweet spot de C_A) e a Proposicao 5 (amplificacao via sigma_A) sao estatica comparativa genuina.

**Onde a distancia e insuficiente:**

1. **A8 assume o resultado.** A ordenacao omega_D < omega_R < omega_A < omega_T2 e exatamente a condicao necessaria e suficiente para o padrao cruzado. Com essa ordenacao em maos, Proposicoes 1-2 seguem quase mecanicamente: democracia compensa sob rapid (omega_R > omega_D) → estavel; autocracia nao compensa sob rapid (omega_R < omega_A) → cai; autocracia compensa sob threshold (omega_T2 > omega_A) → estavel; democracia nao compensa em tempo (lag) → cai. O paper *afirma* que a ordenacao "e derivada de sigma_A > sigma_D", mas essa derivacao nao e apresentada formalmente. A8 e um axioma que codifica o resultado, nao uma consequencia das primitivas.

2. **O Lema 1 nao e um lema.** Ele *re-declara* A8 em prosa. O "proof sketch" para o Lema 1 e uma descricao verbal de como C_A alto e sigma_A alto fazem o protesto ser menos informativo — mas nao ha uma derivacao que mostre, partindo de C_A > C_D e sigma_A > 0, que omega_A > omega_R. A conclusao "the ordering is derived from sigma_A > sigma_D" e afirmada sem proof. Para que fosse um lema, precisaria haver um mecanismo formal em que sigma_A > sigma_D → omega_A > omega_D, com omega_A definido endogenamente (nao como parametro livre).

3. **Circularidade parcial.** A cadeia inferencial declarada e: selectorate size → C_A > C_D → sigma_A > sigma_D → omega_A > omega_D → crossed fragility. Mas a cadeia real e: selectorate size → C_A > C_D (A4) + omega_A > omega_D (A8, direto) → crossed fragility. O passo intermediario (sigma_A → omega_A) nao esta formalizado. Omega_A e simplesmente declarado como parametro com a restricao omega_R < omega_A.

4. **Proposicoes 1-3 sao "verificacao de premissas" (assumption-checking), nao teoremas.** Cada proposicao assume que os parametros estao no range certo e verifica que o modelo faz o que as premissas dizem. Nao ha tensao entre premissas e conclusoes — o resultado e a premissa, reformulada.

**Recomendacao critica**: Derivar omega_A endogenamente. O paper ja tem a maquinaria necessaria: o incumbente autocratico observa pi_t, que e pouco informativo (C_A alto → pi flat em omega); ele inverte pi para inferir omega, mas a inferencia e imprecisa; portanto, precisa de um omega maior para estar confiante de que a crise e real. Essa logica esta na secao 3.4 e no plano de reformulacao, mas nao esta formalizada como derivacao. Se omega_A fosse definido como o valor de omega tal que P(tilde_omega_S > bar_omega | omega) = alpha para um alpha fixo (nível de confianca da elite), e sigma_A fosse modelado como funcao decrescente do selectorate, entao omega_A seria endogeno e crescente em sigma_A. Isso resolveria T.1 integralmente.

### T.2 Parcimonia — 8.5/10

**Forca do paper.** O modelo e notavelmente parcimonioso para o que entrega:

- Uma primitiva unica (selectorate) gera tres consequencias.
- Tres estados (R, T, N) sao o minimo necessario para incerteza genuina sobre theta.
- Deslocamento absorvente e uma premissa simples com consequencia nao-trivial.
- O mecanismo de queda e unico (pi > pi_fall com phi=0) para ambos os regimes.
- Compensacao binaria evita corner solutions.
- Protesto expressivo elimina o problema de free-rider.

**Fraquezas menores:**

1. **O sinal continuo s_{it} e sub-utilizado.** O modelo especifica um sinal continuo com distribuicao logistica e MLRP (A3), mas as proposicoes nao exploram a estrutura do global game. Nao ha cutoff s* derivado, nao ha estatic comparativa sobre sigma (ruido do sinal), nao ha uso da propriedade laplaciana. O global game parece montado mas nao jogado. A unica referencia a sinais e que "workers update beliefs about theta" — mas os resultados nao dependem da estrutura do sinal de forma operacional.

2. **delta e declarado mas inerte.** O desconto temporal aparece na definicao de v_i, mas nao entra em nenhuma proposicao como parametro que afeta o resultado de forma nao-trivial. A tabela de estatica comparativa diz "credible commitment more valuable" para delta alto, mas nao ha proposicao formal derivando esse efeito. Para parcimonia, seria melhor eliminar delta do modelo (definir v sem componente futuro) ou formalize o seu papel.

3. **A9 (renda de complementaridade) e modular.** Y+ = 1 + gamma entra apenas no canal fiscal da democracia sob threshold t=1. E um mecanismo separado (armadilha da prosperidade) que *reforça* o resultado mas nao e necessario para ele — sem gamma, a democracia ainda cai sob threshold porque o lag impede compensacao em t=2. O paper poderia ser mais transparente sobre quais resultados requerem gamma e quais nao.

### T.3 Caminho causal — 7.5/10

**A cadeia causal declarada e:**

```
Selectorate size
  → C_A > C_D (informacao)
  → lag (velocidade)
  → fiscal politics (quem autoriza compensacao)
  → [interacao com trajetoria]
  → crossed fragility
```

**Variaveis endogenas no path:**

1. **Protesto (pi) e endogeno e livre.** O modelo trata pi como resultado do jogo de coordenacao, condicionado a C_x, v_i, e h(pi). O caminho causal de omega_t → pi_t e bem especificado, e a complementaridade estrategica (safety in numbers) e microfundada. Sem circularidade aqui.

2. **Compensacao (phi) e parcialmente livre.** Em democracia, phi depende de pi > pi_comp (voice trigger) — endogeno, ok. Em autocracia, phi depende de tilde_omega_S > omega_A — o sinal tilde_omega_S e endogeno (funcao de omega_t + sigma_A * zeta), mas omega_A e exogeno (parametro livre). Isso reconecta a T.1: omega_A nao e determinado dentro do modelo.

3. **A condicao de queda depende de phi_t = 0.** Isso cria uma dependencia: regime cai iff pi > pi_fall AND phi = 0. Mas phi e determinado ANTES da condicao de queda ser avaliada (etapa 5 precede etapa 6 no timing). Sem inconsistencia temporal.

4. **Variavel potencialmente endogena e nao modelada: C_A.** O custo de protesto em autocracia e exogeno, mas teorias de repressao endogena (Svolik 2012, Acemoglu-Robinson 2006) sugerem que C_A pode ser escolha do autocrata, condicionada a percepcao de ameaca. Se C_A fosse endogeno, o dictator's dilemma teria uma dimensao adicional: o autocrata escolhe C_A alto (para suprimir protesto e manter o poder) mas isso reduz a informativeness do protesto — que e exatamente o trade-off de Wintrobe (1998). O paper reconhece Wintrobe mas nao explora essa endogeneidade. Para um paper de top-5, isso seria exigido como extensao; para JOP/BJPS, e aceitavel como limitacao declarada.

5. **O canal fiscal e bem integrado mas nao formalizado.** O paper descreve verbalmente que "workers earning Y+ face a higher tax burden and oppose compensation", mas nao formaliza o voto/decisao legislativa que transforma preferencias fiscais em ausencia de compensacao. Em democracia, a condicao deveria ser: compensacao requer maioria, e a maioria e (1-omega_L) trabalhadores ganhando Y+ que preferem nao pagar tau*Y+ em impostos. Isso e intuitivo mas nao esta escrito como proposicao ou condicao formal.

6. **Risco de equilibrio multiplo nao tratado.** O modelo invoca global games mas nao estabelece unicidade do equilibrio. A secao 3.6 (Assumptions) menciona que F tem MLRP e "yields closed-form cutoffs", mas nao ha um resultado de unicidade (lemma ou proposicao). Se houvesse equilibrios multiplos, o resultado de fragilidade cruzada seria condicional ao equilibrio selecionado — o que enfraqueceria a forca do argumento.

## Veredicto geral sobre execution

O paper tem uma execucao mista. O design conceitual e forte: uma primitiva unica gera tres consequencias que interagem com duas trajetorias para produzir quatro cenarios. O mecanismo e elegante, e a parcimonia e notavel. Contudo, a distancia premissas-conclusoes (T.1) e a principal fraqueza: A8 codifica diretamente a ordenacao que produz o resultado, e o Lema 1 — que deveria ser a derivacao que fecha a cadeia — e declarado sem proof formal. Isso reduz as proposicoes centrais a exercicios de verificacao parametrica, nao a teoremas que surpreendem o leitor. O caminho causal (T.3) e limpo na maioria dos canais, mas omega_A exogeno e a nao-formalizacao do canal fiscal sao gaps visiveis. O sinal continuo (A3) e montado mas nao operacionalizado. A recomendacao central — endogeneizar omega_A como funcao de sigma_A — resolveria T.1 e elevaria a execucao para 8.5+.

## Sugestoes construtivas

1. **Endogeneizar omega_A (critica).** Definir omega_A como o valor de omega tal que a probabilidade de o sinal tilde_omega_S exceder um threshold exogeno alpha e pelo menos 1/2 (ou qualquer criterio de decisao bayesiano). Mostrar que omega_A = alpha - sigma_A * F^{-1}(1/2) (ou equivalente), de modo que omega_A seja crescente em sigma_A. Isso transforma A8 de axioma em resultado, e o Lema 1 de declaracao em lema genuino.

2. **Derivar cutoff do global game.** Se o modelo usa sinais continuos com logistica e MLRP, o cutoff s* e derivavel em closed-form (Morris & Shin 2003). Apresentar s* explicitamente e usar para derivar pi*(omega) como funcao. Isso fundamentaria as proposicoes em algebra, nao em descricao verbal.

3. **Formalizar o canal fiscal sob threshold t=1 em democracia.** Escrever a condicao de voto: compensacao requer que a fracao de votantes que prefere pagar tau*Y+ para financiar B aos deslocados exceda 1/2. Mostrar que com omega_L pequeno e gamma > 0, essa condicao falha. Proposicao curta, mas fecha o canal.

4. **Tratar unicidade do equilibrio.** Invocar o resultado standard de global games (unicidade sob limite de dominance regions + prior difuso) ou demonstrar as condicoes sob as quais o equilibrio e unico neste modelo. Sem unicidade, a fragilidade cruzada depende de selecao de equilibrio.

5. **Decidir sobre delta.** Ou (a) formalizar o papel de delta numa proposicao (e.g., existe delta* tal que para delta > delta*, a promessa legislativa de t=1 reduz pi abaixo de pi_fall), ou (b) remover delta do baseline e tratar como extensao. Delta como parametro inerte e custo de notacao sem ganho.

6. **Clarificar a relacao entre sigma_A e sigma_D.** O paper fala de sigma_A (ruido da avaliacao da elite) como se fosse comparavel a sigma_D, mas sigma_D nao esta definido formalmente. Em democracia, o trigger e voice (pi > pi_comp), nao avaliacao tecnocratica. A comparacao sigma_A > sigma_D so faz sentido se sigma_D for o ruido implicito na inferencia via protesto. Formalizar essa comparacao.

7. **Explicitar quais resultados dependem de gamma e quais nao.** Se a fragilidade cruzada sobrevive com gamma = 0 (armadilha da prosperidade nao necessaria, apenas lag suficiente), dizer explicitamente. Se gamma e necessario para Proposicao 1(b), dizer explicitamente. Isso separa os mecanismos e permite ao leitor avaliar a robustez.

## Comparacao com review anterior

A versao atual (v9) e substancialmente mais limpa que versoes anteriores: o modelo e mais parcimonioso (sem aggrievement, sem A7 imposta como axioma separado, compensacao como escolha do incumbente). A preocupacao central permanece a mesma: A8 codifica o resultado. O plano de reformulacao (2026-05-01) mostra consciencia do problema e propoe endogeneizar omega_A via inferencia bayesiana do incumbente — mas essa reformulacao nao foi implementada no paper.Rmd.

**Score comparativo:**
- v8 Execution: 8.0/10 (avaliacao possivelmente generosa dado que A8 ja era problema)
- v9 Execution: 7.5/10 (nao houve progresso em T.1; modelo mais limpo mas A8 permanece)

A reducao reflete um julgamento mais severo sobre T.1, nao deterioracao do paper. O modelo melhorou em parcimonia e clareza, mas a fraqueza central nao foi endereçada.
