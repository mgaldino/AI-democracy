# Precisão dos pesos de gasto na Tabela B.I

Os arquivos de replicação de Hubmer permitem recuperar os valores antes do arredondamento. A especificação abaixo reproduz, após o arredondamento a três casas, as 22 participações PCE, as 22 participações CEX e os 22 coeficientes de elasticidade publicados.

O programa original do autor é `code_estimation/2e_sum_2dig.do`. Ele aplica a restrição de anos 1982–2012 e de coeficiente beta disponível a `data_interm/data_pcepfi1.dta`. Para cada ano, converte pesos faltantes em zero e normaliza cada série de pesos sobre os bens elegíveis. Em seguida mantém observações com correspondência de código de bem em `data_interm/CEX/quantiles_expsh4.dta`. Agrupa pela raiz de dois caracteres do código de produto, soma as participações e calcula a elasticidade do ramo a partir dos betas ponderados pelas participações CEX. A centralização por ano faz com que a média orçamentária dos betas corresponda a elasticidade unitária no conjunto dos bens. Finalmente, calcula a média temporal de cada estatística setorial.

O painel filtrado contém 4238 observações de 140 bens distintos em 31 anos calendários. A replicação contém pesos anuais para 1982–2012, inclusive anos intermediários às tabelas quinquenais de insumo-produto. O cálculo aqui usa os registros anuais do autor e a mesma ordem de operações.

As operações foram refeitas em precisão dupla em R. Conservar oito casas de apresentação evita atribuir significado econômico a diferenças numéricas entre softwares. Na manufatura, a referência é o composto das elasticidades dos grupos 31, 32 e 33, ponderado pelas participações PCE médias recuperadas. O composto foi calculado para este confronto.

Tabela 1. Parâmetros anteriores ao arredondamento para os 16 ramos do pareamento. Pesos em frações do gasto total.

| Ramo | Elasticidade | Peso PCE | Peso CEX |
|---|---:|---:|---:|
| Eletricidade gás água e saneamento | 0.70055895 | 0.03007873 | 0.05366618 |
| Manufatura | 0.73144968 | 0.20495807 | 0.26656334 |
| Comércio atacadista | 0.64718646 | 0.03646476 | 0.05301628 |
| Comércio varejista | 0.73546892 | 0.10797395 | 0.11407286 |
| Transportes | 1.39083545 | 0.02546724 | 0.02393570 |
| Armazenagem entregas e correios | 0.53399054 | 0.00086530 | 0.00048054 |
| Informação | 0.90162386 | 0.03382283 | 0.04553272 |
| Finanças e seguros | 1.65941824 | 0.05918770 | 0.05414541 |
| Locação e leasing de bens | 1.48598806 | 0.00771004 | 0.01000241 |
| Serviços profissionais científicos e técnicos | 1.34114584 | 0.01558036 | 0.01042816 |
| Serviços administrativos e gestão de resíduos | 1.57726240 | 0.00510407 | 0.00590686 |
| Educação | 1.42905433 | 0.02611571 | 0.02137512 |
| Saúde e assistência social | 1.34941858 | 0.17246623 | 0.03191166 |
| Artes entretenimento e recreação | 1.96454542 | 0.01112462 | 0.00726572 |
| Alojamento e alimentação | 1.67979924 | 0.06037173 | 0.06496253 |
| Outros serviços | 1.55966054 | 0.05119957 | 0.05914595 |

O depósito do periódico contém cerca de 729 MiB. A pasta `raw/hubmer_replica/` conserva os dois insumos agregados, o código Stata, o README do autor e a tabela LaTeX original. A restrição a três casas aparece no comando de formatação do arquivo Stata. A variável de quartis de gasto adicional apresenta pequenas diferenças entre o TeX distribuído e o PDF publicado em alguns ramos e está fora desta reconstrução. [Depósito oficial](https://www.econometricsociety.org/publications/econometrica/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/18580_Data_and_Programs.zip) e [Tabela B.I publicada](https://www.econometricsociety.org/publications/econometrica/browse/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/ecta200523-sup-0001-onlineappendix.pdf#page=11).

Na raiz do projeto, `sh data/crossing_servicos/extrair_replica_hubmer.sh` recupera os cinco arquivos do depósito, usando o diretório temporário para o arquivo grande. `env LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 Rscript --vanilla data/crossing_servicos/recuperar_precisao.R` produz esta nota e os CSVs para os 22 ramos originais e para os 16 ramos do pareamento. O pacote R necessário é `haven`. Fontes consultadas em 23 de novembro de 2026.
