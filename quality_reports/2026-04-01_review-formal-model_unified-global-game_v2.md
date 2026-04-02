# Editorial Letter — Unified Global Game Sketch v2

**References**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decision: R&R major

## Consolidated scores
| Dimension              | Score | Rating   |
|------------------------|-------|----------|
| Model design           | 6.0/10  | Adequate but still partial |
| Technical presentation | 6.0/10  | Promising, not yet paper-ready |
| Exposition             | 8.0/10  | Strong for a sketch |
| **Global**             | **6.7/10**  | Much improved, but bottleneck remains design isolation |

## Editorial synthesis

This version is materially stronger than the previous sketch. The free-riding problem is no longer suppressed, the `sigma -> pi_x^* -> hat{sigma}_x` chain now has an explicit theorem shell, and the exposition is substantially better. A reader can now see a coherent model rather than a loose repair note.

The main remaining weakness is substantive rather than cosmetic: the democratic side still depends heavily on the timing constraint `A5`, while the sketch itself now admits that the high-noise coordination result in `t=2` is confirmatory rather than essential. That means the unified global game is doing more work on the autocratic side than on the democratic side. The model is no longer vulnerable to the original “two disconnected appendices” critique, but it has not yet fully achieved symmetric mechanism isolation across regimes.

## Hierarchy applied: Design > Presentation > Exposition

The exposition is now clearly the strongest dimension. Technical presentation is middling but improvable. The binding constraint is design: not because the idea is weak, but because the coordination mechanism and the lead-time mechanism are still partially separable on the democratic side. That is the main reason this remains an R&R-major rather than an R&R-minor.

## Priorities for revision
1. **Clarify the division of labor between coordination and timing.** Either make the democratic result depend more directly on the coordination game, or state explicitly that the global game mainly microfounds the autocratic side while the democratic side remains a timing-plus-credibility mechanism.
2. **Turn the recovered results into formal corollaries.** The current Section 6-7 logic is readable, but it still narrates the main substantive propositions rather than stating them as theorem-grade outputs.
3. **Clean the notation and definitions.** Imported objects (`A1-A5`, `Delta`, `M`, `R`) and shifting function arguments (`q_i`) still make the sketch read like a memo rather than a self-contained theory section.
4. **Add figures.** At minimum: a timing diagram and a threshold plot for `pi_x^*(sigma)` crossing `bar{pi}`.
5. **Trim meta-commentary.** The argument is now strong enough that it no longer needs repeated reminders that the new version is better than the old one.

## Strategic recommendation

This sketch is now worth carrying forward. The remaining problems are no longer fatal conceptual holes; they are about sharpening the design claim and converting the sketch into a proper model section. The next efficient move is not another large redesign. It is a focused cleanup pass:

- formalize the recovered propositions as corollaries,
- simplify notation,
- add figures,
- decide whether the democratic mechanism is truly symmetric with the autocratic one or only partially unified.

If that is done well, this becomes a credible replacement for the current Appendix A / Appendix B architecture.

---

## Full Review — Model Design

# Design Review (Dixit / Varian / Board)

## Score: 6/10

## The model in one sentence
A two-period global game in which noisy collective action by exposed workers creates public visibility, and that same visibility can both trigger democratic compensation and weaken autocratic repression.

## Contribution type (Board & Meyer-ter-Vehn)
This is best classified as a new model, or new lens, rather than a new question or a technical contribution. The paper unifies two reduced-form assumptions into one coordination mechanism, which is conceptually strong, but it mostly microfounds an existing crossed-fragility architecture rather than opening a wholly new political puzzle.

## Evaluation by dimension

### MD1. Quality of the question [Adequate]
The question is politically real and easy to state: why does rapid displacement generate democratic compensation and autocratic vulnerability, while threshold automation flips the pattern? That is a genuine puzzle, not just an algebraic exercise. The limitation is that the question is still tightly bound to the paper’s own baseline architecture, so it reads more like a microfounding repair than a broad standalone theory question.

### MD2. Simplicity and KISS [Needs simplification]
The core idea is simple, but the implementation is not yet minimal. The model carries a two-period timing structure, a global game, a public-good layer, a club-good layer, regime-specific continuation maps, and endogenous-threshold machinery. That is more structure than the mechanism really needs, so the design is cleaner than the baseline but still not fully KISS.

### MD3. Isolation of the mechanism [Partial]
The visibility-of-grievance mechanism is clearly identified and does useful work in both regimes. But the isolation is incomplete because democratic fragility under threshold automation still depends heavily on the separate timing constraint `A5`, and the note itself admits that the high-noise result in period 2 is confirmatory rather than essential. So the mechanism is unified, but not fully isolated from institutional timing.

### MD4. Richness of insights [Adequate]
The model does generate real added value: endogenous noise thresholds, a unified interpretation of moderate autocracy, and a single coordination framework that replaces two disconnected primitives. That said, most of the output is architectural clarification rather than a large set of new substantive predictions. The insights are useful, but not especially surprising.

### MD5. Type of contribution [New model / new lens]
This is a persuasive new lens on a known crossed-fragility result. The contribution is to isolate a common informational and coordination force, not to introduce a new equilibrium concept or proof technique. It is convincing as a conceptual unification, but it is still an incremental contribution in the Board & Meyer-ter-Vehn sense.

### MD6. Construction process [Adequate]
The manuscript shows clear iteration and refinement. It moves from ad hoc thresholds to endogenous ones, distinguishes baseline from extension, and works through a numerical illustration, which all suggest genuine model-building rather than first-draft invention. Still, the final architecture feels like a retrofit designed to preserve the original propositions, not yet the cleanest bottom-up construction.

## Overall verdict on design
The design is materially better than the original two-assumption architecture because it replaces disconnected reduced forms with one visibility-based coordination mechanism. The main weakness is that the democratic result still leans substantially on timing and lead time, so the unified coordination game is not doing as much work there as it appears to be doing. In short, the model is promising and coherent, but it still needs simplification and tighter isolation of the mechanism before it becomes a truly strong formal design.

## Constructive suggestions
1. Separate the timing channel from the coordination channel more sharply, or explicitly state that the global game is doing the heavy lifting mainly for autocracy, not for democratic missed windows.
2. Strip the participation technology to the minimum needed for the result, and test whether the model still works without the full club-good plus public-good machinery.
3. Reduce regime-specific parameters where possible, so that democracy and autocracy differ only in the continuation map, not in several auxiliary objects at once.

---

## Full Review — Technical Presentation

# Technical Presentation Review (Thomson / Board)

## Score: 6/10

## Structure of the model
The manuscript sets up a two-period global-game-style participation problem with a continuum of exposed workers `E`, regime type `x in {D, A}`, and shock trajectory `j in {r, tau}`. Each worker observes a private signal `s_it = omega_t + sigma_j epsilon_it`, chooses whether to join public collective action `a_it in {0,1}`, and thereby helps determine aggregate visibility `pi_t`. Visibility then feeds into regime-specific continuation values: in democracy it conditions whether the majority `N` authorizes compensation `varphi_t`, and in autocracy it degrades effective repression `eta(pi_t)`. The equilibrium concept is Bayesian Nash in monotone threshold strategies, with an Assumption GG-style global-games structure generating cutoff participation and endogenous noise thresholds.

## Scorecard

| Dimension | Verdict | Comment |
|----------|-----------|---------|
| D2. Model presentation | Adequate | The order is mostly canonical and the “one coordination mechanism” architecture is clear, but the sketch still reads partly like a memo replacing primitives rather than a self-contained model section. |
| D3. Notation | Needs improvement | The notation is usable but overloaded, with imported symbols, shifting function arguments, and several objects defined only implicitly. |
| D4. Definitions | Needs improvement | Key objects are introduced inline rather than in explicit definition blocks, and several terms depend on external assumptions not restated locally. |
| D5. Statement of results | Needs improvement | The core comparative statics are intelligible, but the main recovered results are still narrated rather than stated as clean corollaries/propositions. |
| D6. Proofs | Needs improvement | The proof sketches are directionally right, but they are too compressed for a theory section that wants to stand on its own. |
| D7. Figures and diagrams | Serious problem | There are no figures, timing diagrams, or threshold plots, despite a model that would benefit strongly from all three. |
| D8. Assumptions and logical structure | Needs improvement | Assumptions are not ordered by plausibility, and Assumption GG bundles several distinct requirements that should be separated. |
| D9. Examples and applications | Adequate | The numerical illustration is coherent and checks the algebra, but it is still only an algebraic verification, not an explanatory example. |

## Key technical takeaways

- `q_i` still changes argument structure between the main definition and the proof sketch.
- Imported baseline objects (`A1-A5`, `Delta`, `M`, `R`) should be restated locally.
- `Lemma 1`, `Lemma 2`, and `Proposition 0` are now respectable theorem shells, but Sections 6-7 still narrate the main substantive outputs instead of stating them as corollaries.
- The absence of figures is now the single biggest presentation problem.

## Constructive suggestions
1. Recast the manuscript into a cleaner theorem chain: define primitives, split `Assumption GG`, then state the main comparative statics as corollaries with one-sentence takeaways.
2. Fix notation consistency, especially the argument structure of `q_i`, the local meaning of imported symbols like `Delta`, and the local definition of `M` and `R`.
3. Add one timing diagram and one threshold figure so the `sigma -> pi^* -> varphi/eta -> regime stability` chain becomes visible at a glance.

---

## Full Review — Exposition

# Exposition Review (Varian / Thomson / Board)

## Score: 8/10

## Evaluation by dimension

### ME1. Structure [Excellent]
The manuscript is organized in a clear, theory-friendly sequence: objective, core intuition, setup, regime-specific continuation maps, common coordination subgame, comparative statics, recovery of the main results, and then a short assessment of what the unified mechanism buys. That is exactly the right general architecture for a formal-model paper.

The main strength is that the reader sees the point early in Sections 1-2: one coordination mechanism is meant to replace separate reduced-form assumptions `A3` and `A4`. The main weakness is that the paper then restates that same point several times in later sections, so the structure is strong but a bit more expansive than necessary.

### ME2. Introduction [Adequate]
The opening communicates the mechanism clearly, especially the claim that “the same coordination stage” does two jobs in democracy and autocracy. It also does a good job distinguishing the informational primitive (`sigma`) from the institutional differences.

What is still missing is a sharper Varian-style opening: the first paragraph should state the puzzle and the result in a more memorable form, not just the modeling move. Right now the intro reads more like a design note than a paper opening. The reader understands the setup, but the contribution would land harder if the crossed-fragility result were stated explicitly in the first paragraph.

### ME3. Writing and style [Adequate]
The prose is mostly clean, technically disciplined, and easy to follow. The best passages are the ones that explain why discounting is omitted and why the coalition problem is interpreted as a club good rather than pure free riding. Those sections do the right thing: they translate a formal move into plain English.

The main issue is repetition and meta-commentary. Phrases like “The point of the lemma is modest but important,” “The previous version introduced...,” and repeated reminders that the new version is “cleaner” or “more endogenous” are useful in drafting, but should be trimmed in the final paper. The manuscript also occasionally over-explains after already making the point, which slows the reading pace.

### ME4. Extensions and when to stop [Long]
The paper is not bloated in a destructive way, but it does keep going after the core mechanism is already established. Sections 8-10, especially the numerical illustration, “What This Buys,” and “Remaining Limitation,” repeat earlier claims in slightly different language.

Those sections are defensible, but they would be stronger if compressed. In a final paper, some of that material should move to the appendix or be reduced to a short concluding paragraph. As written, the paper slightly violates Varian’s “once you’ve made your point, stop” principle.

### ME5. Examples and intuition [Adequate]
This is one of the manuscript’s better features. The step-function `g(pi)`, the rapid-vs-threshold timing contrast, and the numerical illustration all make the mechanism concrete. The club-good interpretation of participation is also a strong intuitive bridge between the formal game and the political story.

The only reason this is not “Excellent” is that the strongest example comes a bit late. A short motivating example near the opening would make the model easier to grasp before the notation-heavy setup begins.

## Overall verdict on exposition
The exposition is strong, coherent, and unusually disciplined for a formal-model sketch. A competent reader can follow the mechanism, understand how one coordination game replaces two separate assumptions, and see how the crossed-fragility result is generated. The main cost is length: the manuscript repeatedly rephrases the same insight instead of cutting to the version that matters most. If tightened, especially in the opening and in Sections 8-10, this would read like a very solid theory-paper exposition.

## Top 5 improvement suggestions
1. State the main result in the first paragraph of the introduction in one sentence, not only the modeling move.
2. Compress Sections 8-10; they now repeat more than they add.
3. Replace drafting/meta language with final-paper language.
4. Add a short roadmap paragraph at the end of the introduction.
5. Bring one concrete motivating example earlier.
