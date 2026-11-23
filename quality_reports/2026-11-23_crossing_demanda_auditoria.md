# Parecer independente sobre demanda setorial e sobrevivência democrática

**23 de novembro de 2026**

O esboço sustenta duas proposições distintas. Uma mudança na elasticidade-renda setorial pode inverter o sinal do efeito marginal da IA sobre a capacidade de oposição. Num conjunto aberto de parâmetros, pode também alterar a decisão do incumbente sobre preservar eleições competitivas depois de um choque finito. No exemplo, as duas economias preservam a democracia na situação inicial. Depois do mesmo choque, a restrição prospera sob demanda homotética e é dissuadida sob demanda não homotética. As desigualdades abaixo demonstram o resultado sem recorrer a um solucionador numérico.

O parecer verifica a especificação e os parâmetros apresentados ao revisor. O conceito de solução é equilíbrio perfeito em subjogos, com informação e observação completas no caso principal. A conferência é analítica. As checagens de código e o cálculo numérico têm registros próprios.

## 1. Economia e objeto da comparação

O salário, o dispêndio nominal e o preço de serviços são unitários. O preço do bem automatizável é $1-a$, com $0\leq a<1$. A produção linear competitiva nos dois setores implica que a fração $s$ do gasto em serviços coincide com sua participação no emprego. Em particular, $L_A+L_S=1$ em ambos os cenários. Essa igualdade depende do uso do trabalho como único insumo remunerado e dos lucros nulos.

Aplicando o lema de Shephard à função de dispêndio proposta, obtêm-se $s=s_0 C^{r\eta}$ e $1-s=(1-s_0)(1-a)^r C^r$, com $r=1-\sigma\in(0,1)$. Isso reproduz o caso com dois setores das equações 2 e 3 de Comin, Lashkari e Mestieri. A equação 9 distingue o expoente $\eta$ da elasticidade-renda efetiva do serviço. Na origem, essa elasticidade é $\sigma+r\eta/(1-s_0+\eta s_0)$. Com os parâmetros da ilustração, $\eta=6$ corresponde a uma elasticidade-renda de $5/3$. [Comin, Lashkari e Mestieri, 2021, pp. 317–319](https://doi.org/10.3982/ECTA16317)

Eliminando $C$, a demanda é a única raiz em $[s_0,1)$ de

$$
F(s)=s+(1-s_0)(1-a)^r(s/s_0)^{1/\eta}-1=0.
$$

Para $a>0$, $F(s_0)<0<F(1)$ e $F$ é estritamente crescente em $s$. Na raiz interior, a derivada de $F$ em relação a $\eta$ é $-(1-s)\log(s/s_0)/\eta^2<0$. Logo, com $\eta>1$, os serviços absorvem mais emprego do que no contrafactual de $\eta=1$. Ambos usam a mesma cesta inicial, os mesmos preços e o mesmo orçamento em cada valor de $a$. O poder de compra de qualquer cesta de referência é comum às duas economias. O índice de consumo $C$ depende das preferências, de modo que ganhos percentuais de utilidade idênticos exigiriam outra restrição.

No exercício hicksiano, manter $C=1$ aos novos preços exige o mesmo orçamento $E_c$ nas duas especificações e dá a parcela de serviços $s_0/E_c^r=s_H(a)$. Restituir o orçamento efetivo isola exatamente a diferença de composição $s_N-s_H$ atribuível ao efeito-renda.

## 2. Jogo político e credibilidade

Se a proposta já foi apresentada, o custo $f$ está incorrido. O incumbente restringe a competição quando $G>Z$ e retira a proposta quando $Z\geq G$, dada a prioridade explícita ao status quo no empate. Pela desigualdade de Cauchy–Schwarz ponderada, o esforço de setores com $L_j>0$, $d_j,c_j>0$ satisfaz

$$
 Z^2=\left(\sum_j L_j d_j e_j\right)^2
 \leq \left(\sum_j L_j d_j^2/c_j\right)
       \left(\sum_j L_j c_j e_j^2\right)=2MK.
$$

A menor despesa para obter a retirada é $G^2/(2M)$, atingida por $e_j^*=Gd_j/(Mc_j)$. Toda oposição intermediária que deixe $0<Z<G$ custa recursos e produz o mesmo regime que esforço zero. A federação escolhe dissuadir quando $V>G^2/(2M)$ e escolhe esforço zero quando a desigualdade se inverte. Diante de dissuasão crível, a proposta rende $-f<0$ e o incumbente preserva a competição sem despesa de mobilização no caminho de equilíbrio. Diante de esforço zero, a proposta rende $G-f>0$ e a restrição é implementada.

A solução requer distinguir dois empates. A retirada em $Z=G$ garante que o custo mínimo de dissuasão seja atingido com esforços contínuos. Se o incumbente sempre implementar nesse ponto, seria preciso ultrapassar $G$ e, com vantagem estrita em dissuadir, a federação poderia continuamente reduzir o esforço escolhido. Já em $M=G^2/(2V)$, a federação é indiferente entre duas respostas. Há equilíbrios puros com resultados institucionais distintos sem outra convenção. Todos os casos decisivos do exemplo têm desigualdades estritas nesse segundo ponto.

## 3. Inversão do sinal e cruzamento do limiar

Denotando $b_A=(1-\rho a)^2$ e $b_S=d_S^2/c_S$, a capacidade política é $M_\eta=(1-s_\eta)b_A+s_\eta b_S$. A diferenciação implícita fornece

$$
 \frac{ds_\eta}{da}=\frac{r\eta s_\eta(1-s_\eta)}
 {(1-a)(1-s_\eta+\eta s_\eta)},\qquad
 M'_\eta(0)=(b_S-1)\frac{r\eta s_0(1-s_0)}{1-s_0+\eta s_0}
             -2\rho(1-s_0).
$$

Com $s_0=1/4$, $r=2/5$, $\rho=1/2$ e $b_S=6$, essa derivada vale $-3/8$ em $\eta=1$, é zero em $\eta=3$ e vale $1/4$ em $\eta=6$. Mais geralmente, se $b_S>1$, a capacidade cai na origem para a demanda homotética e pode crescer para um $\eta$ suficientemente alto se, e somente se,

$$
 (b_S-1)r s_0 < 2\rho < (b_S-1)r.
$$

Para o choque finito é preciso verificar as decisões. Denotem $H$ a especificação homotética, $N$ a não homotética e $\tau=G^2/(2V)$. Um estado inicial que preserva a democracia e dois resultados finais diferentes, na direção proposta, exigem $M_H(a)<\tau<\min\{M(0),M_N(a)\}$, fora dos empates.

Um certificado analítico curto resolve o exemplo com $a=0{,}36$, $G=2$ e $V=0{,}90$.

1. Escreva $k=0{,}64^{2/5}$. Elevando à quinta potência obtém-se $0{,}83<k<0{,}84$. Assim, $s_H=1/(1+3k)<100/349<0{,}29$.
2. Para $\eta=6$, vale $1{,}28^{1/6}<1{,}05$. Logo $F(0{,}32)<0{,}32+0{,}63\times1{,}05-1<0$, o que implica $s_N>0{,}32$.
3. Nesse choque, $M=0{,}6724+5{,}3276s$ e $\tau=20/9$. A participação crítica $s_c=(\tau-0{,}6724)/5{,}3276$ fica estritamente entre $0{,}29$ e $0{,}30$. Além disso, $M(0)=2{,}25>\tau$ e $M_N(0{,}36)>0{,}6724+5{,}3276\times0{,}32>2{,}25$.

Esse certificado garante tanto direções opostas nas mudanças finitas de $M$ quanto a diferença de regime. A continuidade em $a$, preferências e parâmetros políticos assegura uma vizinhança de valores com o mesmo resultado. Em $a>0$, a diferença entre os cenários é exatamente $(s_N-s_H)(b_S-b_A)$. Com $b_S=6$ as curvas de capacidade se separam na origem e a curva não homotética permanece acima da homotética. O objeto que se cruza no exemplo é o limiar institucional. Para $a\to1$, ambos os valores de $s$ convergem a um e ambas as capacidades convergem a seis. Portanto o ramo homotético ultrapassa novamente o limiar em algum choque maior do que $0{,}36$. Essas comparações partem sempre de uma democracia existente. Uma redemocratização ao longo do tempo precisaria ser modelada.

Na expressão do fonte para $M'_\eta/(1-s)$, os fatores positivos $\eta s/(1-s+\eta s)$ e $(b_S-b_A)/(1-a)$ aumentam com $a$, e a perda direta $2\rho(1-\rho a)$ diminui. Como o primeiro termo do quociente diverge para cima perto de $a=1$, o ramo homotético tem um único mínimo e o não homotético cresce em todo o domínio do exemplo. Portanto as duas raízes computadas em $0{,}083435$ e $0{,}496715$ delimitam a única faixa aberta de escolhas institucionais divergentes.

## 4. Robustez e alcance

**Ordem das decisões.** Quando o esforço precede a proposta e seu custo já foi pago, o incumbente que observa $Z$ obtém ganho líquido $G-f-Z$ ao restringir. Se também prefere preservar no empate da decisão inicial, a federação pode dissuadir com $Z=G-f$, a custo $(G-f)^2/(2M)$. O limiar cai para $\tau_{\rm pre}=(G-f)^2/(2V)$. Em $f=0{,}10$, ele é $3{,}61/1{,}8$ e fica abaixo das três capacidades, inclusive a do cenário homotético após o choque. A ordem alternativa elimina a divergência institucional nesse exemplo. A divergência reaparece na ordem alternativa quando $0<f<G-\sqrt{2VM_H(0{,}36)}$. Por exemplo, com $f=0{,}01$ o limiar é $3{,}9601/1{,}8>2{,}20$, ao passo que $M_H<0{,}6724+5{,}3276(100/349)<2{,}20$. Esse mesmo $f$ também preserva a divergência na ordem original. A mudança de timing afeta o intervalo de parâmetros e pode alterar a previsão de regime.

**Valor privado da competição para a federação.** Se a federação conhece seu $V$ e o incumbente apenas sua distribuição, a decisão da federação após a proposta continua obedecendo ao valor crítico $G^2/(2M)$. Com distribuição sem átomo no ponto de corte, o ganho esperado de propor é $G\Pr(V<G^2/(2M))-f$. Suportes suficientemente estreitos em torno do valor do exemplo preservam as decisões nos três cenários porque todas as margens originais são estritas. Com suporte mais amplo, o equilíbrio pode dar probabilidade positiva aos dois resultados após a apresentação da proposta.

**Custo convexo geral.** Para $K=\sum_j L_jc_j e_j^p/p$ com $p>1$, o custo mínimo para obter $Z=G$ é $G^p/(pM_p^{p-1})$, onde $M_p=\sum_j L_jd_j^{p/(p-1)}c_j^{-1/(p-1)}$. Segue da condição de primeira ordem ou da desigualdade de Hölder, com igualdade em $e_j=(G/M_p)(d_j/c_j)^{1/(p-1)}$. Fixando $d_j$ e $c_j$ separadamente, o exemplo estrito resiste a uma faixa aberta de expoentes em torno de dois. A continuidade não estabelece invariância para qualquer custo convexo.

**Mecanismo político.** A maior capacidade organizacional de serviços é uma hipótese sobre setores concretos. Se no ponto considerado $b_S=b_A$, a composição do emprego perde todo efeito sobre o contraste entre as economias. A perda direta de eficácia no setor automatizável, representada por $\rho$, também é uma hipótese econômica e política adicional à preferência de consumo. Com $\rho=0$ e $b_S>1$, as duas capacidades crescem com o choque e a inversão de sinais desaparece. Assume-se ainda que a federação já existe, internaliza os custos dos seus membros e valoriza a competição eleitoral. O arranjo institucional estudado identifica condições para a defesa de eleições competitivas por uma organização existente.

## 5. Veredicto

O equilíbrio, o sinal local e o exemplo finito passam na verificação analítica com as regras de desempate e o domínio declarados. O contraste de regime depende da proximidade ao limiar e pode desaparecer sob outra ordem de decisões. As conclusões empíricas dependeriam de medir os setores que absorvem emprego, a capacidade de organização, a intensidade da perda direta de eficácia e os incentivos políticos. Os parâmetros ilustrativos demonstram possibilidade teórica.

Uma eventual formalização em Lean pode começar pela desigualdade de custo mínimo, pelas escolhas sequenciais e pela separação estrita dos valores do exemplo. A unicidade da demanda e a estática comparativa exigiriam também propriedades das potências reais e diferenciação. Este parecer fornece uma prova analítica e não inclui uma compilação Lean.
