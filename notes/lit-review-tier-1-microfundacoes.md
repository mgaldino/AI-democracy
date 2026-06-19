# Tier 1 — Microfundações herdadas

**Data**: 2026-05-03
**Propósito**: Revisão sistemática técnica das 7 referências do Tier 1 do paper IA-dem (reframing pós-interview 2026-05-03). Foco em mecanismo formal, condições, o que IA-dem herda, o que precisa estender, e armadilhas de antecipação.
**Escopo**: este documento adiciona profundidade técnica que NÃO está em `notes/lit-review-tech-shocks-politics.md` (que é amplo e empírico). Aqui o foco é a derivação matemática de cada modelo herdado.
**Status**: draft de releitura. Para A&R 2000/2001/2006 e Rogowski 1989, parte do detalhe técnico vem de buscas web (não do PDF original); marcado [WEB] quando necessário.

---

## A&R 2000 (QJE) — Why Did the West Extend the Franchise?

**Citação confirmada**: Acemoglu, D., & Robinson, J. A. (2000). Why did the West extend the franchise? Democracy, inequality, and growth in historical perspective. *Quarterly Journal of Economics*, 115(4), 1167–1199.
**Nota**: A&R publicaram correção à Proposição 1 em janeiro 2017 (`why_did_the_west_extend_the_franchise_-_a_correction.pdf`). Releitura deve incluir a correção.

### Mecanismo central

Jogo dinâmico entre elite rica e pobres desfranqueados em sociedade não-democrática. A cada período há um estado da natureza que é "ameaça de revolução alta" (μ=μH) ou "ameaça baixa" (μ=μL). Quando a ameaça é alta, a elite enfrenta escolha:

1. **Repressão**: custo c
2. **Concessão temporária** (transferência redistributiva apenas neste período): mas não é credível para o futuro porque, quando a ameaça baixar, a elite reverte
3. **Extensão do franchise** (democratização): commitment device. Em democracia, mediano vota e fica em equilíbrio com τ > 0 sustentado

Resultado central: como concessão temporária não é credível em estados onde a ameaça revolucionária volta a baixar, a única forma da elite evitar revolução é mudar permanentemente quem decide a política — i.e., democratizar. Democratização é commitment porque transfere poder sobre instrumentos fiscais futuros.

### Assumptions / condições

**Cruciais**:
- (A1) Ameaça revolucionária é estado contingente, transitória (μH ocorre com probabilidade q em cada período); revolução só é viável quando μ=μH
- (A2) Promessas redistributivas da elite não são credíveis: sem mudança institucional, elite reverte τ assim que μ volta a μL
- (A3) Em democracia, mediano (pobre) é o decisor (one-shot); democracia é absorvente (não há golpe — relaxado em A&R 2001/2006)
- (A4) Custo de revolução (μ) e custo de repressão (c) são parâmetros exógenos

**Auxiliares**:
- Função de utilidade linear em consumo
- 2 grupos discretos (sem middle class — relaxado no livro 2006, cap. 8)
- Preferências policy-única sobre tax rate τ ∈ [0, 1]

### Derivação técnica (2-3 linhas)

Markov perfect equilibrium: para q (probabilidade de ameaça) intermediário, elite escolhe democratizar quando o valor presente do fluxo de transferências sob democracia (τD persistente) é menor que o valor da revolução para os pobres (Vrev). A condição é da forma `q · μH > c̄(τD)` onde c̄ é cutoff que depende de inequality e do desconto. Inequality alta → franchise tardio (mediano demanda τ alto, elite resiste mais).

### O que IA-dem herda

1. **Estrutura de saída autocrática via commitment failure**: sob choque rápido (Tipo A) que mobiliza massa autocrática, ditador não consegue prometer compensação futura credível — única saída é institucionalizar. Em IA-dem isto fornece o "fall path" da autocracia em **Tipo A com ameaça aguda** (não no main result, mas como cenário simétrico)
2. **Lógica de "concessão não-credível → mudança institucional"**: aplicável também ao caso democrático sob Tipo B se reinterpretado como falha de comprometer-se com infraestrutura compensatória futura
3. **Tratamento de ameaça revolucionária como estado contingente**: justifica modelar fase 2 do Tipo B como "estado μH súbito"

### O que IA-dem precisa estender

1. **A&R não distingue trajetória econômica do choque**: para A&R, a ameaça é um draw de Bernoulli exógeno; em IA-dem o choque é endogenamente *sequencial* (Tipo B) ou *concorrente* (Tipo A) por estrutura microeconômica
2. **A&R não tem fase de prosperidade ex-ante**: Tipo B exige modelar fase 1 onde *ninguém* tem incentivo a se mobilizar — A&R não captura isso porque ameaça é always-on (com probabilidade q)
3. **A&R foca em franchise binário**: democracia vs autocracia. IA-dem precisa modelar erosão democrática (voltado para BGT 2021), não apenas queda

### Armadilhas / inconsistências potenciais

- **Risco de overstretch da analogia**: A&R 2000 é sobre transição autocracia→democracia em séc. XIX. Aplicar mecanicamente ao caso AI requer cuidado — não há nada na IA que automaticamente recrie "ameaça revolucionária" no sentido A&R
- **Correção de 2017**: a Proposição 1 original tinha erro. Releitura deve checar exatamente qual condição foi corrigida e se afeta a aplicação ao caso IA-dem
- **Mecanismo de commitment**: depende crucialmente de que mudança institucional seja irreversível. Em IA-dem, "construir infraestrutura compensatória" pode ser revertível (via populismo BGT, exatamente) — então o paralelo com franchise não é direto

---

## A&R 2001 (AER) — A Theory of Political Transitions

**Citação confirmada**: Acemoglu, D., & Robinson, J. A. (2001). A theory of political transitions. *American Economic Review*, 91(4), 938–963.

### Mecanismo central

Extensão dinâmica de A&R 2000: agora democracia *também* não é absorvente. Elite pode dar golpe (custo de coup) e voltar a autocracia. Resultado: regime oscila quando inequality é alta e custo de coup é baixo.

Estrutura: três regimes possíveis em sequência — autocracia, democracia, autocracia (golpe). Cada transição depende de:
- Estado econômico atual (ameaça revolucionária ou ameaça de coup)
- Inequality (nível de τ que mediano impõe em democracia)
- Custos exógenos de revolução e de coup

### Assumptions / condições

**Cruciais**:
- (A1) Recessões → ameaça revolucionária ↑ (proletariado tem custo de oportunidade baixo para revoltar)
- (A2) Booms/recessões em democracia → ameaça de coup pela elite ↑ se τ é alto
- (A3) Ambos os regimes têm policy decisor único (autocracia: elite; democracia: mediano)

**Auxiliares**:
- Sem middle class
- Estrutura policy: tax rate τ proportional, sem custos de distorção
- Discounting infinito

### Derivação técnica

Equilibrium é caracterizado por dois cutoffs: 
- `τ̄_R`: tax rate em democracia que torna golpe não-lucrativo para elite
- `μ̄`: ameaça revolucionária que justifica democratização para elite
Quando inequality θ é alta, mediano demanda τ > τ̄_R → democracia é vulnerável a golpe. Sociedade pode oscilar entre regimes (não-monotônico em θ).

### O que IA-dem herda

1. **Estrutura de "regime oscilante"**: sob choque Tipo A com inequality alta, IA-dem pode citar A&R 2001 como microfundação de instabilidade autocrática que volta após democratização — cenário fora do main result mas relevante para extensão
2. **Recessão como gatilho de mobilização**: A1 é diretamente aplicável — fase 2 do Tipo B é "recessão setorial súbita" para os deslocados
3. **Linguagem de "regime fragility"**: o paper IA-dem usa "fragilidade" no sentido herdado de A&R

### O que IA-dem precisa estender

1. **A&R 2001 não modela erosão populista**: golpe é discreto e identificado (elite age coletivamente). IA-dem sob Tipo B precisa de erosão (BGT), não golpe — mecanismos qualitativamente diferentes
2. **Trajetória econômica é cíclica em A&R, não trajetória estrutural**: recessão é boom-bust temporário, não transformação tecnológica permanente. Tipo B é estrutural, não cíclico

### Armadilhas / inconsistências potenciais

- **Risco de "encaixar Tipo B em A&R 2001"**: tentação de modelar Tipo B como "recessão tardia em fase 2" é enganosa. Em A&R, recessão é exógena e cíclica; em IA-dem, deslocamento é endógeno à trajetória O-Ring e permanente
- **Inequality é parâmetro, não trajetória**: A&R 2001 não tem nada análogo a "inequality cresce endogenamente em fase 2 do Tipo B"

---

## A&R 2006 (livro Cambridge) — Economic Origins of Dictatorship and Democracy (caps. 6, 7, 8)

**Citação confirmada**: Acemoglu, D., & Robinson, J. A. (2006). *Economic Origins of Dictatorship and Democracy*. Cambridge University Press.

### Estrutura dos capítulos relevantes [WEB, baseado em sumários]

- **Cap. 6**: Modelo statico (one-shot) de democratização. Elite vs cidadãos, ameaça revolucionária. Refina A&R 2000 com formalização mais cuidadosa
- **Cap. 7**: Modelo dinâmico de criação e consolidação. Refina A&R 2001 com ciclos coup-democratização e o papel de inequality
- **Cap. 8**: Introdução de **classe média**. Mostra que a presença de uma classe média modera demandas redistributivas e torna democratização *e* consolidação mais prováveis

### Mecanismo central (caps. 6-7)

Recapitula A&R 2000/2001 com formalismo unificado. Game tree explícita:
1. Natureza escolhe estado μ ∈ {μH, μL}
2. Elite decide policy: repressão (custo κ), concessão temporária (τR), ou democratização
3. Em democracia, mediano escolhe τD; elite pode tentar golpe (custo φ)
4. Continuation à la Markov perfect

### Mecanismo central (cap. 8)

Adicionar middle class M com renda intermediária yM ∈ (yL, yH) muda decisão do mediano em democracia. Se M é grande e relativamente pobre, mediano é membro de M → τD mais moderado → elite menos incentivada a golpe → democracia consolida ("middle class consensus").

### Assumptions / condições

**Cruciais (cap. 8)**:
- Distribuição trinodal (L, M, H) em vez de bimodal
- M tem renda y_M tal que y_L < y_M < y_H
- Mediano sob democracia universal é determinado pelo tamanho relativo de L vs M
- Preferências sobre policy ainda são monotônicas em renda

**Auxiliares**:
- Sem heterogeneidade dentro de classes
- Preferências policy ainda 1-D (apenas τ)

### O que IA-dem herda

1. **Estrutura formal canônica para regime change** (caps. 6-7): IA-dem pode citar como "padrão" do qual está se afastando — IA-dem propõe que o canal não é via revolution threat, mas via coalition formation (Tipo A) ou coalition absence (Tipo B)
2. **Importância da middle class** (cap. 8): em Tipo B, a fase 1 é caracterizada precisamente porque *quase todos* estão na "middle class" da complementaridade O-Ring. Cap. 8 fornece base para argumentar que a fragilidade do Tipo B vem de "todos serem middle class temporariamente"
3. **Modelagem mínima da autocracia**: 2-3 páginas de modelo autocrático em IA-dem podem ser totalmente baseadas em cap. 6-7 com microfundação herdada

### O que IA-dem precisa estender

1. **Cap. 8 não tem trajetória**: middle class é parâmetro, não outcome de choque tecnológico. Tipo B precisa endogenizar "middle class apparente em fase 1, polarizada em fase 2"
2. **A&R não tem heterogeneidade β intra-classe**: em Tipo B (Gans-Goldfarb), trabalhadores têm β heterogêneo; A&R não tem nada análogo
3. **A&R não modela populismo**: cap. 8 fala de middle class consensus mas não de erosão democrática endógena via plataforma cultural — esse é território BGT 2021

### Armadilhas / inconsistências potenciais

- **Cap. 8 e Tipo B**: tentação de mapear "middle class" → "fase 1 da O-Ring trajectory" é OK como motivação, mas cap. 8 está em steady state. Tipo B é trajectory.
- **Cap. 8 prediz consolidação democrática quando middle class é grande**: IA-dem prediz o oposto sob Tipo B (middle class temporária = vulnerabilidade). É preciso articular que a *natureza* da middle class é diferente: em A&R cap. 8 é uma classe estável; em Tipo B é uma posição transitória que a estrutura O-Ring vai destruir

---

## Bonomi, Gennaioli & Tabellini 2021 (QJE) — Identity, Beliefs, and Political Conflict

**Citação confirmada**: Bonomi, G., Gennaioli, N., & Tabellini, G. (2021). Identity, beliefs, and political conflict. *Quarterly Journal of Economics*, 136(4), 2371–2411. DOI: 10.1093/qje/qjab034.
**PDF**: `qjab034.pdf` no projeto (lido).

### Mecanismo central

Modelo formal de identidade endógena com 2 dimensões de policy: tax rate τ (redistribuição) e cultural policy q (imigração, civil rights, etc.). Eleitor `(ψ, ε)` tem traço cultural ψ e renda futura esperada ε. Voter pode identificar-se com classe econômica (U/L) ou grupo cultural (SP/SC), mas não ambos.

**Dois pilares**:
1. **Identity formation** (Seção III.B): identidade maximiza conflito com outgroup (meta-contrast principle). Se conflito cultural > conflito econômico, identifica com grupo cultural; caso contrário, com classe.
2. **Belief distortion** (Eq. 1, 2 — Seção II.C): voter identificada com grupo G distorce crenças na direção do estereótipo do grupo. Crenças sobre futuro econômico (ε) e cultural (ψ) ambas afetadas. Distortion factor θ = χ/(1−2χ) onde χ é overweighting parameter (Bordalo et al. 2016).

**Resultado central** (Proposição 2, p. 2389): identidade cultural domina se κ̂ = κφ > â, onde:
- κ̂ é peso do conflito cultural (κ é welfare weight de policy cultural, φ é distorção tributária)
- â é cutoff calculado de eq. 10 (p. 2388), depende de ρ (correlação income-progressividade), β (peso de cultura sobre public good), e razão `(ψ̄_SP − ψ̄_SC)/(ε̄_U − ε̄_L)`

**Implicação para skill-biased shocks** (p. 2390): choque que aumenta correlação ρ entre income e cultura (porque empobrece menos-educados, mais conservadores) aumenta `â`-region onde cultura domina → switch endógeno para identidade cultural mesmo se choque aumenta inequality. Resultado: voters perdedores demandam *menos* redistribuição (Proposição 4).

### Assumptions / condições

**Cruciais**:
- (A1, p. 2387): conflito cultural < conflito econômico mas não trivialmente — `ρ < (Δψ̄/Δε̄) < 1/ρ`
- (A2): `χ < 1/2` (overweighting bem-definido, fixed point existe)
- (A3): `β ≤ ρ(1+ρ²)/(1+ρ⁴)` (foco no caso interessante onde identidade pode ser cultural ou econômica)
- (A4): voter pode identificar com classe ou grupo cultural — não com interseção (relaxado em Online Appendix 3, com narrow groups; resultado qualitativo robusto — p. 2390-91)
- (A5): bivariate normal H(ψ, ε)

**Auxiliares**:
- Funções utility quadráticas
- Preferences linearmente separáveis em τ e q
- Heterogeneidade contínua em (ψ, ε), mas "groups" são discretos (cutoffs ψ̂, ε̂ historicamente dados)

### Derivação técnica (eq. central)

Eq. 9 (p. 2388): conflito entre G e Ḡ:
`C(G, Ḡ) = (ε̄_G − ε̄_Ḡ)² + (β² + κ̂)(ψ̄_G − ψ̄_Ḡ)² − 2β(ε̄_G − ε̄_Ḡ)(ψ̄_G − ψ̄_Ḡ)`

Voters identificam com partição (econômica ou cultural) que maximiza conflito. Switch para cultural ocorre quando `C(SP, SC) > C(U, L)`, que se reduz à condição `κ̂ > â` (Prop. 2). â é determinado por eq. 10 — depende crucialmente de ρ.

### O que IA-dem herda

1. **Saída democrática Tipo B = identity switch**: BGT fornece a microfundação exata para "voters perdedores adotam identidade cultural e demandam menos redistribuição". Em Tipo B fase 2, deslocados súbitos podem ser empurrados para cultural identity em vez de demanda por compensação
2. **Mecanismo "skill-biased shock → cultural identity"** (p. 2390): aplicável diretamente — Tipo B é skill-biased no setor afetado (workers complementares prosperam em fase 1, são deslocados em fase 2)
3. **Estrutura formal**: 2 policies (τ, q), identidade endógena, distortion via stereotype. IA-dem pode citar BGT como modelo de "endogenous coalition formation" e usar a Proposição 4 como saída populista

### O que IA-dem precisa estender

1. **BGT é steady-state**: identidade switch é sudden mas modelado em corte transversal. Tipo B requer trajetória — fase 1 (sem perdedores, identity=class é dormante) → fase 2 (deslocados switch para cultural)
2. **BGT não tem trajetória O-Ring**: o "shock" em BGT é exógeno (skill-biased ou trade); IA-dem precisa derivar o shock da estrutura econômica subjacente (Gans-Goldfarb)
3. **BGT não tem dimensão regime**: o modelo é puramente democrático. IA-dem precisa argumentar simetricamente para autocracia (via A&R) — BGT não fala desse caso
4. **BGT diz "identidade cultural reduz demanda por redistribuição", não "destrói infraestrutura compensatória"**: passagem de "menos redistribuição" para "fragilidade institucional" é um gap. IA-dem precisa articular que sem demanda por compensação durante fase 1 (porque ninguém é perdedor) e identity switch em fase 2 (porque os deslocados viram cultural), nenhuma infraestrutura é construída — combina BGT (fase 2) com microfundação própria (fase 1)

### Armadilhas / inconsistências potenciais

- **Risco de antecipação parcial**: BGT já modela "skill-biased technical change → cultural identity → less redistribution". IA-dem precisa argumentar que sua contribuição não é o resultado final (já em BGT) mas a *causa estrutural* (O-Ring sequential vs concurrent), ou seja, a *trajetória* que gera o choque
- **Prop. 4 do BGT (p. 2391-95)**: já mostra "economic shock → cultural switch → less redistribution". Isso é a saída de IA-dem sob Tipo B. Releitura deve confirmar exatamente quão geral é a Prop. 4 — se é para qualquer choque ou específica
- **Identity é binária (class XOR culture)**: é restritivo. Em IA-dem, fase 1 do Tipo B não tem nem class identity (todos prosperam) nem cultural identity (sem trigger). É um caso de "identidade dormante" que BGT não trata diretamente
- **Robustez para narrow groups**: BGT generaliza em Online Appendix 3 (workers podem identificar com sub-grupos como L∩SC). Releitura deve verificar se isso muda a aplicação em Tipo B

---

## Gans & Goldfarb 2026 — O-Ring Automation

**Citação confirmada (via NBER)**: Gans, J. S., & Goldfarb, A. (2026). O-Ring Automation. NBER Working Paper No. 34639. SSRN: 5962594 e 6019718. (Também circulando em workshops; status de publicação em journal pendente.)
**PDF**: NÃO baixado localmente. Disponível em https://www.nber.org/papers/w34639

### Mecanismo central [WEB]

Estende Kremer 1993 para automação. Produção requer N tarefas com qualidades complementares (multiplicativas): `Y = ∏_i q_i`. Trabalhador aloca tempo T fixo entre tarefas; máquinas podem substituir tarefas com qualidade exógena `q^M_i`. Decisão: quais tarefas automatizar.

**Três resultados centrais**:
1. **Não-separabilidade**: automatizar tarefa i muda o retorno marginal de automatizar tarefa j (porque qualidades multiplicam). Logo, regra "task-by-task" sobestima/subestima
2. **Adoção em bundle / discreteness**: mesmo com qualidade da máquina melhorando suavemente, a decisão de adotar é discreta e tipicamente vem em bundle — i.e., automatiza-se um subconjunto inteiro de tarefas simultaneamente
3. **"Focus effect"**: quando máquina assume tarefas, trabalhador realoca tempo para tarefas restantes (bottleneck), aumentando q_human nas tarefas restantes. Em equilibrium, isso pode aumentar valor marginal do trabalho humano — labor income pode subir sob automação parcial

### Assumptions / condições [WEB]

**Cruciais**:
- (A1) Produção O-Ring: `Y = ∏ q_i` (complementaridade multiplicativa)
- (A2) Trabalhador tem tempo total T fixo, alocado entre tarefas manuais
- (A3) Qualidade humana `q_i = f(t_i)` com retornos decrescentes em tempo alocado
- (A4) Qualidade da máquina é exógena (não há learning)
- (A5) Wage bargaining captura parte do surplus criado pelo focus effect

**Auxiliares** (provavelmente):
- Discounting único, sem dinâmica intrinsica
- Mercado de trabalho competitivo na ausência de bundling

### Derivação técnica (intuição) [WEB]

Em equilibrio sem automação: trabalhador aloca T entre N tarefas para maximizar `∏ f(t_i)` s.t. `Σ t_i = T` → solução simétrica. Após automatizar k tarefas (com q^M ≥ alguma threshold), trabalhador realoca T entre N−k tarefas → cada uma recebe T/(N−k) tempo → q_i sobe → labor income sobe IF k é tal que o ganho de qualidade marginal supera a perda de massa de tarefas. Threshold para bundling: depende de q^M relativo a q_human(T/N).

### O que IA-dem herda

1. **Estrutura econômica do Tipo B**: O-Ring → fase 1 (poucas tarefas automatizadas, complementaridade preservada → labor income sobe ou estável → ninguém perde) → fase 2 (threshold cruzado, bundling, deslocamento súbito)
2. **Diferença com substituição linear**: Acemoglu-Restrepo (robôs) é Tipo A (substituição direta de tarefas em produção aditiva). Gans-Goldfarb é Tipo B (complementaridade multiplicativa). Esta é a base estrutural da tipologia
3. **Threshold como resultado endógeno**: o switch fase 1 → fase 2 vem de q^M cruzar limiar — não é exógeno. IA-dem usa isso para tornar o "shock" parte do modelo, não imposto
4. **Resultado "labor income rises with partial automation"**: justifica fase 1 do Tipo B — ninguém quer compensação porque ninguém perde

### O que IA-dem precisa estender

1. **Gans-Goldfarb é puramente econômico**: nenhuma política. IA-dem adiciona toda a camada política (votação, identity, regime)
2. **Heterogeneidade de β**: Gans-Goldfarb tem trabalhadores idênticos (presumivelmente — releitura deve confirmar). Tipo B do IA-dem requer heterogeneidade em β (qual a "ganho de complementaridade" idiosincrático)
3. **Trajetória temporal**: G-G é static (compara automação parcial vs total). IA-dem precisa de 2 períodos onde fase 1 = automação parcial e fase 2 = automação total/threshold
4. **Setor vs economia**: G-G é micro (uma firma, uma cadeia de tarefas). Aplicar ao nível de economia política exige agregação — quais setores são O-Ring, qual fração da força de trabalho

### Armadilhas / inconsistências potenciais

- **Releitura crítica**: paper é working paper, não journal-published. Versões podem estar circulando com diferenças. Releitura deve confirmar versão (NBER w34639 vs SSRN 5962594 vs SSRN 6019718)
- **Risco: bundling não implica colapso súbito de emprego**: G-G mostra adoção discreta, não necessariamente desemprego massivo. IA-dem precisa argumentar que em fase 2, automação atinge tasks que eram bottleneck → trabalhador deslocado. Isso requer que o set de tarefas restantes seja vazio ou que demanda por wage bargaining suma
- **"Labor income rises" é resultado positivo**: G-G é otimista sobre fase 1. IA-dem precisa cuidar para não suavizar excessivamente fase 1 — "ninguém perde" é o setup, mas fase 2 deve ser claramente negativa
- **Scope condition**: G-G aplica-se onde tasks são genuinamente complementares (saúde, educação, software complexo). Definir setores do mundo real onde Tipo B é o caso central é responsabilidade adicional do IA-dem

---

## Kremer 1993 (QJE) — The O-Ring Theory of Economic Development

**Citação confirmada**: Kremer, M. (1993). The O-ring theory of economic development. *Quarterly Journal of Economics*, 108(3), 551–575.

### Mecanismo central [WEB]

Função de produção `Y = k^α · n^β · (q_1 · q_2 · ... · q_n)` onde `q_i ∈ [0,1]` é probabilidade de trabalhador i completar tarefa i corretamente. Dado matching e complementaridade, equilibrium tem positive assortative matching: trabalhadores de mesma habilidade são pareados.

**Resultados centrais**:
1. **PAM**: high-skill workers são pareados com high-skill — output e wages crescem convexamente em skill
2. **Spillovers**: imperfect observability de skill → imperfect matching → strategic complementarity em educação → multiple equilibria
3. **Fragilidade**: erro em qualquer tarefa destroi valor multiplicativo do produto inteiro

### Assumptions / condições [WEB]

**Cruciais**:
- (A1) Produção multiplicativa em qualidades de tarefas
- (A2) Trabalhadores não são substitutos perfeitos (n low-skill ≠ 1 high-skill)
- (A3) Skill = probabilidade de sucesso
- (A4) Matching é endógeno (search/sorting)

### O que IA-dem herda

1. **Base teórica do Gans-Goldfarb**: Kremer fornece a microfundação geral para complementaridade multiplicativa. Gans-Goldfarb 2026 estende para automação.
2. **Justificação para tratar Tipo B como qualitativamente distinto**: Kremer mostra que produção O-Ring tem propriedades fundamentalmente diferentes (PAM, multiple equilibria, fragility) — não é apenas "complementaridade contínua"
3. **Linguagem de "bottleneck task"**: standard na literatura derivada

### O que IA-dem precisa estender

1. **Kremer não tem automação**: este é o gap que Gans-Goldfarb fecha
2. **Kremer é sobre development cross-country**: aplicação setorial requer reinterpretação

### Armadilhas / inconsistências potenciais

- **Risco de citar Kremer onde Gans-Goldfarb basta**: Kremer é o "ancestor" mas Gans-Goldfarb é o paper diretamente herdado. Citar Kremer apenas para genealogia, não para propriedades específicas usadas em IA-dem
- **PAM e wage inequality**: Kremer prediz wage inequality crescente em skill. Em fase 1 do Tipo B isso pode existir mas não ser politicamente saliente (ainda todos prosperam). IA-dem deve cuidar para não importar as predições de inequality do Kremer sem qualificação

---

## Rogowski 1989 — Commerce and Coalitions

**Citação confirmada**: Rogowski, R. (1989). *Commerce and Coalitions: How Trade Affects Domestic Political Alignments*. Princeton University Press.

### Mecanismo central [WEB]

Aplica Stolper-Samuelson com modelo de 3 fatores (terra, trabalho, capital) para derivar como mudanças exógenas em exposição comercial reorganizam coalizões políticas domésticas. Argumento essencialmente comparativo-estático: dada uma economia com endowments específicos, predizer (a) qual fator é abundante/escasso, (b) qual fator beneficia de abertura/fechamento, (c) qual coalização política emerge.

**Cleavages preditas**:
- Abundante labor + escassos capital, terra (US-Hartz, Inglaterra séc. XIX): conflito de classe (workers vs landlords/capitalists)
- Abundante land + escassos labor, capital (NA, Oceania): farmers (free trade) vs labor+capital (protectionism)
- 4 outras combinações em tabela canônica

### Assumptions / condições [WEB]

**Cruciais**:
- (A1) Stolper-Samuelson: aumento no preço relativo do bem intensivo em fator F → aumenta retorno real de F
- (A2) Política reflete distribuição de renda factor-specific (workers, landowners, capitalists)
- (A3) Endowments são exógenos (no curto-médio prazo)

### Derivação técnica (lógica)

Stolper-Samuelson: em modelo Heckscher-Ohlin com 2+ bens, abertura comercial aumenta retorno do fator abundante e reduz do escasso. Logo, dado mapping de endowments para classes políticas, abertura/fechamento de comércio gera ganhadores (classe do fator abundante) e perdedores (classe do fator escasso) previsíveis.

### O que IA-dem herda

1. **Estilo de argumento**: "estrutura econômica → coalizão política previsível". Esse é o template do IA-dem — substituir Stolper-Samuelson por estrutura O-Ring (Gans-Goldfarb), e cleavage previsível por "tipo de patologia política"
2. **Tipologia comparativa**: Rogowski cria tabela canônica de 6 cenários. IA-dem cria tabela 2x2 (Tipo A/B × democracia/autocracia) — herança direta de método
3. **Justifica "primary contribution = typology"**: na tradição Rogowski, a tipologia *é* a contribuição. Não precisa ser "novo modelo formal complicado"; pode ser "novo mapping estrutura → política"

### O que IA-dem precisa estender

1. **Rogowski é estática comparativa**: não tem trajetória. Tipo B é especificamente sobre *trajetória* (fase 1 → fase 2). Rogowski não tem nada análogo
2. **Rogowski tem 3 classes/fatores fixos**: IA-dem tem heterogeneidade contínua dentro de classes (β-distribution)
3. **Rogowski prediz coalizões existentes**: IA-dem prediz *ausência* de coalizão (Tipo B fase 1) — isso é um conceito além do que Rogowski formaliza
4. **Rogowski é puramente sobre commerce**: IA-dem é sobre tecnologia. Linguagem precisa adaptar (não é "exposição comercial" mas "exposição tecnológica via O-Ring")

### Armadilhas / inconsistências potenciais

- **Risco "commerce vs technology"**: globalização (Tipo A) é literalmente Rogowski-style. IA-dem deve articular que para Tipo A o modelo de Rogowski *já* explica o caso (coalition conflict). Tipo B é onde IA-dem faz contribuição genuína (coalition absence). Sem esta articulação, paper parece reaplicar Rogowski sem originalidade
- **Rogowski não tem regime**: assume democracias com lobbying político, não compara democracia vs autocracia. IA-dem importa estilo de argumento mas não a estrutura institucional
- **Citação canônica**: Rogowski 1989 é pre-formal-revolution em IPE. Citar como ancestor metodológico, não para derivações técnicas

---

## Síntese cruzada

### Tensões entre referências

1. **A&R vs BGT — natureza da saída democrática**: A&R 2006 cap. 8 prediz que middle class consolida democracia; BGT 2021 prediz que choque skill-biased (que historicamente atinge middle class) gera identity switch e *desconsolidação* via populismo. IA-dem precisa articular: A&R é sobre nível steady-state (middle class amortece); BGT é sobre choque endógeno (middle class pode bascular). Não há contradição direta, mas paper deve explicitar.

2. **Kremer vs Gans-Goldfarb — automação vs matching**: Kremer prediz PAM e crescimento de wage inequality. Gans-Goldfarb mostra que automação parcial pode *aumentar* labor income via focus effect. Tensão: em fase 1 do Tipo B, há divergência (PAM amplifica gaps) ou convergência (focus effect) entre workers? Releitura deve esclarecer se Gans-Goldfarb mantem PAM ou neutraliza.

3. **A&R vs Rogowski — agente da política**: A&R modela política como Markov perfect equilibrium entre 2 (ou 3) classes uniformes. Rogowski modela coalizões factor-baseadas com lobbying. BGT modela individual identity. IA-dem precisa escolher: median voter à la A&R/BGT, ou coalition-formation à la Rogowski. Sessão de interview convergiu para *median voter + BGT-style endogenous identity* (não Rogowski direto).

4. **Steady-state vs trajectory**: 5 das 7 referências são essencialmente steady-state (BGT, Rogowski, Kremer, A&R 2000-2006 caps. 6-7). Apenas A&R 2001 e Gans-Goldfarb implícitamente têm trajetória. IA-dem precisa construir trajectory model — herança de microfundações estáticas exige cuidado.

### Convergências

1. **Todos os modelos formais (A&R, BGT, Kremer, G-G) usam threshold/cutoff conditions**: identidade switch em BGT (κ̂ > â), democratização em A&R (q > q̄), bundling em G-G (q^M > q*). IA-dem está alinhado com a tradição: a contribuição central é uma threshold condition (cruzar fase 1 → fase 2)

2. **A&R + BGT cobrem espaço de regime change**: A&R (queda autocrática via revolution threat) + BGT (erosão democrática via populism). Together, fornecem ambos os cenários simétricos. IA-dem herda a saída autocrática de A&R e democrática de BGT — isso é coerente.

3. **Kremer + G-G + Rogowski cobrem espaço da estrutura econômica**: Kremer (O-Ring base), G-G (O-Ring + automação), Rogowski (estilo de argumento estrutura → política). Together, motivam a tipologia.

---

## Gaps que IA-dem preenche

1. **Coalition absence como falha política distinta** (Tipo B fase 1): nenhum dos 7 papers modela "ausência de coalizão" como categoria. Rogowski tem cleavages, BGT tem identidades alternativas, A&R tem 2 classes em conflito. *Ninguém modela o caso onde simplesmente não há perdedores ainda — e a inação durante esse período é a falha política*.

2. **Trajetória O-Ring como tipologia política**: Gans-Goldfarb tem a estrutura econômica; nenhum paper conecta isso à patologia política. A ponte é a contribuição.

3. **Comparação democrazia vs autocracia sob mesmo choque tecnológico O-Ring**: BGT é só democracia; A&R é só transição de regime. Combinar no mesmo framework em torno de Tipo B é original.

4. **Prosperity trap como mecanismo formal**: A literatura empírica (Foster-Frieden, Iversen-Soskice) sugere que welfare state inerte é vulnerável; nenhum paper formaliza "construir welfare requer perdedores; sob Tipo B fase 1 não há perdedores; logo welfare não se constrói". IA-dem o faz.

---

## Riscos de antecipação

### Risco ALTO

- **BGT 2021 Proposição 4** (p. 2391): "economic shocks hurting conservative voters trigger switch to cultural identity, causing demand for less redistribution". Isso é *muito próximo* do main result do IA-dem sob Tipo B. Releitura crítica obrigatória. Diferença: BGT aplica a qualquer choque skill-biased; IA-dem específica a estrutura O-Ring/sequential. *A originalidade deve estar na trajetória, não no outcome*.

### Risco MÉDIO

- **A&R 2006 cap. 8** (middle class): pode ser lido como "middle class consolida democracia, perda da middle class desconsolida". Tipo B fase 2 pode ser glossado como "destruição da middle class O-Ring". Releitura deve confirmar que A&R cap. 8 não tem trajectory ou shock-based dynamic — se tiver, é antecipação parcial.

- **Iversen-Soskice 2019** *Democracy and Prosperity* (não no Tier 1 mas mencionado): trabalha com complementaridade entre economia knowledge e democracia. Pode ter elementos de "Tipo B-like prosperity em economias avançadas". Recomendado adicionar ao Tier 2 e ler com atenção.

### Risco BAIXO

- **Gans-Goldfarb 2026**: é puramente econômico. Não tem ângulo político. Não há antecipação política, só estrutural.

- **Rogowski 1989**: é metodológico, sobre comércio. Estilo é herdado, mas conteúdo (Tipo A vs Tipo B) é distinto.

- **Kremer 1993**: é sobre development. Sem ângulo político.

---

## Recomendação ao autor

### Releitura prioritária (antes de remodelar)

1. **BGT 2021 (qjab034.pdf)** — releitura cuidadosa da Proposição 4 (p. 2391-95) e Online Appendix 3 (narrow groups). Determinar se a previsão "skill-biased shock → cultural identity → less redistribution" é geral ou específica. Se geral, IA-dem precisa argumentar contribuição via *trajetória* (Tipo B é diferente de skill-biased puro). [PRIORIDADE 1]

2. **Gans-Goldfarb 2026** — baixar PDF de https://www.nber.org/papers/w34639 e ler. Mapear exatamente: quais são as condições que geram bundling (threshold em q^M)? Há heterogeneidade entre workers? Há trajetória ou apenas comparação estática? [PRIORIDADE 1]

3. **A&R 2000 + correção de 2017** — leitura focada em: quais condições garantem que concessão temporária não é credível? Como o paper trata "ameaça revolucionária" como estado contingente? [PRIORIDADE 2]

4. **A&R 2006 cap. 8** — leitura focada em: middle class é parâmetro ou outcome? Há dinâmica? [PRIORIDADE 2]

### Leitura superficial (suficiente para citação contextual)

5. **A&R 2001 (AER)** — ler abstract e seção de equilibrium types. Suficiente para citação de "regime oscillation under high inequality". [PRIORIDADE 3]

6. **Kremer 1993** — ler abstract + intro + Section II (production function). Suficiente para genealogia. [PRIORIDADE 3]

7. **Rogowski 1989** — ler intro + cap. 1 (frame) + 1-2 capítulos históricos para entender estilo. Não precisa releitura técnica. [PRIORIDADE 3]

### Não-Tier-1 a adicionar à fila

- **Iversen-Soskice 2019** *Democracy and Prosperity* — risco de antecipação não trivial. Adicionar Tier 2.
- **Boix 2003** *Democracy and Redistribution* — alternativa a A&R; útil para contraste.
- **Acemoglu-Restrepo 2020 JPE** — para mostrar que robôs são Tipo A (substituição direta), não Tipo B.
- **Bénabou & Tirole 2006** ou outros sobre identity formation — para entender quão dependente IA-dem fica de BGT especificamente vs alternativas.

---

## Notas metodológicas

- BGT 2021 está em PDF local (qjab034.pdf) — leitura técnica feita das pp. 2371-2392.
- A&R 2000/2001/2006, Rogowski 1989, Kremer 1993, Gans-Goldfarb 2026: PDFs NÃO baixados localmente. Detalhes via web search (marcado [WEB]). **Recomendação**: baixar antes de remodelar.
- Um item ausente: Online Appendix do BGT, que tem provas detalhadas e Online Appendix 3 sobre narrow groups. Para releitura crítica, baixar do QJE.

## Sources (URLs consultadas)

- Gans & Goldfarb 2026 (NBER w34639): https://www.nber.org/papers/w34639
- Gans & Goldfarb 2026 (SSRN): https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6019718
- A&R 2000 (QJE 115/4): https://academic.oup.com/qje/article/115/4/1167/1820389
- A&R 2000 correção 2017: https://voices.uchicago.edu/jamesrobinson/files/2018/06/why_did_the_west_extend_the_franchise_-_a_correcti-15gjedh.pdf
- A&R 2001 (AER 91/4): https://www.aeaweb.org/articles?id=10.1257/aer.91.4.938
- Kremer 1993 (QJE 108/3): https://academic.oup.com/qje/article-abstract/108/3/551/1881767
- Rogowski 1989 (Princeton UP): https://press.princeton.edu/books/paperback/9780691023304/commerce-and-coalitions
- BGT 2021 (QJE 136/4, qjab034): https://academic.oup.com/qje/article/136/4/2371/6368349
- A&R 2006 (Cambridge UP): https://www.cambridge.org/core/books/economic-origins-of-dictatorship-and-democracy/3F29DF90519971B183CAA16ED0203507
