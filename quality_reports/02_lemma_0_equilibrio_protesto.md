# Nota técnica 02 — Lemma 0: existência e unicidade do equilíbrio de protesto

## Diagnóstico geral

O **Lemma 0** é um dos pontos matematicamente mais frágeis do paper. Ele afirma existência e unicidade de um equilíbrio de cutoff no jogo de protesto, sob `A1–A3`, com `h(π)=π` e distribuição logística. O problema é que a prova apresentada é apenas um *proof sketch*: ela sugere a existência por IVT e afirma unicidade com base na ideia de que, para sinais suficientemente precisos, a função relevante se torna uma “smoothed step function” com uma única crossing.

Para AJPS, isso não é suficiente. Se o paper quer sustentar resultados formais posteriores usando esse equilíbrio, a existência, unicidade e propriedades comparativas de `π*` precisam estar muito mais bem estabelecidas.

## O que o lemma precisa entregar

O lemma deveria estabelecer pelo menos quatro coisas:

1. Existe um equilíbrio de cutoff.
2. O equilíbrio relevante é único, ou há uma seleção explícita.
3. O aggregate protest `π*` é contínuo nos parâmetros relevantes.
4. `π*` tem monotonicidades usadas depois: crescente em `v`, crescente em `Ω`, decrescente em `C_x`, e decrescente em `B` quando compensação reduz `v`.

A versão atual afirma apenas os dois primeiros pontos, e mesmo esses de forma incompleta. Os pontos 3 e 4 são usados em Corollary 1, Proposition 3 e Proposition 5, mas não são provados.

## Problema 1 — existência depende de condições de interioridade não declaradas

A prova define uma função `G(s)` e usa o Teorema do Valor Intermediário. Para isso funcionar, é preciso mostrar que:

```math
G(-\infty)>0 \quad \text{e} \quad G(+\infty)<0.
```

O texto afirma que `G(-∞)` é “generically positive”. Isso não basta. É necessário impor uma condição explícita, algo como:

```math
0 < \bar h < \max_\theta \Omega_t(\theta),
```

ou tratar casos de canto. Sem isso, pode haver:

- equilíbrio sem protesto;
- equilíbrio com protesto total dos deslocados;
- múltiplos equilíbrios;
- nenhum cutoff interior relevante.

O problema é agravado porque o próprio apêndice reconhece que, nos parâmetros usados no exemplo, em democracia/rapid displacement, o valor bruto do protesto pode exceder o custo:

```math
v = 1 + \delta = 1.9 > C_D = 1.5.
```

Nesse caso, protestar pode ser estritamente dominante para todos os deslocados, o que viola a lógica de um cutoff interior.

## Problema 2 — unicidade não está provada

A prova diz que, para `σ` pequeno, os estados ficam bem separados e `G` se torna uma “smoothed step function” com uma única crossing. Isso é apenas uma intuição.

Com três estados `R`, `T` e `N`, a função `G(s)` combina:

- posterior weights `P(θ | d,s)`;
- frações deslocadas `Ω_t(θ)`;
- termos logísticos de participação;
- expectativas sobre participação agregada.

Esses termos variam simultaneamente com `s`. Não é evidente que `G(s)` seja monotônica nem que tenha apenas uma crossing.

Para AJPS, há duas alternativas aceitáveis:

### Alternativa A — provar single crossing diretamente

Provar que:

```math
G'(s)<0
```

no domínio relevante, dadas hipóteses adicionais sobre `F`, `Ω`, `v` e `h`.

### Alternativa B — invocar um resultado padrão de global games

Citar formalmente um teorema de Morris and Shin ou literatura equivalente, mas verificar explicitamente que o jogo satisfaz as hipóteses do teorema:

- payoff difference com strategic complementarities;
- sinais privados suficientemente precisos;
- prior comum;
- monotone likelihood ratio property;
- payoff crossing único;
- ausência de equilíbrios múltiplos relevantes.

A versão atual cita a literatura, mas não faz a verificação.

## Problema 3 — ambiguidade sobre quem é o trabalhador marginal

O modelo diz que cada trabalhador observa `(d_it, s_it)` e decide protestar. O expressive value `v_i` incorpora sofrimento atual e medo futuro. Logo, tanto deslocados quanto empregados podem ter incentivo a protestar.

Mas a prova do Lemma 0 parece focar no “marginal displaced worker” e usa `d=1`. Isso cria uma inconsistência.

É preciso escolher uma das duas formulações:

### Opção 1 — apenas deslocados protestam

Então o modelo deve assumir explicitamente:

```math
 a_{it}=0 \quad \text{se } d_{it}=0.
```

Nesse caso, o cutoff é somente entre deslocados.

### Opção 2 — empregados também podem protestar

Então a prova precisa tratar dois tipos de cutoff:

```math
s^*_x(d=1), \quad s^*_x(d=0),
```

ou demonstrar que há um cutoff comum apesar da heterogeneidade em `d`.

A versão atual não resolve isso.

## Problema 4 — o lemma não prova as propriedades usadas depois

Vários resultados posteriores dependem de propriedades de `π*`, especialmente:

```math
\frac{\partial \pi^*}{\partial C_x}<0,
\quad
\frac{\partial \pi^*}{\partial v}>0,
\quad
\frac{\partial \pi^*}{\partial \Omega}>0.
```

Essas propriedades são intuitivas, mas precisam ser provadas ou assumidas. Corollary 1, por exemplo, usa diretamente que `π*(C_A, Ω_2^R, 1)` é contínua e estritamente decrescente em `C_A`. Isso não segue do Lemma 0 atual.

## Por que isso importa para AJPS

Um referee técnico provavelmente não aceitará que o resultado central dependa de um equilíbrio cuja existência, unicidade e monotonicidade são apenas esboçadas. A objeção seria simples:

> The paper’s substantive results depend on equilibrium protest being well behaved, but the authors do not prove that the protest game has a unique cutoff equilibrium with the comparative statics required by the propositions.

Essa crítica compromete Corollary 1 e Proposition 3 diretamente.

## Correção recomendada

Eu reescreveria o Lemma 0 como um resultado mais modesto e mais auditável.

### Versão recomendada

```text
Lemma 0 (Selected protest equilibrium). Suppose the protest game satisfies interiority and single-crossing conditions S1–S3. Then, for each regime x and period t, there exists a unique monotone cutoff equilibrium. The induced aggregate protest function π*_x(Ω,v,C_x) is continuous, increasing in Ω and v, and decreasing in C_x.
```

Depois, o apêndice provaria ou assumiria S1–S3.

### Condições adicionais possíveis

```text
S1. Interiority: for all relevant states, the payoff difference changes sign over the support of s.
S2. Single crossing: the marginal benefit of protest is strictly increasing in s.
S3. Equilibrium regularity: the selected equilibrium varies continuously with parameters.
```

Se essas condições forem assumidas, o paper deve reconhecer que os resultados são condicionais a regularity conditions no jogo de protesto. Isso é aceitável, desde que transparente.

## Conclusão

O Lemma 0, como está, não está no padrão técnico de AJPS. Ele deve ser fortalecido substancialmente ou rebaixado para uma hipótese de regularidade. O mais importante é não deixar os resultados centrais dependerem implicitamente de propriedades de `π*` que não foram demonstradas.
