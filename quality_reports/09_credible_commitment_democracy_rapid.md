# Nota técnica 09 — Credible commitment em democracia sob rapid displacement

## Diagnóstico geral

O argumento de estabilidade democrática sob rapid displacement depende crucialmente de um mecanismo de **credible legislative commitment**: trabalhadores protestam o suficiente para acionar a legislação, mas não tanto a ponto de derrubar o regime, porque antecipam que a compensação estará disponível em `t=2`.

Esse mecanismo é substantivamente plausível, mas no modelo atual aparece como um ajuste verbal/numerical-example-driven. Para AJPS, ele precisa ser modelado como parte do equilíbrio dinâmico.

## O problema que o credible commitment resolve

Sem compromisso crível, um trabalhador deslocado em `t=1` tem expressive value alto:

```math
v = 1+\delta.
```

Com os parâmetros do exemplo:

```math
v = 1+0.9=1.9.
```

Como:

```math
C_D=1.5,
```

isso implica:

```math
v>C_D.
```

Portanto, protestar pode ser dominante para os deslocados. Nesse caso, democracia sob rapid displacement poderia ter protesto excessivo e cair, em vez de sobreviver.

Para evitar isso, o paper usa a ideia de que os trabalhadores antecipam a compensação futura:

```math
v_{cred}=1+\delta(1-B).
```

Com `B=0.6` e `δ=0.9`:

```math
v_{cred}=1+0.9(0.4)=1.36<C_D.
```

Isso reduz protesto e permite estabilidade.

## Problema 1 — o compromisso é essencial, mas não formalizado

Esse não é um detalhe secundário. Sem esse mecanismo, a célula democracia/rapid pode falhar. Portanto, o commitment precisa estar explicitamente no modelo.

A prova deve mostrar que:

1. o protesto esperado em `t=1` excede o trigger de compensação;
2. a legislatura de fato aprova compensação;
3. os trabalhadores antecipam isso racionalmente;
4. essa antecipação reduz `v`;
5. o protesto resultante fica abaixo do threshold de queda.

Hoje, esses passos aparecem verbalmente, mas não como uma verificação de equilíbrio.

## Problema 2 — possível circularidade

Há uma possível circularidade:

- trabalhadores protestam menos porque esperam compensação;
- compensação só é acionada se protesto for suficientemente alto;
- se trabalhadores protestarem pouco demais, não há compensação;
- se não há compensação, deveriam protestar mais.

Isso exige uma condição de consistência:

```math
\bar\pi_D^{comp}<\pi_D^{R,1}(v_{cred})<\bar\pi_D^{fall}.
```

Ou seja, mesmo com `v` reduzido pela expectativa de compensação, protesto ainda deve exceder o trigger legislativo.

Sem essa desigualdade, o commitment não é self-confirming.

## Problema 3 — timing legislativo precisa ser mais explícito

O modelo diz que, em democracia, se `comp_t=1`, então `φ_{t+1}=1`. Mas para o commitment funcionar, trabalhadores precisam saber que:

```math
\pi_t>\bar\pi_D^{comp} \Rightarrow \phi_{t+1}=1
```

com probabilidade 1, ou suficientemente alta.

Se existe incerteza sobre aprovação legislativa, implementação ou reversão, o valor esperado de compensação muda.

O paper pode assumir compromisso perfeito, mas deve declará-lo:

```text
Democratic legislation, once triggered by protest above \barπ_D^{comp}, is perfectly credible and implemented with probability one in the next period.
```

## Problema 4 — compromisso crível não deve aparecer apenas no exemplo numérico

O exemplo numérico usa `v_cred` para resolver a estabilidade democrática sob rapid displacement. Mas a proposição formal deve conter isso como condição geral.

A versão atual corre o risco de parecer calibrada para obter o resultado desejado.

## Correção recomendada

Adicionar uma condição formal de self-confirming commitment.

### Condição sugerida

```text
D-R Commitment Condition. Under rapid displacement, the anticipated legislative response reduces the period-1 expressive value to v_cred=1+δ(1-B), and the induced protest satisfies:

\barπ_D^{comp}<π_D^{R,1}(v_cred)<\barπ_D^{fall}.
```

Essa condição faz exatamente o trabalho necessário.

## Versão alternativa mais elegante

Modelar explicitamente dois valores de protesto:

```math
v^{no\ comp}=1+\delta,
```

```math
v^{comp}=1+\delta(1-B).
```

Então mostrar:

```math
\pi_D^{R,1}(v^{comp})>\bar\pi_D^{comp},
```

logo compensação é realmente acionada, e:

```math
\pi_D^{R,1}(v^{comp})<\bar\pi_D^{fall},
```

logo o regime não cai.

Isso elimina a circularidade.

## Relação com threshold automation

O mesmo raciocínio deve explicar por que o commitment não aparece sob threshold em `t=1`.

Sob threshold, no primeiro período:

```math
\pi_D^{T,1}<\bar\pi_D^{comp}.
```

Logo, não há legislação e nenhum `v_cred` relevante. Quando o choque aparece em `t=2`, a legislação seria acionada, mas só produziria `φ_3=1`, fora do horizonte do modelo.

Essa comparação deve ser explícita, porque ela é o coração do prosperity trap.

## Texto sugerido para o corpo

```text
The stability of democracy under rapid displacement requires a self-confirming legislative commitment. If workers expect no future compensation, their expressive value is v=1+δ, which may generate destabilizing protest. But when period-1 protest is expected to exceed the democratic compensation threshold, workers rationally anticipate compensation in period 2, reducing their expressive value to v_cred=1+δ(1-B). The democratic rapid-displacement cell is stable when the induced protest lies between the compensation and fall thresholds: \barπ_D^{comp}<π_D^{R,1}(v_cred)<\barπ_D^{fall}. This condition ensures that protest is strong enough to activate voice but not strong enough to topple the regime.
```

## Conclusão

O credible commitment é indispensável para a célula democracia/rapid. Ele deve ser incorporado como uma condição formal de equilíbrio, não apenas como uma intuição ou ajuste numérico. Sem isso, Proposition 1 fica vulnerável a uma crítica direta: a democracia poderia cair também sob rapid displacement, dependendo dos parâmetros.
