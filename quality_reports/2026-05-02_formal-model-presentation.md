# Formal Model Presentation Diagnostic

**Paper:** paper.Rmd ("The Prosperity Trap")
**Date:** 2026-05-02
**Results analyzed:** 10 (L0, L1, R1, P1, P2, P3, P4, C1, P5, Rk2)
**Checklist items assessed:** 90 (10 × 9)

## Summary statistics
- Items PRESENT: 35/90 (39%)
- Items PARTIAL: 21/90 (23%)
- Items MISSING: 29/90 (32%)
- Items N/A: 5/90 (6%)
- **Most common gap: Comparative statics (Item 2) — MISSING in 7/10 results**
- **Second most common gap: Margin table (Item 5) — MISSING in 10/10 results**
- **Third most common gap: Phase/region diagram (Item 3) — MISSING in 7/10 results**

---

## Per-Result Diagnostics

### L0: Existence and uniqueness of cutoff equilibrium

**Statement:** Under A1–A3, at least one cutoff equilibrium exists; it is unique for σ sufficiently small.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PARTIAL | "σ sufficiently small" is not quantified. Derive an explicit upper bound on σ relative to state separation min|ω_t(θ) − ω_t(θ')|. |
| 2 | Comparative statics | MISSING | How does s_x* move with C_x, σ, δ, B? At minimum, derive ∂s*/∂C_x (higher cost → higher cutoff → less protest). |
| 3 | Phase/region diagram | MISSING | Low priority for a technical lemma. Consider a figure in appendix showing how s* varies with σ. |
| 4 | Parametric window | MISSING | Quantify: "uniqueness holds for σ < [bound]". With baseline σ = 0.10 and min state separation ω_R − ω_{T1} = 0.25, what is the bound? |
| 5 | Margin table | MISSING | Show that baseline σ = 0.10 satisfies the uniqueness condition with positive margin. |
| 6 | Verbal intuition before | PARTIAL | The paragraph before L0 provides some context but doesn't explain WHY cutoff equilibria exist or what drives uniqueness. Add 2 sentences: "Workers with higher signals are more pessimistic about automation, generating higher expressive value and stronger incentive to protest. This monotonicity ensures a cutoff structure." |
| 7 | Worked example | PARTIAL | The numerical example in §3.8 implicitly uses L0 but doesn't show the cutoff value s*. |
| 8 | Mapping to reality | N/A | Technical existence result. |
| 9 | Proof location | PARTIAL | Proof sketch in main text. Full proof should be in appendix. The "sketch" label is honest, but for CP/IR outlet, move entirely to appendix with a sentence: "The equilibrium exists and is unique (Appendix A.0)." |

**Comparative statics gap analysis:**
- Parameters analyzed: none
- Parameters NOT analyzed: C_x (→ ∂s*/∂C_x > 0: higher cost raises threshold), σ (→ ∂s*/∂σ ambiguous: noisier signals), δ (→ ∂s*/∂δ < 0: more forward-looking → more protest), B (→ ∂s*/∂B > 0: better compensation → less protest), ω_t (→ ∂s*/∂ω_t < 0: worse conditions → more protest)

**Priority actions:**
1. Move proof sketch to appendix. Replace with one-line reference.
2. Quantify "sufficiently small σ" with an explicit bound.
3. Add 2 sentences of verbal intuition before the statement.

---

### L1: Dictator's dilemma

**Statement:** ω̄_A(σ_A) increasing in σ_A; for σ_A ∈ (σ̲, σ̄), elite misses rapid but sees threshold.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PRESENT | ω̄_A(σ_A) = ω_0 + g(σ_A), with explicit σ̲ and σ̄ derived from primitives. Clean and interpretable. |
| 2 | Comparative statics | PARTIAL | Effect of σ_A is shown (it's the content of the lemma). But effects of ω_0, α_1, ω_R, ω_{T2} on the sweet spot interval (σ̲, σ̄) are not analyzed. E.g., ∂σ̲/∂ω_R < 0 (higher rapid displacement narrows the interval from below). |
| 3 | Phase/region diagram | MISSING | Create a figure: x-axis = σ_A, y-axis = ω. Plot ω̄_A(σ_A) as a curve. Shade region between ω_R and ω_{T2}. Label "elite misses rapid" below curve, "elite sees threshold" above. Mark σ̲ and σ̄ on x-axis. This is the KEY figure for the dictator's dilemma. |
| 4 | Parametric window | PARTIAL | Interval (σ̲, σ̄) stated analytically but not computed numerically. With baseline: σ̲ = (0.30 − ω_0)/α_1, σ̄ = (0.60 − ω_0)/α_1. Compute and report. |
| 5 | Margin table | MISSING | At baseline σ_A = 0.15: compute ω̄_A, margin from ω_R (how far above), margin from ω_{T2} (how far below). Show both margins are strictly positive. |
| 6 | Verbal intuition before | PRESENT | Extensive verbal explanation in §2.2 (dictator's dilemma) and §3.4 (deriving the evidence threshold). Well done. |
| 7 | Worked example | PRESENT | Numerical example shows P(approve|ω_R) < 1/2, P(approve|ω_{T2}) > 1/2. Specific probabilities (25% vs 91%) are in the abstract. |
| 8 | Mapping to reality | PRESENT | Mapped to selectorate size, subordinate reporting, censored media, absence of independent statistics. Concrete and vivid. |
| 9 | Proof location | PRESENT | Proof is in the lemma statement, concise and appropriate (3 lines). |

**Comparative statics gap analysis:**
- Parameters analyzed: σ_A
- Parameters NOT analyzed: ω_0 (→ ∂σ̲/∂ω_0 = −1/α_1 < 0: lower base threshold widens interval), α_1 (→ ∂σ̲/∂α_1 < 0: less noise sensitivity widens interval), ω_R (→ ∂σ̲/∂ω_R = 1/α_1 > 0: higher rapid displacement narrows from below), ω_{T2} (→ ∂σ̄/∂ω_{T2} = 1/α_1 > 0: higher threshold shock widens from above)

**Priority actions:**
1. **Create the σ_A vs ω region diagram** — this is the most impactful missing figure for L1.
2. Compute the parametric window numerically for the baseline.
3. Add a Remark in appendix with comparative statics on ω_0, α_1.

---

### R1: Absorptive composition

**Statement:** Ω₂^R = ω_R(2 − ω_R), Ω₂^T = ω_{T1} + (1 − ω_{T1})ω_{T2}.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PRESENT | Explicit formulas, interpretable. |
| 2 | Comparative statics | MISSING | ∂Ω₂^R/∂ω_R = 2(1 − ω_R) > 0, ∂Ω₂^T/∂ω_{T2} = 1 − ω_{T1} > 0, ∂Ω₂^T/∂ω_{T1} = 1 − ω_{T2} > 0 (when ω_{T2} < 1). State these — they're mechanical but useful. |
| 3 | Phase/region diagram | MISSING | Low priority for a mechanical identity. Could plot Ω₂ as function of ω_R and ω_{T2} for context. |
| 4 | Parametric window | N/A | Identity, holds always. |
| 5 | Margin table | MISSING | Low priority. Could show Ω₂^T − Ω₂^R = 0.11 at baseline. |
| 6 | Verbal intuition before | PARTIAL | Intuition comes AFTER the proof, not before. Add 1 sentence before: "Because displacement is absorbing, second-period displacement depends on who survived period 1." |
| 7 | Worked example | PRESENT | 0.51 and 0.62 computed explicitly. |
| 8 | Mapping to reality | PARTIAL | Brief note that threshold produces more total displacement. Could add: "The absorptive structure means that the first workers displaced under rapid in t=1 are still displaced in t=2, accumulating the stock." |
| 9 | Proof location | PRESENT | 1-line proof, appropriate for a remark. |

**Priority actions:**
1. Add 1 sentence of verbal intuition BEFORE the formal statement.
2. State the comparative statics on ω_R and ω_{T2} (mechanical but shows which parameters lever Ω₂).

---

### P1: Democratic fragility pattern

**Statement:** Democracy stable under rapid, unstable under threshold.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PARTIAL | Conditions are qualitative (ω_R > ω̄_D, π > π̄_D^fall). The "stability" condition is not expressed as a single interpretable inequality on primitives. Derive: "Democracy is stable under rapid iff [condition on C_D, ω_R, B, δ, π̄_D^fall]." |
| 2 | Comparative statics | MISSING | The comparative statics table (§4.5) lists effects informally. But there are no formal Remarks with proofs. For P1, which parameters widen/narrow the stability margin? E.g., how does ∂(stability margin)/∂B look? Higher B → lower v → more stable. |
| 3 | Phase/region diagram | MISSING | Create a figure: x-axis = ω_R, y-axis = C_D (or δ, or B). Shade the region where democracy survives rapid. This shows the reader WHERE in parameter space the result operates. Like Kenkel & Paine Figure 3. |
| 4 | Parametric window | MISSING | Over what range of C_D does democracy survive rapid? Over what range of ω_R? State explicitly. |
| 5 | Margin table | MISSING | At baseline: what is π_1 vs π̄_D^fall? What is the margin? Show stability is strict, not knife-edge. |
| 6 | Verbal intuition before | PRESENT | Section 2.3 provides 2 full paragraphs of verbal walkthrough for each scenario. Excellent. |
| 7 | Worked example | PRESENT | Section 3.8 walks through all four scenarios with specific numbers. |
| 8 | Mapping to reality | PRESENT | Voice mechanism, legislative process, prosperity trap — all mapped to real-world institutions. |
| 9 | Proof location | PARTIAL | Proof is in main text (5 lines). Should be in appendix for a CP/IR paper. Replace with: "Proof. See Appendix A.X." |

**Comparative statics gap analysis:**
- Parameters analyzed (informally, in table): C_D (via π̄_D^fall), B, δ, γ
- Parameters NOT analyzed formally: ω_R (how high can it go before democracy also falls?), σ (signal noise), π̄_D^comp (voice trigger threshold), ω_{T1} (how low must it be for prosperity trap?)

**Priority actions:**
1. **Create a region diagram** — e.g., (ω_R, C_D) plane with shaded stability region. Most impactful missing item.
2. Convert the informal comparative statics table entries for P1 into a formal Remark with proofs in appendix.
3. Move proof to appendix.
4. Derive an explicit stability condition as a closed-form inequality.

---

### P2: Autocratic fragility pattern

**Statement:** Autocracy unstable under rapid, stable under threshold.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PARTIAL | Same issue as P1. "ω_R < ω̄_A" is clean, but the full stability condition also requires π > π̄_A^fall, which depends on C_A, Ω₂, v. Derive a single condition. |
| 2 | Comparative statics | MISSING | Same gap. Formalize the table entries for P2. |
| 3 | Phase/region diagram | MISSING | Create: (ω_R, C_A) plane, shade instability region. Or (σ_A, ω_R) plane, showing the dictator's dilemma zone. |
| 4 | Parametric window | MISSING | Over what range of C_A is autocracy unstable under rapid? (This is partly answered by C1, but not for P2 directly.) |
| 5 | Margin table | MISSING | At baseline: P(approve|ω_R) = ? (< 1/2 by how much?), π vs π̄_A^fall = ? (exceeds by how much?) |
| 6 | Verbal intuition before | PRESENT | Section 2.3, excellent. |
| 7 | Worked example | PRESENT | Section 3.8. |
| 8 | Mapping to reality | PRESENT | Elite bubble, decree, Svolik (2012). |
| 9 | Proof location | PARTIAL | Proof in main text. Move to appendix. |

**Comparative statics gap analysis:**
- Same as P1 but for autocratic parameters: σ_A (covered by P5), C_A (covered by C1), ω_R, B, π̄_A^fall
- NOT analyzed: interaction between σ_A and C_A (do they reinforce or substitute?)

**Priority actions:**
1. Create a region diagram for autocratic instability.
2. Formalize comparative statics as Remark in appendix.
3. Move proof to appendix.

---

### P3: Crossed fragility

**Statement:** There exist parameter ranges such that democracy and autocracy exhibit opposite fragility patterns.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PARTIAL | Five conditions listed but not consolidated into a single set of parameter inequalities. The reader cannot quickly check whether a given parameterization satisfies crossed fragility. |
| 2 | Comparative statics | MISSING | Which parameters widen/narrow the set of parameterizations where crossed fragility holds? P5 analyzes σ_A but not γ, B, δ, π̄ thresholds. |
| 3 | Phase/region diagram | MISSING | This is the MOST IMPORTANT missing figure in the paper. Create a 2D region plot (e.g., (C_A, σ_A) plane, or (ω_R, ω_{T2}) plane) with the crossed fragility region shaded. Table 3 is a 2×2 verbal summary, not a region diagram. |
| 4 | Parametric window | PARTIAL | "Open set in parameter space" claimed but not exhibited. The numerical example gives ONE point. Following the PowerBayesianPersuasion pattern: "Crossed fragility holds for C_A ∈ [a,b], σ_A ∈ [c,d], ..." |
| 5 | Margin table | MISSING | For the baseline parameterization, show the margin of each of the 5 conditions. How far is each from its boundary? This is the most concrete way to show the result is not knife-edge. |
| 6 | Verbal intuition before | PRESENT | Section 2 (entire section) is a 4-page verbal walkthrough. Among the best in the paper. |
| 7 | Worked example | PRESENT | Section 3.8 with Table 2. Well done. |
| 8 | Mapping to reality | PRESENT | Table 3 with mechanism per cell, mapped to voice/decree/bubble. |
| 9 | Proof location | PARTIAL | Proof in main text (conditions (i)–(v)). Move formal proof to appendix; keep only the 2×2 table and verbal summary in main text. |

**Comparative statics gap analysis:**
- Parameters analyzed: σ_A (via P5), C_A (via C1)
- Parameters NOT analyzed for crossed fragility: γ (prosperity trap depth), B (compensation level), δ (discount), ω_R and ω_{T2} (shock magnitudes), π̄_D^fall and π̄_A^fall (resilience thresholds), p_R/p_T/p_N (priors)

**Priority actions:**
1. **CREATE A REGION DIAGRAM for crossed fragility** — highest-priority missing item in the entire paper. Show the crossed fragility region in (C_A, σ_A) space or (ω_R, ω_{T2}) space.
2. **Add a margin table** showing each of the 5 conditions at baseline, its value, its boundary, and the margin.
3. **State the parametric window** explicitly: for each key parameter, the interval over which crossed fragility holds.
4. Formalize comparative statics for γ, B, δ on the crossed fragility region.
5. Move proof to appendix.

---

### P4: Welfare advantage of democratic stability

**Statement:** Conditional on survival, workers are better off in democracy: gap = (1−B)(Ω₂^T − Ω₂^R) > 0.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PRESENT | Clean formula, interpretable. Each factor has economic meaning: (1−B) = uncompensated fraction, (Ω₂^T − Ω₂^R) = composition difference. |
| 2 | Comparative statics | MISSING | How does the welfare gap change with B? ∂gap/∂B = −(Ω₂^T − Ω₂^R) < 0: better compensation narrows the gap. With ω_R? With ω_{T2}? State these — they're one-line derivatives. |
| 3 | Phase/region diagram | MISSING | Low priority. Could plot welfare gap as function of B and ω_{T2}. |
| 4 | Parametric window | MISSING | For what range of B is the gap > 0? Always (since Ω₂^T > Ω₂^R and B < 1). State this. |
| 5 | Margin table | MISSING | Gap = 0.044 at baseline. Is this economically meaningful? Compare to average income. |
| 6 | Verbal intuition before | PARTIAL | The interpretation comes AFTER the proof. Move 1 sentence before: "Even when both regimes survive, the autocratic survival scenario involves more total displacement, because the threshold shock is larger than the accumulated rapid shock." |
| 7 | Worked example | PRESENT | 0.4 × 0.11 = 0.044. |
| 8 | Mapping to reality | PARTIAL | Brief. Could add: "In a workforce of 100 million, the welfare gap corresponds to the income loss of approximately 4.4 million additional uncompensated workers." |
| 9 | Proof location | PRESENT | Proof in main text, 3 lines, appropriate for this simple result. |

**Comparative statics gap analysis:**
- Parameters analyzed: none formally
- NOT analyzed: B (→ gap decreasing), ω_R (→ gap decreasing in ω_R because Ω₂^R rises), ω_{T2} (→ gap increasing), ω_{T1} (→ gap increasing via Ω₂^T)

**Priority actions:**
1. Add comparative statics on B, ω_R, ω_{T2} — each is a one-line derivative.
2. Move verbal intuition BEFORE the formal statement.
3. Add a sentence interpreting the magnitude (what does 0.044 mean in practical terms?).

---

### C1: Sweet spot of C_A

**Statement:** Crossed fragility requires C_A ∈ (C_D, C_A^max); interval non-empty.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PRESENT | C_A^min = C_D, C_A^dom = v/(1−Ω₂^R) ≈ 2.04. C_A^max via IVT. Clean. |
| 2 | Comparative statics | PARTIAL | The proof discusses independence of conditions from C_A, but doesn't systematically sweep: how does C_A^max change with Ω₂^R, π̄_A^fall, v? E.g., ∂C_A^max/∂π̄_A^fall > 0 (higher resilience widens the sweet spot). |
| 3 | Phase/region diagram | PRESENT | Figure fig_CA_sweet_spot.pdf shows π*(C_A) with the sweet spot shaded. Good. |
| 4 | Parametric window | PRESENT | C_A ∈ (1.50, 1.74) stated numerically. Excellent — this is the PowerBayesianPersuasion pattern. |
| 5 | Margin table | MISSING | At baseline C_A = 2.0: show that C_A is OUTSIDE the sweet spot for the global games π*, but inside for the single-state approximation. Clarify this. |
| 6 | Verbal intuition before | PRESENT | Paragraph before C1 explains the logic. |
| 7 | Worked example | PRESENT | π* ≈ 1/3 at C_D, C_A^dom ≈ 2.04. |
| 8 | Mapping to reality | PRESENT | Typology of autocracies: open, intermediate, totalitarian. Excellent mapping. |
| 9 | Proof location | PRESENT | Proof in Appendix A. |

**Comparative statics gap analysis:**
- Parameters analyzed: C_A (it IS the subject)
- NOT analyzed: ∂C_A^max/∂Ω₂^R, ∂C_A^max/∂π̄_A^fall, ∂C_A^max/∂v. Also: how does the width of the sweet spot (C_A^max − C_D) change with parameters?

**Priority actions:**
1. Add margin table showing proximity to boundaries at baseline.
2. Add a Remark on how C_A^max and the sweet spot width depend on Ω₂^R and π̄_A^fall.

---

### P5: σ_A amplification

**Statement:** Increasing σ_A (shrinking selectorate) deepens dictator's dilemma and widens crossed fragility interval.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | PRESENT | p_R and p_T formulas, z_R and z_T expressions. Sufficient condition for monotonicity stated. |
| 2 | Comparative statics | PARTIAL | σ_A IS the comparative static variable. But the result doesn't analyze interactions: how does the amplification effect change with ω_R, ω_{T2}, α_1? |
| 3 | Phase/region diagram | PRESENT | Figure fig_sigma_amplification.pdf with two panels. Good. |
| 4 | Parametric window | PARTIAL | "Empirically relevant range" mentioned but not specified numerically. What is the range of σ_A where parts (a), (b), (c) all hold? |
| 5 | Margin table | MISSING | At baseline σ_A = 0.15: p_R = ?, p_T = ?, margin from 1/2 for each. |
| 6 | Verbal intuition before | PRESENT | Two paragraphs explaining the "two faces of the selectorate coin." Among the best verbal explanations in the paper. |
| 7 | Worked example | PARTIAL | Baseline σ_A = 0.15 mentioned but p_R and p_T not computed in the example. |
| 8 | Mapping to reality | PRESENT | Selectorate size, information bubble, groupthink, GDP collapse. |
| 9 | Proof location | PRESENT | Proof in Appendix A. |

**Comparative statics gap analysis:**
- Parameters analyzed: σ_A (subject of the proposition)
- NOT analyzed: ω_R (how does the amplification differ at different rapid displacement levels?), ω_{T2} (same for threshold), α_1 (sensitivity of ω̄_A to noise), interaction C_A × σ_A

**Priority actions:**
1. Compute p_R and p_T at baseline σ_A = 0.15 and add to numerical example.
2. State the parametric window for σ_A explicitly.
3. Add a margin table.

---

### Rk2: Standing compensatory capacity

**Statement:** Democracy with pre-committed insurance is stable under both trajectories.

| # | Item | Status | Action |
|---|------|--------|--------|
| 1 | Closed-form boundary | MISSING | No formal condition for when φ₀ ≥ 1 suffices. Derive: "Standing compensation stabilizes democracy iff B ≥ [threshold] such that v = 1 − B keeps π < π̄_D^fall." |
| 2 | Comparative statics | MISSING | How does the required B depend on ω_{T2}, C_D, δ? A welfare state with higher B is more stabilizing — quantify. |
| 3 | Phase/region diagram | MISSING | Could plot (B, ω_{T2}) plane with stability/instability regions. Shows the reader: "for displacement this large, you need compensation this generous." |
| 4 | Parametric window | MISSING | For what range of B does pre-committed insurance stabilize? |
| 5 | Margin table | MISSING | At baseline B = 0.6: is π(v=0.4) < π̄_D^fall? By how much? |
| 6 | Verbal intuition before | PRESENT | The remark IS verbal intuition, well integrated with policy discussion. |
| 7 | Worked example | MISSING | No numerical illustration. Add: "With B = 0.6, displaced workers earn 0.6 instead of 0, v drops to 0.4, protest falls to X < π̄_D^fall = 0.20." |
| 8 | Mapping to reality | PRESENT | Welfare state, automatic triggers, Esping-Andersen/Iversen & Soskice. Well mapped. |
| 9 | Proof location | N/A | Informal remark, appropriate. |

**Comparative statics gap analysis:**
- Parameters analyzed: none
- NOT analyzed: B, ω_{T2}, C_D, δ, γ — all affect whether standing compensation suffices

**Priority actions:**
1. Add a worked example with specific numbers.
2. Derive a formal condition for when standing compensation stabilizes democracy.
3. Add a (B, ω_{T2}) region diagram — shows the policy design space.

---

## Summary Table

| Result | 1:Boundary | 2:CompStat | 3:Region | 4:Window | 5:Margin | 6:Intuition | 7:Example | 8:Mapping | 9:Proof |
|--------|:----------:|:----------:|:--------:|:--------:|:--------:|:-----------:|:---------:|:---------:|:-------:|
| L0     | PARTIAL    | MISSING    | MISSING  | MISSING  | MISSING  | PARTIAL     | PARTIAL   | N/A       | PARTIAL |
| L1     | PRESENT    | PARTIAL    | MISSING  | PARTIAL  | MISSING  | PRESENT     | PRESENT   | PRESENT   | PRESENT |
| R1     | PRESENT    | MISSING    | MISSING  | N/A      | MISSING  | PARTIAL     | PRESENT   | PARTIAL   | PRESENT |
| P1     | PARTIAL    | MISSING    | MISSING  | MISSING  | MISSING  | PRESENT     | PRESENT   | PRESENT   | PARTIAL |
| P2     | PARTIAL    | MISSING    | MISSING  | MISSING  | MISSING  | PRESENT     | PRESENT   | PRESENT   | PARTIAL |
| P3     | PARTIAL    | MISSING    | MISSING  | PARTIAL  | MISSING  | PRESENT     | PRESENT   | PRESENT   | PARTIAL |
| P4     | PRESENT    | MISSING    | MISSING  | MISSING  | MISSING  | PARTIAL     | PRESENT   | PARTIAL   | PRESENT |
| C1     | PRESENT    | PARTIAL    | PRESENT  | PRESENT  | MISSING  | PRESENT     | PRESENT   | PRESENT   | PRESENT |
| P5     | PRESENT    | PARTIAL    | PRESENT  | PARTIAL  | MISSING  | PRESENT     | PARTIAL   | PRESENT   | PRESENT |
| Rk2    | MISSING    | MISSING    | MISSING  | MISSING  | MISSING  | PRESENT     | MISSING   | PRESENT   | N/A     |

---

## Global Recommendations

### 1. Notation summary table
**Status: MISSING.** The paper has no notation reference table. Kenkel & Paine Appendix A.1 provides a complete reference of all symbols and cutpoints, organized by category (model setup, equilibrium cutpoints). The reader of this paper must hunt through §3.1–§3.6 to find notation.

**Action:** Create an Appendix section "Notation Summary" with three subsections:
- **Parameters:** ω_R, ω_{T1}, ω_{T2}, ω_N, σ, C_D, C_A, B, δ, γ, σ_A, ω_0, α_1, p_R, p_T, p_N
- **Institutional thresholds:** π̄_D^comp, π̄_D^fall, π̄_A^fall, ω̄_A(σ_A)
- **Derived quantities:** Ω₂^R, Ω₂^T, s_x*, Y^+, v_i

### 2. Game tree or timeline diagram
**Status: PRESENT (Table 1).** The timeline table in §3.6 is functional. However, a game tree diagram (like Kenkel & Paine Figure 2) showing the sequence of moves with payoffs at terminal nodes would be clearer, especially for the asymmetric compensation triggers. The split between democracy and autocracy at Step 4 is the institutional content of the model — a game tree would make this visually immediate.

**Action:** Consider adding a figure showing the game tree with the democracy/autocracy fork at the compensation trigger stage.

### 3. Most critical gaps across all results

**Ranked by impact:**

1. **Comparative statics formalization (Item 2)** — The paper has an informal table (§4.5) but no Remarks with proofs in the style of Kenkel & Paine A.14. This is the single biggest gap. The table lists 10 parameters but provides no formal derivations, no proofs, and no interaction effects. **Action:** Create Appendix section "Additional Comparative Statics" with Remarks A.1–A.3 covering (a) protest dynamics: ∂π*/∂C_x, ∂π*/∂ω, ∂π*/∂B; (b) elite assessment: ∂P(approve)/∂σ_A, ∂P(approve)/∂ω; (c) regime stability: ∂(stability margin)/∂parameter for each key parameter. Each with proof.

2. **Margin tables (Item 5)** — Missing for ALL 10 results. This is the easiest gap to fill: compute the baseline parameterization, evaluate each condition, and show the margin from boundary. One comprehensive table would suffice, organized by result. **Action:** Add a table in the appendix or body showing: Result | Condition | LHS | RHS | Margin | Status.

3. **Region diagrams for P1, P2, P3 (Item 3)** — C1 and P5 have figures; P1, P2, and P3 do not. P3 (crossed fragility) is the paper's central result and has no region diagram — only a 2×2 verbal table. **Action:** Create region plots in the Kenkel & Paine style. Priority order: (a) P3: crossed fragility region in (C_A, σ_A) or (ω_R, ω_{T2}) space; (b) P1/P2: stability regions in (ω_R, C_D) or (ω_R, C_A) space; (c) L1: dictator's dilemma zone in (σ_A, ω) space.

4. **Proof location (Item 9)** — L0, P1, P2, P3 have proofs/proof sketches in the main text. For a CP/IR paper targeting JOP/BJPS, all proofs should be in the appendix. **Action:** Move proofs of P1, P2, P3 to appendix. Keep only the formal statement + verbal intuition + table/figure in the main text.

### 4. Comparative statics table → Formal Remarks

The informal table at §4.5 (lines 342-354) is a good start but falls short of the Kenkel & Paine standard. Transform it into formal Remarks:

**Current format (informal):**
> | $C_A \uparrow$ | $\pi_A \downarrow$ | Protest more suppressed; autocracy more resilient... |

**Target format (Kenkel & Paine A.14):**
> **Remark A.X (Comparative statics on protest dynamics).**
> *(a) Increases in C_A reduce equilibrium protest: ∂π*/∂C_A < 0.*
> *(b) Increases in ω_R increase equilibrium protest: ∂π*/∂ω > 0.*
> *(c) Increases in B reduce expressive value and thus protest: ∂v/∂B < 0, ∂π*/∂v > 0.*
> *Proof.* [Formal derivation] ∎

This transformation adds rigor without changing content. The informal table can remain in the main text as a summary, with the formal Remarks in the appendix.

---

## Highest-Priority Actions (Top 5)

1. **Region diagram for P3 (crossed fragility)** — The paper's central result has no visual representation of its parameter space. Create a 2D figure showing where crossed fragility holds.

2. **Formalize the comparative statics table** — Transform the informal §4.5 table into Remarks with proofs in Appendix, following Kenkel & Paine A.14.

3. **Margin table for all results** — One comprehensive table showing each condition's value, boundary, and margin at baseline. Proves the results are not knife-edge.

4. **Notation summary table** — Create in Appendix. Essential for a paper with 19+ parameters.

5. **Move proofs of P1, P2, P3 to appendix** — Keep main text clean: statement + verbal intuition + figure/table.
