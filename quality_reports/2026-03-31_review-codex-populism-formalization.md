# Review: Codex Populism Formalization (model/07)

**Data**: 2026-03-31
**Objeto**: `model/07_populism_platform_choice_sketch.md` + `model/06_populism_numerical_sketch.R` (atualizados pelo Codex)
**Contexto**: Codex endogeneizou escolha de plataforma via Opcao A (agenda-setter dentro de E). Design review externo: 8.5/10.

## O que funciona bem

1. **Estrutura formal limpa.** P9 bem enunciada: 5 itens, prova sketch, interpretacao. Paper-ready.

2. **Assimetria tipo-dependente vs tipo-independente correta e central.** u_i(C) depende de x_i, u_i(R) nao. Derivado dos payoffs do modelo base, nao importado de fora.

3. **Threshold sigma_bar = 2f/(B*rho) e genuino.** Melhoria sobre sketch anterior onde qualquer sigma_E > 0 bastava. Condicao nao-trivial para populismo emergir.

4. **Conexao com Appendix A e logica.** P9 senta ANTES do Appendix A: decide se E apresenta demanda compensatoria. Se C: jogo segue para Appendix A (N decide). Se R: Appendix A nunca acontece.

5. **phi_0 como seletor funciona.** Se phi_0 >= phi_bar, compensacao automatica -> agenda-setter irrelevante -> compromisso sempre.

## Tres problemas substantivos

### 1. psi (campaign amplification) e o motor dos dois equilibrios, mas e pura assuncao

A multiplicidade vem INTEIRAMENTE de s_R^1 > s_R^0, que vem de psi(sigma_E) > 0. Mas psi e postulada ("entry activates anti-elite cleavage and fragments E further") sem derivacao. Se removermos psi: s_R^1 = s_R^0 = 1/2, e Pi_R^0 = B/2 - f < B/2 = Pi_C sempre. **Sem psi, so existe o equilibrio compromisso.** O resultado inteiro depende de uma funcao assumida.

Isso e o "palavratorio" que o autor sinalizou — a endogeneidade da saliencia esta em psi, e psi e exogena.

### 2. Agenda-setter e auto-interessado, e isso e crucial mas subenfatizado

O agenda-setter maximiza B * support, nao o welfare de E. Se maximizasse welfare de E, sempre escolheria C (porque compensacao + Appendix A da welfare maior que R para E em media). O equilibrio populista existe **porque o agenda-setter prefere controle politico a bem-estar de E**. Isso e um resultado sobre captura por elites — nao sobre coordenacao. O paper precisaria dizer explicitamente: "populismo emerge quando empreendedores politicos priorizam base eleitoral sobre welfare dos constituintes."

### 3. Coordenacao de elites (insight original do autor) virou otimizacao de um agente so

O insight era: "quem coordena sao elites politicas" — implicando MULTIPLOS atores tentando organizar E, com incerteza sobre quem consegue. O Codex substituiu por UM agenda-setter com escolha binaria. Mais tratavel, mas perde o aspecto de coordenacao que gerava multiplicidade naturalmente. A multiplicidade agora vem de psi (assumida), nao de falha de coordenacao (derivada).

## Veredicto

Formalizacao **funcional e publicavel** como appendix. Contornou o problema dificil (endogeneizar psi) em vez de resolve-lo. Para o paper na forma atual, suficiente se psi for apresentado honestamente como reduced-form. Para P9 no texto principal com forca total, psi precisaria de microfundacao.

## Recomendacao

Integrar como esta, com frase explicita no paper: "We model campaign amplification psi in reduced form; a full microfoundation via salience-driven identity activation (cf. Bonomi, Gennaioli, and Tabellini 2021) is left for future work." Honesto e padrao em papers formais.

## Questoes para o autor decidir

1. P9 no texto principal ou no appendix? (Se appendix, psi reduced-form e aceitavel. Se texto principal, psi precisa de mais trabalho.)
2. Explicitar que populismo emerge de auto-interesse do agenda-setter, nao de irracionalidade de E?
3. Futuramente: microfundar psi via modelo de saliencia (Bonomi et al. 2021) ou modelo de coordenacao entre multiplos agenda-setters?
