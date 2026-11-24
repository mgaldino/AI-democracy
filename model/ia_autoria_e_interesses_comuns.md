---
title-meta: "Da fábrica ao jantar de autor"
lang: pt-BR
documentclass: article
papersize: a4
fontsize: 11pt
geometry: [left=2.55cm, right=2.55cm, top=2.35cm, bottom=2.3cm]
linestretch: 1.07
colorlinks: true
urlcolor: teal
header-includes: |
  \usepackage{fancyhdr}
  \setlength{\headheight}{15pt}
  \pagestyle{fancy}\fancyhf{}
  \fancyhead[L]{\small\sffamily Da fábrica ao jantar de autor}
  \fancyfoot[R]{\small\sffamily\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \setlength{\emergencystretch}{2em}
---

<!-- Reprodução a partir da raiz do projeto: pandoc model/ia_autoria_e_interesses_comuns.md --pdf-engine=pdflatex -o output/pdf/ia_autoria_e_interesses_comuns.pdf -->

\thispagestyle{plain}
\noindent{\small\sffamily Nota de pesquisa\hfill 23 de novembro de 2026}

# Da fábrica ao jantar de autor

Uma máquina prepara o prato à perfeição. O cliente ainda quer o chef que conhece seus gostos e lhe conta por que a avó usava aquele ingrediente. Ao comprar o jantar, compra também tempo **daquela pessoa**. O chef pode cobrar mais justamente porque seria difícil substituí-lo. Mas o cachê que ele negocia para si pouco informa a outro chef sobre quanto deve pedir. Na fábrica em que ambos recebiam pela mesma tabela, conquistar um reajuste para a função melhorava a remuneração de todos os que a exerciam. O que muda é até onde se estende uma vitória individual e como cada trabalhador descobre com quem tem interesses em comum.

Tomo de Alex Imas a hipótese de que a IA barateia a produção padronizada e de que, à medida que enriquecem, as pessoas dedicam uma parcela maior de seu orçamento a bens cuja procedência humana importa. **Quem enriquece primeiro?** No cenário examinado, os donos do capital de IA. A renda volta a alguns trabalhadores pelas encomendas que esses proprietários escolhem fazer. Comin, Lashkari e Mestieri estimam que efeitos de renda explicam mais de 73% da realocação setorial do emprego *prevista por seu modelo* dentro dos países. Essa estimativa histórica motiva o papel da demanda. A composição da clientela e a distribuição das encomendas entre pessoas exigem evidência própria. [Imas (2026)](https://aleximas.substack.com/p/what-will-be-scarce) e [Comin, Lashkari e Mestieri (2021), p. 314](https://doi.org/10.3982/ECTA16317).

## Cinco trabalhadores diante da mesma escolha

Suponha que os trabalhadores reivindiquem R\$ 100 das rendas da IA como dividendo, R\$ 20 para cada um dos cinco. Se o dinheiro ficar com os proprietários, R\$ 50 chegarão aos cinco como remuneração líquida de encomendas. Para isolar o mecanismo, suponha que os trabalhadores gastariam o dividendo em bens automatizados. Compare duas formas de repartir os mesmos R\$ 50.

* **Uma remuneração comum.** Cada trabalhador perderia R\$ 10 de encomendas e receberia R\$ 20 de dividendo. Os cinco ganhariam R\$ 10 cada.
* **Encomendas pelo nome.** Um chef muito procurado perderia R\$ 30 e os outros quatro, R\$ 5 cada. O chef perderia R\$ 10 líquidos com o dividendo. Cada colega ganharia R\$ 15. Os quatro passam a ter um interesse *mais forte* na mesma reivindicação.

Suponha agora que sustentar a pauta exija três compromissos e que participar custe R\$ 2. O chef e dois colegas conseguem deliberar entre si. Os outros dois só conversam um com o outro. Mantendo esses vínculos fixos, o primeiro grupo consegue se comprometer quando todos ganham R\$ 10. Sob as encomendas pelo nome, cada grupo tem só dois dispostos a participar. **Quatro de cinco ganhariam com o dividendo e a reivindicação perde sustentação.** Uma associação que reúna três dos quatro a restabelece, sem mudar clientes, cachês ou tecnologia. Os valores ilustram uma possibilidade.

O jantar reúne duas coisas que o exemplo da cantora permite separar. O chef tem uma história própria e conhece aquele cliente. Para querer ouvir Taylor Swift, o fã pode atribuir enorme valor à identidade da cantora sem que ela o conheça. Uma reputação que acompanha o profissional quando ele troca de cliente lhe dá alternativas. A intimidade construída com um único comprador é muito mais difícil de levar consigo.

\newpage

# A distribuição do prêmio de autoria

Seja $a$ a parcela da produção padronizada que a IA assume. No cenário de interesse, cresce a renda $\Pi(a)$ dos proprietários, e parte de seu gasto vira remuneração líquida $D(a)$ dos trabalhadores em serviços pessoais. Há $n$ trabalhadores sem capital, incluindo os que quase não recebem encomendas. O cenário de Imas pode elevar tanto $D$ quanto a fração $\lambda$ da remuneração paga pela escolha de uma pessoa específica. Para saber quem se beneficia, suponha que a parcela de cada trabalhador $i$ seja

$$
s_i(\lambda)=\frac{1-\lambda}{n}+\lambda z_i,\qquad
z_i\geq 0,\quad \sum_{i=1}^{n}z_i=1.
$$

A fração $1-\lambda$ remunera trabalho em condições comuns, com horas iguais neste exemplo. O peso $z_i$ é a participação de $i$ nas encomendas pelo nome e pode refletir gosto, reputação ou história compartilhada. Com $D$ fixo, quem tem $z_i>1/n$ recebe mais conforme $\lambda$ aumenta. Se as diferentes clientelas valorizarem igualmente seus profissionais, todos terão $z_i=1/n$ e a autoria, por si só, preservará a distribuição da renda.

**Quem quer o dividendo?** Uma reivindicação transferiria $T\leq\Pi(a)$ dos proprietários para os trabalhadores em parcelas iguais. A cada real adicional de renda dos proprietários, $m$ chega como remuneração líquida desses serviços, com $0<m<1$. Tome as parcelas marginais como constantes no intervalo da transferência. No exemplo, o gasto adicional dos trabalhadores recai sobre bens automatizados. A preços fixos, o ganho monetário de $i$ com a reforma é o dividendo que recebe menos a remuneração que perde nas encomendas. Assim,

$$
g_i(\lambda)=T\left[\frac{1-m}{n}-m\lambda\left(z_i-\frac1n\right)\right].
$$

**O resultado distributivo.** Todos concordam em $\lambda=0$. À medida que aumenta a parcela paga pelo nome, cresce a dispersão dos ganhos quando os $z_i$ diferem. Quem recebe mais do que a média das encomendas por nome passa a perder com o dividendo se $m s_i(\lambda)>1/n$. Os ganhos dos demais podem aumentar mesmo enquanto cresce a capacidade do chef de cobrar por sua presença. A soma dos ganhos dos trabalhadores permanece $T(1-m)$. No exemplo da página anterior, $m=0{,}5$, $z_{\rm chef}=0{,}6$ e $z_{\rm colega}=0{,}1$ para cada colega. O ganho do chef é $10-20\lambda$ e o de cada colega, $10+5\lambda$. Com custo de participação igual a 2, o chef já deixa de assinar em $\lambda=0{,}4$ se, indiferente, prefere se abster. O seu ganho material só se torna negativo acima de $\lambda=0{,}5$.

**E se os clientes forem os próprios trabalhadores?** Denote por $\alpha_i^K$ e $\alpha_i^W$ a renda líquida do trabalho que chega a $i$ por real adicional em mãos dos proprietários ou dos trabalhadores, respectivamente. O ganho passa a $T(1/n+\alpha_i^W-\alpha_i^K)$. Uma cantora cuja plateia compra ingressos com o próprio salário pode ver sua receita crescer com o dividendo. A mesma artista pode depender de um único comprador para um show privado. A identidade da artista é igualmente importante nas duas situações. A incidência é de primeira rodada, com preços dados e custos do serviço já deduzidos.

**O que se observa nos shows.** Nos dados de bilheteria dos Estados Unidos analisados por Krueger, 1% dos artistas concentrou 56% da receita em 2003. Para testar o limiar do modelo, ainda é preciso saber que parte dessa receita chega ao artista e como ela muda quando o poder de compra passa de uma classe para outra. [Krueger (2005)](https://doi.org/10.1086/425431).

\newpage

# Quando uma maioria consegue agir

Na fábrica idealizada, o contracheque e a tabela comum revelam o que uma mudança salarial significa para os colegas. Num jantar privado, o cachê revela quanto aquele cliente pagou àquele chef. Descobrir quem mais apoiaria uma pauta demanda outros vínculos. Na história, artesãos também os construíram. No Lancashire das décadas de 1820 e 1830, Calhoun documenta como pequenas oficinas e laços comunitários sustentaram mobilizações de trabalhadores de ofício. [Calhoun (1980), pp. 442–443](https://doi.org/10.1017/S0145553200019040).

Represente esses vínculos por uma rede. Num grupo conectado $C$, os trabalhadores conseguem comparar condições e fazer compromissos verificáveis entre si. Os grupos podem ser oficinas, associações ou circuitos de colegas que se falam mesmo quando trabalham sozinhos. Seja $c_i$ o custo de participar, incluindo o tempo e, quando pertinente, a exposição à perda de futuras encomendas por assumir uma posição pública. Uma organizadora favorável à proposta conhece os ganhos e custos de cada pessoa e dispõe de uma tentativa. Ela escolhe $k$ trabalhadores de um mesmo grupo, onde o compromisso conjunto é verificável. Se todos aceitarem, a ação se realiza e cada participante paga seu custo. Se alguém recusar, ninguém paga. Suponha que a campanha bem-sucedida obtenha a reforma, que os convidados decidam em sequência e que se abstenham quando indiferentes.

Cada convidado é decisivo quando os demais aceitam. Começando pelo último, o compromisso se sustenta se todos ganharem mais com a proposta do que gastam para apoiá-la. Como a organizadora escolhe quem convidar, a condição é

$$
\max_C\,\#\{i\in C:g_i(\lambda)>c_i\}\ \geq\ k .
$$

A expressão distingue **concordar**, **saber com quem se pode contar** e **poder se expor**. Um patrão que escolhe a quem encomendar cada jantar tem mais poder sobre um chef que perderia quase toda a renda ao desagradar-lhe. Um chef que leva a clientela consigo pode recusar as condições desse patrão. Esta é a conexão com Gorz. Seu argumento sobre o retorno dos serviçais parte da desigualdade que permite a alguns comprar o tempo de outros. No jantar de autor, o comprador também quer uma contribuição que só o chef pode fazer. As duas características coexistem e variam separadamente. [Gorz (1990)](https://www.monde-diplomatique.fr/1990/06/GORZ/42679).

**A pauta também importa.** Artistas com públicos e cachês muito diferentes podem querer a mesma regra para o uso da própria voz. A SAG-AFTRA negociou em 2024 a obrigação de as gravadoras signatárias obterem consentimento da artista para lançar fonogramas cobertos que usem uma réplica digital identificável de sua voz. É uma regra conquistada em conjunto para proteger algo que cada pessoa tem de singular. [Apêndice do acordo, §§ 1–3](https://www.sagaftra.org/sites/default/files/Sound%20Recordings%20Code%20Appendix%20on%20Artificial%20Intelligence.pdf).

**A implicação democrática.** Se uma maioria precisa se organizar para que um governo negocie com ela, as encomendas privadas podem tornar mais fácil ignorar trabalhadores que ganhariam com a mesma política. No exemplo, o chef muda de posição e a maioria continua favorável ao dividendo, mas perde a capacidade de levá-lo à pauta. Um voto secreto sobre uma proposta já em pauta poderia produzir outro resultado. Também importa quanto custa ignorá-los. Uma paralisação dos chefs pode privar os proprietários do jantar e deixar intacta a receita de suas fábricas automatizadas. Para testar o mecanismo, seria preciso observar, dentro do mesmo ofício, quem paga a quem, quanto custa recusar um cliente e quais colegas conseguem sustentar uma pauta juntos. A frequência dessa inversão e seu efeito sobre a sobrevivência de regimes seguem em aberto.
