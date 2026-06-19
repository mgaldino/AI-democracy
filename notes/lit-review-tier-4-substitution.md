# Tier 4 — Contraste Tipo A: substituição direta em economia do trabalho

**Data**: 2026-05-03
**Skill**: lit-review (manual)
**Propósito**: Construir a base econômica para o reframing IA-dem (`quality_reports/2026-05-03_interview-reframing.md`). A contribuição central depende de mostrar que automação clássica (robôs, China shock) é Tipo A — substituição direta, choque concorrente desde t=0 — e portanto distinta da estrutura sequencial O-Ring (Tipo B) que IA pode gerar via Gans-Goldfarb (2026).

**Tese a defender**: A literatura de economia do trabalho documenta automação clássica como choque concorrente; ela não distingue formalmente Tipo A vs Tipo B na dimensão *temporal* relevante para coalizões políticas. Essa é uma janela legítima para a contribuição de IA-dem.

---

## 1. Acemoglu & Restrepo (2020), *JPE* — Robots and Jobs

### Framework
Modelo task-based estendido (Acemoglu-Restrepo 2018, AER): produção é alocação de tarefas entre capital e trabalho. Robô industrial automatiza um subconjunto de tarefas físicas previamente alocadas a trabalhadores. Dois efeitos contrapostos:
- **Displacement effect**: trabalhadores expulsos das tarefas automatizadas
- **Productivity effect**: queda de custos pode expandir output e demanda agregada por trabalho em tarefas remanescentes

Empiricamente, exposição a robôs por commuting zone derivada da estrutura industrial pré-1990 × adoção de robôs por indústria (instrumentada via adoção em outras economias avançadas — Alemanha, França, Itália).

### Achado empírico
Um robô adicional por mil trabalhadores reduz a razão emprego-população em 0.2 pp e salários em 0.42%. A chegada de um robô adicional num mercado local coincide com queda de 5.6 trabalhadores empregados. Robôs explicam parcela substantiva da queda relativa de emprego manufatureiro nas zonas mais expostas. **Productivity effect existe mas é dominado pelo displacement effect** no caso dos robôs industriais.

### Estrutura temporal do choque
- **Concorrente desde t=0**: a partir do momento em que robôs entram na linha de montagem, trabalhadores nas tarefas automatizadas perdem emprego
- **Gradual em ritmo, mas não em estrutura**: o ritmo é determinado pela velocidade de difusão do capital físico (custo, instalação, treinamento), mas a *identidade* dos perdedores é pré-determinada pela estrutura ocupacional. Trabalhadores em ocupações de assembly, welding, materials handling sabem desde t=0 que estão expostos
- **Sem fase de complementaridade prévia**: o paper não documenta nenhum período em que a chegada do robô tenha tornado os trabalhadores afetados *mais* prósperos (em equilíbrio de mercado de trabalho local) antes de deslocá-los. Pelo contrário, A&R 2018 (AER, "Race between Man and Machine") modelam explicitamente displacement e reinstatement como contemporâneos, com displacement dominando para robôs

### Argumento: por que Tipo A
1. **Substituição direta de tarefas**: robô executa a tarefa que o trabalhador executava (welding, painting, assembly). Não há cadeia O-Ring em que o trabalhador continue como bottleneck até alguma qualidade-limiar ser alcançada
2. **Perdedores identificáveis ex ante**: a coalizão de perdedores existe desde t=0 — por ocupação, por região (Detroit, Rust Belt), por nível de qualificação
3. **Sem prosperity trap**: não há fase em que a maioria do eleitorado afetado prospere com a chegada do robô. O efeito sobre wages locais é negativo desde a primeira derivada
4. **Mapeamento direto para Tipologia IA-dem**: este é o caso canônico de Tipo A. Coalizão pró-compensação pode existir (e existiu, em forma defeituosa, via TAA — Trade Adjustment Assistance — e demandas por proteção tarifária)

---

## 2. Acemoglu & Restrepo (2018), *AER* — Race between Man and Machine

### Framework
Modelo dinâmico endógeno: tasks ∈ [0,1], capital automatiza tarefas em [N-1, I], labor faz tarefas em [I, N]. Inovação tem duas direções:
- **Automation innovations**: estendem I (capital invade tarefas antes labor-only)
- **New task innovations**: estendem N (criação de novas tarefas em que labor tem comparative advantage)

Long-run growth path estável requer balanço entre as duas. Senão, automação domina e labor share colapsa.

### Achado central
Resultado teórico, não empírico no sentido de A&R 2020. Mas estabelece que:
- Displacement effect e reinstatement effect operam em direções opostas e o equilíbrio depende de qual inovação prevalece
- Sob automação isolada (sem reinstatement), wages caem e labor share cai mesmo com produtividade alta
- Mecanismo de mercado pode self-correct via efeito de escassez (labor mais barato → menos automação na margem) — mas só em horizontes muito longos

### Estrutura temporal do choque
- **Concorrente em cada onda**: cada onda de automation innovation desloca um conjunto de tarefas e os trabalhadores nelas — desde o momento em que a tarefa é automatizada
- **Sequencialidade entre ondas, não dentro**: pode haver onda 1 (manufactura, anos 1980-2000), onda 2 (serviços rotineiros, anos 2000-2020) — mas dentro de cada onda, perdedores existem desde t=0
- **Não há mecanismo O-Ring** em que tarefas remanescentes recebam premium temporário de complementaridade que torne *trabalhadores afetados* prósperos. Reinstatement cria *novas* tarefas (e novos vencedores), não enriquece os deslocados durante uma fase de transição

### Argumento: por que Tipo A
1. O modelo é construído sobre **substituibilidade entre capital e trabalho na mesma tarefa**, não sobre cadeia complementar. A função de produção é Y = ∫ y(i) di com tarefas separáveis (não Y = ∏ y(i) como no O-Ring)
2. Reinstatement pode criar Tipo A invertido (novas tarefas → novos vencedores), mas não Tipo B (mesmos trabalhadores prósperos antes de deslocados)
3. Adicionalmente: o framework Acemoglu-Restrepo é o **benchmark contra o qual O-Ring Automation (Gans-Goldfarb 2026) se diferencia**. Gans-Goldfarb explicitamente argumentam que o framework task-by-task substitutability falha quando tarefas são quality-complements

---

## 3. Autor, Dorn & Hanson (2013), *AER* — China Syndrome

### Framework
Não é paper de automação stricto sensu — é choque comercial — mas serve como benchmark do **mesmo tipo de choque na dimensão política**: substituição direta de produção doméstica por importações chinesas. Empírico: variação cross-CZ na exposição a importações chinesas, instrumentada por importações chinesas em outras economias avançadas.

### Achado empírico
Aumento de importações chinesas entre 1990-2007 causa:
- Queda de emprego manufatureiro nas CZs expostas
- Queda de participação na força de trabalho
- Queda de wages
- Aumento de transfer payments (UI, disability, healthcare)

Import competition explica ~25% do declínio agregado contemporâneo de emprego manufatureiro.

### Estrutura temporal do choque
- **Concorrente desde a entrada da China na OMC (2001) e antes**: cada container de importação concorre com produção doméstica desde o momento em que entra
- **Gradual em magnitude, concorrente em estrutura**: o volume de importações cresceu ao longo da década, mas a competição é direta desde o primeiro dólar de importação. Não há fase em que a importação chinesa torne o trabalhador americano de manufatura *mais* próspero
- **Coalizão de perdedores ex ante**: trabalhadores em indústrias rotineiras, regiões manufatureiras (Midwest, Sul). Esta é a coalizão que vira protecionista (Colantone-Stanig 2018 documentam consequência política)

### Argumento: por que Tipo A
1. **Substituição direta de output**: bem chinês substitui bem americano no mercado consumidor — clássica substituição
2. **Sem fase de complementaridade**: não existe modelo plausível em que importação chinesa *complemente* produção doméstica antes de substituí-la. O choque é concorrente desde sempre
3. **Caso paradigmático para Rogowski (1989)**: estrutura econômica (intensidade fatorial × abundância relativa) → coalizão política. Argumento direto, sem mediação temporal
4. **Inclusão como Tipo A**: o reframing IA-dem usa China shock como o benchmark canônico de Tipo A (junto com robôs). É o caso onde "perdedores existem desde t=0" é mais óbvio empiricamente

---

## Síntese: automação clássica = Tipo A?

**Sim, robusto.** As três referências do Tier 4 documentam choques tecnológicos/comerciais em que:

1. **A função de produção é separável (não O-Ring)**: trabalho e capital/imports substituem-se em tarefas (ou bens) específicos, não há multiplicação de qualidades em cadeia
2. **Perdedores existem desde t=0**: a coalizão afetada é identificável ex ante por ocupação, indústria, região
3. **Não há fase de prosperidade compartilhada**: o choque não enriquece os afetados antes de deslocá-los. Productivity effect (em A&R 2018, 2020) opera via output agregado e tarefas remanescentes, não via uplift dos trabalhadores deslocados
4. **Padrão político: coalition conflict**: perdedores demandam compensação/proteção; vencedores resistem; resultado depende de cross-cutting cleavages, identity, partisan alignment (Colantone-Stanig, Baccini-Weymouth, Foster-Frieden, Autor-Dorn-Hanson-Majlesi 2020)

Isso é estruturalmente distinto da trajetória O-Ring documentada por Gans-Goldfarb (2026), em que:

1. **Função de produção é multiplicativa (O-Ring)**: Y = ∏ q(i)
2. **Worker pode ser bottleneck remanescente**: durante fase de complementaridade, automação parcial *aumenta* o valor das tarefas humanas remanescentes (focus effect)
3. **Threshold descontínuo**: o deslocamento é súbito e massivo quando todas as tarefas críticas são automatizadas — antes disso, worker prospera; depois, worker é dispensável
4. **Coalition absence em fase 1**: durante a fase próspera, não existe coalizão de perdedores

---

## Papers adicionais (web search) sobre AI vs robôs

### Brynjolfsson, Li & Raymond (2025, *QJE*) — Generative AI at Work
- 5,179 customer support agents com acesso a assistente de IA conversacional
- Produtividade média +14%; novatos e baixa-qualificação +34%; experts impacto mínimo
- **Mecanismo**: IA dissemina best practices → comprime curva de aprendizado
- **Implicação para tipologia**: este é Tipo B incipiente — a IA é *complementar* aos novatos (tornando-os mais produtivos), não substituta. Mas ainda não documenta fase 2 (deslocamento sequencial) porque a ferramenta acabou de ser introduzida
- **Para IA-dem**: prova de conceito do mecanismo de complementaridade. Não prova ainda o threshold, mas é coerente com a hipótese

### Eloundou et al. (2024, *Science*) — GPTs are GPTs
- ~80% da força de trabalho dos EUA tem ≥10% das tarefas afetadas por LLMs
- Roles dependentes de critical thinking science → correlação negativa com exposição
- Roles dependentes de programming, writing → correlação positiva
- **Implicação**: exposição é *pervasiva* mas heterogênea. Coerente com o reframing IA-dem de "AI gera mistura de Tipo A e Tipo B dependendo da estrutura de tarefas"
- **Mas atenção**: o paper *não* faz a distinção temporal. Mede exposição estática, sem diferenciar substituição direta vs. fase de complementaridade

### Acemoglu (2024, NBER w32487 / *Economic Policy* 2025) — Simple Macroeconomics of AI
- Aplicação do framework task-based ao caso AI
- TFP gain agregado modesto: ≤0.66% em 10 anos (Hulten's theorem com fração de tarefas afetadas × cost saving médio)
- AI pode *aumentar* desigualdade mesmo melhorando produtividade de baixa-qualificação se não criar novas tarefas para eles
- **Implicação para IA-dem**: Acemoglu trata AI dentro do mesmo framework displacement/reinstatement de robôs — não constrói tipologia O-Ring. **A própria literatura mainstream de Acemoglu não distingue Tipo A vs Tipo B na dimensão temporal**. Isso confirma que IA-dem tem espaço analítico legítimo

### Acemoglu, Kong & Restrepo (2024) — Tasks, Automation, Wage Inequality
- Estende Econometrica 2022 para AI
- Mantém framework task-based separável
- **Não usa O-Ring explicitamente** — confirma que a comunidade Acemoglu-Restrepo não absorveu Kremer 1993 como mecanismo central

### Gans & Goldfarb (2026, NBER w34639) — O-Ring Automation
- Ponto exato do contraste Tipo A vs Tipo B na própria literatura econômica
- Argumento explícito: "task-by-task substitution logic is incomplete because automating one task changes the return to automating others"
- Resultado-chave: labour income pode *subir* sob automação parcial porque o valor do bottleneck humano sobe
- **Quote-chave**: "two jobs with identical exposure scores can have completely opposite displacement risks depending on whether their tasks are complements"
- **Para IA-dem**: este é o paper-fonte da microfundação Tipo B. Citá-lo como base econômica do mecanismo

---

## A literatura já distingue Tipo A vs Tipo B formalmente?

**Diagnóstico**: a literatura econômica **distingue substituição vs complementaridade na função de produção**, mas **não distingue na dimensão temporal/sequencial relevante para coalizões políticas**.

### O que a literatura tem
1. **Distinção substituição vs complementaridade na FP**: Acemoglu-Restrepo (displacement vs reinstatement effects); Autor (skill-biased technical change vs routine-biased); Gans-Goldfarb (task-by-task vs O-Ring quality complements)
2. **Distinção exposição alta vs complementaridade alta**: trabalho recente em "AI Exposure and the Future of Work" (Upjohn) sugere typology de "high-exposure low-complementarity" (replacement risk) vs "high-exposure high-complementarity" (augmentation). Isso é mais próximo do que IA-dem precisa, mas ainda *estático* — não modela a transição temporal
3. **Citação de Kremer 1993 no contexto de AI**: Gans-Goldfarb 2026 é o trabalho mais explícito. Empiricrafting "Weak Links, Strong Predictions: Kremer's O-Ring at 30" (substack) também faz a ponte conceitual

### O que a literatura NÃO tem
1. **Estrutura temporal do choque como variável política**: nenhum paper modela o fato de que *quando* os perdedores aparecem (todos em t=0 vs apenas após threshold) muda a dinâmica de formação de coalizão
2. **Coalition absence vs coalition conflict**: literatura política de globalização/automação assume implicitamente que há perdedores (debate é sobre por que não compensam). IA-dem propõe um regime em que *durante fase 1 não há perdedores*
3. **Prosperity trap como falha endógena**: o conceito de que prosperidade temporária de fase 1 *bloqueia* construção de infraestrutura compensatória — não está articulado em nenhum paper que vi

### Citações de Kremer 1993 no contexto AI/automação
- **Gans & Goldfarb (2026, NBER w34639)**: o trabalho central, formaliza o-ring para automação
- **Empiricrafting blog "Kremer's O-Ring at 30"** (substack, 2024): revisão conceitual conectando Kremer a AI
- **economicforces.xyz "Complementarities, Weak Links, AI"**: ensaio popular
- **Jones (2011, AER)**: "Intermediate Goods and Weak Links" — extensão original de Kremer para macro/desenvolvimento, não AI especificamente
- **Não vi**: nenhum paper de top-5 que cite Kremer 1993 *e* faça argumento político sobre formação de coalizão sob trajetória sequencial

### Implicação para o claim de originalidade IA-dem
O claim "estrutura temporal do choque (concorrente vs sequencial) é uma dimensão política nova" **é defensável**. A literatura econômica trata complementaridade como propriedade da FP, não da trajetória temporal de quem-perde-quando. A literatura política de tech & politics (Colantone-Stanig, Baccini-Weymouth, Bonomi-Gennaioli-Tabellini) trata perdedores como existindo desde t=0.

**Risco de overclaim**: dizer "ninguém antes pensou em automação como sequencial" seria exagero — Gans-Goldfarb pensaram, e a comunidade de development economics (Jones 2011) tem variações. Mas dizer "ninguém modelou a consequência política da estrutura temporal sequencial" parece sustentável.

---

## Recomendação para framing IA-dem

### Como apresentar o contraste (claim disciplinado)

> "A literatura de economia do trabalho documenta robôs (Acemoglu-Restrepo 2020) e choques comerciais (Autor-Dorn-Hanson 2013) como casos de substituição direta: perdedores identificáveis ex ante, deslocamento concorrente desde a entrada do choque, productivity effect operando via output agregado em vez de uplift dos afetados. Recentemente, Gans & Goldfarb (2026) formalizam um caso distinto — automação O-Ring, em que cadeias de tarefas com complementaridade multiplicativa geram dinâmica de threshold: durante fase de automação parcial, trabalhadores remanescentes ganham focus premium; ao cruzar threshold de qualidade, deslocamento é súbito e abrange a cadeia inteira. Chamamos o primeiro padrão de Tipo A (concorrente) e o segundo de Tipo B (sequencial). A contribuição deste paper é mostrar que a estrutura temporal do choque — não apenas a magnitude — gera padrões qualitativamente distintos de formação de coalizão política."

### O que evitar
1. **Não dizer**: "robôs e China shock são bem-entendidos pela literatura econômica como Tipo A". A *literatura* não usa essa nomenclatura. Frasear como classificação proposta pelo autor: "classificamos como Tipo A choques que documentadamente exibem [propriedades X, Y, Z]"
2. **Não over-claim** que a tipologia A/B é original ao paper. A microfundação econômica (substituição vs O-Ring) é Gans-Goldfarb. O que IA-dem traz é a *consequência política* — coalition absence vs coalition conflict
3. **Não confundir** dimensões: a literatura tem (i) substituição vs complementaridade na FP; (ii) skill-biased vs routine-biased TBC; (iii) exposição alta vs baixa. IA-dem precisa de (iv) trajetória temporal de quem-perde-quando, que é distinta. Ser explícito sobre qual dimensão.

### Como usar Tier 4 no paper
- **Section 2 (Lit Review)**: Tier 4 ancora a base econômica. Robôs (A&R 2020) e China (ADH 2013) como benchmarks Tipo A. Gans-Goldfarb (2026) como microfundação Tipo B. Acemoglu (2024 Simple Macro) para mostrar que mainstream AI economics ainda trata via task-based separável — janela analítica para IA-dem
- **Section 3 (Tipologia)**: introduzir Tipo A vs Tipo B com referência explícita aos casos canônicos. Tabela 1: "Robôs (A&R 2020): substituição direta, concorrente; China shock (ADH 2013): substituição direta de output, concorrente; AI O-Ring (Gans-Goldfarb 2026): complementaridade multiplicativa, sequencial"
- **Section 4 (Modelo formal)**: tomar Gans-Goldfarb como dado (estrutura econômica é input, regra do projeto), construir camada política
- **Section 5 (Predições)**: contraste empírico — democracias compensação-friendly têm sucesso documentado sob Tipo A (Escandinávia sob globalização, Alemanha sob robôs via Kurzarbeit), predição de falha sob Tipo B é a margem testável

### Sugestão de subseção dedicada
> **2.X "AI is not just faster robots: the temporal dimension"**
>
> Existing political economy of automation (Colantone-Stanig 2018; Baccini-Weymouth 2021; Bonomi-Gennaioli-Tabellini 2021; Frey et al. 2018) treats technological displacement as analogous to trade displacement: a concurrent shock with identifiable losers from t=0. This framing is empirically grounded for industrial robots and import competition, where production functions are task-separable and substitution is direct. Recent work in economics of automation (Gans & Goldfarb 2026, building on Kremer 1993) identifies a distinct case: when tasks are quality-complements (multiplicative production), partial automation enriches remaining human bottlenecks before threshold crossing displaces the entire chain. We argue this temporal structure — sequential rather than concurrent appearance of losers — generates a political pathology absent in the Type A literature: coalition absence in phase 1, prosperity trap blocking compensation infrastructure, sudden mobilization in phase 2 outpacing democratic policy speed.

---

## Referências citadas

### Tier 4 (core)
- Acemoglu, D., & Restrepo, P. (2018). The race between man and machine. *AER*, 108(6), 1488–1542.
- Acemoglu, D., & Restrepo, P. (2020). Robots and jobs: Evidence from US labor markets. *JPE*, 128(6), 2188–2244.
- Autor, D. H., Dorn, D., & Hanson, G. H. (2013). The China syndrome. *AER*, 103(6), 2121–2168.

### Tier 4 expandido (web search 2023-2026)
- Acemoglu, D. (2024). The simple macroeconomics of AI. NBER WP 32487. *Economic Policy* 40(121), 13-58.
- Acemoglu, D., Kong, F., & Restrepo, P. (2024). Tasks at work. MIT working paper.
- Brynjolfsson, E., Li, D., & Raymond, L. (2025). Generative AI at work. *QJE*, 140(2), 889–942.
- Eloundou, T., Manning, S., Mishkin, P., & Rock, D. (2024). GPTs are GPTs. *Science*.
- Gans, J. S., & Goldfarb, A. (2026). O-Ring Automation. NBER WP 34639.
- Kremer, M. (1993). The O-ring theory of economic development. *QJE*, 108(3), 551–575.

---

## Sources (web search)
- [Robots and Jobs (NBER)](https://www.nber.org/papers/w23285)
- [The Race Between Man and Machine (NBER)](https://ideas.repec.org/p/nbr/nberwo/22252.html)
- [The China Syndrome (NBER)](https://www.nber.org/papers/w18054)
- [The Simple Macroeconomics of AI (NBER)](https://www.nber.org/papers/w32487)
- [Generative AI at Work (QJE)](https://academic.oup.com/qje/article/140/2/889/7990658)
- [GPTs are GPTs (arXiv)](https://arxiv.org/abs/2303.10130)
- [O-Ring Automation (NBER)](https://www.nber.org/papers/w34639)
- [Kremer's O-Ring at 30 (Empiricrafting)](https://empiricrafting.substack.com/p/weak-links-strong-predictions-kremers)
- [Tasks at Work (Acemoglu-Kong-Restrepo)](https://economics.mit.edu/sites/default/files/2025-03/Tasks%20at%20Work%20-%20Comparative%20Advantage,%20Technology%20and%20Labor%20Demand.pdf)
- [Automation and New Tasks (JEP 2019)](https://www.aeaweb.org/articles?id=10.1257/jep.33.2.3)
