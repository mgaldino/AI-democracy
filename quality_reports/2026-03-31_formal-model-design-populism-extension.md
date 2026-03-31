# Parecer de Design do Modelo (Dixit / Varian / Board) — Extensão: Microfundamentação via Populismo

**Data**: 2026-03-31
**Objeto avaliado**: Design conceitual de nova microfundamentação para A3+A5, conforme `model/05_populism_microfoundation_synthesis.md`
**Contexto**: Modelo base avaliado em 8.5/10 (v3). Esta extensão propõe substituir/enriquecer o Appendix A com um jogo de dois equilíbrios sob threshold.

## Score: 6.5/10

## O modelo em uma frase

Extensão do jogo de votação do Appendix A onde, sob threshold, os ganhos de complementaridade em t=1 tornam a compensação custosa para N e a coordenação de E incerta, gerando dois equilíbrios autorrealizáveis (compromisso vs. populista), com φ₀ selecionando entre eles.

## Tipo de contribuição (Board & Meyer-ter-Vehn)

**Modelo novo (nova lente) para microfundamentação existente.** A contribuição é reconceptualizar POR QUE democracias falham sob threshold — de um argumento informacional/timing (A3+A5) para um argumento de economia política (coalizão de vencedores + coordenação incerta). Isso é valioso: endereça uma fragilidade real na argumentação do modelo base. Porém, é uma melhoria de microfundamentação, não uma nova proposição — o resultado formal (P1-P8) permanece o mesmo.

## Avaliação por dimensão

### MD1. Qualidade da pergunta — Excelente

A pergunta é excelente: "por que democracias falham sob threshold se o choque é igualmente observável em t=2?" Identifica uma fragilidade genuína que um referee atento apontaria. A resposta proposta — a fase de complementaridade transforma o cenário político — é criativa e empiricamente ancorada (Brexit como caso paradigmático). A conexão com a literatura de populismo (Passarelli & Tabellini 2017, Di Tella & Rotemberg 2018, Bonomi et al. 2021) enriquece o posicionamento do paper.

### MD2. Simplicidade e KISS — Precisa simplificar

Aqui reside o principal problema. O design atual introduz **três mecanismos simultâneos**: (1) ganhos de N que encarecem compensação (custo c' = c + δg), (2) heterogeneidade de E que torna coordenação incerta, (3) narrativa de traição que canaliza raiva em populismo. Cada um desses mecanismos poderia, sozinho, gerar o resultado. Juntos, criam redundância e obscurecem qual é o mecanismo essencial.

**Teste Schelling-Spence**: Se removermos a heterogeneidade de E e mantivermos apenas g (ganhos de N) + custo de coordenação condicional a crenças de N, o resultado sobrevive? Provavelmente sim. Se removermos g e mantivermos apenas heterogeneidade de E, também sobrevive (via global game com σ variável). Isso indica que o modelo precisa de mais simplificação — nem todos os componentes estão fazendo trabalho analítico indispensável.

**Parâmetros novos**: g, δ, c' são três novos parâmetros para um apêndice de microfundamentação. Compare com o Appendix A atual: apenas γ e c além dos parâmetros do modelo base. O teste é: cada parâmetro faz trabalho analítico que nenhum outro parâmetro faz?

### MD3. Isolamento do mecanismo — Parcial

O mecanismo central — "complementaridade cria vencedores que bloqueiam compensação" — é claro e poderoso. Mas está emaranhado com o mecanismo de coordenação (que é o mecanismo autocrático do Appendix B). O design propõe que a coordenação de E opere tanto no lado democrático (determina se N acredita que E vai revoltar) quanto no autocrático (determina η). Isso é conceitualmente elegante (mecanismo unificador!) mas cria um risco: se a coordenação de E é o mecanismo para AMBOS os regimes, a distinção regime-específica (democracia = compensação, autocracia = repressão) fica borrada.

**Problema da tabela de payoffs**: Na tabela 2×2 de N, o payoff de N quando bloqueia e E não coordena é (w_N + g) — N fica com tudo. Mas no SPE, se E credivamente prefere R quando não compensado (por A2), e R é uma ação individual (não requer coordenação), então N sabe que E SEMPRE escolhe R se φ = 0. A coordenação só importa se R requer coordenação. Mas no modelo base, R sob democracia é uma escolha individual de cada membro de E (diferente do Appendix B onde revolução requer massa crítica π̄). Se R é individual, não há incerteza sobre E, e a tabela colapsa: N sabe que E revolta se bloqueado → N sempre compensa (como no Appendix A atual).

**Isso é o maior problema técnico do design**: para os dois equilíbrios existirem, R sob democracia precisa requerer coordenação. Mas no modelo base, a estabilidade democrática é definida em termos de u_E(M) vs u_E(R) para cada membro de E, sem referência a coordenação. Se R requer coordenação, o payoff de R precisa ser condicional a π, o que muda a estrutura do modelo base — não apenas da microfundamentação.

### MD4. Riqueza de insights — Rica (potencial)

Se os problemas técnicos forem resolvidos, o design promete insights valiosos:
- **φ₀ como seletor de equilíbrio** é um resultado novo que enriquece P7 significativamente (welfare state não apenas compensa — previne populismo)
- **"Democracia populista" como caso extremo de democracia fraca** é limpo e empiricamente mapeável
- **Complementaridade como semente de destruição política** é transferível: qualquer tecnologia que primeiro beneficia e depois substitui criaria o mesmo padrão (globalização → Brexit é exatamente isso)
- **Assimetria democracia/autocracia** via canais políticos (vencedores podem bloquear em democracia mas não em autocracia) é genuinamente nova

### MD5. Tipo de contribuição — Forte se executada

A contribuição seria: **força política isolada** (complementaridade como criadora de constituency que bloqueia compensação) + **pergunta nova para a microfundamentação** (por que welfare state previne populismo, não apenas compensa). Convincente se resolvido o problema técnico de MD3.

### MD6. Processo de construção — Adequado (em progresso)

A trajetória de brainstorming é exemplar: pergunta socrática → identificação da fragilidade → exploração de mecanismos → convergência. Porém, o sketch numérico ainda não foi feito, e é exatamente no sketch que os problemas de MD3 apareceriam de forma irrecusável (Varian: "Work an example. No! The next stage is to work an example").

## Veredicto geral

O design identifica uma fragilidade REAL no modelo base e propõe um mecanismo criativo e empiricamente ancorado. A intuição é forte: a fase de complementaridade transforma o cenário político, e o welfare state previne populismo (não apenas compensa). Porém, há um **problema técnico central**: para os dois equilíbrios existirem, R precisa requerer coordenação sob democracia, o que tensiona a estrutura do modelo base onde R é escolha individual. Este problema precisa ser resolvido ANTES do sketch numérico — não durante.

A recomendação é: resolver o problema do "R individual vs. R coordenado" primeiro, depois fazer o sketch numérico. Se a solução for que R sob democracia é interpretado como backsliding democrático (que requer mobilização política, não ação individual), isso precisa ser formalizado com cuidado para não contradizer a definição de estabilidade do modelo base.

## Sugestões construtivas

1. **Resolver o problema de R individual vs. coordenado.** Opção mais limpa: distinguir entre R-individual (cada E pode revoltar sozinho, como no modelo base) e R-coletivo (revolução requer massa crítica). Sob democracia, R-individual é voting for a populist — cada cidadão vota sozinho, mas a eleição do populista só ocorre se maioria de E vota R. Isso naturaliza a coordenação sem mudar payoffs.

2. **Simplificar para UM mecanismo.** O design tem três mecanismos (g encarece compensação, heterogeneidade reduz coordenação, narrativa de traição canaliza raiva). Escolher UM como o mecanismo formal e relegar os outros a discussão verbal. Candidato mais forte: g encarece compensação para N, porque é o mais simples e o mais próximo do Appendix A existente.

3. **Separar democracia e autocracia.** A coordenação de E deveria operar DIFERENTEMENTE nos dois lados. Sugestão: no lado democrático, o mecanismo é g (custo de compensação para N). No lado autocrático, o mecanismo é heterogeneidade (coordenação de E para superar repressão). Isso mantém a separação limpa de instrumentos.

4. **Sketch numérico IMEDIATO.** Antes de resolver tudo conceitualmente, fazer o sketch com números (Varian). Os problemas técnicos ficarão óbvios quando os payoffs forem computados. Use os parâmetros do exemplo v2 (w_E=1, W=2, L=1, θ=0.5, k=0.4) e adicione g=0.3, δ=1.

5. **Testar o scope.** Esta extensão pode funcionar como: (a) novo Appendix A (substitui o atual), (b) Appendix C (complementar), ou (c) seção do paper se o resultado for suficientemente forte (dois equilíbrios → nova proposição). O sketch numérico ajudará a decidir.
