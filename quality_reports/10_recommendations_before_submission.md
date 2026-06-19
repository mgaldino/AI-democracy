# Nota técnica 10 — Onze recomendações antes de submeter à AJPS

## 1. Reescrever os resultados principais como proposições condicionais

As Propositions 1 e 2 não devem ser enunciadas simplesmente “Under A1–A9”. Elas dependem de desigualdades adicionais sobre protesto, compensação, queda e aprovação da elite.

Recomendação: introduzir condições explícitas para cada célula da matriz:

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
P_A(approve\mid\omega_R)<q,
```

```math
\pi_A^{R,2}(1)>\bar\pi_A^{fall},
```

```math
P_A(approve\mid\omega_{T2})>q,
```

```math
\pi_A^{T,2}(1-B)<\bar\pi_A^{fall}.
```

A contribuição passa a ser: crossed fragility emerge em uma região paramétrica substantivamente interpretável, não universalmente sob A1–A9.

## 2. Consertar Lemma 0 ou rebaixá-lo para assumption

O Lemma 0 precisa provar existência, unicidade, continuidade e monotonicidades do equilíbrio de protesto. A versão atual é um proof sketch.

Há duas opções:

1. Provar formalmente o resultado de global games, verificando as condições necessárias.
2. Assumir uma regularity condition:

```text
The selected protest equilibrium is unique, continuous in parameters, increasing in Ω and v, and decreasing in C_x.
```

Para AJPS, não se deve usar propriedades de `π*` sem prova ou assumption explícita.

## 3. Alinhar linguagem probabilística e determinística no Lemma 1

O modelo autocrático gera probabilidades de aprovação:

```math
P(approve\mid\omega_R)<1/2,
```

```math
P(approve\mid\omega_{T2})>1/2.
```

Mas as proposições tratam aprovação como determinística. É preciso escolher:

- ou resultados probabilísticos;
- ou uma regra determinística com cutoff `q`.

Recomendação:

```math
comp_t=1 \quad \text{iff} \quad P(approve\mid\omega_t)\ge q.
```

Com `q=1/2`, a ponte fica clara.

## 4. Transformar Proposition 3 em prova de open set

Proposition 3 deve provar que crossed fragility vale em um conjunto aberto de parâmetros.

A prova deve seguir quatro passos:

1. Definir as inequalities `CF1–CF8`.
2. Mostrar que todas envolvem funções contínuas.
3. Verificar que o exemplo numérico satisfaz todas estritamente.
4. Invocar continuidade para concluir existência de uma vizinhança aberta.

Sem isso, o exemplo numérico parece substituir a prova.

## 5. Provar monotonicidade de protesto em `C_A`

Corollary 1 depende de:

```math
\frac{\partial \pi^*}{\partial C_A}<0.
```

Essa monotonicidade precisa ser provada ou assumida. Se for assumida, declarar como regularity condition. Se for provada, colocá-la como lemma antes do corolário.

## 6. Corrigir Proposition 5 para o caso geral de `g(σ_A)`

A monotonicidade de:

```math
P(approve\mid\omega_R)
```

em `σ_A` não segue apenas de `\bar\omega_A'(σ_A)>0`.

É preciso restringir a proposição à especificação linear:

```math
\bar\omega_A(σ_A)=ω_0+α_1σ_A,
```

ou adicionar a condição:

```math
σ_A\bar\omega_A'(σ_A)>\bar\omega_A(σ_A)-ω_R.
```

Sem isso, a prova está overclaimed.

## 7. Integrar Appendix B ao modelo principal

Se o paper usa a aproximação single-state após `t=1`, o timing deve dizer que aggregate protest `π_1` é publicamente observado e revela o estado `θ`, ou pelo menos atualiza crenças fortemente.

Adicionar algo como:

```text
At the beginning of period 2, all players observe π_1. Under the selected equilibrium, the mapping θ↦π_1(θ) is injective, so θ becomes common knowledge.
```

Ou tratar Appendix B como uma aproximação ilustrativa e não como parte da prova.

## 8. Formalizar o credible commitment democrático

A estabilidade de democracia sob rapid displacement depende de trabalhadores anteciparem compensação futura.

Adicionar uma condição de consistência:

```math
\bar\pi_D^{comp}<\pi_D^{R,1}(v_{cred})<\bar\pi_D^{fall},
```

com:

```math
v_{cred}=1+\delta(1-B).
```

Isso mostra que protesto é suficiente para acionar compensação, mas insuficiente para derrubar o regime.

## 9. Enfraquecer a afirmação de que tudo deriva de um único primitive

O texto diz que o resultado deriva de selectorate size. Mas no modelo atual, selectorate size não deriva plenamente:

- custo de protesto;
- ruído informacional;
- velocidade institucional;
- regra fiscal/compensatória.

Esses canais são introduzidos separadamente.

Recomendação: trocar linguagem forte por:

```text
We model selectorate size as inducing three regime-level asymmetries: information quality, speed of response, and fiscal authorization.
```

Isso é mais defensável.

## 10. Separar resultados formais, exemplo numérico e interpretação

O paper deve deixar claro o que é:

- resultado analítico;
- condição paramétrica;
- exemplo numérico;
- interpretação substantiva.

Hoje, o exemplo numérico faz trabalho demais. Ele deve ser usado apenas para mostrar que as desigualdades são simultaneamente satisfatíveis.

## 11. Remover TODOs e completar o apêndice técnico

Antes de submeter à AJPS, não pode haver seções `[TODO]` relacionadas a extensões ou apêndices. Mesmo que sejam futuras extensões, a presença de TODOs sinaliza manuscrito incompleto.

Além disso, as provas de Propositions 1–3 devem ter uma versão técnica no apêndice. O corpo pode conter intuition/sketch, mas a auditabilidade precisa estar no apêndice.

## Síntese

O paper deve ser reconstruído em torno de uma estratégia formal mais modesta e mais defensável:

1. Definir claramente o equilíbrio de protesto ou assumir sua regularidade.
2. Declarar as inequalities que produzem crossed fragility.
3. Provar que essas inequalities definem um conjunto aberto.
4. Usar o exemplo numérico apenas para demonstrar não-vaziedade.
5. Ajustar a linguagem para não prometer derivação total onde há forma reduzida.

Essa reconstrução preserva a contribuição substantiva, mas reduz muito a vulnerabilidade técnica em uma revisão AJPS.
