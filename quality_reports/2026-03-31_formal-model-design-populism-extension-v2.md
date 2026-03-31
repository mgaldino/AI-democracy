# Parecer de Design do Modelo (Dixit / Varian / Board) — v2

**Data**: 2026-03-31
**Objeto avaliado**: Design revisado da microfundamentacao via populismo (v2), conforme `model/05_populism_microfoundation_synthesis.md` (secao "Mecanismo escolhido")
**Progressao**: 6.5/10 (v1, tres mecanismos + R individual) -> **7.5/10** (v2, mecanismo unico + coordenacao de elites)

## Score: 7.5/10

## O modelo em uma frase

Sob threshold, a heterogeneidade de E (criada pela complementaridade em t=1) torna incerto se elites politicas mainstream conseguem coordenar uma demanda compensatoria coesa, abrindo espaco para um empreendedor populista e gerando dois equilibrios autorrealizaveis — compromisso ou populismo — com o welfare state pre-existente (phi_0) como seletor.

## Tipo de contribuicao (Board & Meyer-ter-Vehn)

**Forca politica isolada + Nova lente para microfundamentacao existente.** O design isola um mecanismo preciso: a heterogeneidade endogena a trajetoria economica afeta a capacidade de coordenacao de elites politicas, nao dos eleitores. Isso e uma contribuicao genuina — a literatura de populismo (Bonomi et al. 2021, Buisseret & Van Weelden 2020) modela competicao eleitoral com heterogeneidade exogena; aqui a heterogeneidade e endogena a trajetoria de automacao, o que conecta o mecanismo diretamente ao modelo base. Se a formalizacao funcionar, e potencialmente uma nova proposicao (P9), nao apenas um apendice revisado.

## Avaliacao por dimensao

### MD1. Qualidade da pergunta — Excelente

Mantem a mesma excelencia da v1. A pergunta e um puzzle genuino que um referee apontaria: se o choque threshold e visivel em t=2, por que a democracia nao compensa? A resposta — a complementaridade transforma o cenario politico, criando heterogeneidade que fragmenta a demanda — e criativa, nao-obvia, e empiricamente ancorada. A analogia com Brexit/globalizacao e convincente: nao faltou dinheiro nem informacao; faltou coesao politica.

### MD2. Simplicidade e KISS — Adequado (melhoria significativa sobre v1)

**Problema v1 resolvido**: os tres mecanismos (g, heterogeneidade, traicao) foram reduzidos a UM — heterogeneidade de E determinando a capacidade de coordenacao de elites. Os outros dois foram corretamente relegados: g descartado (ad hoc), traicao relegada a cor empirica. O design agora passa no teste Schelling-Spence para o mecanismo: se removermos a heterogeneidade de E, os dois equilibrios desaparecem (E homogeneo -> M-party coordena trivialmente -> equilibrio unico). O mecanismo e indispensavel.

**Preocupacao remanescente**: o jogo proposto tem 4 tipos de jogadores (E_i, M-party, P-party, N). O Appendix A atual tem 2 (E, N). Quadruplicar os jogadores para uma microfundamentacao e um salto consideravel. Sera possivel reduzir? Talvez M-party e P-party possam ser modelados como um unico "political market" com entrada endogena, em vez de dois jogadores estrategicos separados. Isso reduziria a complexidade sem perder o mecanismo.

**Parametros**: a v2 precisa de pelo menos um parametro novo (medida de heterogeneidade de E sob threshold, digamos sigma_E). Isso e aceitavel — o Appendix A tem gamma e c, e sigma_E faria trabalho analitico claro (sigma_E = 0 sob rapid -> equilibrio unico; sigma_E > 0 sob threshold -> dois equilibrios). Passa no teste de parcimonia.

### MD3. Isolamento do mecanismo — Adequado (melhoria significativa sobre v1)

**Problema v1 resolvido (R individual vs. coordenado)**: a solucao — eleitores votam individualmente, coordenacao e das elites — e elegante e resolve o problema tecnico sem mudar a estrutura do modelo base. Cada E_i ainda compara u_E(M) vs u_E(R) individualmente. O que muda e o que esta no menu eleitoral: se M-party oferece compensacao, E_i vota M; se P-party oferece populismo e ganha, o resultado e R (backsliding). Isso e consistente com o modelo base.

**Problema v1 resolvido (separacao dos lados)**: democracia = coordenacao de elites sobre plataforma; autocracia = coordenacao de E para superar repressao. Mecanismos distintos, mesma fonte (heterogeneidade). Limpo.

**Preocupacao nova**: os dois equilibrios sao descritos como "autorrealizaveis", mas a fonte formal da multiplicidade nao esta totalmente especificada. Em que jogo exatamente surgem os dois equilibrios? Se M-party e P-party jogam simultaneamente, e um jogo de coordenacao entre eles? Se sequencialmente (M-party primeiro, P-party entra se M-party falha), o resultado pode ser unico via backward induction. A estrutura de timing importa para determinar se ha genuina multiplicidade ou apenas um resultado deterministico que depende de parametros (como sigma_E > sigma_bar vs. sigma_E < sigma_bar). Isso precisa ser esclarecido no sketch numerico.

**Preocupacao sobre a heterogeneidade de E**: por que a complementaridade criaria heterogeneidade DENTRO de E? Se E e definido como "trabalhadores que serao deslocados por IA em t=2", todos experimentam l_1 = 0 em t=1 (sem perda). A heterogeneidade teria que vir de ganhos diferenciais durante a complementaridade — alguns E_i ganharam mais produtividade com IA que outros. Isso e plausivel mas precisa de justificativa explicita, e a definicao de E pode precisar ser refinada para acomodar essa variacao interna.

### MD4. Riqueza de insights — Rica

Mantem a riqueza da v1 e adiciona:
- **Insight transferivel forte**: "tecnologias que primeiro complementam e depois substituem sao politicamente mais perigosas que tecnologias que deslocam imediatamente" — aplica-se a globalizacao, plataformas digitais, automacao gradual. Este insight e nao-obvio e testavel.
- **phi_0 como mecanismo anti-populista**: welfare state previne populismo nao porque compensa (mecanico), mas porque elimina a fragmentacao politica (elimina a necessidade de coordenacao de elites sobre compensacao). Isso enriquece P7 com uma interpretacao substantiva nova.
- **Democracia populista como tipo**: phi_0 ~ 0 em t=0 = populismo como condicao inicial, nao apenas como resultado. Fecha o ciclo: populismo erode phi_0 -> democracia fraca -> mais vulneravel a populismo sob threshold.
- **Estatica comparativa nova**: sigma_E (heterogeneidade) como variavel-chave. Setores com IA altamente diferenciadora (e.g., IA que ajuda muito programadores seniores e pouco juniores) teriam sigma_E maior -> mais vulneraveis ao equilibrio populista.

### MD5. Tipo de contribuicao — Forte

**Forca politica isolada** (heterogeneidade endogena -> fragmentacao de demanda -> abertura para populismo) + **Predicao empirica nova** (trajetorias com fase de complementaridade sao mais perigosas politicamente) + **Insight normativo** (welfare state como mecanismo anti-populista, nao apenas compensatorio). Se formalizado com sucesso, justifica uma nova proposicao (P9) no paper, nao apenas um apendice revisado.

### MD6. Processo de construcao — Adequado (melhoria)

A trajetoria de iteracao e excelente: v1 com tres mecanismos -> avaliacao 6.5/10 -> selecao rigorosa (cada candidato avaliado com pros/contras) -> v2 com mecanismo unico. O insight "quem coordena sao elites, nao eleitores" veio do autor durante o brainstorming, nao foi imposto — sinal de maturidade conceitual. Porem, o sketch numerico AINDA nao foi feito. Varian insiste: "Work an example." A v2 e conceitualmente mais madura que a v1, mas compartilha a mesma lacuna — o teste numerico. Ate que os payoffs sejam computados com numeros concretos, o design permanece uma conjectura informada.

## Veredicto geral

O design v2 resolve os tres problemas identificados na v1: (1) simplifica para um mecanismo (heterogeneidade -> coordenacao de elites), (2) resolve R individual vs. coordenado (eleitores votam individualmente, coordenacao e das elites), e (3) separa os lados (democracia = coordenacao de elites, autocracia = coordenacao de E). A melhoria e significativa.

O principal ponto forte e o mecanismo: heterogeneidade endogena a trajetoria economica que afeta a coordenacao de elites politicas, nao dos eleitores. Isso e original, parcimonioso, e empiricamente ancorado.

Dois pontos fracos remanescentes: (a) a fonte formal da multiplicidade de equilibrios precisa ser especificada — o timing do jogo entre M-party e P-party determinara se ha genuina multiplicidade ou um resultado deterministico condicional a sigma_E; (b) a justificativa para heterogeneidade DENTRO de E sob complementaridade precisa ser mais explicita. Ambos sao resoluveis no sketch numerico.

A recomendacao e clara: **fazer o sketch numerico agora**. O design conceitual esta maduro o suficiente. Os dois pontos fracos remanescentes so podem ser resolvidos com numeros — conceitos adicionais nao vao ajudar; a disciplina numerica sim.

## Sugestoes construtivas

1. **Sketch numerico IMEDIATO.** Usar os parametros do v2 (w_E=1, W=2, L=1, theta=0.5, k=0.4) e adicionar sigma_E como parametro de heterogeneidade. Mostrar: (a) sob rapid (sigma_E = 0), equilibrio unico; (b) sob threshold (sigma_E > 0), dois equilibrios. Computar payoffs de todas as combinacoes.

2. **Simplificar o jogo de elites.** Em vez de M-party e P-party como jogadores separados, modelar como um jogo de entrada: M-party sempre oferece compensacao; P-party entra sse a heterogeneidade de E cria uma abertura (sigma_E > sigma_bar). Isso transforma a multiplicidade em condicao parametrica — mais tratavel, embora perca a autorrealizacao. Avaliar no sketch qual estrutura e mais frutifera.

3. **Justificar heterogeneidade de E.** Sugestao: definir que durante a complementaridade (t=1, l_1 = 0), a IA aumenta produtividade de E_i diferentemente (depende do tipo de tarefa). Quando o threshold chega, alguns E_i tinham produtividade alta (investiram em skills complementares a IA) e outros baixa. Isso cria heterogeneidade interna com justificativa economica precisa, derivada da premissa de Gans & Goldfarb (O-Ring: tarefas complementares dentro de processos produtivos).

4. **Testar se o resultado justifica P9.** Se o sketch numerico confirmar dois equilibrios, a extensao merece uma proposicao formal: "Sob threshold automation com heterogeneidade suficiente (sigma_E > sigma_bar), democracias sem welfare state enfrentam um equilibrio populista alem do equilibrio compromisso." Isso seria P9, nao um apendice.

5. **Conexao formal com Bonomi et al. (2021).** O mecanismo (heterogeneidade -> fragmentacao de cleavage politico) e conceitualmente proximo do QJE de Bonomi, Gennaioli & Tabellini, onde choques economicos mudam qual clivagem e saliente. Importar a estrutura formal (identity switching + competicao eleitoral) seria o caminho mais eficiente para formalizar o jogo M-party vs. P-party.
