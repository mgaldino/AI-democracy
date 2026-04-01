# Parecer de Design do Modelo (Dixit / Varian / Board)

## Score: 8.5/10

## O modelo em uma frase

Sob threshold automation, um empreendedor politico escolhe endogenamente entre compensacao (`C`) e populismo (`R`); a heterogeneidade de `E`, criada pela fase de complementaridade, torna `R` eleitoralmente viavel porque `C` e uniforme mas tipo-dependente, enquanto `R` e pooling, e a propria campanha populista amplia essa fragmentacao.

## Tipo de contribuicao (Board & Meyer-ter-Vehn)

**Forca politica isolada + nova lente para a extensao democratica.** O modelo agora nao apenas diz que "populismo pode aparecer": ele mostra por que um empreendedor racional troca de plataforma quando a heterogeneidade de `E` torna a compensacao politicamente incompleta. Isso e mais que um apendice defensivo; e uma nova proposicao substantiva sobre como trajetorias economicas moldam a rentabilidade politica de clivagens alternativas.

## Avaliacao por dimensao

### MD1. Qualidade da pergunta [Excelente]

A pergunta continua forte e ficou mais precisa: nao e mais "por que threshold pode gerar populismo?", mas "quando um empreendedor racional prefere oferecer populismo em vez de compensacao?". Isso ataca diretamente a fragilidade do design anterior, em que papeis estavam pre-atribuidos. O puzzle e real, compreensivel e importante para a contribuicao central do paper.

### MD2. Simplicidade e KISS [Adequado]

Houve melhora clara. O design foi reduzido a um unico empreendedor, dois programas (`C` e `R`), um custo fixo de entrada populista (`f`) e uma funcao de amplificacao (`psi(sigma_E)`). Isso e bem mais parcimonioso do que a versao com `M-party` e `P-party` como atores separados. O modelo passa no teste Schelling-Spence: se removermos a heterogeneidade de `E`, `R` deixa de ser viavel; se removermos a amplificacao de campanha, a multiplicidade desaparece.

O ponto que ainda impede nota maxima e que `psi(sigma_E)` continua reduced-form. Isso e aceitavel no sketch numerico, mas a versao final deve dizer explicitamente que `psi` representa saliencia/fragmentacao de clivagem ativada pela campanha, nao preferencia material adicional.

### MD3. Isolamento do mecanismo [Excelente]

O mecanismo agora esta muito mais limpo. A propriedade formal central esta isolada com precisao:

- `C` preserva heterogeneidade de tipos porque `u_i(C)` depende de `x_i`
- `R` colapsa tipos porque `u_i(R)` e igual para todos

Essa assimetria ja estava embutida nos payoffs do modelo base; o novo design a transforma em mecanismo politico. A multiplicidade tambem esta melhor fundada: ela nao vem de "dois partidos por construcao", mas de uma desigualdade entre `Pi_R^0`, `Pi_C` e `Pi_R^1`.

O unico ponto em aberto e o locus institucional da competicao. O sketch funciona como jogo de escolha de plataforma, mas a versao final deve explicitar se esta etapa representa competicao dentro do bloco exposto, agenda-setting oposicionista ou eleicao geral com probabilidade de vitoria. Sem essa frase, um leitor atento ainda pode perguntar onde entra a maioria `N`.

### MD4. Riqueza de insights [Rica]

O ganho de insight e substantivo:

1. O modelo agora gera um limiar de heterogeneidade (`sigma_bar`) em vez de depender do artefato "qualquer heterogeneidade basta".
2. `phi_0` ganha uma interpretacao mais rica: welfare state nao apenas compensa perdas, ele desativa a rentabilidade politica do populismo.
3. A extensao sugere uma predicao empirica clara: setores em que a fase de complementaridade gera maior dispersao interna devem ser mais vulneraveis a plataformas populistas.

Esses sao insights transferiveis para globalizacao, digitalizacao e outras tecnologias sequenciais.

### MD5. Tipo de contribuicao [Forte]

O modelo isola uma **forca politica nova**: a rentabilidade eleitoral de uma plataforma depende da forma como a trajetoria economica reestrutura a distribuicao intra-grupo de perdas e ganhos. Isso tambem gera uma **predicao empirica nova**: heterogeneidade criada por complementaridade anterior aumenta a chance de equilibrio populista. Convince como candidata a `P9`.

### MD6. Processo de construcao [Maduro]

O processo esta no espirito de Varian. Primeiro veio o sketch numerico; depois, a generalizacao. O modelo novo corrige diretamente o defeito apontado pelo parecer anterior e produz uma condicao fechada (`sigma_bar = 2f / (B rho)`) no exemplo uniforme. Isso e sinal de iteracao real, nao de "compressed noodling".

## Veredicto geral sobre design

O design agora esta suficientemente forte para sustentar uma nova proposicao formal. O principal avanco e que a escolha entre compensacao e populismo se torna endogena, apoiada em uma diferenca formal real entre os programas, e nao em papeis atribuidos ex ante. O melhor resultado do redesign e o limiar `sigma_bar`, que transforma a extensao em estatica comparativa genuina.

O principal ponto fraco remanescente e que a amplificacao de campanha (`psi(sigma_E)`) ainda e reduzida a uma forma funcional. Isso nao invalida o sketch; apenas significa que a versao final deve ser cuidadosa ao apresentar `psi` como termo de saliencia ou fragmentacao politica, nao como choque material adicional. Tambem vale explicitar melhor onde essa escolha de plataforma ocorre institucionalmente, para evitar a objecao sobre a maioria `N`.

## Sugestoes construtivas

1. Na versao final, defina explicitamente o locus institucional da escolha de plataforma: competicao dentro do bloco exposto, selecao de agenda oposicionista ou eleicao com probabilidade de vitoria.
2. Introduza a extensao estocastica ja sugerida no sketch: `Pr(win_R) = G(s_R^1 - s_C)`. Isso reduz a artificialidade do "entrou, ganhou" e melhora a plausibilidade.
3. Diga em uma frase o que `psi(sigma_E)` representa substantivamente: saliencia da clivagem anti-elite, simplificacao discursiva ou capacidade de pooling de demandas heterogeneas.
4. Se quiser elevar o design para 9+, acrescente uma frase ligando `psi` diretamente ao principio de saliencia de Bonomi, Gennaioli e Tabellini (2021): a campanha nao muda preferencias materiais, apenas reorganiza qual clivagem domina a disputa politica.
