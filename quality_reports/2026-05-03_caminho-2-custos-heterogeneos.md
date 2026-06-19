# Caminho 2 - Protesto com custos heterogêneos e capacidade compensatória

**Data**: 2026-05-03  
**Status**: nota de reformulação conceitual  
**Objetivo**: preservar a substância política do modelo, reduzir a dificuldade de prova gerada pelo global game atual, e evitar uma versão excessivamente reduced-form.

## 1. Motivação

O problema técnico do modelo atual não é apenas a prova do Lemma 0. O problema é que o equilíbrio de protesto está carregando muitas tarefas simultaneamente:

1. agregar informação privada;
2. combinar dois sinais, `d_it` e `s_it`;
3. resolver coordenação estratégica;
4. incorporar expectativa intertemporal de perda futura;
5. gerar monotonicidades em `C_x`, `v`, `B` e `Omega`;
6. alimentar o gatilho de compensação e a condição de queda.

Isso torna o modelo vulnerável. Mesmo quando se tenta provar o equilíbrio, a estática comparativa do global game com `h(pi)=pi` cria uma tensão substantiva: no equilíbrio interior single-state, `pi* = 1 - v/C_x`, de modo que protesto aumenta com `C_x`, o oposto da intuição política de repressão.

O caminho proposto aqui substitui o global game por uma microfundação individual simples: trabalhadores têm custos heterogêneos de protestar. O protesto agregado emerge da distribuição desses custos. Isso mantém distância entre premissas e conclusões, mas evita a necessidade de provar existência, unicidade e seleção de equilíbrio em um jogo de coordenação.

## 2. Ideia central

Cada trabalhador deslocado tem um custo individual de protesto. O regime desloca a distribuição desses custos:

- em democracias, protestar é relativamente barato;
- em autocracias, protestar é relativamente caro.

Trabalhadores protestam quando a perda material de não receber compensação excede seu custo individual de protesto. Como os custos variam na população, um aumento no deslocamento ou na perda material aumenta o protesto agregado de forma contínua e monotônica.

A capacidade compensatória entra como variável de estado:

```math
K_t \in \{0,1\},
```

onde `K_t = 1` significa que existe infraestrutura institucional para compensar deslocados no período `t`. Se `K_t = 0`, deslocados não recebem compensação. Se `K_t = 1`, deslocados recebem `B`.

A diferença de velocidade institucional opera sobre `K_t`:

```math
D: \text{gatilho em } t \Rightarrow K_{t+1}=1,
```

```math
A: \text{gatilho em } t \Rightarrow K_t=1.
```

Assim, democracias podem responder, mas com lag; autocracias respondem imediatamente quando a elite autoriza.

## 3. Primitivos

Há um contínuo de trabalhadores `i in [0,1]` e dois períodos `t in {1,2}`. O regime é `x in {D,A}`.

As trajetórias econômicas continuam exógenas:

```math
\theta \in \{R,T,N\}.
```

No caminho rápido:

```math
(\omega_1,\omega_2)=(\omega_R,\omega_R).
```

No caminho threshold:

```math
(\omega_1,\omega_2)=(\omega_{T1},\omega_{T2}),
```

com:

```math
\omega_N < \omega_{T1} < \omega_R < \omega_{T2}.
```

O deslocamento é absorvente. A fração acumulada de deslocados no período 2 é:

```math
\Omega_2^R=\omega_R(2-\omega_R),
```

```math
\Omega_2^T=\omega_{T1}+(1-\omega_{T1})\omega_{T2}.
```

A renda individual é:

```math
y_{it}=(1-d_{it}) + B d_{it}K_t.
```

Logo, a perda material de um deslocado é:

```math
g(K_t)=1-BK_t.
```

Se não há capacidade compensatória, `g(0)=1`. Se há compensação, `g(1)=1-B`.

## 4. Microfundação do protesto

Somente trabalhadores deslocados participam do jogo de protesto no baseline. Essa é uma escolha de simplificação importante: empregados podem apoiar ou se opor a políticas de compensação na arena fiscal, mas o protesto disruptivo é gerado pelos trabalhadores que sofreram perda material direta.

Cada trabalhador deslocado tem custo individual:

```math
c_i=\kappa_x+\varepsilon_i,
```

onde:

- `kappa_x` é o componente institucional do custo de protesto;
- `epsilon_i` é heterogeneidade individual, distribuída segundo uma CDF contínua `H`;
- `kappa_A > kappa_D`, porque repressão, vigilância e ausência de proteção legal tornam protesto mais custoso na autocracia.

Um trabalhador deslocado protesta se:

```math
g(K_t) \geq \kappa_x+\varepsilon_i.
```

Assim, a fração de deslocados que protesta é:

```math
H(g(K_t)-\kappa_x).
```

O protesto agregado é:

```math
\pi_{xt}=\Omega_t H(g(K_t)-\kappa_x).
```

Quando `g(K_t)-kappa_x` está fora do suporte de `H`, interpretamos `H` como truncada em `0` e `1`.

## 5. Monotonicidades limpas

Se `H` é contínua e estritamente crescente no domínio relevante, então:

```math
\frac{\partial \pi_{xt}}{\partial \Omega_t}=H(g(K_t)-\kappa_x)>0.
```

Protesto cresce com deslocamento.

```math
\frac{\partial \pi_{xt}}{\partial B}
=-\Omega_t K_t h(g(K_t)-\kappa_x)<0
\quad \text{se } K_t=1.
```

Compensação reduz protesto quando está disponível.

```math
\frac{\partial \pi_{xt}}{\partial \kappa_x}
=-\Omega_t h(g(K_t)-\kappa_x)<0.
```

Repressão reduz protesto.

Essas são exatamente as propriedades que o modelo precisa e que o global game atual torna difíceis ou ambíguas.

## 6. Gatilhos institucionais

### Democracia

Democracias usam voice como gatilho:

```math
\text{comp}_{Dt}=1
\quad \text{iff} \quad
\pi_{Dt}\geq \bar{\pi}_D^{comp}
\quad \text{and} \quad
M_t=1.
```

`M_t` representa autorização fiscal majoritária. No baseline, pode ser definida por uma regra simples:

```math
M_t=1
\quad \text{iff} \quad
\Omega_t \geq \bar{\Omega}_D^{tax}
\quad \text{and} \quad
Y_t \leq \bar{Y}.
```

Interpretação:

- se há deslocamento suficiente, a demanda por compensação é politicamente majoritária;
- se a maioria está prosperando com IA, como no threshold em `t=1`, ela bloqueia investimento preventivo em compensação.

Quando a compensação é aprovada em democracia:

```math
\text{comp}_{Dt}=1 \Rightarrow K_{t+1}=1.
```

Há lag legislativo.

### Autocracia

Autocracias usam autorização da elite:

```math
\text{comp}_{At}=1
\quad \text{iff} \quad
\tilde{\omega}_{St}\geq \bar{\omega}_A.
```

O sinal da elite pode ser mantido como no modelo atual:

```math
\tilde{\omega}_{St}=\omega_t+\sigma_A \zeta.
```

A condição operacional central é:

```math
\omega_R < \bar{\omega}_A < \omega_{T2}.
```

Crises moderadas e persistentes são invisíveis para a elite; crises massivas são autovidentes.

Quando a compensação é autorizada em autocracia:

```math
\text{comp}_{At}=1 \Rightarrow K_t=1.
```

Há decreto imediato.

## 7. Condição de queda

O mecanismo de queda permanece único:

```math
\text{queda em } t
\quad \text{iff} \quad
\pi_{xt}>\bar{\pi}_x^{fall}
\quad \text{and} \quad
K_t=0.
```

Com:

```math
\bar{\pi}_D^{fall}>\bar{\pi}_A^{fall}.
```

Democracias toleram mais protesto antes de desestabilizar; autocracias são mais frágeis quando protesto excede sua capacidade coercitiva.

## 8. Fragilidade cruzada como conjunto de desigualdades

### Democracia sob trajetória rápida

Em `t=1`, há deslocamento moderado e visível:

```math
\pi_{D1}^R=\omega_R H(1-\kappa_D).
```

Condição para ativar compensação sem cair:

```math
\bar{\pi}_D^{comp}
\leq
\omega_R H(1-\kappa_D)
<
\bar{\pi}_D^{fall}.
```

Isso gera `K_2=1`. Em `t=2`:

```math
\pi_{D2}^R=\Omega_2^R H(1-B-\kappa_D).
```

Condição de estabilidade:

```math
\Omega_2^R H(1-B-\kappa_D)<\bar{\pi}_D^{fall}.
```

### Autocracia sob trajetória rápida

A elite não autoriza compensação:

```math
\omega_R < \bar{\omega}_A.
```

Logo `K_2=0`. Em `t=2`:

```math
\pi_{A2}^R=\Omega_2^R H(1-\kappa_A).
```

Condição de queda:

```math
\Omega_2^R H(1-\kappa_A)>\bar{\pi}_A^{fall}.
```

A autocracia cai não porque todo mundo protesta, mas porque a massa acumulada de deslocados torna até uma taxa baixa de participação suficiente para ultrapassar o limiar de queda.

### Democracia sob threshold

Em `t=1`, há poucos deslocados e a maioria prospera:

```math
\pi_{D1}^T=\omega_{T1}H(1-\kappa_D)<\bar{\pi}_D^{comp},
```

ou, mesmo que algum protesto exista, `M_1=0` porque `Y^+=1+\gamma` torna a maioria fiscalmente hostil à compensação preventiva.

Assim, `K_2=0`. Em `t=2`, o choque massivo produz:

```math
\pi_{D2}^T=\Omega_2^T H(1-\kappa_D).
```

Condição de queda:

```math
\Omega_2^T H(1-\kappa_D)>\bar{\pi}_D^{fall}.
```

A democracia vê a crise em `t=2`, mas o lag torna a resposta inútil dentro do horizonte do modelo.

### Autocracia sob threshold

Em `t=2`, a crise é grande o suficiente para furar a bolha informacional:

```math
\omega_{T2}>\bar{\omega}_A.
```

Logo, a elite autoriza compensação e o decreto gera `K_2=1`. O protesto passa a ser:

```math
\pi_{A2}^T=\Omega_2^T H(1-B-\kappa_A).
```

Condição de estabilidade:

```math
\Omega_2^T H(1-B-\kappa_A)<\bar{\pi}_A^{fall}.
```

## 9. Resultado principal

O modelo exibe fragilidade cruzada se existe um conjunto aberto de parâmetros tal que:

```math
\bar{\pi}_D^{comp}
\leq
\omega_R H(1-\kappa_D)
<
\bar{\pi}_D^{fall},
```

```math
\Omega_2^R H(1-B-\kappa_D)<\bar{\pi}_D^{fall},
```

```math
\Omega_2^T H(1-\kappa_D)>\bar{\pi}_D^{fall},
```

```math
\omega_R < \bar{\omega}_A < \omega_{T2},
```

```math
\Omega_2^R H(1-\kappa_A)>\bar{\pi}_A^{fall},
```

```math
\Omega_2^T H(1-B-\kappa_A)<\bar{\pi}_A^{fall}.
```

Essas condições têm interpretação substantiva clara:

- democracia vê o gradual cedo o suficiente para montar capacidade;
- democracia não monta capacidade no threshold porque a fase de prosperidade bloqueia demanda;
- autocracia não vê o gradual porque a elite filtra crises moderadas;
- autocracia vê o threshold porque a crise é grande demais para ser ignorada;
- compensação reduz grievance e, portanto, protesto;
- repressão reduz a fração de deslocados que protesta, mas não elimina necessariamente o risco quando o estoque de deslocados é grande.

## 10. Vantagens sobre o global game atual

1. **Prova simples**. Não há problema de existência ou unicidade de equilíbrio. A decisão individual é uma desigualdade; a agregação vem diretamente da CDF `H`.

2. **Monotonicidades corretas**. Protesto cresce em deslocamento e perda material, cai com compensação e repressão.

3. **Microfundação suficiente**. O modelo não simplesmente impõe `pi`; ele deriva `pi` da distribuição de custos individuais.

4. **Capacidade compensatória fica central**. A diferença entre democracia e autocracia passa pela transição de `K_t`, que captura exatamente o mecanismo de velocidade institucional.

5. **O selectorate continua fazendo trabalho**. Ele afeta `kappa_x`, o lag institucional e a autorização fiscal. A contribuição política continua sendo a interação entre informação, velocidade e política fiscal.

6. **A matemática fica auditável**. As proposições viram comparações de desigualdades, não dependem de uma função de equilíbrio difícil de controlar.

## 11. Custos da mudança

O principal custo é perder a coordenação estratégica explícita do global game. O protesto deixa de ser um problema de complementaridade estratégica e passa a ser um problema de participação individual com custos heterogêneos.

Isso é aceitável se o baseline for apresentado como um modelo de mobilização expressiva, não como um modelo de revolução estratégica. A queda continua estratégica no lado do regime, porque o governo decide quando construir capacidade compensatória e a elite autoriza ou bloqueia gasto.

Se for importante preservar coordenação, uma extensão pode introduzir um termo simples de mobilização:

```math
c_i=\kappa_x+\varepsilon_i-\lambda \pi_t,
```

com `lambda >= 0`. Mas isso reabre problemas de múltiplos equilíbrios. Minha recomendação é deixar esse termo fora do baseline.

## 12. Especificação recomendada para primeiro teste

Para obter fechamentos analíticos simples, usar uma distribuição logística para custos:

```math
H(z)=\frac{1}{1+\exp(-z/s_c)}.
```

Então:

```math
\pi_{xt}=\Omega_t
\frac{1}{1+\exp(-(1-BK_t-\kappa_x)/s_c)}.
```

O parâmetro `s_c` controla heterogeneidade social:

- `s_c` pequeno: custos muito concentrados, protesto muda bruscamente com grievance;
- `s_c` grande: custos dispersos, protesto responde gradualmente.

Essa especificação permite figuras transparentes e verificação numérica simples sem depender de equilíbrio de cutoff.

## 13. Perguntas para a próxima iteração

1. O baseline deve assumir que apenas deslocados protestam, ou devemos permitir que empregados com medo também protestem em uma extensão?

2. A regra democrática `M_t=1` deve ser um limiar simples de apoio fiscal ou uma mini-microfundação de eleitor mediano?

3. O "sweet spot" autocrático deve ser reescrito em termos de `kappa_A` e estoque de deslocados, ou removido do texto principal e tratado como tipologia em appendix?

