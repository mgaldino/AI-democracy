# Plano: Biblioteca Lean 4 para Jogos Supermodulares

**Status**: DRAFT (ideação — não aprovado para implementação)
**Data**: 2026-04-02

## Motivação

4 papers do portfólio usam jogos supermodulares / complementaridades estratégicas:
- IA-dem (global games, ação binária)
- DC Estático (mean-field, bifurcação pitchfork)
- DC Cross-Domain (2 domínios + spillover)
- Strategic Ratification (mean-field com λ_d)

Todos compartilham: (1) BR monotônica, (2) Tarski para existência, (3) análise unicidade vs multiplicidade. Uma biblioteca compartilhada evita refazer infraestrutura para cada paper.

## Pergunta central unificada

> Dado f : α →o α num CompleteLattice, quando lfp f = gfp f (único) vs lfp f < gfp f (múltiplos)?

### Como cada paper responde:

| Paper | Resposta | Mecanismo |
|---|---|---|
| IA-dem | Único (Laplacian) | Dominance regions + σ→0 → extremais coincidem |
| DC Estático | Depende de μ | μ < μ* → único; μ > μ* → bifurcação (3 FP) |
| DC Cross-Domain | Depende de ξ | Spillover pode quebrar ou restaurar unicidade |
| Strategic Ratification | Depende de λ_d | λ>0 → múltiplos (rede); λ<0 → único (free-riding) |

## Arquitetura da biblioteca

```
SupermodularGames/          ← Lean 4 package independente
│
├── lakefile.toml           ← Mathlib como dependência
├── lean-toolchain
│
├── SupermodularGames/
│   │
│   ├── Core/
│   │   ├── Defs.lean                 ← increasing differences, supermodular payoff
│   │   ├── MonotoneBR.lean           ← BR monotone em jogos supermodulares
│   │   ├── Tarski.lean               ← wrapper fino sobre Mathlib OrderHom.lfp/gfp
│   │   └── ExtremalEquilibria.lean   ← lfp ≤ gfp, FP formam lattice completo
│   │
│   ├── Uniqueness/
│   │   ├── Contraction.lean          ← f contração → único FP
│   │   ├── SingleCrossing.lean       ← f cruza identidade uma vez → único
│   │   ├── DominanceSolvable.lean    ← IEDS converge → lfp = gfp
│   │   └── Laplacian.lean            ← Global games: uniforme → único (IA-dem)
│   │
│   ├── Multiplicity/
│   │   ├── TippingPoints.lean        ← lfp < gfp: quando existem múltiplos FP
│   │   ├── SShape.lean              ← BR com formato S → 3 FP (DC)
│   │   └── Bifurcation.lean         ← Parâmetro μ cruza μ* → nasce/morre FP
│   │
│   ├── ComparativeStatics/
│   │   ├── Topkis.lean              ← Monotone CS: parâmetro ↑ → equilíbrios ↑
│   │   ├── Vives.lean               ← Complementos e substitutos
│   │   └── ParametricFP.lean        ← lfp(f_t) monotone em t
│   │
│   └── Applications/
│       ├── BinaryAction.lean         ← Lattice {0,1}, threshold strategies
│       ├── MeanField.lean            ← Contínuo de jogadores, agregação
│       └── GlobalGames.lean          ← Sinais ruidosos, NoiseCDF, π*(σ)
│
└── SupermodularGames.lean  ← root import
```

## Mapeamento: biblioteca → papers

### Core/ (serve TODOS os 4 papers)

**Defs.lean**:
```lean
/-- Increasing differences: ganho marginal de a_i cresce com ação agregada dos outros. -/
class HasIncreasingDifferences (α β : Type*) [Preorder α] [Preorder β]
    (u : α → β → ℝ) : Prop where
  incr_diff : ∀ a a' : α, a ≤ a' → Monotone (fun s => u a' s - u a s)

/-- Jogo supermodular: action lattice + increasing differences. -/
structure SupermodularGame where
  ActionSpace : Type*
  [actionLattice : CompleteLattice ActionSpace]
  AggregateSpace : Type*
  [aggPreorder : Preorder AggregateSpace]
  payoff : ActionSpace → AggregateSpace → ℝ
  [incr_diff : HasIncreasingDifferences ActionSpace AggregateSpace payoff]
```

**Tarski.lean** (thin wrapper):
```lean
/-- Existência: BR monotônica em lattice completo tem FP. -/
theorem equilibrium_exists (BR : α →o α) : ∃ a, BR a = a

/-- Extremais: least e greatest FP existem. -/
theorem extremal_eq (BR : α →o α) : IsFixedPt BR BR.lfp ∧ IsFixedPt BR BR.gfp

/-- Qualquer FP está entre os extremais. -/
theorem fp_between_extremals (BR : α →o α) (a : α) (ha : BR a = a) :
    BR.lfp ≤ a ∧ a ≤ BR.gfp
```

### Uniqueness/ (IA-dem + Strategic Ratification com λ<0)

**SingleCrossing.lean**:
```lean
/-- Se f : [a,b] → [a,b] é contínua, monotone, e f(x) - x é
    estritamente decrescente, então f tem exatamente um ponto fixo. -/
theorem unique_fp_of_strict_single_crossing
    (f : ℝ → ℝ) (a b : ℝ) (hab : a < b)
    (hf_mono : MonotoneOn f (Set.Icc a b))
    (hf_maps : MapsTo f (Set.Icc a b) (Set.Icc a b))
    (hf_cont : ContinuousOn f (Set.Icc a b))
    (h_cross : StrictAntiOn (fun x => f x - x) (Set.Icc a b)) :
    ∃! x ∈ Set.Icc a b, f x = x
```

**Laplacian.lean** (IA-dem específico mas reusável para qualquer global game):
```lean
/-- Sob prior uniforme, o cutoff de equilíbrio ω* satisfaz condição
    de indiferença com raiz única. -/
theorem laplacian_unique_cutoff (cdf : NoiseCDF) (target : ℝ)
    (ht : 0 < target ∧ target < 1) (σ : ℝ) (hσ : σ > 0) :
    ∃! ω, 1 - cdf.F ((ω - ω₀) / σ) = target
```

### Multiplicity/ (DC Estático + Strategic Ratification com λ>0)

**SShape.lean**:
```lean
/-- Se f : [0,1] → [0,1] tem formato S (convexa-côncava),
    f(0) > 0, f(1) < 1, e f'(m*) > 1 para algum m*,
    então f tem exatamente 3 pontos fixos. -/
theorem three_fp_of_s_shape
    (f : ℝ → ℝ) (hf_cont : ContinuousOn f (Set.Icc 0 1))
    (hf_maps : MapsTo f (Set.Icc 0 1) (Set.Icc 0 1))
    (hf_mono : MonotoneOn f (Set.Icc 0 1))
    (h_boundary_low : f 0 > 0)
    (h_boundary_high : f 1 < 1)
    (h_steep : ∃ m ∈ Set.Ioo 0 1, <derivative of f at m > 1>) :
    ∃ x₁ x₂ x₃ ∈ Set.Icc 0 1,
      f x₁ = x₁ ∧ f x₂ = x₂ ∧ f x₃ = x₃ ∧ x₁ < x₂ ∧ x₂ < x₃

/-- Bifurcação: ao variar parâmetro μ, FP nascem/morrem em pares. -/
theorem pitchfork_bifurcation
    (f : ℝ → ℝ → ℝ)  -- f(μ, x)
    (hf_smooth : <smoothness conditions>)
    (h_sym : ∀ μ, f μ (1/2) = 1/2)  -- symmetric FP always exists
    (h_deriv_cross : <∂f/∂x at (μ*, 1/2) crosses 1>) :
    <for μ > μ*, two new FP emerge symmetrically around 1/2>
```

### ComparativeStatics/ (TODOS os papers)

**Topkis.lean**:
```lean
/-- Monotone comparative statics: se f_t é monotone em t (pointwise),
    então lfp(f_t) e gfp(f_t) são monotones em t. -/
theorem lfp_monotone_in_param {α : Type*} [CompleteLattice α]
    {T : Type*} [Preorder T]
    (f : T → α →o α) (hf : ∀ a, Monotone (fun t => f t a)) :
    Monotone (fun t => (f t).lfp)
```

### Applications/ (especializações por paper)

**BinaryAction.lean** (IA-dem):
```lean
/-- No lattice {0,1}, estratégia monotone = threshold strategy. -/
-- Toda a análise de threshold strategies como caso especial

/-- Conexão com CoordinationConditions: regiões de dominância
    = bounds no threshold space. -/
```

**MeanField.lean** (DC, Ratification):
```lean
/-- Agregação mean-field: contínuo de jogadores com tipo i.i.d.
    Equilíbrio = ponto fixo do mapa agregado m ↦ Φ(m). -/
structure MeanFieldGame where
  TypeSpace : Type*
  action : TypeSpace → ℝ → Bool  -- type × aggregate → action
  aggregate : (TypeSpace → Bool) → ℝ  -- strategy profile → aggregate
  -- O mapa Φ(m) = aggregate(fun θ => action θ m)
```

## Priorização (o que construir primeiro)

### Fase 1: Core + Uniqueness (serve IA-dem imediatamente) — 3-4 semanas
- Core/Defs.lean, Core/Tarski.lean
- Uniqueness/SingleCrossing.lean, Uniqueness/Laplacian.lean
- Applications/BinaryAction.lean, Applications/GlobalGames.lean
- **Entregável**: Lemmas 1-2 do IA-dem formalizados

### Fase 2: Multiplicity (serve DC) — 3-4 semanas
- Multiplicity/TippingPoints.lean, Multiplicity/SShape.lean
- Applications/MeanField.lean
- **Entregável**: Teorema de unicidade (P3) e bifurcação (P4) do DC formalizados

### Fase 3: ComparativeStatics + Bifurcation (serve todos) — 2-3 semanas
- ComparativeStatics/Topkis.lean, ComparativeStatics/ParametricFP.lean
- Multiplicity/Bifurcation.lean
- **Entregável**: Monotone CS formalizados, μ* como bifurcação

### Fase 4: Cross-domain + Ratification — 2-3 semanas
- Extensões para DC Cross-Domain e Strategic Ratification
- **Entregável**: Spillover effects e sign-switching formalizados

**Total: ~10-14 semanas para cobertura completa dos 4 papers.**

## Decisão: package independente vs. dentro de IA-dem?

### Opção A: Subpasta de IA-dem (como agora)
- Prós: zero overhead de setup, lake build existente
- Contras: acoplado a um paper, difícil de reusar

### Opção B: Package Lean independente (RECOMENDADO)
- Localização: `/Users/manoelgaldino/Documents/DCP/SupermodularGames/`
- Próprio lakefile.toml com Mathlib como dep
- Cada paper importa como dependência Lake:
  ```toml
  [[require]]
  name = "SupermodularGames"
  path = "../../SupermodularGames"
  ```
- Prós: reusável, testável independentemente, publicável
- Contras: setup inicial (30 min), precisa manter compatibilidade de Mathlib version

### Opção C: Repositório GitHub separado
- Publicável como contribuição à comunidade Lean
- Prós: visibilidade, citável, outros podem contribuir
- Contras: overhead de manutenção

**Recomendação: começar com B (local), migrar para C quando maduro.**

## Papers que NÃO se beneficiam

- **PowerBayesianPersuasion**: Bayesian persuasion + Baron-Ferejohn. Não é supermodular — requer técnicas de design de informação (concavification). Biblioteca separada se for formalizar.
- **Modelo formal (corruption)**: Moral hazard dinâmico. Requer programação dinâmica, não lattice theory.

## O que isso muda no plano do IA-dem

Se criarmos o package independente, os 5 arquivos do plano anterior migram:
- `SupermodularDefs.lean` → `SupermodularGames/Core/Defs.lean` + `Core/Tarski.lean`
- `ParticipationSupermodular.lean` → `SupermodularGames/Applications/BinaryAction.lean`
- `LaplacianUniqueness.lean` → `SupermodularGames/Uniqueness/Laplacian.lean`
- `ParticipationComparativeStatics.lean` → `SupermodularGames/Applications/GlobalGames.lean`
- `CoordinationLemmas.lean` → permanece em IA-dem (paper-specific interface)

O IA-dem importaria a biblioteca e só teria o "último mile" de conexão com ModelParams.
