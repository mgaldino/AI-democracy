# Demanda setorial e competição democrática

Resultados numéricos do esboço de 23 de novembro de 2026. O exercício compara a mesma tecnologia com duas especificações de demanda. As unidades de custo e valor correspondem às dos payoffs do jogo.

## Parâmetros e equilíbrios

A parcela inicial do setor S é 0,25, a elasticidade de substituição é 0,60, o efeito direto da automação sobre a eficácia no setor A tem coeficiente 0,50 e a capacidade por trabalhador no setor S vale 6.
O ganho da restrição é G = 2,00, o valor da competição para a federação é V = 0,90 e o custo de apresentar a proposta é f = 0,10. O limiar de dissuasão é G²/(2V) = 2,222222.

**Tabela 1. Equilíbrio no ponto inicial e após o mesmo choque de IA.** A parcela de S é uma fração do emprego total, normalizado em um. A margem é M menos o limiar. O custo é a despesa mínima de defesa diante de uma proposta de restrição.

| Situação | a | η | Emprego em S | Capacidade M | Margem | Custo G²/(2M) | Regime |
|---|---:|---:|---:|---:|---:|---:|---|
| Inicial, homotética | 0,00 | 1 | 0,2500 | 2,2500 | 0,0278 | 0,8889 | Competição preservada |
| Inicial, não homotética | 0,00 | 6 | 0,2500 | 2,2500 | 0,0278 | 0,8889 | Competição preservada |
| Após IA, homotética | 0,36 | 1 | 0,2849 | 2,1904 | -0,0318 | 0,9131 | Competição restringida |
| Após IA, não homotética | 0,36 | 6 | 0,3397 | 2,4823 | 0,2601 | 0,8057 | Competição preservada |

Fonte: cálculos com parâmetros sintéticos do esboço.

A mudança de M em relação à origem é -0,0596 na demanda homotética e 0,2323 na não homotética. Após o choque, a distância entre as capacidades é 0,2918 e a diferença de emprego em S é de 5,48 pontos percentuais.
Qualquer limiar estritamente entre 2,190436 e 2,250000 preserva a competição inicialmente e a separação observada depois do choque. No limiar exato a federação é indiferente.

## Inclinações e valores críticos

**Tabela 2. Sensibilidade inicial ao aumento de a.** As colunas numéricas usam diferenças à direita de segunda ordem. A elasticidade-renda mede, a preços fixos, a variação percentual da quantidade de S para uma alta de 1% no orçamento inicial.

| Demanda | η | Elasticidade-renda de S | ds/da analítica | ds/da numérica | dM/da analítica | dM/da numérica |
|---|---:|---:|---:|---:|---:|---:|
| Homotética | 1 | 1,0000 | 0,0750 | 0,0750 | -0,3750 | -0,3750 |
| Não homotética | 6 | 1,6667 | 0,2000 | 0,2000 | 0,2500 | 0,2500 |

Fonte: cálculos com parâmetros sintéticos do esboço.

- No choque de 0,36 a competição é preservada para η acima de 1,237697 (raiz numérica 1,237697), quando o emprego em S ultrapassa 29,090%. Esse limiar de η equivale à elasticidade-renda inicial de S de 1,067309.
- A variação total de M entre a origem e o choque de 0,36 muda de sinal em η = 1,471494.
- A derivada de M na origem muda de sinal em η = 3,000000 (raiz numérica 3,000000). Isso equivale à elasticidade-renda inicial de S igual a 1,4000.
- Mantendo η homotético e não homotético nos valores da Tabela 2, a inversão local de inclinações ocorre para a capacidade por trabalhador de S estritamente entre 4,75 e 11,00.
- Na demanda homotética, duas raízes de M(a) igual ao limiar estão em a = 0,083435 e a = 0,496715. Cada ponto da figura compara economias que partem de eleições competitivas. A segunda raiz descreve a volta da dissuasão no contrafactual estático.

**Tabela 3. Diferença de capacidade entre demanda não homotética e homotética após o choque, variando a organização de S.** A capacidade de A nesse ponto é a mesma nos três cenários.

| Capacidade de S por trabalhador | Capacidade de A por trabalhador | M não homotética menos M homotética |
|---:|---:|---:|
| 0,3362 | 0,6724 | -0,0184 |
| 0,6724 | 0,6724 | 0,0000 |
| 6,0000 | 0,6724 | 0,2918 |

Fonte: cálculos com parâmetros sintéticos do esboço.

## Ordem das decisões e informação privada

**Tabela 4. Defesa mobilizada antes da apresentação da proposta.** O limiar é (G−f)²/(2V). Como o gasto de mobilização é antecipado, a federação o suporta inclusive quando decide impedir a proposta. Os dois resultados são avaliados no mesmo choque da Tabela 1.

| Custo de apresentar f | Limiar | Margem homotética | Regime homotético | Margem não homotética | Regime não homotético |
|---:|---:|---:|---|---:|---|
| 0,100 | 2,005556 | 0,184880 | Competição preservada | 0,476725 | Competição preservada |
| 0,005 | 2,211125 | -0,020689 | Competição restringida | 0,271155 | Competição preservada |

Fonte: cálculos com parâmetros sintéticos do esboço.

Na ordem original, suponha que a federação conheça privadamente V e que o suporte conhecido pelo governo seja [0,895, 0,905]. O custo mínimo de defesa é 0,888889 na origem, 0,913060 após o choque na demanda homotética e 0,805711 na não homotética. O custo está abaixo de todo o suporte na origem e na não homotética, e acima de todo o suporte na homotética após o choque. Todos os tipos escolhem a mesma resposta em cada respectivo subjogo.

## Verificações e reprodução

A malha contém 991 pontos de automação por cenário, entre 0 e 0,99. Os maiores resíduos absolutos foram:

- Equação implícita da demanda: 3.49e-14.
- Parcela obtida pela equação de dispêndio independente: 4.39e-14.
- Parcela homotética em forma fechada: 1.11e-16.
- Restrição de emprego total: 2.22e-16.
- Decomposição exata da diferença entre as capacidades: 8.88e-16.

A rotina também verifica o ponto inicial comum, a ordenação das parcelas em toda a malha positiva, os sinais das margens e do custo da defesa, os dois limiares analíticos e o efeito de igualar ou inverter as capacidades setoriais no ponto pós-choque.

Executado com R version 4.6.1 (2026-06-24), usando R base. Na raiz do projeto, rode `Rscript model/verificar_crossing_demanda_ia.R` para reproduzir este arquivo, `figures/crossing_demanda_ia.pdf` e `figures/crossing_demanda_tabela.tex`.
