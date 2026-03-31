# Populism Microfoundation: Synthesis from Socratic Interview (2026-03-31)

## Problema identificado

A microfundamentacao atual do mecanismo de coordenacao tem duas fragilidades:
- **Lado democratico (A3+A5)**: o choque threshold e igualmente visivel em t=2, entao "falta de informacao" nao justifica a falha democratica. O que realmente faz o trabalho e A5 ("tarde demais"), que e assumido, nao derivado.
- **Lado autocratico (eta)**: nao ha razao clara para sinais serem mais ruidosos sob threshold -- o choque L e igualmente observavel em ambos os casos.

## Mecanismo novo: a fase de complementaridade como transformadora politica

A insight central e que a fase de complementaridade (l_1 = 0 sob threshold) nao apenas atrasa o choque -- ela **transforma o cenario politico** de tres formas:

1. **Cria vencedores da IA** (firmas, consumidores, trabalhadores complementados) que formam constituency
2. **Cria narrativa de traicao** ("elites lucraram enquanto eramos preparados para o descarte")
3. **Cria heterogeneidade** entre trabalhadores (uns ganharam mais com complementaridade que outros)

Esses tres efeitos tem consequencias OPOSTAS em cada regime:

| | Democracia | Autocracia |
|--|--|--|
| **Threshold** | Vencedores bloqueiam compensacao via canais democraticos + narrativa de traicao -> equilibrio populista -> instavel | Vencedores nao tem canal para bloquear autocrata + heterogeneidade impede coordenacao -> repressao funciona -> estavel |
| **Rapid** | Sem vencedores previos -> sem bloqueio -> compromisso -> estavel | Perdedores homogeneos -> coordenacao facil -> oposicao organizada -> repressao degradada -> instavel |

## Analogia empirica: Brexit

- Trabalhadores britanicos sabiam que globalizacao causou suas perdas (causa clara)
- O que gerou populismo nao foi confusao causal -- foi a percepcao de que elites lucraram com o mesmo processo
- Em vez de redistribuicao, houve austeridade -> revolta populista inocua contra elites
- A "solucao" populista (Brexit) foi emocionalmente satisfatoria mas economicamente prejudicial

## Resultado formal proposto (Caminho 3: equilibrios multiplos)

Sob threshold, democracias sem welfare state (phi_0 < phi_bar) enfrentam **dois equilibrios**:
- **Compromisso**: taxar ganhos da IA -> compensar perdedores -> phi_2 = phi_bar -> estavel
- **Populista**: narrativa de traicao + bloqueio por vencedores -> raiva canalizada em populismo anti-elite -> phi_2 = 0 -> instavel

### Seletor de equilibrio: phi_0

- phi_0 >= phi_bar: trabalhadores protegidos durante complementaridade -> sem traicao -> compromisso selecionado
- phi_0 = 0: trabalhadores expostos -> traicao -> populismo selecionado

P7 ganha profundidade: welfare state nao e so seguro mecanico -- e o que **previne as condicoes politicas do populismo**.

### Por que crossed fragility sobrevive

- **Rapid + democracia**: sem fase de complementaridade -> sem vencedores -> sem bloqueio -> apenas equilibrio compromisso existe -> estavel
- **Rapid + autocracia**: perdedores homogeneos -> coordenacao facil -> oposicao organizada -> eta_R < 1 -> instavel
- **Threshold + democracia**: fase de complementaridade criou vencedores + narrativa de traicao -> equilibrio populista -> instavel (para phi_0 < phi_bar)
- **Threshold + autocracia**: vencedores nao tem canal democratico para bloquear autocrata + heterogeneidade entre trabalhadores impede coordenacao -> repressao funciona -> estavel

## Conexoes com a literatura

| Paper | Conexao |
|-------|---------|
| **Di Tella & Rotemberg (2018)** JCE | Betrayal aversion: eleitores preferem lideres incompetentes como seguro contra traicao. Formaliza a narrativa de traicao |
| **Passarelli & Tabellini (2017)** JPE | Referencia-dependencia + aggrievement -> protesto. Referencia inflada pela complementaridade em t=1 |
| **Panunzi, Pavoni & Tabellini (2024)** EJ | Risk-seeking no dominio de perdas -> atracao por opcao populista arriscada |
| **Bonomi, Gennaioli & Tabellini (2021)** QJE | Identity switching sob choques: complementaridade ativa clivagem diferente de deslocamento rapido |
| **Fernandez & Rodrik (1991)** | Status quo bias: vencedores bloqueiam reforma. Exatamente o mecanismo de bloqueio de compensacao |
| **Bernhardt, Krasa & Shadmehr (2022)** AER | Paper mais proximo: liga fragilidade economica a instabilidade democratica. Nao compara trajetorias |

## Caminhos descartados

- **Caminho 1 (substituir A3+A5)**: substituiria microfundamentacao mas manteria resultado deterministico. Menos interessante.
- **Caminho 2 (robustez)**: adicionar premissa de betrayal como alternativa a A5. Descartado porque distancia premissa->conclusao e pequena demais (critica Edmans).
- **Abordagem B (sinalizacao/betrayal aversion)**: importar estrutura de Di Tella & Rotemberg (2018) — E escolhe entre lider competente (compromisso) e incompetente (populista). Sob threshold, betrayal aversion alta -> E prefere populista. Descartado por hora: mais distante do modelo atual. Pode ser retomado se Abordagem A (extensao do Appendix A com beneficiarios) nao funcionar.

## Selecao de mecanismo (2026-03-31)

Tres candidatos avaliados para o mecanismo formal central:

### Candidato 1: g (ganhos de complementaridade encarecem compensacao para N)
- N ganha g > 0 em t=1 -> custo de compensacao sobe de phi_bar*c para phi_bar*(c + delta*g)
- **Descartado**: resultado deterministico (nao gera dois equilibrios). Distancia premissa-conclusao pequena — delta*g e ad hoc (por que compensar E ameacaria ganhos de IA de N se compensacao e pura transferencia fiscal?)

### Candidato 2: Heterogeneidade de E (criada pela complementaridade)
- Complementaridade diferencia E (uns se adaptaram mais, uns ganharam mais)
- Gera dois equilibrios via incerteza sobre coordenacao
- **Problema original**: R no modelo base e individual, nao requer coordenacao -> heterogeneidade irrelevante
- **Solucao (insight do autor)**: quem coordena nao sao eleitores, sao ELITES POLITICAS. Eleitores votam individualmente. A coordenacao e sobre qual plataforma politica oferecer.

### Candidato 3: Narrativa de traicao (betrayal aversion)
- Complementaridade cria vencedores visiveis -> "elites lucraram enquanto nos eramos preparados para descarte"
- **Problemas**: (a) requer premissas comportamentais, (b) nao gera dois equilibrios naturalmente (e preferencial, nao autorrealizavel), (c) se traicao aumenta raiva de E, N deveria compensar MAIS (direcao errada)
- **Relegado a cor empirica**: narrativa de traicao e o CONTEUDO que o empreendedor populista usa, nao o mecanismo formal

### Mecanismo escolhido: Heterogeneidade de E + coordenacao de elites politicas

**Em uma frase**: sob threshold, heterogeneidade de E (criada pela complementaridade) torna incerto se elites mainstream conseguem coordenar demanda politica coesa, gerando dois equilibrios; sob rapid, homogeneidade de E torna coordenacao trivial, gerando equilibrio unico.

**Estrutura do jogo sob threshold (t=2, l_2 = L)**:

Jogadores:
- E_i (muitos membros, votam individualmente)
- Elites mainstream (M-party): decidem se oferecem plataforma compensatoria
- Empreendedor populista (P-party): decide se entra com plataforma anti-elite
- N (maioria, vota sobre taxacao se plataforma compensatoria vence)

Logica:
1. l_2 = L revelado
2. M-party tenta coordenar E em torno de compensacao. Sucesso depende de homogeneidade de E.
3. P-party avalia: se E fragmentado, oferece plataforma "elites trairam voces" (mais simples, captura raiva difusa)
4. E_i vota individualmente na plataforma preferida
5. Se compensacao vence: N taxa, phi_2 = phi_bar -> estavel
6. Se populismo vence: R implementado (backsliding democratico) -> instavel

Dois equilibrios autorrealizaveis:
- **Compromisso**: M-party coordena E (apesar de heterogeneidade) -> demanda coesa -> N compensa -> estavel
- **Populista**: P-party captura E fragmentado -> sem demanda coesa -> populista vence -> R -> instavel

**Assimetria rapid/threshold**:
- Rapid: E homogeneo -> M-party coordena trivialmente -> P-party sem abertura -> equilibrio unico (compromisso)
- Threshold: E heterogeneo -> M-party pode ou nao coordenar -> P-party tem abertura -> dois equilibrios

**phi_0 como seletor**:
- phi_0 >= phi_bar: welfare state ja existe, compensacao automatica -> nao precisa de coordenacao politica -> P-party nao tem abertura -> compromisso sempre
- phi_0 = 0: tudo depende de coordenacao politica -> populismo possivel

**Separacao dos lados do modelo**:
- Democracia: mecanismo e coordenacao de ELITES sobre plataforma politica
- Autocracia: mecanismo e coordenacao de E para superar repressao (Appendix B)
- Mecanismos distintos, mesma fonte (heterogeneidade de E da complementaridade)

**R sob democracia = backsliding democratico**:
- Cada E_i vota individualmente (consistente com modelo base)
- R = eleger populista que promete redistribuicao radical ao custo de destruicao institucional
- u_E(R) = theta*W - k permanece (payoff individual do backsliding)

**Democracia populista em t=0**:
- Caso extremo de democracia fraca com phi_0 ~ 0
- Populista ja no poder -> institucoes compensatorias erodidas -> sob threshold, certamente instavel

## Decisao sobre entrada (2026-03-31)

**Escolhido: Opcao B — Entrada autorreforçante.** P-party entra se acredita que pode ganhar. A propria campanha populista fragmenta E (ativa clivagem identitaria em vez de classe). Dois equilibrios autorrealizaveis:
- P-party entra -> campanha anti-elite -> fragmenta E -> P-party ganha
- P-party nao entra -> E permanece coeso -> M-party ganha

Descartado: Opcao A (entrada deterministica, sigma_E > sigma_bar) — daria resultado deterministico (Caminho 1), nao dois equilibrios (Caminho 3).

**Nota para versao final**: Na formalizacao completa, entrada de P-party deve ter componente estocastico — P-party entra porque tem CHANCE de ganhar, mas pode perder mesmo assim. Sketch numerico atual simplifica para determinismo condicional a crencas; extensao futura adiciona ruido eleitoral.

## Resultado do sketch numerico (2026-03-31)

Sketch em `model/06_populism_numerical_sketch.R`. Parametros do v2: w_E=1, W=2, L=1, theta=0.5, k=0.4.

### Resultados confirmados

1. **Rapid (sigma_E = 0)**: equilibrio unico (compromisso). E homogeneo, P-party nao entra.
2. **Threshold (sigma_E > 0)**: dois equilibrios existem para todo sigma_E testado (0.1 a 0.5).
3. **phi_0 >= phi_bar**: compromisso sempre (compensacao automatica, P-party sem abertura).
4. **Crossed fragility preservado**: democracia fraca estavel sob rapid, instavel (eq. populista) sob threshold.

### Explicacao didatica: por que E se divide sob threshold?

O ponto sutil do modelo e o seguinte. Sob threshold, a complementaridade em t=1 diferenciou os trabalhadores de E. Alguns ganharam mais produtividade com IA (tipo alto, x_i > w_E), outros ganharam menos (tipo baixo, x_i < w_E). Quando o choque L chega em t=2, TODOS perdem — mas a pergunta e: preferem aceitar compensacao (M) ou apoiar o populista (R)?

**Sem compensacao**: TODOS preferem R. Isso e trivial — o choque e grande demais para absorver sem ajuda (por A2).

**Com compensacao (phi = phi_bar)**: aqui a coisa fica interessante. A compensacao phi_bar foi calibrada para tornar o trabalhador MEDIO (x_i = w_E) indiferente entre M e R. Entao:
- Tipo alto (x_i > w_E): ganhou mais da IA, tem mais a perder com R, prefere M+compensacao. "Tenho um bom emprego ajustado, prefiro ser compensado a arriscar tudo."
- Tipo baixo (x_i < w_E): ganhou menos da IA, tem menos a perder, prefere R. "A compensacao nao e suficiente para mim, prefiro mudar o sistema."

No sketch com distribuicao uniforme simetrica em torno de w_E, exatamente 50% esta acima e 50% abaixo do cutoff. Isso e artefato da simetria — com distribuicao assimetrica (ex: mais trabalhadores abaixo da media), a fracao pro-R mudaria. O resultado QUALITATIVO e robusto: qualquer sigma_E > 0 cria uma fracao positiva que prefere R mesmo com compensacao.

### Por que o equilibrio compromisso sobrevive com 50% de E preferindo R?

Porque a ELEICAO nao e so entre membros de E. N (nao-expostos) tambem vota, e N e maioria (mu_N > mu_E, premissa do modelo base). No equilibrio compromisso:
- 50% de E vota M (aceita compensacao)
- 50% de E vota R (prefere populista)
- N vota M (prefere pagar taxa phi_bar*c a enfrentar instabilidade gamma)
- Total pro-M: N + metade de E > metade de E = total pro-R
- M-party vence -> compensacao implementada -> estavel

No equilibrio populista, o mecanismo e diferente:
- P-party entra e faz campanha anti-elite
- A campanha FRAGMENTA a demanda de E (ativa clivagem identitaria em vez de classe)
- Sem plataforma compensatoria coesa, N nao oferece taxa
- 100% de E prefere R sobre M sem compensacao
- Populista vence -> R -> instavel

A diferenca entre os dois equilibrios nao e quantos E_i preferem R "em abstrato" — e se existe uma plataforma compensatoria coesa para E votar. Quando M-party coordena, E se divide mas M-party vence com apoio de N. Quando P-party captura E, ninguem oferece compensacao e E vai unanime para R.

### Nota sobre a distribuicao uniforme

O resultado de exatamente 50-50 e artefato da uniforme simetrica. Em versao mais geral:
- Distribuicao com mais massa abaixo de w_E (ex: log-normal): mais de 50% pro-R -> equilibrio compromisso mais fragil
- Distribuicao com mais massa acima de w_E: menos de 50% pro-R -> equilibrio compromisso mais robusto
- O que importa para o resultado qualitativo: fracao pro-R > 0 (P-party tem base) E fracao pro-R < 1 (M-party tambem tem base)

## Desafios de formalizacao remanescentes

1. **Formalizar o jogo de elites**: como modelar M-party e P-party? Competicao eleitoral Downsiana com entrada? Jogo de coordenacao entre elites?
2. **Parametrizar heterogeneidade**: como medir heterogeneidade de E criada pela complementaridade? Variancia de ganhos em t=1?
3. **Derivar condicao para dois equilibrios**: para quais valores de heterogeneidade ambos os equilibrios existem?
4. **phi_0 como seletor formal**: derivar formalmente por que phi_0 >= phi_bar elimina o equilibrio populista
5. **Decidir escopo**: Appendix A revisado, Appendix C novo, ou secao do paper?

## Proximos passos

1. Sketch numerico IMEDIATO (Varian): parametros do v2 + heterogeneidade
2. Ler Bonomi, Gennaioli & Tabellini (2021) para ferramentas de competicao eleitoral com heterogeneidade
3. Decidir se entra no paper atual como nova microfundamentacao ou como extensao formal
