# Nota técnica 04 — Propositions 1 e 2: padrões de fragilidade democrática e autocrática

## Diagnóstico geral

As **Propositions 1 e 2** são os resultados substantivos que sustentam o paper. Elas afirmam que, sob `A1–A9`, democracias sobrevivem ao rapid displacement e caem sob threshold automation, enquanto autocracias exibem o padrão inverso.

O problema central é que essas proposições **não seguem de A1–A9**. Elas dependem de várias desigualdades adicionais sobre protesto, thresholds de compensação, thresholds de queda e compromisso crível. Essas desigualdades aparecem verbalmente ou no exemplo numérico, mas não estão incorporadas nas hipóteses formais.

Para AJPS, isso é um problema sério: o referee vai perguntar exatamente quais condições garantem cada célula da matriz crossed fragility.

## Proposition 1 — democracia

A Proposition 1 afirma:

1. Democracia é estável sob rapid displacement.
2. Democracia é instável sob threshold automation.

A prova verbal diz:

- sob rapid, `ω_R` aciona voice;
- há lag institucional, mas a promessa legislativa reduz `v`;
- protesto fica abaixo de `π_D^fall`;
- sob threshold, `t=1` tem prosperidade e nenhum trigger;
- em `t=2`, voice chega tarde demais;
- protesto excede `π_D^fall`.

Isso é intuitivo, mas não é uma prova sob A1–A9.

## Condições faltantes para democracia sob rapid displacement

Para demonstrar estabilidade democrática sob rapid, o paper precisa de algo como:

```math
\bar\pi_D^{comp}<\pi_D^{R,1}(v_{cred})<\bar\pi_D^{fall}.
```

Essa desigualdade faz duas coisas:

1. Garante que protesto é alto o suficiente para acionar compensação.
2. Garante que protesto não é alto o suficiente para derrubar o regime antes da compensação.

Também é necessário:

```math
\pi_D^{R,2}(1-B)<\bar\pi_D^{fall}.
```

Essa segunda desigualdade garante que, depois da compensação, o protesto permanece contido.

Nenhuma dessas desigualdades está em A1–A9.

## Condições faltantes para democracia sob threshold automation

Para demonstrar queda democrática sob threshold, o paper precisa de:

```math
\pi_D^{T,1}<\bar\pi_D^{comp}.
```

Isso garante que a complementary phase não aciona legislação preventiva.

Também precisa de:

```math
\pi_D^{T,2}(1)>\bar\pi_D^{fall}.
```

Isso garante que, quando o threshold shock chega, o protesto é grande o suficiente para derrubar o regime antes da compensação legislativa.

A9 diz que `Y^+=1+γ` aumenta oposição à taxação, mas não prova que `π_D^{T,1}` fica abaixo do trigger de compensação nem que `π_D^{T,2}` excede o threshold de queda.

## Problema específico: prosperity trap

O prosperity trap é verbalmente convincente, mas formalmente submodelado. O texto diz que trabalhadores com renda `Y^+=1+γ` se opõem à compensação porque enfrentam maior custo fiscal. Porém, o jogo de votação/taxação não está formalmente modelado.

A versão atual usa A9 como uma ponte:

```text
Higher income raises the tax cost of compensation and reduces support.
```

Mas para sustentar uma proposição, seria preciso formalizar algo como:

```math
Support_i(comp)=1 \quad \text{iff} \quad E[benefit_i]\ge \tau Y_i.
```

Então, com `Y_i=Y^+`, a maioria não apoiaria compensação preventiva.

Sem isso, a prosperity trap é uma hipótese substantiva, não um resultado derivado.

## Proposition 2 — autocracia

A Proposition 2 afirma:

1. Autocracia é instável sob rapid displacement.
2. Autocracia é estável sob threshold automation.

A prova depende de duas coisas:

- a elite não autoriza compensação sob rapid;
- a elite autoriza compensação sob threshold;
- o protesto acumulado sob rapid excede `π_A^fall`;
- o protesto compensado sob threshold fica abaixo de `π_A^fall`.

Novamente, isso não segue de A1–A9.

## Condições faltantes para autocracia sob rapid displacement

É preciso algo como:

```math
P_A(approve \mid \omega_R)<q,
```

ou uma regra determinística equivalente, além de:

```math
\pi_A^{R,2}(1)>\bar\pi_A^{fall}.
```

A primeira condição garante ausência de compensação. A segunda garante queda.

A8 fornece apenas uma probabilidade menor que 1/2, não necessariamente ausência de compensação. E A1–A9 não garantem a desigualdade de protesto.

## Condições faltantes para autocracia sob threshold automation

É preciso:

```math
P_A(approve \mid \omega_{T2})>q,
```

ou regra determinística equivalente, além de:

```math
\pi_A^{T,2}(1-B)<\bar\pi_A^{fall}.
```

A primeira garante compensação por decreto. A segunda garante que a compensação reduz o protesto o suficiente para evitar queda.

A6 diz que compensação é parcial, `B∈(0,1)`, mas não garante que `1-B` seja baixo o bastante para conter protesto. Se `B` for muito pequeno, a compensação pode não estabilizar a autocracia.

## O problema formal comum

As duas proposições deveriam depender de condições de estabilidade celular. Em vez disso, elas são escritas como se A1–A9 bastassem.

Isso gera uma vulnerabilidade óbvia:

> There exist parameter values satisfying A1–A9 under which democracy does not survive rapid displacement, or autocracy does not survive threshold automation.

Por exemplo:

- se `π_D^fall` for muito baixo, democracia cai também sob rapid;
- se `B` for muito baixo, autocracia cai também sob threshold;
- se `π_A^fall` for muito alto, autocracia sobrevive também sob rapid;
- se `π_D^comp` for muito baixo, democracia pode construir compensação preventiva sob threshold.

Todos esses casos podem satisfazer A1–A9.

## Correção recomendada

Reformular P1 e P2 como proposições condicionais.

### Versão sugerida para Proposition 1

```text
Proposition 1 (Democratic fragility pattern). Under A1–A9 and democratic stability conditions D1–D4, democracy is stable under rapid displacement and unstable under threshold automation.
```

Com:

```math
D1: \bar\pi_D^{comp}<\pi_D^{R,1}(v_{cred})<\bar\pi_D^{fall}
```

```math
D2: \pi_D^{R,2}(1-B)<\bar\pi_D^{fall}
```

```math
D3: \pi_D^{T,1}<\bar\pi_D^{comp}
```

```math
D4: \pi_D^{T,2}(1)>\bar\pi_D^{fall}
```

### Versão sugerida para Proposition 2

```text
Proposition 2 (Autocratic fragility pattern). Under A1–A9 and autocratic stability conditions A1'–A4', autocracy is unstable under rapid displacement and stable under threshold automation.
```

Com:

```math
A1': P_A(approve\mid \omega_R)<q
```

```math
A2': \pi_A^{R,2}(1)>\bar\pi_A^{fall}
```

```math
A3': P_A(approve\mid \omega_{T2})>q
```

```math
A4': \pi_A^{T,2}(1-B)<\bar\pi_A^{fall}
```

## Como preservar a contribuição substantiva

Essa mudança não enfraquece necessariamente o paper. Pelo contrário, melhora a transparência. O resultado central passaria a ser:

> Crossed fragility arises when the protest, compensation, and fall thresholds fall into a specific but nondegenerate ordering.

Isso é muito mais defensável do que afirmar que crossed fragility decorre automaticamente de A1–A9.

## Conclusão

Propositions 1 e 2 estão overclaimed. Elas precisam ser reescritas como resultados condicionais a desigualdades explícitas. Do jeito atual, um referee técnico provavelmente apontará que o paper confunde exemplo numérico com prova geral.
