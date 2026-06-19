# Nota técnica 07 — Proposition 5: amplificação por selectorate size / σ_A

## Diagnóstico geral

A **Proposition 5** afirma que, conforme `σ_A` aumenta — interpretado como shrinking selectorate ou piora da informação da elite — a autocracia fica mais propensa a não compensar crises graduais, enquanto crises massivas continuam visíveis. A intuição é boa, mas a prova atual tem um problema técnico importante: a monotonicidade de `P(approve | ω_R)` em `σ_A` não segue das hipóteses gerais como está formulada.

Para AJPS, esse ponto precisa ser corrigido. A versão atual é defensável para a especificação linear de `\bar\omega_A(σ_A)`, mas não para uma função geral `g(σ_A)` apenas crescente.

## Estrutura atual

A probabilidade de aprovação é:

```math
P(approve\mid \omega)=\Phi\left(\frac{\omega-\bar\omega_A(\sigma_A)}{\sigma_A}\right).
```

Defina:

```math
z_\omega(\sigma_A)=\frac{\omega-\bar\omega_A(\sigma_A)}{\sigma_A}.
```

Como `Φ` é crescente, o sinal de:

```math
\frac{dP}{d\sigma_A}
```

é o sinal de:

```math
z_\omega'(\sigma_A).
```

## Derivada correta

Derivando:

```math
z_\omega'(\sigma_A)
=
\frac{-\bar\omega_A'(\sigma_A)\sigma_A-(\omega-\bar\omega_A(\sigma_A))}{\sigma_A^2}.
```

Rearranjando:

```math
z_\omega'(\sigma_A)
=
\frac{\bar\omega_A(\sigma_A)-\omega-\sigma_A\bar\omega_A'(\sigma_A)}{\sigma_A^2}.
```

Para `P(approve|ω)` diminuir em `σ_A`, precisamos de:

```math
z_\omega'(\sigma_A)<0,
```

isto é:

```math
\sigma_A\bar\omega_A'(\sigma_A)>\bar\omega_A(\sigma_A)-\omega.
```

## Problema com o caso rapid

Para `ω=ω_R`, no intervalo crossed fragility temos:

```math
\bar\omega_A(\sigma_A)>\omega_R.
```

Portanto, o lado direito:

```math
\bar\omega_A(\sigma_A)-\omega_R
```

é positivo. Não basta assumir que `\bar\omega_A'(σ_A)>0`. É preciso que o threshold suba rápido o suficiente.

A versão atual sugere que essa condição decorre de `\bar\omega_A(0)<ω_R`, mas isso só é garantido em especificações particulares, como a linear.

## Exemplo: especificação linear

Se:

```math
\bar\omega_A(\sigma_A)=\omega_0+\alpha_1\sigma_A,
```

então:

```math
\bar\omega_A'(\sigma_A)=\alpha_1.
```

Logo:

```math
\sigma_A\alpha_1 > \omega_0+\alpha_1\sigma_A-\omega_R
```

é equivalente a:

```math
\omega_R>\omega_0.
```

Como o modelo assume `ω_0<ω_R`, a monotonicidade está garantida no caso linear.

Portanto, a prova funciona para a especificação linear.

## Mas não funciona para qualquer `g`

Se `g` for crescente, mas muito côncava ou com derivada pequena no intervalo relevante, pode ocorrer:

```math
\sigma_A\bar\omega_A'(\sigma_A)\le \bar\omega_A(\sigma_A)-\omega_R.
```

Nesse caso, `P(approve|ω_R)` não necessariamente diminui com `σ_A`.

Logo, Proposition 5(a) está overclaimed sob a formulação geral.

## Caso threshold

Para `ω=ω_{T2}`, no intervalo relevante temos:

```math
\omega_{T2}>\bar\omega_A(\sigma_A).
```

Então:

```math
\bar\omega_A(\sigma_A)-\omega_{T2}<0.
```

Como `\sigma_A\bar\omega_A'(\sigma_A)>0`, temos:

```math
\bar\omega_A(\sigma_A)-\omega_{T2}-\sigma_A\bar\omega_A'(\sigma_A)<0.
```

Portanto:

```math
z_{T2}'(\sigma_A)<0.
```

Assim, a probabilidade de aprovação sob threshold também diminui com `σ_A`, embora possa permanecer acima de `1/2` se `ω_{T2}` estiver suficientemente acima de `\bar\omega_A`.

Essa parte é mais sólida.

## Problema conceitual: “amplifies both sides”

O texto diz que reduzir o selectorate “deepens both the blindness and the speed”. Mas no modelo `σ_A` afeta diretamente apenas a informação da elite, não a velocidade. A velocidade é fixa: autocracia age por decreto.

Se o paper quer dizer que selectorate size também gera speed, precisa formalizar uma relação entre selectorate size e lag institucional. Do jeito atual, `σ_A` amplifica a cegueira, mas não formalmente a velocidade.

Formulação mais precisa:

```text
As σ_A increases, the informational component of crossed fragility intensifies: moderate crises become less likely to trigger elite authorization, while sufficiently massive crises remain visible enough to trigger immediate decree-based compensation.
```

## Correção recomendada

Há duas opções.

### Opção A — restringir Proposition 5 à especificação linear

```text
Proposition 5 (σ_A amplification, linear threshold). Suppose \bar\omega_A(σ_A)=ω_0+α_1σ_A with α_1>0 and ω_0<ω_R. Then P(approve|ω_R) is strictly decreasing in σ_A. P(approve|ω_{T2}) is also decreasing in σ_A but remains above 1/2 whenever ω_{T2}>\bar\omega_A(σ_A).
```

Essa é a solução mais limpa.

### Opção B — manter `g` geral, mas adicionar condição de elasticidade

Adicionar:

```math
\sigma_A\bar\omega_A'(\sigma_A)>\bar\omega_A(\sigma_A)-\omega_R
```

para todo `σ_A` no intervalo relevante.

Então Proposition 5(a) segue.

## Prova sugerida para o caso linear

```text
Proof. Let z_ω(σ_A)=(ω-ω_0-α_1σ_A)/σ_A=(ω-ω_0)/σ_A-α_1. For ω=ω_R, since ω_R>ω_0, z_R'(σ_A)=-(ω_R-ω_0)/σ_A^2<0. Hence P(approve|ω_R)=Φ(z_R(σ_A)) is strictly decreasing in σ_A. For ω=ω_{T2}, z_T'(σ_A)=-(ω_{T2}-ω_0)/σ_A^2<0, so approval under threshold is also decreasing in σ_A. However, it remains above 1/2 whenever z_T(σ_A)>0, equivalently ω_{T2}>\barω_A(σ_A). The crossed-fragility interval for ω_R is the set ω_R<\barω_A(σ_A)<ω_{T2}; because \barω_A is increasing in σ_A, the lower cutoff for invisible moderate crises rises with σ_A. QED.
```

## Conclusão

Proposition 5 tem uma boa intuição, mas sua prova atual está forte demais para as hipóteses declaradas. A solução mais segura é restringir o resultado à especificação linear do threshold autocrático ou adicionar uma condição explícita de crescimento suficiente de `\bar\omega_A(σ_A)`. Sem isso, um referee técnico pode rejeitar a monotonicidade central.
