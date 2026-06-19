# Nota técnica 06 — Corollary 1: sweet spot de repressão autocrática

## Diagnóstico geral

O **Corollary 1** é um dos resultados mais promissores do paper. A ideia de que crossed fragility opera em uma faixa intermediária de repressão é intuitiva e teoricamente útil. O resultado também é relativamente fácil de salvar.

O problema é que a prova depende de uma monotonicidade chamada `M1` — protesto decrescente em `C_A` — que não é provada no paper. Para AJPS, esse passo precisa ser formalizado.

## Estrutura atual do corolário

O corolário define:

```math
C_A^{min}:=C_D
```

como lower bound definicional para uma autocracia.

Depois define `C_A^{max}` como o valor único em que:

```math
\pi^*(C_A^{max},\Omega_2^R,v=1)=\bar\pi_A^{fall}.
```

A crossed fragility requer:

```math
C_A\in(C_D,C_A^{max}).
```

A lógica é boa: se `C_A` é baixo demais, a autocracia se parece com democracia; se é alto demais, protesto é totalmente reprimido; no meio, protesto é suficientemente reprimido para atrasar informação, mas não suficientemente reprimido para impedir eventual queda.

## Problema 1 — monotonicidade de `π*` em `C_A` é assumida

A prova usa:

```math
\pi^*(C_A,\Omega_2^R,1)
```

como função contínua e estritamente decrescente em `C_A`.

Mas isso não foi provado. A prova diz “By M1”. Só que M1 não aparece como lemma demonstrado.

Para AJPS, isso precisa ser resolvido.

## O que precisa ser provado

É preciso mostrar que:

```math
\frac{\partial \pi^*}{\partial C_A}<0.
```

No caso simples em que o cutoff é determinado por:

```math
v=C_A(1-\pi),
```

então:

```math
\pi=1-\frac{v}{C_A},
```

ou, dependendo da normalização:

```math
\pi=1-\frac{\bar h}{C_A}.
```

Nesse caso, a monotonicidade é direta. Mas no modelo completo, `π*` vem de um equilíbrio global game com sinais, posteriors e safety in numbers. A monotonicidade não pode ser simplesmente assumida sem dizer que o modelo foi reduzido ao single-state approximation.

## Problema 2 — unique `C_A^{max}` depende de estrita monotonicidade

O corolário afirma que existe um valor único `C_A^{max}`. A unicidade depende de `π*` ser estritamente decrescente.

Se `π*` for apenas fracamente decrescente ou tiver trechos planos, pode haver um intervalo de valores de `C_A` em que:

```math
\pi^*(C_A,\Omega_2^R,1)=\bar\pi_A^{fall}.
```

Nesse caso, `C_A^{max}` não é único.

Uma versão mais robusta seria definir:

```math
C_A^{max}:=\sup\{C_A: \pi^*(C_A,\Omega_2^R,1)>\bar\pi_A^{fall}\}.
```

Essa definição não exige unicidade forte.

## Problema 3 — o lower bound é conceitual, não matemático

O lower bound `C_A^{min}=C_D` é definido como condição para a autocracia ser “meaningfully autocratic”. Isso é conceitual, não derivado matematicamente.

Tudo bem, mas o paper deve deixar claro que:

```math
C_A>C_D
```

é uma condição classificatória de regime, não uma condição necessária para o resultado mecânico.

## Correção recomendada

Eu reescreveria o corolário assim:

```text
Corollary 1 (Sweet spot of autocratic repression). Suppose the selected protest equilibrium satisfies continuity and strict monotonicity in the protest cost: π*(C_A,Ω,v) is continuous and strictly decreasing in C_A, with π*(C_D,Ω_2^R,1)>\barπ_A^fall and lim_{C_A→∞}π*(C_A,Ω_2^R,1)=0. Then there exists a unique C_A^max>C_D such that π*(C_A^max,Ω_2^R,1)=\barπ_A^fall. Autocratic instability under rapid displacement requires C_A∈(C_D,C_A^max).
```

Essa versão explicita exatamente o que é necessário.

## Prova sugerida

```text
Proof. By assumption, π*(C_A,Ω_2^R,1) is continuous and strictly decreasing in C_A. At C_A=C_D, π*(C_D,Ω_2^R,1)>\barπ_A^fall. As C_A→∞, π*(C_A,Ω_2^R,1)→0<\barπ_A^fall. By the intermediate value theorem, there exists C_A^max such that π*(C_A^max,Ω_2^R,1)=\barπ_A^fall. Strict monotonicity gives uniqueness. For C_A<C_A^max, protest exceeds the fall threshold; for C_A>C_A^max, it does not. Intersecting with the regime-classification condition C_A>C_D yields the sweet spot (C_D,C_A^max). QED.
```

## Se a monotonicidade não puder ser provada

Se o paper não quiser provar monotonicidade no jogo completo, uma alternativa é rebaixar o resultado:

```text
Corollary 1 (Sweet spot under monotone protest response).
```

Ou:

```text
Assumption A10 (Monotone protest response). The selected aggregate protest equilibrium is continuous and strictly decreasing in C_x.
```

Isso é aceitável se o paper for transparente.

## Conclusão

Corollary 1 é conceitualmente forte e matematicamente recuperável. O único problema sério é que a monotonicidade central ainda não foi provada. Uma vez que `π*` seja formalmente caracterizada como contínua e estritamente decrescente em `C_A`, o corolário fica limpo e defensável.
