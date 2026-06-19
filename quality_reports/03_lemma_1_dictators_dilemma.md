# Nota técnica 03 — Lemma 1: dictator’s dilemma

## Diagnóstico geral

O **Lemma 1** é mais sólido do que o Lemma 0, mas ainda está formulado com uma ambição maior do que a prova entrega. Ele afirma que o “dictator’s dilemma” é derivado da estrutura informacional da autocracia. Na prática, porém, boa parte do resultado é assumida em `A8`.

A prova organiza uma ordering paramétrica, mas não deriva endogenamente a regra de aprovação da elite nem o threshold de evidência a partir de uma escolha ótima. Para AJPS, isso não é fatal, mas a linguagem deve ser ajustada: o lemma não deve dizer que o dilema é plenamente derivado; deve dizer que ele segue de uma hipótese paramétrica sobre ruído informacional e thresholds de aprovação.

## Estrutura atual do lemma

O paper define:

```math
\bar\omega_A(\sigma_A)=\omega_0+g(\sigma_A), \quad g'(\sigma_A)>0, \quad g(0)=0.
```

Com isso, afirma que existe um intervalo:

```math
\sigma_A \in (\underline\sigma,\bar\sigma)
```

no qual:

```math
\omega_R < \bar\omega_A(\sigma_A) < \omega_{T2}.
```

A partir disso, segue que:

```math
P(approve \mid \omega_R)
= \Phi\left(\frac{\omega_R-\bar\omega_A}{\sigma_A}\right)<\frac{1}{2},
```

e:

```math
P(approve \mid \omega_{T2})
= \Phi\left(\frac{\omega_{T2}-\bar\omega_A}{\sigma_A}\right)>\frac{1}{2}.
```

Matematicamente, isso está correto dado o threshold.

## Problema 1 — o resultado é quase assumido em A8

`A8` já impõe:

- elite information noise `σ_A>0`;
- threshold crescente `\bar\omega_A(σ_A)`;
- `ω_0<ω_R`;
- existência de um intervalo onde `ω_R<\bar\omega_A(σ_A)<ω_{T2}`.

Ou seja, o Lemma 1 não deriva muito além do que A8 já contém. Ele transforma a ordering assumida em uma conclusão probabilística.

Isso não é necessariamente ruim. O problema é a apresentação. O texto afirma que o dictator’s dilemma é “derived”, mas na verdade ele é **encoded parametrically**.

## Correção de linguagem

Evitar:

```text
The dictator’s dilemma is derived from informational noise.
```

Preferir:

```text
Under the assumed mapping from selectorate noise to the elite’s evidence threshold, informational noise generates a region in which moderate crises are unlikely to trigger elite authorization while massive crises are likely to do so.
```

Essa formulação é mais honesta e menos vulnerável a um referee.

## Problema 2 — “does not authorize” não segue de probabilidade menor que 1/2

O lemma diz que, sob rapid displacement, “the elite does not authorize compensation”. Mas a fórmula dá:

```math
P(approve \mid \omega_R)<1/2.
```

Isso não implica autorização zero. Implica apenas que aprovação é menos provável do que não aprovação.

Há uma inconsistência entre linguagem determinística e modelo probabilístico.

## Duas formas de corrigir

### Opção A — tornar os resultados probabilísticos

Reformular as proposições como afirmações sobre probabilidade de estabilidade:

```text
Autocracies are less likely to compensate under rapid displacement than under threshold automation.
```

Nesse caso, Proposition 2 e Proposition 3 também devem ser probabilísticas.

### Opção B — adicionar uma regra determinística de decisão

Introduzir um threshold de aprovação `q`, por exemplo:

```math
comp_t=1 \quad \text{iff} \quad P(approve \mid \omega_t) \ge q.
```

Com `q=1/2`, o resultado determinístico segue:

```math
P(approve \mid \omega_R)<q \Rightarrow comp_t=0,
```

```math
P(approve \mid \omega_{T2})>q \Rightarrow comp_t=1.
```

Essa opção é mais consistente com as proposições atuais.

## Problema 3 — o threshold da elite não é derivado de microfundamentos

O texto diz que a elite autoriza compensação quando o custo esperado da inação excede o custo fiscal. Mas a prova não modela explicitamente:

- payoff da elite;
- custo fiscal de compensação;
- probabilidade de queda;
- posterior da elite sobre `ω`;
- decisão ótima de autorizar ou não compensação.

Em vez disso, o threshold `\bar\omega_A(σ_A)` é introduzido diretamente.

Isso é aceitável se o paper tratar esse bloco como uma forma reduzida. Mas não é aceitável vender como uma derivação completa.

## Possível microfundamento mínimo

Se quiser derivar o threshold, o paper poderia introduzir:

```math
Elite approves iff
E[L(\omega) \mid \tilde\omega_S] \ge K,
```

onde:

- `L(ω)` é a perda esperada da elite se o regime cai;
- `K` é o custo fiscal/político da compensação;
- `\tilde\omega_S=\omega+\sigma_A \zeta`.

Então o threshold seria:

```math
\bar\omega_A(\sigma_A) = \inf\{\tilde\omega: E[L(\omega) \mid \tilde\omega] \ge K\}.
```

A partir daí, seria possível estudar quando `\bar\omega_A` é crescente em `σ_A`. Mas isso é mais trabalhoso.

## Recomendação prática

Para não reconstruir o modelo inteiro, eu faria uma solução intermediária:

1. Tratar o threshold autocrático como forma reduzida.
2. Reescrever A8 como uma hipótese explícita de “informational-blindness region”.
3. Reescrever Lemma 1 como uma implicação da forma reduzida.
4. Evitar dizer que o threshold é endogenamente derivado.

## Formulação sugerida

```text
Assumption A8' (Autocratic evidence threshold). The autocratic elite observes a noisy assessment \tilde\omega_S=\omega+\sigma_A\zeta and authorizes compensation iff \tilde\omega_S>\bar\omega_A(\sigma_A), where \bar\omega_A is increasing in \sigma_A. There exists a nonempty interval \Sigma_A such that, for every \sigma_A\in\Sigma_A, \omega_R<\bar\omega_A(\sigma_A)<\omega_{T2}.
```

Then:

```text
Lemma 1. Under A8', the probability of autocratic compensation is lower under rapid displacement than under threshold displacement. Moreover, if the regime uses the decision rule comp=1 iff P(approve|ω)≥1/2, then the autocracy does not compensate under rapid displacement and compensates under threshold displacement.
```

## Conclusão

O Lemma 1 é recuperável, mas precisa de duas correções: alinhar linguagem determinística/probabilística e reconhecer que o dictator’s dilemma é imposto por uma hipótese de forma reduzida, não plenamente derivado. Do jeito atual, um referee técnico provavelmente diria que o resultado está “assumed rather than proved”.
