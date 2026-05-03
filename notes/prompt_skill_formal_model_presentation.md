# Prompt: Criar skill `formal-model-presentation`

Cole este prompt numa nova sessão Claude Code (qualquer diretório).

---

Crie uma skill chamada `formal-model-presentation` que guie a apresentação de resultados de modelos formais em papers de Ciência Política / Relações Internacionais / Economia Política.

## Fontes a consultar

1. **5 heurísticas do PowerBayesianPersuasion** — salvas em memória do projeto IA-dem (`~/.claude/projects/-Users-manoelgaldino-Documents-DCP-Papers-IA-dem/memory/feedback_model_presentation_heuristics.md`). São:
   - Closed-form boundaries como fundação
   - Transições de fase como sites de riqueza analítica
   - Janelas paramétricas (open sets), não calibrações pontuais
   - Curvas piecewise com regiões anotadas
   - Provas de open set com tabelas de margem

2. **Comparação Hirsch & Shotts vs PowerBayesianPersuasion** — em `/Users/manoelgaldino/Documents/DCP/Papers/PowerBayesianPersuasion/quality_reports/`. Procure arquivos com "hirsch", "comparison", "benchmark", "exposition" no nome. Critérios de Hirsch & Shotts para boa exposição de modelos formais:
   - Model setup em ≤1.5 páginas de prosa fluente
   - Intuição verbal ANTES de cada resultado formal
   - Exemplo motivador ANTES do modelo completo
   - Provas no appendix (sem proof sketches no corpo)
   - Mapeamento explícito modelo → realidade (quem é H, quem é W, o que é θ)
   - Figuras calibradas com dados reais
   - Predições discriminantes que distinguem o modelo de alternativas

3. **Referências canônicas de escrita de teoria**:
   - Thomson (1999) "The Young Person's Guide to Writing Economic Theory" — notação, definições, provas
   - Board & Meyer-ter-Vehn (2018) "Writing Economic Theory Papers" — estrutura, resultados
   - Dixit (2015) "The Art of Modeling" — design, KISS, isolamento de mecanismo
   - Varian (1997/2016) "How to Build an Economic Model" — exemplos antes de generalizar

4. **Skills existentes para não duplicar** — em `~/.claude/skills/`:
   - `formal-model-design` — avalia design conceitual (Dixit/Varian/Board)
   - `formal-model-writing` — avalia apresentação técnica (Thomson/Board)
   - `formal-model-exposition` — avalia comunicação (Varian/Thomson/Board)
   - A nova skill NÃO é review — é GUIA DE IMPLEMENTAÇÃO. Diz ao autor COMO apresentar, não avalia o que já escreveu.

## O que a skill deve fazer

Quando invocada após o autor ter resultados formais prontos (proposições, lemas, corolários com provas), a skill guia a APRESENTAÇÃO desses resultados no paper:

### Checklist de apresentação (para cada resultado formal):

1. **Boundary derivation**: O resultado tem uma condição closed-form que o leitor pode interpretar sem resolver equações? Se não, derivar.
2. **Phase diagram**: Existe uma figura mostrando as regiões do espaço paramétrico onde o resultado opera? Se não, criar script.
3. **Parametric window**: O resultado é apresentado como open set ("holds for parameter ∈ [a,b]") ou como ponto ("with parameter = x")? Se ponto, generalizar.
4. **Margin table**: Existe uma tabela mostrando a margem de cada condição do resultado em relação ao seu boundary? Se não, criar.
5. **Verbal intuition BEFORE formal statement**: A intuição precede o enunciado formal? Se não, reordenar.
6. **Worked example**: Existe um exemplo numérico concreto ANTES da generalização? Se não, criar.
7. **Mapping to reality**: Os elementos do modelo estão explicitamente mapeados para entidades reais? Se não, adicionar parágrafo de mapping.
8. **Proof location**: A prova está no appendix (não no corpo como sketch)? Se não, mover.

### Output esperado:

Para cada resultado formal no paper:
- Diagnóstico: qual dos 8 itens está faltando
- Ação concreta: o que escrever/plotar/mover
- Exemplo de como ficaria (1-2 frases ou pseudocódigo do plot)

## Formato da skill

Seguir o formato padrão de skills em `~/.claude/skills/`. A skill deve:
- Ter frontmatter com name, description
- Ser invocável com `/formal-model-presentation paper.Rmd`
- Ler o manuscrito, identificar todos os resultados formais
- Aplicar o checklist de 8 itens a cada um
- Produzir relatório com diagnóstico + ações
- NÃO editar arquivos (apenas diagnosticar e recomendar)

## Referência de como criar skills

Use a skill `skill-creator:skill-creator` se disponível, ou consulte o formato de skills existentes em `~/.claude/skills/` como template.
