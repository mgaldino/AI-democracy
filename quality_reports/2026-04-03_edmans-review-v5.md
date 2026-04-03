# Carta Editorial — Framework Edmans v5 (Contribution, Execution, Exposition)

## Decisão: R&R minor

## Scores consolidados

| Dimensão     | Score | Rating   |
|-------------|-------|----------|
| Contribution | 7.0/10  | Adequada-Boa |
| Execution    | 7.5/10  | Boa |
| Exposition   | 7.5/10  | Boa |
| **Global**   | **7.3/10** | **Bom** |

## Síntese editorial

O paper faz uma contribuição real e oportuna: o resultado de crossed fragility é genuinamente novo, surge da composição não-óbvia de blocos existentes, e gera predições direcionais testáveis sobre qual tipo de regime é vulnerável a qual tipo de choque. A tipologia de cinco tipos e a equivalência funcional welfare state/repressão são resultados citáveis e policy-relevant.

A principal força é a execução técnica: o modelo é parcimonioso (um primitivo, um equilíbrio, dois mapas institucionais), a cadeia inferencial é transparente, e a verificação em Lean 4 dá confiança na correção formal. A principal fraqueza é a distância premissas-conclusões: A6 (separação de trajetórias) e A7 (timing institucional) fazem muito do trabalho pesado, e as continuation maps são simetricamente opostas por construção, o que torna o crossing quase inevitável uma vez aceitas as premissas. O paper precisa ser mais explícito sobre o que o modelo exclui.

Os três pareceres convergem em três pontos: (1) P7/Corollary 3 devem ir para apêndice; (2) σ endógeno ao tipo de regime é uma limitação não discutida; (3) a Seção 2 cria redundância com a introdução. O parecerista de Exposition sugere eliminar a Seção 2 inteiramente — discordo, dado que ela foi adicionada justamente para atender a prática standard em CP formal (ver Bonomi et al. QJE, Goldstein JOP), mas concordo que a introdução e a Seção 2 precisam ser diferenciadas mais claramente para evitar a sensação de repetição.

## Hierarquia Edmans aplicada

Contribution (7.0) é o gargalo. O resultado é interessante e não-trivial, mas não transforma fundamentalmente como entendemos estabilidade de regime — é mais "nova lente produtiva" do que "revolução conceitual". Execution (7.5) é sólida mas limitada pela curta distância premissas-conclusões. Exposition (7.5) é boa, com problemas localizados (redundância, P7 no texto principal).

A contribuição é forte o suficiente para justificar publicação em JOP, BJPS, ou journals especializados em economia política. Para APSR/AJPS, o paper precisaria de: (a) microfundamentação parcial de σ, ou (b) componente empírico descritivo, ou (c) extensão que enriqueça o mecanismo (e.g., σ endógeno ao regime).

## Prioridades para revisão

1. **Mover P7/Corollary 3 para apêndice** — consenso unânime dos três pareceristas.
2. **Discutir endogeneidade de σ ao tipo de regime** — autocracias podem aumentar σ via censura/vigilância; democracias podem reduzi-lo via imprensa livre/sindicatos. Reconhecer e discutir direção do bias.
3. **Explicitar o que o modelo exclui** — sob quais condições o modelo *não* geraria crossed fragility? Resposta: quando continuation maps não são simetricamente opostas (regimes com instrumentos mistos). Isso ilumina os limites e fortalece a contribuição.
4. **Corrigir "desmobilizes" → "demobilizes"** e fazer proofread completo com falante nativo.
5. **Tornar abstract mais preciso** — substituir "testable predictions about which countries..." por predições específicas com parâmetros.

## Recomendação estratégica ao autor

O paper está em boa posição para submissão a **JOP ou BJPS** com as revisões de polish já implementadas nesta sessão + as 5 prioridades acima. Para esses journals, o nível atual de contribuição e execução é competitivo. Para APSR/AJPS, o paper precisaria de fortalecimento adicional (microfundamentação de σ ou componente empírico) que representaria trabalho substantivo além de uma revisão.

Recomendação: submeter a JOP/BJPS após implementar as 5 prioridades (estimativa: 1-2 dias de trabalho). Guardar a microfundamentação de σ e a extensão de σ endógeno (Paper 2: surveillance) como agenda de pesquisa futura, não como requisito para esta submissão.

---

## Parecer completo — Contribution

### Score: 7/10

### Resumo da contribuição alegada

O paper desenvolve um modelo formal mostrando que a *trajetória* da automação por IA determina qual tipo de regime é mais frágil, gerando "crossed fragility": democracias estáveis sob deslocamento rápido mas frágeis sob threshold, autocracias com o padrão inverso. O welfare state funciona como seguro institucional equivalente à repressão, com welfare estritamente superior.

### Avaliação por dimensão

**Novidade [Adequada]**: O resultado central é genuinamente novo — a composição global games + trajetórias + regimes não foi articulada previamente. Mas a intuição subjacente (choques uniformes facilitam coordenação) é familiar na literatura de ação coletiva. O Bayesian update do leitor é moderado.

**Importância [Adequada]**: Tópico de primeira ordem (IA + estabilidade de regime). Tipologia é útil e policy-relevant. Mas o paper é puramente teórico e a prescrição principal ("invista em welfare state antes da crise") não é especialmente contraintuitiva. A fragilidade democrática depende criticamente de A7, que é premissa sobre timing, não resultado do modelo.

**Adequação ao escopo [Adequada]**: Bibliografia predominantemente CP/economia política. Global games pode alienar parte da audiência generalista, mas Seção 2 mitiga.

**Generalizabilidade [Forte]**: A lógica se aplica a qualquer choque que varie na uniformidade de impacto. Transferível a crises financeiras, clima, demografia.

**Trade-offs [Parcial]**: Welfare state como costless (reconhecido mas não formalizado). Benefícios da automação ausentes. Heterogeneidade dentro de N ausente.

**Hipóteses [Claras e direcionais]**: Ponto forte. P1-P6 são todas condicionais e direcionais com previsões precisas e refutáveis.

### Sugestões construtivas

1. Endogenizar σ parcialmente (micro-sketch em apêndice).
2. Incluir componente empírico descritivo (mapear países na tipologia).
3. Discutir resposta política de bloquear automação.
4. Mover P7 para apêndice; promover Remarks a Corollaries.

---

## Parecer completo — Execution

### Score: 7.5/10
### Tipo: Teórico

### Resumo da estratégia

Importa trajetórias econômicas como premissa, modela coordenação via global games (σ → π*), e deriva respostas institucionais opostas a partir de um único objeto de equilíbrio processado por continuation maps regime-específicas.

### Avaliação por dimensão

**T.1 Distância premissas-conclusões [6.5/10]**: A6 faz trabalho excessivo (assume separação que é quase o resultado). Continuation maps são simetricamente opostas por construção — o modelo não *poderia* gerar resultado diferente. A7 é premissa forte para P1(b). Aspectos positivos: separação limpa economia/política, exemplo numérico, verificação Lean.

**T.2 Parcimônia [8.5/10]**: Ponto mais forte. Um primitivo (σ), um equilíbrio (π*), dois mapas. Extensão welfare state é orgânica. P7 dilui parcimônia (mover para apêndice).

**T.3 Caminho causal [7.5/10]**: Elos σ→π* e π*→{φ,η} são limpos. Vulnerabilidade: σ pode ser endógeno ao tipo de regime (autocracias manipulam informação, democracias agregam via imprensa). Não discutido no manuscrito. A7 também é exógena.

### Sugestões construtivas

1. Explicitar o que o modelo exclui.
2. Discutir endogeneidade de σ ao regime.
3. Mover P7 para apêndice.
4. Fortalecer microfundamentação de A6.
5. Endogenizar φ₀ como decisão de investimento (extensão futura).

---

## Parecer completo — Exposition

### Score: 7.5/10

### Avaliação por dimensão

**Clareza [Boa]**: Escrita limpa e competente. Significância substantiva forte (exemplo numérico, κ̄ como número memorável). Problemas: "desmobilizes" (erro L1), "fragility" sem definição operacional até Seção 3, "the same AI technology" impreciso (são trajetórias, não tecnologias).

**Extensão [Adequado, com ressalvas]**: Intro eficiente (~5pp). Seção 2 cria redundância com intro (mecanismo apresentado 3 vezes antes dos resultados). P7/calibração back-of-the-envelope diluem segunda metade. Footnotes adequadas (~1/5pp).

**Citações [Precisas]**: 13 referências, enxuto e disciplinado. Todas as citações são precisas e funcionais. Sem bibliografia inflada, mis-citações, ou citações estratégicas.

### Top 5 sugestões

1. Diferenciar mais claramente intro vs. Seção 2 (intro = resultado + gap; Seção 2 = building blocks do modelo). Evitar repetição.
2. Mover P7/Corollary 3 para apêndice.
3. Adicionar definição operacional de "fragility" na introdução.
4. Corrigir "desmobilizes" → "demobilizes"; proofread com nativo.
5. Abstract mais preciso no final (predições específicas com parâmetros).
