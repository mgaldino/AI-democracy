# Validação Bibliográfica

**Arquivo principal**: paper.Rmd
**Arquivo .bib**: references.bib (recém-criado)
**Data**: 2026-04-03

**Nota**: O paper usa citações inline (ex: "Acemoglu and Robinson 2006"), não `@citekey`. O .bib foi criado manualmente a partir da seção References. A conversão para `@citekey` ainda não foi feita.

## Resumo
- Total de citações no texto (corpo): 16 referências distintas
- Total de entradas no .bib: 19
- Citações órfãs: 0
- Entradas não citadas no corpo: 5
- Entradas com problemas de qualidade: 2

## Citações no corpo do texto → .bib

| Citação inline | Linha(s) | Chave .bib | Status |
|---------------|----------|------------|--------|
| Acemoglu and Robinson 2006 | 21 | AcemogluRobinson2006 | OK |
| Przeworski 2005 | 21 | Przeworski2005 | OK |
| Gans and Goldfarb 2026 | 21, 41, 67, 113 | GansGoldfarb2026 | OK |
| Autor, Levy, and Murnane 2003 | 21 | AutorLevyMurnane2003 | OK |
| Lake 2009 | 23 | Lake2009 | OK |
| Chwe 2001 | 25, 433 | Chwe2001 | OK |
| Kuran 1991 | 25, 433 | Kuran1991 | OK |
| Edmond 2013 | 25 | Edmond2013 | OK |
| Przeworski and Wallerstein 1982 | 31, 236 | PrzeworskiWallerstein1982 | OK |
| Moene and Wallerstein 2001 | 31, 236 | MoeneWallerstein2001 | OK |
| Morris and Shin 2003 | 67, 105, 107, 111, 413, 415, 419, 433 | MorrisShin2003 | OK |
| Knutsen and Rasmussen 2018 | 319 | KnutsenRasmussen2018 | OK |
| Desai, Olofsgard, and Yousef 2009 | 236 | DesaiOlofsgardYousef2009 | OK |
| Przeworski and Limongi 1997 | 433 | PrzeworskiLimongi1997 | OK |

## Citações órfãs (no texto, ausentes do .bib) 🔴

Nenhuma.

## Entradas não citadas no corpo (no .bib, apenas na seção References) 🟡

| Chave | Referência | Nota |
|-------|-----------|------|
| AcemogluRestrepo2020 | Acemoglu & Restrepo (2020), "Robots and Jobs" | Na seção References mas não citado no corpo |
| Boix2003 | Boix (2003), *Democracy and Redistribution* | Na seção References mas não citado no corpo |
| Przeworski2006 | Przeworski (2006), "Self-Enforcing Democracy" | Na seção References mas não citado no corpo |
| PrzeworskiAlvarezCheibubLimongi2000 | Przeworski et al. (2000), *Democracy and Development* | Na seção References mas não citado no corpo |
| Svolik2012 | Svolik (2012), *The Politics of Authoritarian Rule* | Na seção References mas não citado no corpo |

**Decisão necessária**: Remover estas 5 entradas do .bib e da seção References, ou adicionar citações no texto onde pertinente?

## Possíveis duplicatas 🟡

Nenhuma.

## Problemas de qualidade no .bib 🟡

| Chave | Problema | Sugestão |
|-------|----------|----------|
| GansGoldfarb2026 | Working paper sem instituição/URL | Adicionar `institution` ou `url` se disponível |
| MorrisShin2003 | @incollection sem páginas | Adicionar `pages` se conhecidas |

## Problemas de capitalização no .bib 🟡

| Chave | Campo | Problema | Sugestão |
|-------|-------|----------|----------|
| Kuran1991 | title | "East European" precisa de `{}` para preservar caps | Já corrigido: `{East European}` |
| AcemogluRestrepo2020 | title | "US" precisa de `{}` | Já corrigido: `{US}` |

## Entradas OK ✅

17/19 entradas sem problemas de qualidade (2 com issues menores acima).

## Ação recomendada

1. **Converter citações inline para `@citekey`** no paper.Rmd e adicionar `bibliography: references.bib` ao YAML
2. **Decidir sobre as 5 entradas fantasma**: remover ou citar
3. **Remover a seção `# References {-}` manual** (será gerada automaticamente pelo pandoc/citeproc)
