# Parecer de Design do Modelo (Dixit / Varian / Board) — v2

**Data**: 2026-03-27
**Manuscrito avaliado**: model/03_formal_model.md
**Score anterior (sketch)**: 5/10
**Score atual**: 7.5/10

## O modelo em uma frase

Modelo de dois períodos onde a coordenação de trabalhadores expostos a automação tem efeitos opostos sobre democracias (facilita compensação) e autocracias (degrada repressão), produzindo fragilidade cruzada: cada regime é mais frágil ao tipo de choque em que o outro é resiliente.

## Tipo de contribuição (Board & Meyer-ter-Vehn)

**Pergunta nova + Força política isolada + Predições empíricas novas.** A interação trajetória de automação × tipo de regime não foi formalizada. A força isolada é a assimetria no efeito da coordenação: positiva para democracias (canaliza em compensação), negativa para autocracias (degrada repressão). As predições empíricas são novas e testáveis. Não é contribuição técnica nem formalização de intuição existente: o resultado cruzado é genuinamente novo.

## Avaliação por dimensão

### MD1. Qualidade da pergunta — Excelente

Puzzle real: "Qual regime é mais frágil frente à automação por IA?" é uma pergunta que o mundo real está fazendo (EUA vs. China). A literatura formal de estabilidade de regimes (Acemoglu & Robinson 2006, Boix 2003, Svolik 2012) trata choques econômicos como uniformes. Nenhum modelo distingue trajetórias.

Originalidade: A distinção por *forma da trajetória* é genuinamente nova na teoria formal de regimes. O resultado cruzado não foi articulado antes, nem formalmente nem informalmente. A intuição de que automação *gradual* é mais perigosa para democracias que automação *rápida* é contraintuitiva e nova.

Teste de interesse: "A IA é mais perigosa para democracias ou autocracias?" passa o teste de Varian.

### MD2. Simplicidade e KISS — Excelente

5 premissas (A1–A5), escolha binária (M/R), dois períodos, dois regimes → 6 proposições com provas curtas. Enunciável em 1–2 páginas.

Teste Schelling-Spence: remover η elimina resultado cruzado (essencial); remover 2 períodos elimina timing (essencial); remover comparação de regimes elimina a pergunta (essencial). N (não-expostos) não aparece em nenhuma equação formal — eliminável da apresentação.

4 parâmetros efetivos: Δ, L, κ₀, η_R. Todos fazem trabalho analítico.

### MD3. Isolamento do mecanismo — Adequado (tendendo a Excelente)

Mecanismo isolado: coordenação de E como variável mediadora com efeitos opostos sobre os dois regimes. UMA variável, DOIS efeitos, UM resultado cruzado.

Ressalva: A coordenação não é formalmente modelada. A3 (compensação reativa) e A4 (η variável) são assumidas, não derivadas de jogo entre atores. Bem justificadas narrativamente e stark no sentido de Dixit, mas não microfundadas.

### MD4. Riqueza de insights — Rica

1. Resultado cruzado (P3) — contraintuitivo e publicável
2. Welfare gap = κ̄ (P4) — elegante
3. Tipologia de 3 autocracias (Corolário 1) — mapeamento empírico direto
4. Extensão φ₀ (§6.2) — welfare state ≈ κ₀ como seguro contra choques delayed (insight surpreendente)
5. Duas tragédias simétricas (§6.4) — insight transferível
6. η_R como parâmetro-chave (P6) — empiricamente estimável
7. Generalização além de IA (§6.5) — framework para resiliência institucional

### MD5. Tipo de contribuição — Múltipla e convincente

Pergunta nova + Força política isolada + Predições empíricas novas + Nova lente conceitual.

### MD6. Processo de construção — Maduro

Progressão v1 → v2 → geral documentada. Fracasso do v1 registrado. Baseline + 5 extensões separados.

## Veredicto geral

Salto substancial do sketch (5/10) para modelo resolvido (7.5/10). O resultado cruzado é genuinamente interessante, contraintuitivo, e formalmente limpo. Principal ponto fraco: modelo é decision-theoretic (A3 e A4 assumidas, não derivadas de jogo). Segundo ponto: instrumentos são regime-específicos por construção.

## Sugestões construtivas (priorizadas)

1. **Microfundar A3** — modelo de votação: N decide sobre taxação τ. Quando ℓ₁=0, custo de instabilidade percebido=0 → N veta → φ=0. Derivar A3 como equilíbrio.
2. **Microfundar η (A4)** — modelo de coordenação: E decide se participa de revolta. Custo de coordenação depende do tipo de choque. Derivar η como resultado de equilíbrio.
3. **Eliminar N da apresentação formal** — W como parâmetro, justificar A3 diretamente.
4. **Extensão com instrumentos mistos** — ambos os regimes podem compensar e reprimir. Mostrar que especialização emerge endogenamente. (Futuro.)
5. **Desenvolver extensão φ₀ formalmente** — welfare state como seguro. Proposição 7 com prova e discussão empírica. (No paper.)
6. **Posicionar vs. Svolik (2012)** — problema de agência (Svolik) vs. problema de contenção (este modelo). Mecanismos complementares.
