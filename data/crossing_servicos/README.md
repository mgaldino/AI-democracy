# Elasticidade-renda do gasto e sindicalização nos serviços dos Estados Unidos

O pareamento reúne 14 ramos de serviços para os quais há uma elasticidade de gasto familiar e uma indústria empregadora correspondente, mais manufatura e utilidades como referências. A planilha `pares.csv` tem uma linha por ramo em 2012, 2015 e 2025. Cada elasticidade representa a mesma estimativa histórica em todas as linhas daquele ramo. Os números anuais que variam são os de emprego, filiação e cobertura coletiva. O arquivo `verificacao.md` apresenta a tabela completa em formato legível.

## Fontes e alcance

Joachim Hubmer estimou elasticidades de gasto nos Estados Unidos a partir da *Consumer Expenditure Survey* (CEX). A Tabela B.I do suplemento publicado, p. 11, agrega os bens a dois dígitos das tabelas insumo-produto e tira a média dos momentos entre 1982 e 2012. O artigo estima quanto cresce o gasto de consumo em um bem quando aumenta o gasto total das famílias. A tabela publica o excesso dessa elasticidade sobre um. A coluna `elasticidade` soma um ao valor publicado. Atribuir a elasticidade de demanda do consumidor ao crescimento dos postos de trabalho de uma indústria requer hipóteses adicionais sobre produtividade, compras intermediárias, financiamento público e composição do produto. [Artigo](https://doi.org/10.3982/ECTA18580) e [Tabela B.I do suplemento](https://www.econometricsociety.org/publications/econometrica/browse/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/ecta200523-sup-0001-onlineappendix.pdf#page=11).

Barry T. Hirsch, David A. Macpherson e William E. Even (2026), *Union Membership, Coverage, and Earnings from the CPS*, calculam contagens ponderadas a partir dos grupos de rotação de saída da *Current Population Survey* (CPS). Os assalariados de 16 anos ou mais são classificados pela indústria do emprego principal. Filiação abrange sindicatos e associações de empregados equiparadas. Cobertura inclui filiados e trabalhadores adicionais representados em acordo coletivo. As razões usam o número de trabalhadores assalariados, incluindo empregados públicos e privados nas indústrias correspondentes. A base exclui os trabalhadores por conta própria. A filiação observada depende também das leis, dos empregadores e da história dos sindicatos. [Definições das variáveis](https://unionstats.com/ind/ind_index.html), [documentação da base](https://unionstats.com/main.htm) e [comparação com o BLS](https://unionstats.com/cps/BLS_vs_UnionStats.htm).

Os dados foram consultados em 23 de novembro de 2026. O ano de 2012 coincide com a última data da Tabela B.I. Os de 2015 e 2025 verificam a sensibilidade a mudanças na estrutura sindical. Em 2025, a CPS adotou a classificação industrial do Censo de 2022 e não foi coletada em outubro, durante a paralisação federal. A média publicada abrange os outros 11 meses. O pareamento utiliza os códigos efetivos de cada planilha. [Planilha de 2012](https://unionstats.com/ind/xls/ind_2012.xlsx), [planilha de 2015](https://unionstats.com/ind/xls/ind_2015.xlsx), [planilha de 2025](https://unionstats.com/ind/xls/ind_2025.xlsx) e [nota metodológica do BLS, Tabela 3](https://www.bls.gov/news.release/archives/union2_02182026.htm).

## Correspondência das indústrias

`hubmer_bi.csv` preserva as duas participações de gasto e a coluna de elasticidades da tabela para todos os 22 ramos. `crosswalk.csv` registra os intervalos fechados de código de indústria do Censo (CIC), o grupo de insumo-produto, inclusões e exclusões. O arquivo `detalhe_cic.csv` identifica cada código efetivamente incorporado, com sua descrição original, ano e contagens para permitir a inspeção dos ramos amplos.

- Na **habitação**, a tabela reúne imóveis e o aluguel imputado da residência própria. O segundo componente carece de um grupo correspondente de empregados. Por isso, habitação fica fora do confronto e o ramo 53 cobre apenas a locação de bens e de ativos intangíveis.
- O **transporte** (48) mantém separados o correio norte-americano, as entregas e a armazenagem (49). O mecanismo de contratação do setor postal é particularmente relevante para interpretar a elevada densidade sindical do ramo 49. O ramo 56 exclui a gestão de empresas (CIC 7570), que corresponde a um setor distinto na classificação industrial.
- Em **educação** e **saúde e assistência social**, a CPS inclui escolas e hospitais públicos e privados. A amostra CEX cobre apenas a parcela dos serviços paga pelas famílias. Em saúde, a própria tabela mostra participação de 3,2% no gasto pesquisado (CEX) e 17,2% no consumo das contas nacionais (PCE). Na educação, as famílias podem consumir serviços públicos sem uma despesa corrente correspondente. Financiamento público e cobertura institucional podem alterar a composição dos empregos criados na margem.
- Em **comércio** e **serviços profissionais**, a elasticidade estimada para as compras de consumo final tem alcance diferente do emprego no setor, que também atende empresas e governo. A CEX agrega categorias de bens às tabelas de insumo-produto. A CPS classifica todos os empregados na indústria correspondente, inclusive os de subindústrias com participação pequena no consumo final. A elasticidade de informação ou serviços profissionais não identifica a elasticidade específica da programação, da hospedagem de dados ou do desenvolvimento de sistemas.
- A **manufatura** reúne os grupos 31, 32 e 33. A elasticidade do agregado é a média dos três coeficientes publicados (0,441, 0,790 e 1,170), ponderados pelas participações PCE de 0,098, 0,049 e 0,058. O composto calculado é 0,73067. A ponderação usa médias históricas publicadas, arredondadas a três casas, e expressa a composição fixada nesses pesos.
- As **utilidades** (eletricidade, gás, água e saneamento) aparecem para sensibilidade, fora dos 14 ramos principais. O subtotal rotulado *UTILITIES* nas três planilhas do Unionstats também inclui a construção. O script soma somente os CICs 570–690 e verifica que acrescentar a construção recupera o subtotal publicado.
- **Agricultura, mineração e construção** estão fora do recorte setorial. **Administração pública** e **gestão de empresas** carecem de elasticidade própria na Tabela B.I. As linhas das subindústrias usadas para descrever a heterogeneidade interna, como sistemas de computação (CIC 7380), conservam somente seus resultados trabalhistas. Cada elasticidade aparece uma vez por ano na análise setorial.

### Empregadores privados em educação e saúde

A Tabela 3 da publicação anual do Bureau of Labor Statistics (BLS) permite comparar os totais por ramo com o emprego privado. Em educação, por exemplo, o BLS estima 12,4% dos assalariados privados como filiados em 2012. Quando entram escolas públicas, o Unionstats fornece 31,7% de filiação no conjunto do ramo. As tabulações que seguem reproduzem diretamente os percentuais publicados pelo BLS. O excerto `raw/bls_tabela3_privado_excerto.csv` preserva também as contagens, em milhares arredondados como na publicação. [Edição de 2012](https://www.bls.gov/news.release/archives/union2_01232013.htm), [edição de 2015](https://www.bls.gov/news.release/archives/union2_01282016.htm) e [edição de 2025](https://www.bls.gov/news.release/archives/union2_02182026.htm).

Tabela 1. Filiação e cobertura entre os assalariados de empregadores privados dos Estados Unidos, em porcentagem.

| Ramo | Ano | Filiação (%) | Cobertura (%) |
|---|---:|---:|---:|
| Educação | 2012 | 12,4 | 14,1 |
| Saúde e assistência social | 2012 | 7,0 | 8,0 |
| Educação | 2015 | 13,7 | 15,8 |
| Saúde e assistência social | 2015 | 7,3 | 8,3 |
| Educação | 2025 | 13,4 | 15,7 |
| Saúde e assistência social | 2025 | 6,8 | 8,0 |

## Unidades e reprodução

Em `pares.csv`, `setor` é o identificador e `nome` o rótulo em português. `ano` é o ano da CPS. `obs_cps` conta observações da amostra. `emprego`, `filiados` e `cobertos` são contagens ponderadas de pessoas, convertidas dos milhares com a precisão interna das células Excel. As casas decimais decorrem dessa ponderação. `pct_filiados` e `pct_cobertos` são as respectivas frações de `emprego` multiplicadas por 100. `servico=1` assinala a amostra principal. `peso_gasto` e `peso_cex` são frações do gasto nos bens elegíveis das duas bases, após a normalização anual do autor e antes de uma eventual renormalização para qualquer subconjunto de ramos. O peso CEX publicado de 0,000 no ramo 49 decorre do arredondamento da tabela. O arquivo com a precisão recuperada permite distinguir esse caso de um gasto exatamente nulo.

São necessários R, o pacote `readxl` e o executável `pdftotext` do Poppler. Na raiz do repositório, usar um locale UTF-8 disponível no sistema. O download preserva os arquivos que já existem. Os hashes em `fontes.sha256` identificam os quatro originais do pareamento e os cinco arquivos de replicação de Hubmer incluídos na sensibilidade à precisão.

```sh
sh data/crossing_servicos/baixar_fontes.sh
(cd data/crossing_servicos && shasum -a 256 -c fontes.sha256)
env LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 Rscript --vanilla data/crossing_servicos/parear_setores.R
```

O script confere a transcrição com o PDF, valida os códigos, verifica os limites das contagens e reconcilia os somatórios com as planilhas. Ele gera `pares.csv`, `detalhe_cic.csv` e `verificacao.md`.

Para recuperar a precisão anterior ao arredondamento da Tabela B.I, `recuperar_precisao.R` utiliza os insumos agregados em `raw/hubmer_replica/` e o pacote R `haven`. Os cinco arquivos foram extraídos do ZIP oficial de replicação, cujo SHA-256 é `367a6ff1e0a47028cbba70c57a7d01ecf912c29702674ba40ea19a771eca2c96`. `extrair_replica_hubmer.sh` permite recuperá-los novamente. A especificação e a checagem contra a publicação encontram-se em `precisao_pesos.md`. [Dados e programas do artigo](https://www.econometricsociety.org/publications/econometrica/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/18580_Data_and_Programs.zip).
