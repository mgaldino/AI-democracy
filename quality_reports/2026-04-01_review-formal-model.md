# Carta Editorial — Revisão de Modelo Formal

**Referências**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decisão: R&R minor

## Scores consolidados
| Dimensão              | Score | Rating   |
|-----------------------|-------|----------|
| Design do modelo      | 8.0/10  | Forte — pergunta excelente, mecanismo adequadamente isolado, insights ricos |
| Apresentação técnica  | 7.5/10  | Boa — mas faltam figuras, conflitos de notação, provas telegráficas |
| Exposição             | 7.5/10  | Boa — estrutura sólida, intro precisa de ajuste, Appendix C questionável |
| **Global**            | **7.5/10**  | Paper com design forte, precisando de polish técnico e decisão sobre Appendix C |

## Síntese editorial

O design do modelo é a principal força do paper. A pergunta é genuinamente nova (nenhum modelo formal liga trajetória de automação a estabilidade comparada de regimes), o mecanismo (coordenação como mediadora com efeitos opostos por regime) está adequadamente isolado, e o modelo é notavelmente parcimonioso (2 períodos, 2 regimes, 2 trajetórias, 6 parâmetros). O teste Schelling-Spence confirma que η_R é o componente indispensável (P6 mostra que η_R = 1 anula o resultado cruzado). A extensão welfare state (P7-P8) é possivelmente o resultado mais publicável: a equivalência funcional com gap de welfare = κ̄ é elegante e normatively poderosa. O processo de construção é maduro (exemplos numéricos → modelo geral, 3 reviews iterados).

A apresentação técnica é competente mas com problemas corrigíveis: ausência total de figuras (problema sério para um modelo com tipologia e intervalos), conflitos de notação entre apêndices (c, x_i, B reutilizados com significados diferentes), provas telegráficas demais para audiência de CP (~30% linguagem natural vs. 52-63% recomendados por Thomson), e conceito de equilíbrio não declarado no modelo principal.

A exposição comunica bem os resultados, mas a intro gasta espaço com contexto econômico e o Appendix C (populismo) é um corpo estranho que os três pareceristas questionam.

## Hierarquia aplicada: Design > Apresentação > Exposição

O design é claramente o ponto mais forte. Isso significa que **vale a pena investir em melhorar apresentação e exposição** — o modelo é bom o suficiente para justificar o polimento. A hierarquia funciona a favor do paper: design forte sustenta investimento em revisão.

A tensão principal no design — que A3 e A4 são regime-específicas por construção e o resultado cruzado segue quase diretamente delas — é real mas mitigada por três fatores: (1) as microfundações nos apêndices, (2) a Proposição 6 mostrando que η_R governa tudo, e (3) a riqueza de insights derivados (P4 welfare cost, P5 threshold of thresholds, P7-P8 welfare state). O design não é perfeito (unificar as microfundações em um framework de coordenação seria o próximo passo), mas é suficientemente forte para publicação.

## Prioridades para revisão

1. **Adicionar figuras (impacto alto).** No mínimo: (a) reta κ₀ com intervalos dos 3 tipos de autocracia e intervalo cruzado colorido; (b) tabela 2×2 com shading estável/instável; (c) idealmente, diagrama φ₀ × κ₀ para tipologia completa de 5 tipos. Board: "If you can, draw a picture."

2. **Corrigir conflitos de notação entre apêndices (impacto alto).** c, x_i e B reutilizados com significados diferentes nos Apêndices A, B e C. Renomear: c_T/c_F, x_i/z_i, B_R/B_P. Consolidar η (eliminar η_R que confunde com ação R, fixar η_r e η_τ). Thomson: "Do not use the same symbol for different things."

3. **Expandir provas com linguagem natural (impacto médio-alto).** Para cada prova de P1-P6, adicionar 1-2 frases de explicação informal ANTES da álgebra. Mirar na faixa de 52-63% linguagem natural recomendada por Thomson. Audiência de CP, não de matemáticos.

4. **Explicitar conceito de equilíbrio e timing (impacto médio).** Adicionar subsecção "Timing and equilibrium concept" na Seção 2: dominância no baseline, SPE no Appendix A, BNE no Appendix B.

5. **Decidir sobre Appendix C (impacto médio).** Os três pareceristas convergem: o Appendix C distrai mais do que contribui no estado atual. ψ é reduced-form, a notação é pesada, e P9 não é necessária para o argumento central. Recomendação: cortar ou reduzir drasticamente. Se mantido, reescrever o parágrafo na Discussion para ser autocontido.

## Recomendação estratégica ao autor

O paper tem design forte o suficiente para publicação em **JOP, BJPS, ou possivelmente AJPS** após revisão focada em apresentação técnica (figuras, notação, provas). Os problemas identificados são de *apresentação*, não de *substância* — são corrigíveis em uma rodada de revisão.

Para **APSR**, a questão é se a distância premissas-conclusões é suficiente. O design review avalia 8/10, mas o Edmans Execution avalia 6.5/10 — a diferença reflete que o design é elegante mas a formalização não gera surpresa suficiente. A sugestão de unificar as microfundações de A3 e A4 em um único framework de coordenação (um global game onde precisão do sinal gera simultaneamente compensação reativa e efetividade repressiva variável) seria o upgrade que transformaria o paper de "bom para JOP" em "competitivo para APSR."

Intervenções imediatas de maior retorno: (1) adicionar 2-3 figuras; (2) corrigir notação; (3) expandir provas com linguagem natural. Estas são todas de baixo risco e alto impacto — puro polimento técnico que não altera a substância.

---

## Parecer completo — Design do Modelo (8.0/10)

**O modelo em uma frase:** Modelo de 2 períodos com 2 regimes e 2 trajetórias mostra que a forma temporal do choque determina qual regime é mais frágil, via coordenação como mediadora com efeitos opostos sobre compensação democrática e repressão autocrática.

**Tipo de contribuição:** Força política isolada + pergunta nova + predições empíricas.

**MD1 Qualidade da pergunta [Excelente]:** Puzzle genuíno (Przeworski et al. 2000), compreensível para não-especialistas, "why should I care" forte (P8 na abertura). Insight novo — ninguém propôs que cada regime tem vantagem comparativa por tipo de choque.

**MD2 Simplicidade e KISS [Excelente]:** Notavelmente parcimonioso. Economia importada como premissa (OEP). Teste Schelling-Spence: η_R é indispensável (P6 confirma). 5 assumptions justificadas.

**MD3 Isolamento do mecanismo [Adequado com tensão]:** Coordenação isolada como mediadora. Tensão: A3 e A4 são microfundadas por mecanismos *diferentes* (votação e global games). Unificação em um framework único fortaleceria.

**MD4 Riqueza de insights [Rica]:** P4 (welfare cost = κ̄), P5 (threshold of thresholds), P6 (η_R governa tudo), P7-P8 (equivalência funcional), tipologia 5 tipos, transferabilidade. Modelo compacto mas rico.

**MD5 Tipo de contribuição [Forte]:** Força política isolada (mismatch timing choque × resposta institucional). Predições empíricas via tipologia.

**MD6 Processo de construção [Maduro]:** Exemplos numéricos → generalização. 3 reviews iterados (5→7.5→8.5). Baseline + extensões modulares.

## Parecer completo — Apresentação Técnica (7.5/10)

**Estrutura:** E escolhe M/R, dominância no baseline, SPE no App A, BNE no App B. Conceito de equilíbrio não declarado no modelo principal (omissão).

**Scorecard:**
- D2 Apresentação: Adequado (falta timing explícito e conceito de equilíbrio)
- D3 Notação: Precisa melhorar (η inconsistente, φ sobrecarregado, Δ não mnemônico, conflitos c/x_i/B entre apêndices)
- D4 Definições: Adequado (falta destaque tipográfico formal)
- D5 Resultados: Adequado (formato paralelo, takeaways claros)
- D6 Provas: Precisa melhorar (~30% linguagem natural vs. 52-63% recomendado)
- D7 Figuras: **Problema sério** (nenhuma figura em todo o manuscrito)
- D8 Assumptions: Adequado (bem agrupadas, motivação proporcional)
- D9 Exemplos: Adequado (numérico bom, faltam geométricos)

**Conflitos de notação identificados:** (1) c = custo de taxação (App A) e custo de falha (App B); (2) x_i = sinal privado (App B) e tipo do trabalhador (App C); (3) B = benefício de revolta (App B) e valor de controle político (App C); (4) i = tipo de regime e índice de trabalhador; (5) R = ação radical e subscript de "rapid" em η_R.

## Parecer completo — Exposição (7.5/10)

**ME1 Estrutura [Adequada]:** Fluxo canônico (Intro→Modelo→Resultados→Extensão→Discussion→Conclusão). Baseline resolvido antes de extensões. P3 aparece cedo. Discussion mistura elementos heterogêneos.

**ME2 Introdução [Precisa melhorar]:** Abre com P8 (bom), mas gasta 2 parágrafos em contexto econômico antes de chegar à contribuição. Mecanismo (coordenação) só aparece no 4º parágrafo. Laundry list de implicações no "Third" result. Parágrafo Przeworski & Wallerstein repete o anterior.

**ME3 Escrita [Adequado]:** Clara, concisa, consistente. Frases curtas. Footnotes parcimoniosos. Abstract longo demais (~250→~120 palavras).

**ME4 Extensão [Adequado]:** Corpo enxuto (~10-12 pp). P7-P8 justificadas. Appendix C questionável (mini-paper com ψ reduced-form). Transferability não desenvolvida.

**ME5 Exemplos [Adequado]:** Exemplo numérico após P3 eficaz. Faltam figuras geométricas e cenário motivador concreto na intro.
