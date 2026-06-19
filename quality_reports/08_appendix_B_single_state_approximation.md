# Nota técnica 08 — Appendix B: single-state approximation e prior concentration

## Diagnóstico geral

O **Appendix B** tenta justificar o uso de uma aproximação single-state no cálculo do protesto. A ideia é que, depois de observar aggregate protest em `t=1`, os agentes conseguem inferir o estado verdadeiro `θ`, de modo que, em `t=2`, a incerteza relevante desaparece ou fica concentrada.

Esse apêndice é útil, mas ainda não está completamente integrado ao modelo principal. O ponto mais delicado é que a identificação perfeita do estado via protesto agregado é uma hipótese forte, e ela precisa aparecer claramente no timing e nas premissas informacionais do modelo.

## O papel do Appendix B no argumento

O paper usa cálculos simples de protesto, especialmente para:

- verificar estabilidade democrática sob rapid displacement;
- verificar queda autocrática sob rapid displacement;
- justificar o sweet spot de `C_A`;
- sustentar o exemplo numérico.

Esses cálculos são mais simples se, em `t=2`, os agentes sabem que estão em rapid ou threshold. O Appendix B tenta fornecer essa ponte.

## Problema 1 — observação pública de `π_1` não está clara no timing

O timing do modelo diz que:

1. trabalhadores observam `(d_it,s_it)`;
2. escolhem protesto;
3. aggregate protest `π_t` é observado pelo incumbent;
4. triggers são avaliados.

Mas o Appendix B parece exigir que trabalhadores e/ou elite observem publicamente `π_1` antes de formar crenças em `t=2`.

Se isso for necessário, o timing deve dizer explicitamente:

```text
At the beginning of period 2, all players observe period-1 aggregate protest π_1.
```

Sem isso, a atualização de crenças usada no Appendix B não está autorizada pelo modelo.

## Problema 2 — identificação perfeita é forte demais

Em um continuum de trabalhadores, aggregate protest pode ser uma função determinística do estado. Se essa função for invertível, então observar `π_1` revela `θ` perfeitamente.

Mas isso é uma consequência forte da combinação de:

- continuum population;
- ausência de ruído agregado;
- cutoff equilibrium determinístico;
- função `π_1(θ)` separada entre estados.

Em aplicações políticas, aggregate protest normalmente seria observado com ruído, ou pelo menos medido imperfeitamente.

O paper pode manter a hipótese, mas deve reconhecer que ela é uma idealização técnica.

## Problema 3 — invertibilidade de `π_1(θ)` não foi demonstrada

Para `π_1` identificar `θ`, é necessário que:

```math
\pi_1(R) \ne \pi_1(T) \ne \pi_1(N)
```

ou, mais precisamente, que a função `θ ↦ π_1(θ)` seja injetiva no conjunto de estados relevantes.

Isso não foi provado. Pode haver casos em que dois estados geram protesto agregado igual ou quase igual, especialmente se:

- o custo de protesto é alto;
- protesto é zero em múltiplos estados;
- a distribuição dos sinais comprime respostas;
- deslocamento baixo em `T1` e `N` gera protesto indistinguível.

A identificação perfeita deve ser substituída por uma condição explícita ou por uma atualização bayesiana com ruído.

## Problema 4 — o appendix pode enfraquecer a motivação de ambiguidade

O modelo enfatiza que trabalhadores enfrentam ambiguidade: low displacement em `t=1` pode significar calm `N` ou threshold time bomb `T`. Isso é substantivamente importante.

Mas se aggregate protest em `t=1` revela perfeitamente `θ`, então essa ambiguidade desaparece no início de `t=2`. Isso pode ser aceitável, mas o paper deve explicar:

- a ambiguidade é relevante apenas em `t=1`;
- o mecanismo de threshold democracy failure ocorre porque `t=1` não gera protesto/voice;
- quando `t=2` revela a verdade, já é tarde para a democracia.

Sem essa explicação, o Appendix B parece tensionar a narrativa de incerteza persistente.

## Problema 5 — single-state approximation não substitui prova do modelo completo

Mesmo que o Appendix B justifique uma aproximação, ele não prova automaticamente os resultados no modelo completo. Se as proposições são enunciadas para o modelo multi-state com sinais bayesianos, os resultados deveriam ser provados nesse modelo ou explicitamente restritos ao caso aproximado.

Há duas formas de resolver:

### Opção A — tornar o modelo principal single-state após t=1

Assumir que `θ` é publicamente aprendido no início de `t=2`. Nesse caso, os cálculos single-state são parte do modelo, não apenas aproximação.

### Opção B — manter o modelo multi-state e tratar o appendix como heurístico

Nesse caso, o paper deve dizer que o exemplo numérico usa uma aproximação ilustrativa, mas os resultados formais não dependem dela. Isso exigiria provas independentes no modelo completo.

Hoje, o paper parece oscilar entre as duas opções.

## Formulação sugerida para o timing

Se a opção A for escolhida, incluir:

```text
At the end of period 1, aggregate protest π_1 is publicly observed. In the continuum economy, π_1 is a deterministic function of the underlying state θ under the selected cutoff equilibrium. We assume that this mapping is one-to-one over the relevant states. Hence θ becomes common knowledge at the beginning of period 2.
```

Depois, adicionar uma assumption:

```text
A10 (State revelation through aggregate protest). Under the selected period-1 protest equilibrium, the mapping θ↦π_1(θ) is injective. Therefore, public observation of π_1 reveals θ before period 2 decisions.
```

Essa hipótese torna o Appendix B consistente com o modelo.

## Formulação alternativa com ruído

Uma versão mais realista, mas mais trabalhosa, seria:

```math
\hat\pi_1=\pi_1(\theta)+\eta,
```

com `η` ruído agregado. Então `π_1` atualiza crenças, mas não revela perfeitamente `θ`. O single-state result poderia ser tratado como limite quando `Var(η)→0`.

Isso seria mais elegante, mas talvez desnecessário para esta versão do paper.

## Conclusão

Appendix B é útil, mas precisa ser integrado ao modelo. A recomendação prática é transformar a identificação via aggregate protest em uma assumption explícita ou restringir os resultados que dependem da aproximação. Do jeito atual, o apêndice faz trabalho formal importante sem que suas premissas estejam plenamente incorporadas ao modelo principal.
