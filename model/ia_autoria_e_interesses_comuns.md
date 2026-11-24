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

Uma máquina prepara o prato à perfeição. O cliente ainda quer o chef que conhece seus gostos e lhe conta por que a avó usava aquele ingrediente. Ele contrata o chef diretamente para um jantar em casa e compra tempo **daquela pessoa**. Na fábrica, dois operários podiam fazer o mesmo trabalho, observar um ao outro e se beneficiar do mesmo reajuste. No jantar, o chef pode cobrar mais por ser difícil de substituir. O outro chef, trabalhando para outra família, pode sequer ficar sabendo do acordo. A relação pessoal que produz o valor do serviço liga o trabalhador ao comprador. É preciso explicar em que circunstâncias surgiria também uma relação entre os trabalhadores.

Tomo de Alex Imas a hipótese de que a IA barateia a produção padronizada e de que, à medida que enriquecem, as pessoas dedicam uma parcela maior de seu orçamento a bens cuja procedência humana importa. **Quem enriquece primeiro?** No cenário examinado, os donos do capital de IA. A renda volta a alguns trabalhadores pelas encomendas que esses proprietários escolhem fazer. Comin, Lashkari e Mestieri estimam que efeitos de renda explicam mais de 73% da realocação setorial do emprego *prevista por seu modelo* dentro dos países. Essa estimativa histórica motiva o papel da demanda. A composição da clientela e a distribuição das encomendas entre pessoas exigem evidência própria. [Imas (2026)](https://aleximas.substack.com/p/what-will-be-scarce) e [Comin, Lashkari e Mestieri (2021), p. 314](https://doi.org/10.3982/ECTA16317).

## Cinco trabalhadores diante da mesma escolha

Suponha que os trabalhadores reivindiquem R\$ 100 das rendas da IA como dividendo, R\$ 20 para cada um dos cinco. Se o dinheiro ficar com os proprietários, R\$ 50 chegarão aos cinco como remuneração líquida de encomendas. Para isolar o mecanismo, suponha que os trabalhadores gastariam o dividendo em bens automatizados. Compare duas formas de repartir os mesmos R\$ 50.

* **Uma remuneração comum.** Cada trabalhador perderia R\$ 10 de encomendas e receberia R\$ 20 de dividendo. Os cinco ganhariam R\$ 10 cada.
* **Encomendas pelo nome.** Um chef muito procurado perderia R\$ 30 e os outros quatro, R\$ 5 cada. O chef perderia R\$ 10 líquidos com o dividendo. Cada colega ganharia R\$ 15. Os quatro passam a ter um interesse *mais forte* na mesma reivindicação.

Suponha agora que sustentar a pauta exija três compromissos e que participar custe R\$ 2. O chef e dois colegas conseguem deliberar entre si. Os outros dois só conversam um com o outro. Mantendo esses vínculos fixos, o primeiro grupo consegue se comprometer quando todos ganham R\$ 10. Sob as encomendas pelo nome, cada grupo tem só dois dispostos a participar. **Quatro de cinco ganhariam com o dividendo e a reivindicação perde sustentação.** Para que ela volte à pauta, pelo menos três dos quatro precisam ter como agir juntos. A página 3 examina como as próprias condições do trabalho por encomenda poderiam dar origem a esse vínculo. Os valores são ilustrativos.

O jantar reúne duas coisas que a hipótese de uma apresentação privada permite separar. O anfitrião pode querer contratar Taylor Swift para cantar em sua casa sem que ela o conheça pessoalmente. A identidade da artista já faz parte do que ele quer comprar. No caso do chef, soma-se a isso o conhecimento acumulado sobre o próprio cliente. Uma reputação que acompanha o profissional lhe dá alternativas. A intimidade construída com um único comprador é mais difícil de levar consigo.

\newpage

# A distribuição do prêmio de autoria

Seja $a$ a parcela da produção padronizada que a IA assume. No cenário de interesse, cresce a renda $\Pi(a)$ dos proprietários, e parte de seu gasto vira remuneração líquida $D(a)$ dos trabalhadores em serviços pessoais. Há $n$ trabalhadores sem participação no capital de IA, incluindo os que quase não recebem encomendas. O cenário de Imas pode elevar tanto $D$ quanto a fração $\lambda$ da remuneração paga pela escolha de uma pessoa específica. Para saber quem se beneficia, suponha que a parcela de cada trabalhador $i$ seja

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

**E se os clientes forem os próprios trabalhadores?** Denote por $\alpha_i^K$ e $\alpha_i^W$ a renda líquida do trabalho que chega a $i$ por real adicional em mãos dos proprietários ou dos trabalhadores. O ganho passa a $T(1/n+\alpha_i^W-\alpha_i^K)$. Um chef pode perder jantares encomendados por um dono de capital e ganhar encomendas de famílias que vivem de salário. Em ambos os casos ele cozinha pessoalmente para quem o contratou. A incidência é de primeira rodada, com preços dados e custos do serviço já deduzidos.

**Uma encomenda documentada.** Em 1503, Isabella d'Este encomendou a Perugino um quadro e especificou até como Palas seguraria o véu de Cupido. Por carta, lembrou que contratara uma obra que o pintor faria *di sua mano*. A documentação registra, na mesma encomenda, a importância da autoria para a cliente e a autoridade que ela conservava sobre o trabalho. [Contrato de 19 de janeiro](https://irds-project.org/doc/1562/) e [carta de 3 de abril de 1503](https://www.irds-project.org/doc/125/).

\newpage

# Como se formariam vínculos entre artesãos

Dois chefs podem passar anos cozinhando para famílias vizinhas sem ter motivo para se encontrar. Há, contudo, um risco que nasce da própria encomenda pessoal. Quando um chef adoece, outro pode até cozinhar o mesmo prato, mas o cliente que queria aquele encontro pode cancelá-lo. **Cada um teria algo a ganhar em ajudar o outro nos períodos sem renda**, mesmo que ambos continuem a negociar separadamente e a cobrar preços distintos.

Considere $h\geq 2$ profissionais que teriam como se conhecer. Antes de surgir a pauta do dividendo, podem criar uma caixa de ajuda mútua. Cada um conserva a renda média que teria sob cada política. A caixa reparte apenas oscilações transitórias e verificáveis em torno dessa média. Suponha que o dividendo preserve os riscos e o custo da caixa. Os choques têm variância $\sigma^2$ e correlação $\rho$ entre pares. Com a partilha em partes iguais, a variância individual cai para $\sigma^2[\rho+(1-\rho)/h]$. Para quem avalia a renda pela média menos $\gamma/2$ vezes a variância, com $\gamma>0$, o ganho precisa superar o custo $f_i$ de encontrar colegas e manter um acordo exigível. Todos têm interesse em criá-lo quando, para cada $i$,

$$
\frac{\gamma\sigma^2}{2}(1-\rho)(1-1/h)> f_i .
$$

Quem vive de atender um patrono pode ter muito a perder ao deixar de estar disponível para ele. Isso eleva $f_i$. Quem já conhece colegas e corre sobretudo riscos individuais ganha mais com a caixa, a custos menores. Se todas as famílias cortam encomendas ao mesmo tempo, há pouco risco a dividir. O socorro entre artesãos tem precedente. As contas da confraria dos alfaiates de Londres no século XV registram contribuições regulares e ajuda a membros em dificuldade. Elas documentam a prática. A origem de cada vínculo e a adesão política de seus membros são questões distintas. [Davies (1994), cap. 2](https://ora.ox.ac.uk/objects/uuid%3A577c6a65-92cb-4f30-b4fd-e123096dbf43/files/mf891ac4049c14a2cf6d82e0b946b1671).

**Do auxílio à ação política.** Se administrar a caixa permite conhecer as condições e a disposição dos colegas, seus membros podem fazer compromissos entre si. Para cada grupo conectado $C$, conte quantos ganham com o dividendo mais do que o custo $c_i$ de apoiá-lo publicamente. Esse custo inclui a perda esperada de futuras encomendas de um patrono contrariado. Suponha uma campanha que exige exatamente $k$ adesões verificáveis do mesmo grupo e obtém o dividendo se todos os convidados aceitarem. Uma organizadora favorável pode escolher os convidados, conhece seus ganhos e custos e dispõe de uma tentativa. Se ela falhar, ninguém paga. Com decisões sequenciais e abstenção na indiferença, uma campanha é viável quando

$$
\max_C\,\#\{i\in C:g_i(\lambda)>c_i\}\ \geq\ k .
$$

Cada convidado é decisivo se os demais aceitarem. A caixa pode aproximar pessoas que depois discordem sobre o dividendo ou usem sua organização para reservar encomendas aos membros do ofício. O componente serviçal descrito por Gorz aparece quando poucos compradores dispõem da renda para comprar o tempo dos demais e estes têm pouca margem para recusar. Para a democracia, importa se os trabalhadores conseguem se organizar **inclusive para contrariar quem os contrata**. Uma maioria favorável à partilha da renda da IA pode não conseguir levá-la à pauta. Para estimar com que frequência isso ocorreria, seria preciso observar de quem vêm as encomendas, quanto custa recusá-las e quais vínculos os prestadores constroem fora da clientela. [Gorz (1990)](https://www.monde-diplomatique.fr/1990/06/GORZ/42679).
