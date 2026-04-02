# Carta Editorial — Revisão de Modelo Formal v3 (paper.Rmd com global game unificado + estado absorvente)

**Referências**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decisão: R&R minor (para JOP/BJPS) / R&R major (para APSR)

## Scores consolidados
| Dimensão              | Score | Rating | Delta vs v2 |
|-----------------------|-------|--------|-------------|
| Design do modelo      | 8.5/10  | Forte | ↑0.5 |
| Apresentação técnica  | 7.0/10  | Adequada com lacunas | ↓0.5 |
| Exposição             | 7.0/10  | Boa com lacunas visuais | ↓0.5 |
| **Global**            | **7.5/10** | | = |

## Síntese editorial

O design melhorou significativamente com a integração do global game unificado e a reformulação de estado absorvente. O score de design subiu de 8.0 para 8.5: o modelo agora tem um único primitivo informacional (σ) que gera endogenamente tanto a compensação democrática quanto a efetividade repressiva, e o estado absorvente é mais fiel à premissa econômica (Gans & Goldfarb). P1-P4 sobrevivem intactos e a distância premissas→conclusões aumentou materialmente.

Porém, a integração criou novos problemas de apresentação técnica que não existiam na versão mais simples. Os três mais graves: (1) **sobrecarga de g** — o parâmetro g (ganho de complementaridade) e a função g(π) (visibilidade) usam a mesma letra; (2) **payoffs de coordenação ausentes do corpo** — b_x e m só aparecem no Appendix B, deixando o jogo de coordenação incompletamente especificado no texto principal; (3) **unicidade do equilíbrio** — o Lemma 1 afirma existência de equilíbrio monotono mas não unicidade, contradizendo A3 que diz "unique."

A exposição perdeu pontos por falta de figuras de mecanismo (nenhuma figura mostra a cadeia causal σ→π*→continuation map) e por redundância entre as condições de estabilidade (§3.2) e as provas de P1-P2.

## Hierarquia aplicada: Design > Apresentação > Exposição

O design é o ponto forte e justifica investimento em polir apresentação e exposição. A queda nos scores técnicos reflete problemas corrigíveis (renomear variável, mover payoffs ao corpo, adicionar figuras), não falhas estruturais.

## Prioridades para revisão

1. **Renomear g (ganho de complementaridade)** para evitar sobrecarga com g(π) (visibilidade). Sugestão: usar b (bonus) ou δ_g.
2. **Mover payoffs de coordenação (b_x, m) para o corpo principal** — o jogo de coordenação deve ser autocontido na §2.
3. **Afirmar unicidade no Lemma 1** ou corrigir A3 — a contradição entre "admits a monotone cutoff equilibrium" (existência) e "unique monotone equilibrium" (A3) deve ser resolvida.
4. **Adicionar figura de mecanismo** (flow chart: trajectory → σ → π* → {φ, η} → stability) e/ou figura de π*(σ) cruzando π̄.
5. **Completar Appendix B** — provar unicidade, derivar σ̂_x explicitamente, demonstrar continuidade de π* em σ.

## Recomendação estratégica

O paper está em forma sólida para submissão a JOP/BJPS após as 5 correções acima (estimativa: 1-2 sessões de trabalho). Para APSR, o Appendix B precisaria ser substancialmente mais completo (provas de unicidade, derivação de σ̂_x, condições para ordenação σ̂_D vs σ̂_A) e os payoffs de coordenação precisariam estar no corpo. O design 8.5 suporta ambos os targets; a diferença é o nível de rigor técnico esperado.

---

## Parecer Design (8.5/10)
Pergunta excelente (9/10). KISS excelente (9/10) — único primitivo σ gera tudo; reserva sobre P7 como over-engineering. Mecanismo muito bom (8.5/10) — cadeia causal limpa σ→π*→continuation map; reservas: σ→trajetória reduced-form, continuation maps exógenos, peso causal assimétrico (coordenação constitutiva na autocracia, confirmatória na democracia). Insights ricos (9/10) — crossed fragility, welfare gap = κ̄, equivalência funcional P6, tipologia 5 tipos, duas tragédias simétricas. Contribuição forte e múltipla (9/10). Processo exemplar (9/10) — 7 iterações documentadas.

## Parecer Writing (7.0/10)
D2 (6/10): jogadores incompletamente especificados — N é parâmetro no corpo mas jogador no apêndice; payoffs de a_it ausentes do corpo; autocrata não declarado como não-estratégico. D3 (7/10): payoffs M/P corretos mas payoffs de coordenação ausentes. D4 (5/10 — problema sério): conceito de equilíbrio insuficiente — "BNE + dominância" sem especificar SPE/PBE para o jogo composto; unicidade não provada; estrutura intertemporal (backward induction) não formalizada. D5 (7/10): sobrecargas g/g(π), i, F. D6 (8/10): assumptions bem justificadas. D7 (7/10): P3 derivativa; P4 ambígua ("conditional on survival"); Lemma 2 sem rigor suficiente. D8 (8/10): figuras adequadas. D9 (5/10 — problema sério): Appendix B esquelético.

## Parecer Exposition (7.0/10)
ME1 (8/10): estrutura canônica, extensão antes de discussão. P7 deslocada (deveria ser após tipologia). Comparative statics na Discussion deveriam estar em Results. ME2 (8.5/10): exemplo numérico excelente (Varian). Caso knife-edge (L = w_E) é uma preocupação menor. ME3 (7.5/10): intuição verbal boa, "two symmetric tragedies" elegante. Falta explicitação da hierarquia timing vs coordenação ANTES das provas. Falta diagrama de mecanismo. ME4 (6/10): provas P1-P2 redundantes com §3.2; P7 introduz notação pesada para resultado simples; Appendix B esquelético. ME5 (5.5/10): faltam figuras de income paths, de π*(σ), e de mecanismo causal. Duas figuras de resultado mas zero figuras de mecanismo.
