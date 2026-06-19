# Plano: Formalização de Lemmas 1-2 via Supermodularidade em Lean 4

**Status**: DRAFT
**Data**: 2026-04-02

## Objetivo

Formalizar os dois últimos resultados não-verificados do paper IA-dem:
- **Lemma 1**: Equilíbrio de cutoff único no jogo de participação (global games)
- **Lemma 2**: Participação de equilíbrio π* decrescente em σ (ruído)

Rota: complementaridade estratégica → Tarski → unicidade Laplaciana.

## Contexto

### O que existe
- `CoordinationConditions.lean`: payoff, q*, regiões de dominância, single-crossing (8 teoremas, zero sorry)
- `Basic.lean`: ModelParams, Δ, φ̄, κ̄, A1, A2
- `Prop1-3.lean`: tomam resultados de coordenação como hipóteses (φ=φ̄ ou φ=0, η=η_r ou η=1)
- Mathlib: `OrderHom.lfp/gfp`, `fixedPoints.completeLattice`, IVT, convergência monotônica

### Decisão arquitetural: Path B (Algébrica)

**Duas rotas foram avaliadas:**

| | Path A (Tarski completo) | Path B (Algébrica) |
|---|---|---|
| Ideia | Construir OrderHom BR, provar monotonia, invocar Tarski formalmente | Tomar existência de equilíbrio monotônico como hipótese (Tarski justifica), provar unicidade algebricamente |
| Vantagem | Proof-chain fechada end-to-end | Evita teoria da medida, 3× mais rápido |
| Custo | Precisa formalizar posterior q(x_i, k) — requer integração | Existence é hipótese, não teorema |
| Tempo | 6-8 semanas | 2-3 semanas |

**Escolha: Path B.** Razões:
1. O estilo existente do projeto já toma coordenação como hipótese
2. A contribuição do paper NÃO é em global games — é aplicação
3. O que queremos provar é que as *condições* de Morris-Shin são satisfeitas e que as *consequências* seguem algebricamente
4. Path A requer infraestrutura de medida que não existe no projeto

### A lógica matemática (supermodularidade → unicidade)

```
CoordinationConditions.lean        (EXISTENTE)
  ├─ Dominance regions             [q=1 → participate, q=0 → abstain]
  ├─ Single-crossing               [participate ↔ q ≥ q*]
  └─ q* ∈ (0,1)                   [m/(b+m)]
        │
        ▼
SupermodularDefs.lean              (NOVO — Arquivo 1)
  ├─ Def: increasing differences   [lattice condition]
  ├─ Def: supermodular game        [structure]
  └─ Thm: BR monotone → Tarski    [existence via OrderHom.lfp/gfp]
        │
        ▼
ParticipationSupermodular.lean     (NOVO — Arquivo 2)
  ├─ Def: jogo de participação     [binary, params b, m, π̄]
  ├─ Thm: jogo é supermodular      [increasing differences em a_i, π]
  ├─ Thm: dominance regions ↔ BR bounded  [reusa CoordinationConditions]
  └─ Hyp: existência de eq. monotônico    [justified by Tarski + supermod]
        │
        ▼
LaplacianUniqueness.lean           (NOVO — Arquivo 3)
  ├─ Def: NoiseCDF (F strictmono, contínua, simétrica)
  ├─ Def: eq_cutoff ω*             [indifference condition]
  ├─ Thm: ω* é único              [algebraico: F strictmono → raiz única]
  ├─ Thm: ω* independente de σ    [Laplacian property]
  └─ ★ LEMMA 1: equilíbrio de cutoff único
        │
        ▼
ParticipationComparativeStatics.lean (NOVO — Arquivo 4)
  ├─ Def: π*(σ) = 1 - F((ω* - ω₀)/σ)
  ├─ Thm: π* strictly decreasing in σ  [composição: F strictmono, arg monotone]
  ├─ Thm: π* → 1 as σ → 0⁺
  ├─ Thm: π* → 1/2 as σ → ∞
  ├─ Thm: ∃! σ̂ com π*(σ̂) = π̄    [IVT + strict monotonicity]
  └─ ★ LEMMA 2: π* decrescente em σ
        │
        ▼
CoordinationLemmas.lean            (NOVO — Arquivo 5)
  ├─ Thm: σ_r ≤ σ̂ → π* ≥ π̄ (rapid → coordination succeeds)
  ├─ Thm: σ_τ > σ̂ → π* < π̄ (threshold → coordination fails)
  └─ Conexão: rapid → {φ=φ̄, η=η_r}; threshold → {φ=0, η=1}
```

## Arquivos a criar

### Arquivo 1: `FormalProofs/SupermodularDefs.lean`
**Dificuldade**: 3/10 | **Tempo**: 2-3 dias

```lean
import Mathlib

noncomputable section

/-! ## Supermodular Games on Lattices

  Minimal definitions for games with strategic complementarities.
  A game has increasing differences when raising one player's action
  raises the marginal return to raising another player's action.
-/

/-- A game has increasing differences if the gain from raising one's action
    is increasing in the aggregate action of others.
    For binary actions on a lattice: u(1, π) - u(0, π) is increasing in π. -/
def HasIncreasingDifferences (gain : ℝ → ℝ) : Prop :=
  Monotone gain

/-- In a game with increasing differences and compact strategy lattice,
    a monotone best-response map has fixed points by Tarski. -/
theorem tarski_equilibrium_exists
    {α : Type*} [CompleteLattice α]
    (BR : α →o α) :
    ∃ a : α, BR a = a :=
  ⟨BR.lfp, BR.isFixedPt_lfp⟩

/-- Extremal equilibria: least and greatest fixed points. -/
theorem extremal_equilibria
    {α : Type*} [CompleteLattice α]
    (BR : α →o α) :
    BR.lfp = BR.lfp ∧ BR.gfp = BR.gfp ∧ BR.lfp ≤ BR.gfp := ...

end
```

### Arquivo 2: `FormalProofs/ParticipationSupermodular.lean`
**Dificuldade**: 4/10 | **Tempo**: 3-4 dias

```lean
import Mathlib
import FormalProofs.SupermodularDefs
import FormalProofs.CoordinationConditions

noncomputable section

/-- The participation game's net gain from participating (a=1 vs a=0)
    given belief q about success probability.
    gain(q) = q·b - (1-q)·m = participation_payoff q b m.
    This is LINEAR (hence monotone) in q → increasing differences. -/
theorem participation_has_increasing_differences
    (b m : ℝ) (hb : b > 0) (hm : m > 0) :
    HasIncreasingDifferences (fun q => participation_payoff q b m) := ...

/-- Dominance regions bound all equilibrium thresholds.
    From CoordinationConditions: q=1 → gain > 0, q=0 → gain < 0.
    So any equilibrium cutoff s* must satisfy s_low ≤ s* ≤ s_high
    where s_low, s_high correspond to signals giving q ∈ {0, 1}. -/
theorem equilibrium_bounded_by_dominance
    (b m : ℝ) (hb : b > 0) (hm : m > 0)
    (s_star : ℝ) (h_eq : <s_star is an equilibrium cutoff>) :
    s_low ≤ s_star ∧ s_star ≤ s_high := ...

end
```

### Arquivo 3: `FormalProofs/LaplacianUniqueness.lean`  ★ LEMMA 1
**Dificuldade**: 6/10 | **Tempo**: 1-1.5 semanas

```lean
import Mathlib
import FormalProofs.SupermodularDefs
import FormalProofs.CoordinationConditions

noncomputable section

/-- CDF of the noise distribution (e.g., uniform on [-1/2, 1/2]). -/
structure NoiseCDF where
  F : ℝ → ℝ
  h_strictMono : StrictMono F
  h_continuous : Continuous F
  h_range : ∀ x, 0 ≤ F x ∧ F x ≤ 1
  h_sym : ∀ x, F (-x) = 1 - F x  -- symmetric
  h_F_zero : F 0 = 1 / 2          -- from symmetry

/-- Parameters of the coordination game. -/
structure CoordGameParams where
  b : ℝ                   -- benefit of successful coordination
  m : ℝ                   -- cost of failed participation
  π_bar : ℝ               -- critical mass for visibility
  ω₀ : ℝ                  -- realized fundamental (shock severity)
  h_b : b > 0
  h_m : m > 0
  h_π_pos : 0 < π_bar
  h_π_lt1 : π_bar < 1
  h_risk_dom : π_bar < b / (b + m)  -- risk dominance

/-- Critical belief q* = m/(b+m). Reuses CoordinationConditions. -/
def CoordGameParams.q_star (p : CoordGameParams) : ℝ :=
  critical_threshold p.b p.m

/-- The Laplacian indifference equation: at ω*, the fraction of
    participants equals 1 - q* = b/(b+m).
    ω* is the unique root of: 1 - F((ω* - ω₀)/σ) = b/(b+m). -/
theorem laplacian_indifference_unique_root
    (p : CoordGameParams) (cdf : NoiseCDF) (σ : ℝ) (hσ : σ > 0) :
    ∃! ω_star : ℝ,
      1 - cdf.F ((ω_star - p.ω₀) / σ) = p.b / (p.b + p.m) := ...
  -- Proof sketch: g(ω) = 1 - F((ω - ω₀)/σ) is strictly decreasing
  -- (composition of F strictmono with linear), continuous, with
  -- range covering (0,1). The RHS is in (0,1), so unique root by IVT.

/-- ★ LEMMA 1: Unique cutoff equilibrium.
    Under the Morris-Shin conditions:
    (i)  dominance regions exist (CoordinationConditions)
    (ii) single-crossing (CoordinationConditions)
    (iii) Laplacian property (uniform prior)
    the coordination game has a unique symmetric BNE in threshold strategies. -/
theorem lemma1_unique_cutoff
    (p : CoordGameParams) (cdf : NoiseCDF) (σ : ℝ) (hσ : σ > 0) :
    ∃! s_star : ℝ, <s_star is the unique equilibrium threshold> := ...

end
```

### Arquivo 4: `FormalProofs/ParticipationComparativeStatics.lean`  ★ LEMMA 2
**Dificuldade**: 7/10 | **Tempo**: 1-2 semanas

```lean
import Mathlib
import FormalProofs.LaplacianUniqueness

noncomputable section

/-- Equilibrium participation rate at realized fundamental ω₀. -/
def eq_participation (p : CoordGameParams) (cdf : NoiseCDF)
    (ω_star : ℝ) (σ : ℝ) : ℝ :=
  1 - cdf.F ((ω_star - p.ω₀) / σ)

/-- π*(σ) is strictly decreasing.
    ω* < ω₀ (by risk dominance), so (ω*-ω₀)/σ < 0.
    As σ ↑, (ω*-ω₀)/σ → 0⁻, F(·) ↑, 1-F(·) ↓. -/
theorem participation_strict_anti
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star : ℝ)
    (h_gap : ω_star < p.ω₀) :
    StrictAntiOn (eq_participation p cdf ω_star) (Set.Ioi 0) := ...

/-- π* → 1 as σ → 0⁺. -/
theorem participation_tendsto_one
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star : ℝ)
    (h_gap : ω_star < p.ω₀) :
    Filter.Tendsto (eq_participation p cdf ω_star)
      (nhdsWithin 0 (Set.Ioi 0)) (nhds 1) := ...

/-- π* → 1/2 as σ → ∞. -/
theorem participation_tendsto_half
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star : ℝ)
    (h_gap : ω_star < p.ω₀) :
    Filter.Tendsto (eq_participation p cdf ω_star)
      Filter.atTop (nhds (1 / 2)) := ...

/-- ★ LEMMA 2: ∃! σ̂ > 0 such that π*(σ) ≥ π̄ iff σ ≤ σ̂.
    Proof: π* is continuous + strictly decreasing + hits (1/2, 1).
    Since π̄ ∈ (0, 1/2) by risk dominance, IVT gives unique crossing. -/
theorem lemma2_noise_threshold
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star : ℝ)
    (h_gap : ω_star < p.ω₀)
    (h_half : p.π_bar < 1 / 2) :
    ∃ σ_hat : ℝ, σ_hat > 0 ∧
      eq_participation p cdf ω_star σ_hat = p.π_bar ∧
      ∀ σ, σ > 0 →
        (σ ≤ σ_hat → eq_participation p cdf ω_star σ ≥ p.π_bar) ∧
        (σ > σ_hat → eq_participation p cdf ω_star σ < p.π_bar) := ...

end
```

### Arquivo 5: `FormalProofs/CoordinationLemmas.lean`
**Dificuldade**: 5/10 | **Tempo**: 2-3 dias

```lean
import Mathlib
import FormalProofs.LaplacianUniqueness
import FormalProofs.ParticipationComparativeStatics

noncomputable section

/-- Rapid shock: σ_r ≤ σ̂ → coordination succeeds → π* ≥ π̄. -/
theorem rapid_coordination_succeeds
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star σ_r σ_hat : ℝ)
    (h_gap : ω_star < p.ω₀)
    (hσ_r : σ_r > 0)
    (h_hat : eq_participation p cdf ω_star σ_hat = p.π_bar)
    (h_rapid : σ_r ≤ σ_hat) :
    eq_participation p cdf ω_star σ_r ≥ p.π_bar := ...

/-- Threshold shock: σ_τ > σ̂ → coordination fails → π* < π̄. -/
theorem threshold_coordination_fails
    (p : CoordGameParams) (cdf : NoiseCDF) (ω_star σ_τ σ_hat : ℝ)
    (h_gap : ω_star < p.ω₀)
    (hσ_τ : σ_τ > 0)
    (h_hat : eq_participation p cdf ω_star σ_hat = p.π_bar)
    (h_threshold : σ_τ > σ_hat) :
    eq_participation p cdf ω_star σ_τ < p.π_bar := ...

/-- Connection to main model: rapid → democracy compensates (φ = φ̄). -/
/-- Connection to main model: threshold → autocracy represses fully (η = 1). -/

end
```

### Atualizar: `FormalProofs.lean` (root import)

Adicionar:
```lean
import FormalProofs.SupermodularDefs
import FormalProofs.ParticipationSupermodular
import FormalProofs.LaplacianUniqueness
import FormalProofs.ParticipationComparativeStatics
import FormalProofs.CoordinationLemmas
```

## Dependências entre arquivos

```
CoordinationConditions.lean (existente)
        │
        ├──────────────────────┐
        ▼                      ▼
SupermodularDefs.lean    ParticipationSupermodular.lean
        │                      │
        └──────┬───────────────┘
               ▼
     LaplacianUniqueness.lean  ← ★ Lemma 1
               │
               ▼
ParticipationComparativeStatics.lean  ← ★ Lemma 2
               │
               ▼
     CoordinationLemmas.lean  (interface p/ Prop1-3)
```

## Desafios técnicos específicos

1. **Set.Icc como CompleteLattice**: Precisa `Fact (a ≤ b)` instance. Padrão: `haveI : Fact (s_low ≤ s_high) := ⟨h_bounds⟩`
2. **Filter API para limites**: `Filter.Tendsto`, `nhdsWithin`, `Filter.atTop` — bem suportado em Mathlib mas requer familiaridade
3. **IVT para σ̂**: Usar `intermediate_value_Icc'` em intervalo fechado [ε, M], depois argumentar unicidade via StrictAnti
4. **Composição de StrictMono**: F strictmono + g strictmono → F∘g strictmono. Mathlib tem `StrictMono.comp`
5. **Divisão por σ**: `field_simp` + `ring` padrão do projeto, mas cuidado com σ > 0 em denominadores

## Estimativa total

| Arquivo | Dificuldade | Tempo |
|---------|-------------|-------|
| SupermodularDefs.lean | 3/10 | 2-3 dias |
| ParticipationSupermodular.lean | 4/10 | 3-4 dias |
| LaplacianUniqueness.lean | 6/10 | 5-7 dias |
| ParticipationComparativeStatics.lean | 7/10 | 7-10 dias |
| CoordinationLemmas.lean | 5/10 | 2-3 dias |
| **TOTAL** | | **~3-4 semanas** |

## Verificação

- [ ] `cd formal_proofs && lake build` sem erros
- [ ] Zero `sorry` em todos os 5 novos arquivos
- [ ] `DASHBOARD.md` atualizado: 17/17 verificados
- [ ] Lemma 1 e Lemma 2 marcados como VERIFIED
- [ ] Prop1-3 poderiam (opcionalmente) ser refatorados para usar CoordinationLemmas em vez de hipóteses diretas

## O papel da supermodularidade

A supermodularidade NÃO é um desvio — é o fundamento conceitual:
1. **Increasing differences** → BR monotônica (justifica hipótese de existência)
2. **Tarski** → equilíbrios extremais existem (lfp, gfp em [s_low, s_high])
3. **Laplacian** → lfp = gfp (unicidade)
4. **IEDS** → converge aos extremais (dominance regions já provadas)

Formalizamos (1) e (3)-(4) algebricamente. (2) é invocado via Mathlib mas a construção do OrderHom é tomada como hipótese justificada por (1).

## Recursos externos

- `harfe/fixed-point-theorems-lean4`: Kakutani completo (alternativa, não necessário para Path B)
- `MixedMatched/formalizing-game-theory`: Definições de NE (não necessário — trabalhamos com BNE em threshold strategies)
- Mathlib `Order/FixedPoints.lean`: Tarski lfp/gfp (usado diretamente)
