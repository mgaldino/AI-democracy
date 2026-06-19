# Nota técnica 05 — Proposition 3: crossed fragility

## Diagnóstico geral

A **Proposition 3** é o resultado central do paper. Ela afirma que existem faixas paramétricas nas quais democracias sobrevivem sob rapid displacement e caem sob threshold automation, enquanto autocracias exibem o padrão inverso.

A ideia é substantivamente interessante. O problema é que a prova atual ainda depende demais de uma combinação de proof sketch, exemplo numérico e afirmação de robustez. Para AJPS, o paper precisa transformar esse argumento em uma prova de existência de um conjunto aberto de parâmetros.

## Estrutura atual da prova

A prova atual faz três movimentos:

1. Diz que Proposition 3 combina Propositions 1 e 2.
2. Lista cinco condições necessárias para crossed fragility.
3. Afirma que essas condições são conjuntamente satisfatíveis, e que o exemplo numérico em Section 3.8 fornece uma parametrização.

Esse argumento mostra, no máximo, plausibilidade. Ele não demonstra formalmente que há uma região não degenerada de parâmetros.

## Problema 1 — Propositions 1 e 2 não foram provadas sob A1–A9

Como Propositions 1 e 2 dependem de desigualdades adicionais não declaradas, Proposition 3 herda esse problema.

Se P1 e P2 não seguem de A1–A9, P3 também não pode seguir de A1–A9.

A prova de P3 precisa começar com condições explícitas de estabilidade celular, não apenas com A1–A9.

## Problema 2 — exemplo numérico não prova conjunto aberto

Um exemplo numérico pode provar existência pontual, desde que todos os objetos sejam bem definidos. Mas Proposition 3 afirma mais: que o resultado vale para um conjunto não degenerado, ou seja, uma região aberta do espaço de parâmetros.

Para isso, é preciso mostrar:

1. As condições que caracterizam crossed fragility são desigualdades estritas.
2. As funções envolvidas são contínuas nos parâmetros.
3. O exemplo numérico satisfaz todas as desigualdades estritamente.
4. Portanto, por continuidade, há uma vizinhança aberta em torno do exemplo na qual as desigualdades continuam válidas.

A prova atual não estabelece formalmente os passos 2 e 3.

## Estrutura que a prova deveria ter

Defina as funções de protesto relevantes:

```math
\pi_D^{R,1}(v_{cred}), \quad \pi_D^{R,2}(1-B),
```

```math
\pi_D^{T,1}, \quad \pi_D^{T,2}(1),
```

```math
\pi_A^{R,2}(1), \quad \pi_A^{T,2}(1-B).
```

Defina também as probabilidades ou regras de aprovação da elite:

```math
P_A^R = P(approve\mid \omega_R),
```

```math
P_A^T = P(approve\mid \omega_{T2}).
```

Então crossed fragility é caracterizado por um sistema de desigualdades:

```math
\bar\pi_D^{comp}<\pi_D^{R,1}(v_{cred})<\bar\pi_D^{fall},
```

```math
\pi_D^{R,2}(1-B)<\bar\pi_D^{fall},
```

```math
\pi_D^{T,1}<\bar\pi_D^{comp},
```

```math
\pi_D^{T,2}(1)>\bar\pi_D^{fall},
```

```math
P_A^R<q,
```

```math
\pi_A^{R,2}(1)>\bar\pi_A^{fall},
```

```math
P_A^T>q,
```

```math
\pi_A^{T,2}(1-B)<\bar\pi_A^{fall}.
```

Se essas inequalities são estritas e as funções são contínuas, então a existência de um ponto que as satisfaz implica existência de um conjunto aberto.

## Problema 3 — continuidade de `π*` não foi provada

A prova de conjunto aberto depende de continuidade do equilíbrio de protesto. Mas o Lemma 0 atual não prova continuidade de `π*` em parâmetros.

É preciso demonstrar ou assumir:

```math
\pi^*_x = \pi^*_x(\Omega,v,C_x,\sigma,\ldots)
```

é contínua localmente no equilíbrio selecionado.

Uma forma de provar isso seria usar o Teorema da Função Implícita, se o cutoff é caracterizado por uma condição de indiferença:

```math
H(s^*;\theta)=0
```

com:

```math
\frac{\partial H}{\partial s}\ne 0.
```

Sem isso, a passagem “exemplo numérico → open set” fica injustificada.

## Problema 4 — o resultado deveria ser uma proposição de existência, não uma proposição universal

A formulação atual começa com “Under A1–A9, there exist parameter ranges...”. Isso é melhor do que dizer que o padrão sempre ocorre, mas ainda mistura duas coisas:

- hipóteses estruturais do modelo;
- condições paramétricas específicas para crossed fragility.

Uma versão mais limpa seria:

```text
Proposition 3 (Existence of crossed fragility). Suppose A1–A9 hold and the protest equilibrium is unique and continuous in parameters. There exists an open set of parameter values satisfying conditions CF1–CF8 such that democracy is stable under rapid displacement and unstable under threshold automation, while autocracy is unstable under rapid displacement and stable under threshold automation.
```

Depois, listar `CF1–CF8` explicitamente.

## Problema 5 — a prova precisa separar mecanismo e calibração

Hoje, o exemplo numérico faz muito trabalho. Ele mostra que, com os parâmetros escolhidos, o padrão desejado aparece. Mas um paper de teoria formal deve deixar claro:

- quais desigualdades são teoricamente essenciais;
- quais são apenas valores ilustrativos;
- quais parâmetros podem variar sem destruir o resultado.

Essa separação é especialmente importante porque o resultado depende de uma “sweet spot” de repressão e de ruído informacional. Isso é substantivamente interessante, mas formalmente implica que o resultado não é universal.

## Prova sugerida

Uma prova AJPS-ready poderia ter a seguinte estrutura:

```text
Proof. Let Θ denote the vector of primitive parameters. Define the crossed-fragility region CF as the set of Θ satisfying inequalities CF1–CF8. Under Lemma 0', π*_x is continuous in Θ. The approval probabilities P_A^R and P_A^T are continuous in Θ because Φ and \bar\omega_A are continuous. Hence CF is an open set, since it is defined by finitely many strict inequalities involving continuous functions. The numerical parameter vector Θ0 reported in Section 3.8 satisfies all CF inequalities strictly. Therefore CF contains an open neighborhood of Θ0 and is nonempty. For every Θ∈CF, the timing rules imply the stability pattern in Table 3. QED.
```

Essa prova resolveria grande parte do problema.

## Conclusão

Proposition 3 é viável, mas precisa ser reescrita como uma prova de existência de uma região aberta definida por desigualdades explícitas. O exemplo numérico pode permanecer, mas deve servir apenas para demonstrar que a região é não vazia. Do jeito atual, o resultado está subprovado para AJPS.
