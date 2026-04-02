# Carta Editorial — Revisão de Modelo Formal v2 (paper.Rmd)

**Referências**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decisão: R&R minor (para JOP/BJPS)

## Scores consolidados
| Dimensão              | Score | Rating | Delta vs v1 |
|-----------------------|-------|--------|-------------|
| Design do modelo      | 8.0/10  | Forte | = |
| Apresentação técnica  | 7.5/10  | Boa | = |
| Exposição             | 7.5/10  | Boa | = |
| **Global**            | **7.5/10**  | | = |

## Síntese editorial

O design mantém-se forte: pergunta genuinamente nova, modelo parcimonioso, riqueza de insights desproporcional à complexidade. O processo de construção é exemplar (Varian). P7-P8 continuam sendo o resultado mais publicável. A versão .Rmd tem conteúdo adicional vs .md (P9 fiscal, Corollary 3, exemplo inline nos Assumptions) que gera trade-offs.

A apresentação técnica tem problemas corrigíveis mas numerosos: numeração descontinua (P4→P7), definições tardias ("stability" usada antes de definida), phi sobrecarregado (phi_t, phi_0, φ̄), apêndices que são sketches e não provas completas, e P9 que introduz c(φ) sem especificação.

A exposição é boa. O exemplo numérico na §2 é o ponto alto — materializa o resultado cruzado com 4 cenários verificáveis. A intro (US/China) é eficaz. Problemas: excesso de citações na intro (14 nos primeiros 5 parágrafos), repetição da intuição coordenação/common knowledge (~4 vezes), e P9/Corollary 3 interrompendo o arco P7-P8→tipologia.

## Prioridades para revisão

1. **Corrigir numeração de proposições** (renumerar sequencialmente P1-P7 ou similar; reordenar Corollary 2 para antes de P9)
2. **Definir "stability" e "crossed fragility" formalmente antes do primeiro uso**
3. **Completar apêndices** (especialmente App B: derivar threshold de participação, não apenas afirmar) ou citar resultado exato de Morris & Shin
4. **Decidir sobre P9**: relegar a Discussion/Appendix ou manter mas especificar c(φ) e explicitar desconto temporal (δ=1)
5. **Eliminar repetições** (intuição coordenação aparece 4x; P&W verbatim 2x)
6. **Separar equivalência e welfare gap em P8** (título promete isomorfismo, corpo entrega desigualdade)

## Recomendação estratégica

O paper.Rmd tem conteúdo rico (P9 fiscal, exemplo inline, Corollary 3) mas também complexidade que a versão .md não tinha. Recomendação: (1) corrigir numeração e ordenação; (2) completar App B ou citar resultado exato; (3) decidir se P9 fica no corpo ou vira Discussion. Após essas correções, o paper está pronto para submissão a JOP/BJPS. Para APSR, a integração das microfundações (global game unificado) é o upgrade necessário.

---

## Parecer Design (8.0/10)
Pergunta excelente. KISS adequado com reserva sobre P9/A5'. Mecanismo adequadamente isolado com tensão conhecida (A3+A4 por construção). Riqueza de insights desproporcional ao modelo (P4 welfare gap, P8 equivalência, tipologia 5 tipos, duas tragédias, transferibilidade). Processo maduro (3 iterações documentadas). Sugestão principal: enfrentar a objeção "premissas→conclusões" diretamente no texto.

## Parecer Writing (7.5/10)
Scorecard: D2 Adequado, D3 Precisa melhorar (phi sobrecarregado, Delta mal posicionado, W ambíguo), D4 Precisa melhorar (stability usada antes de definida, crossed fragility nunca definido formalmente), D5 Precisa melhorar (P4 cross-cenário implícito, P8 título≠corpo, numeração descontinua), D6 Precisa melhorar (provas triviais, App B sketch), D7 Adequado (2 figuras), D8 Adequado com ressalvas (A5 não microfundada, c(φ) sem especificação), D9 Bom (exemplo numérico excelente). Conflitos de notação entre apêndices resolvidos (c→d? Não, .Rmd usa c_s no App A — sem conflito). Alpha não definido no App A.

## Parecer Exposição (7.5/10)
Estrutura adequada. Intro boa (hook US/China) mas com excesso de citações (14) e falta de hierarquia clara entre resultados. Escrita limpa com repetições de intuição (~4x coordenação/common knowledge). P9 interrompe arco narrativo P7-P8→tipologia. Exemplo numérico excelente. Apêndices esquelécticos. Sugestão principal: mover P9 para Discussion, completar apêndices, eliminar repetições.
