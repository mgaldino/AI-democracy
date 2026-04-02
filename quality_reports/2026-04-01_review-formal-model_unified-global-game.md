# Editorial Letter — Unified Global Game Sketch

**References**: Thomson (1999), Board & Meyer-ter-Vehn (2018), Dixit (2015), Varian (1997/2016)

## Decision: R&R major

## Consolidated scores
| Dimension              | Score | Rating   |
|------------------------|-------|----------|
| Model design           | 7.0/10  | Stronger than current paper, but still partial |
| Technical presentation | 6.0/10  | Promising sketch, not yet theorem-grade |
| Exposition             | 6.0/10  | Clear internal memo, not yet reader-facing |
| **Global**             | **6.5/10**  | Promising architectural fix, needs formal tightening |

## Editorial synthesis

This sketch is a real improvement over the current architecture. Its main virtue is conceptual: it gives the paper one mediator, one informational primitive, and one clearer inferential chain. The crossed fragility result is no longer presented as a conjunction of two disconnected assumptions, but as the output of a common coordination shell in which signal noise affects participation and participation affects each regime's continuation map differently.

The main weakness is that the sketch has not yet crossed the line from elegant architecture to fully worked formal model. The core comparative statics are asserted rather than demonstrated, several key objects are imported from the larger paper rather than defined self-containedly, and the coordination stage currently suppresses a real public-good/free-riding issue. As a result, the sketch is strong as a redesign memo but not yet strong enough to carry the burden of replacing `A3` and `A4` in the body of the paper without another round of formalization.

## Hierarchy applied: Design > Presentation > Exposition

The good news is that the bottleneck is no longer the high-level design. The design move is worth pursuing: unifying the two microfoundations is the right response to the review criticism. The bottleneck now shifts to formal execution. That is encouraging, because the remaining problems are fixable with a tighter statement of primitives, one or two formal lemmas, and a more careful treatment of the participation stage.

## Priorities for revision

1. **Fix the participation game.** As written, the subgame treats successful visibility as if only participants enjoyed the continuation benefit. That suppresses the free-riding problem that naturally arises when compensation or regime change benefits the whole exposed group.
2. **Turn the sigma-to-participation mapping into a theorem.** The sketch currently assumes cutoff values `sigma_D^*` and `sigma_A^*` rather than deriving them from primitives. That moves the arbitrariness one level back instead of fully eliminating it.
3. **Clarify exactly what is unified.** The sketch says one equilibrium object `pi*` drives both regimes, but it later uses regime-specific participation objects `pi_x^*(sigma_j)`. That is still a meaningful unification, but it is weaker than the current prose suggests.
4. **Make the sketch self-contained.** Restate `A1-A5`, define `M/R`, `Delta`, `bar{varphi}`, and `bar{kappa}` locally, and avoid requiring the reader to reconstruct the larger paper in order to assess the model.
5. **Add one figure and one theorem skeleton.** At minimum: a timing diagram and a proposition sequence for existence/uniqueness, low-sigma/high-sigma comparative statics, and recovery of `P1-P3`.

## Strategic recommendation

This is worth developing. The architecture is substantially better than the current split Appendix A / Appendix B design, and it directly addresses the strongest reviewer criticism. But it is not yet ready to be treated as the new model section of the paper. The next step should not be cosmetic rewriting; it should be one more formal pass that turns the memo into a compact, self-contained game with explicit conditions and at least a proof sketch for the key comparative statics.

---

## Full Review — Model Design

# Design Review (Dixit / Varian / Board)

## Score: 7/10

## The model in one sentence
A single global-game coordination mechanism, driven by the public visibility of grievance, replaces the paper’s separate reduced-form assumptions about democratic compensation and autocratic repression degradation, so the same participation threshold `pi*` generates both regime-specific outcomes.

## Contribution type (Board & Meyer-ter-Vehn)
This is best classified as a **new lens / isolated political force** contribution. The manuscript does not invent a new political question, but it does compress two regime-specific assumptions into one shared mechanism, which is exactly the kind of conceptual tightening Board & Meyer-ter-Vehn value. It is convincing as a design move because it makes the crossed fragility result come from one mediator rather than two disconnected primitives, especially around the shared visibility threshold in the core mechanism and the equilibrium mapping in the common subgame.

## Evaluation by dimension

### MD1. Quality of the question [Adequate]
The question is a genuine political puzzle, namely why the same shock trajectory can trigger compensation in democracy and repression breakdown in autocracy, and the manuscript makes that puzzle understandable even to non-specialists by translating it into a common visibility mechanism. What is still somewhat internal to the model is the “why care” justification, which is strongest as a theoretical architecture fix rather than as a broad political phenomenon, so this is good but not yet fully compelling as a standalone puzzle.

### MD2. Simplicity and KISS [Needs simplification]
The redesign is cleaner than the original baseline, but it still has a fair amount of machinery: a continuum of workers, two periods, two regimes, two trajectories, private signals, a step-function visibility rule, regime-specific continuation maps, and a separate lead-time constraint `A5`. That is more than the minimum needed to expose the mechanism, so the model is conceptually compressed but not yet truly stripped down.

### MD3. Isolation of the mechanism [Partial]
The central mechanism is clear: public visibility of grievance mediates both democratic concession and autocratic repression failure. The problem is that the mechanism is still embedded in several layers of structure, especially the binary `g(pi)` threshold, the regime-specific continuation payoffs, and the separate `A5` timing constraint, so the design isolates the force better than before but does not yet isolate it completely.

### MD4. Richness of insights [Adequate]
The main payoff is not just re-deriving the existing propositions, but giving them a transferable interpretation: coordination becomes the common channel through which shocks matter across regimes, and the “moderate autocracy” interval acquires a cleaner equilibrium meaning. That said, the model mostly deepens interpretation rather than generating a large set of surprising new comparative statics, so the insight is real but not especially expansive.

### MD5. Type of contribution [New lens / isolated political force; convincing]
This is a convincing **new lens** because it replaces two separate reduced-form assumptions with one unified coordination mechanism. It is not a new question, not a technical contribution, and not primarily a new empirical prediction paper; its value is conceptual compression, which is strong if the full manuscript keeps the architecture as clean as this sketch.

### MD6. Construction process [Mature]
The note reads like the product of iteration: it starts from the baseline assumptions, identifies the architectural weakness, proposes a simpler mediator, checks special cases, and then verifies that the numerical illustration survives. The presence of a clear baseline plus a worked-through replacement mechanism is exactly what one wants to see, even if the final model still needs one more pass of simplification.

## Overall verdict on design
This is a substantially better design than a pair of disconnected reduced-form assumptions. The main strength is architectural: one coordination mechanism, one informational primitive, and one equilibrium object now explain both democratic compensation and autocratic repression effects. The main weakness is that the model is still not fully at the Dixit/Varian ideal of starkness, because the visibility threshold and the residual regime-specific continuation maps still do a lot of work.

## Constructive suggestions
1. Strip the exposition to the minimum version first: one visibility function, one coordination game, one regime comparison, then add `A5` only after the core mechanism is established.
2. Replace the step-function `g(pi)` with a monotone version in the main text, and reserve the threshold case as a special case or appendix result so the mechanism looks less binary and more structural.
3. Add one deliberately simple worked case that shows what breaks when visibility is removed, because that will make the Schelling-Spence test visible and sharpen the claim that `pi*` is the essential mediator.

---

## Full Review — Technical Presentation

# Technical Presentation Review (Thomson / Board)

## Score: 6/10

## Structure of the model
The sketch has one main strategic interaction: a continuum of exposed workers `E` observes noisy private signals about a shock, chooses whether to join public collective action, and then chooses `M` or `R`; in democracy, a non-exposed majority `N` decides whether to compensate, while in autocracy repression is mechanically weakened or preserved as a function of public participation. The intended equilibrium concept is a Bayesian Nash equilibrium in monotone threshold strategies with a unique cutoff `a_i^*(s_i; x, sigma_j) = 1[s_i \ge s_x^*(sigma_j)]`. Preferences are summarized by continuation payoffs from compensation vs refusal in democracy and from radical action vs mobilization in autocracy, with the key mediator being public visibility `g(pi)`.

## Scorecard
| Dimension | Verdict | Comment |
|----------|---------|---------|
| D2 | Adequate | The macro-order is mostly canonical, but the sketch still mixes primitives, reduced-form continuation maps, and result recovery in a way that hides the formal spine. |
| D3 | Needs improvement | The notation is mostly guessable, but several symbols are imported, overloaded, or used before they are fully defined. |
| D4 | Needs improvement | Core objects like “visibility,” “moderate autocracy,” `M/R`, and `sigma_x^*` are not defined with enough precision. |
| D5 | Needs improvement | The main claims are intelligible, but they are stated more as programmatic mappings than as formally delimited results. |
| D6 | Serious problem | There is essentially no proof structure; the global-games uniqueness and comparative statics are asserted, not demonstrated. |
| D7 | Serious problem | No figures or diagrams are provided, despite a model where a timeline and threshold diagram would materially improve comprehension. |
| D8 | Needs improvement | The logic is coherent, but assumptions are partly externalized to `A1`–`A5` and not organized in a self-contained order. |
| D9 | Adequate | The numerical illustration is helpful and internally consistent, but it functions as a check, not a derivation. |

## Detailed analysis
The overall architecture is clean, and the move from two reduced-form assumptions to one visibility-based coordination mechanism is a real improvement. The main weakness is technical presentation, not conceptual coherence: the sketch still reads like a hybrid of formal model, intuition note, and result memo rather than a self-contained theory section.

**D3-D4: notation and definitions.** The biggest presentation issue is that several symbols are not fully pinned down at first use, or are only intelligible if the reader already knows the larger paper. Examples include `A1`–`A5`, `M/R`, `Delta`, `bar{kappa}`, `bar{varphi}`, and `sigma_x^*`. Thomson’s rule here is simple: define new objects unambiguously before you use them, and keep the namespace small enough that a reader can reconstruct meanings without backtracking. Right now, the notation is mostly inferable, but not cleanly teachable.

**D5-D6: results and proofs.** The claims about a unique cutoff equilibrium and monotone comparative statics are the most serious technical gap. The sketch says “standard global-games arguments imply” uniqueness, but it never states the exact conditions under which the theorem applies, nor does it prove that the posterior `q_i` and the aggregate participation `pi_x^*(sigma_j)` move monotonically in `sigma_j`. That is a Board problem as much as a Thomson problem: the reader needs a result, then a proof, then an intuition. Here the proof is replaced by a verbal bridge. The same issue appears in the recovery of Propositions 1–3: the mapping is plausible, but it is not yet a theorem.

**D7: figures and diagrams.** This is a clear omission. A model built around signal noise, a visibility threshold, and a two-regime continuation map should have at least one timeline diagram and one threshold/phase diagram. A simple 2x2 figure showing `rapid vs threshold` crossed with `democracy vs autocracy` would make the logic of the model instantly legible. As written, the reader has to reconstruct the whole mechanism from prose alone.

**D8: assumptions and logical structure.** The structure is mostly sensible, but the assumptions are not organized by dependency or plausibility. Some primitives are explicit, while others are silently inherited from the prior paper. The result is that the logical chain sometimes jumps from “if `pi_t >= bar{pi}` then compensation/repression changes” to “therefore `pi^*(sigma)` crosses `bar{pi}`” without enough intermediate formalization. That is fixable, but the assumption block should be made self-contained.

## Notation inventory
| Symbol | Meaning | Where introduced | Issue? |
|--------|---------|------------------|--------|
| `A1`–`A5` | External assumptions from the larger paper | Objective and setup | Imported, not restated |
| `E` | Exposed workers | Setup | Fine |
| `N` | Non-exposed majority | Timing | Defined late |
| `x` | Regime type, `D` or `A` | Setup | Fine |
| `j` | Trajectory, `r` or `tau` | Setup | Fine |
| `t` | Period index | Setup | Fine |
| `ell_t` | Loss process | Setup | Fine |
| `omega_t` | Realized shock severity | Information | Relation to `ell_t` should be cleaner |
| `s_it` | Private signal | Information | Fine |
| `sigma_j` | Noise by trajectory | Information | Fine |
| `a_it` | Collective-action choice | Collective action | Fine |
| `pi_t` | Aggregate participation | Collective action | Fine |
| `g(pi)` | Public visibility of grievance | Core intuition | Needs formal interpretation |
| `bar{pi}` | Visibility threshold | Core intuition | Fine |
| `varphi_t` | Democratic compensation level | Democracy | Underdefined in sketch |
| `Gamma(pi_t)` | Instability cost to majority | Democracy | Fine |
| `kappa_0` | Baseline repression | Autocracy | Fine |
| `eta(pi_t)` | Repression factor | Autocracy | Slightly overloaded |
| `eta_r` | Degraded repression under visibility | Autocracy | Fine |
| `kappa^{eff}` | Effective repression | Autocracy | Fine |
| `B_D`, `B_A` | Continuation gains from crossing visibility threshold | Common subgame | Fine, but should be stated as derived objects |
| `q_i` | Posterior probability of visible collective action | Common subgame | Belief formation not fully specified |
| `q_x^*` | Participation cutoff | Common subgame | Fine |
| `M`, `R` | Post-visibility choices | Timing | Undefined in the sketch |
| `Delta` | Reduced-form payoff gap from the larger paper | Democracy payoff | Imported object |
| `bar{kappa}` | Threshold payoff difference | Democracy payoff | Imported object |
| `sigma_x^*` | Max noise consistent with crossing `bar{pi}` | Comparative statics | Ad hoc, not formally defined |

## Result-by-result analysis
| Claim | Assessment | What is missing |
|------|------------|-----------------|
| One visibility game can replace `A3` and `A4` | Plausible and attractive | A formal proposition showing the equivalence, with conditions |
| Unique monotone cutoff equilibrium | Not yet rigorous enough | Exact assumptions, theorem statement, and proof sketch |
| Low-noise implies high participation; high-noise implies low participation | Standard and likely correct | The monotone comparative statics argument is only asserted |
| Proposition 1–3 are recovered | Readable as a roadmap, not yet as a formal result set | Separate proposition statements and derivations |
| Numerical illustration “survives intact” | Useful sanity check | It chooses participation rates exogenously instead of solving them from the game |

## Constructive suggestions
1. Restate every primitive and inherited object in one compact assumption block: define `M/R`, `A1`–`A5`, `Delta`, `bar{kappa}`, `bar{varphi}`, and `sigma_x^*` before the model starts doing comparative statics.
2. Turn the three headline mappings into formal propositions or lemmas: one for equilibrium existence/uniqueness, one for the noise comparative statics, and one for the recovery of Propositions 1–3.
3. Add two figures: a timeline of play and a 2x2 diagram for `rapid vs threshold` by `democracy vs autocracy`; then treat the numerical example as a check, not as a substitute for derivation.

---

## Full Review — Exposition

# Exposition Review (Varian / Thomson / Board)

## Score: 6/10

## Evaluation by dimension

### ME1. Structure [Adequate]
The manuscript has a clean internal architecture: objective, intuition, setup, regime-specific continuation maps, common subgame, comparative statics, numerical illustration, and payoff. That said, it still feels like a memo about how to rebuild the model rather than a paper built to catch a busy reader on page 1. The main mechanism is explained before the reader is told why it matters, and the central results only become explicit in sections 6–7.

### ME2. Introduction [Needs improvement]
Section 1 states what the note replaces, but not the substantive puzzle or headline contribution. A reader learns that `A3` and `A4` will be unified, but not yet what the paper explains in the world or why this unification matters. A paper-level introduction would also need a compact literature bridge, and this sketch has none. The opening should give the puzzle, state the two key results in plain English, then present the model. Right now the introduction mixes framing, model design, and internal architecture commentary.

### ME3. Writing and style [Adequate]
The prose is mostly short, direct, and technically readable. The best feature is that each section begins with a clear claim and then gives the formal object that supports it. The main weaknesses are self-referential phrasing and repetition. For example, phrases like “the current paper's exact comparative statics,” “this is the old `A3`,” and “reproduces Proposition 3” are useful in a memo but too inward-facing for a polished exposition. Section 7.2 and section 8 also restate the same comparative statics in different forms; that weakens the pacing.

### ME4. Extensions and when to stop [Adequate]
The manuscript is not bloated, but it keeps extending the same point after the mechanism is already clear. Sections 8–10 are helpful for internal validation, yet in a paper body they are close to repetitive. If the final manuscript keeps the numerical illustration, it should be short and visibly illustrative, not another full pass through the same logic. The comparison in section 9 is especially close to a summary that could be collapsed into one paragraph.

### ME5. Examples and intuition [Insufficient]
There is some intuition, and the numerical illustration in section 8 is useful, but the paper still lacks an early motivating example that anchors the reader before the formalism starts. The step-function `g(pi)` is intuitive in concept but remains abstract in presentation. A compact toy scenario, timing diagram, or simple special case would make the coordination mechanism easier to visualize and would better satisfy the Varian/Thomson emphasis on “talk-like” exposition.

## Overall verdict on exposition
The exposition is coherent and the mechanism is easy to follow once you are already inside the manuscript, but it still reads more like an internal design memo than a reader-facing paper. The core architecture is good: one coordination game, one informational primitive, two continuation maps. What is missing is a stronger first-page hook, less self-referential language, and earlier concrete intuition. As written, a competent but busy reader would understand the logic, but only after more effort than the model deserves.

## Top 5 improvement suggestions
1. Replace the current opening with a true paper introduction: state the empirical puzzle, the two headline results, and the unified mechanism in the first 2–3 paragraphs, with no `A3/A4` labels yet.
2. Rewrite self-referential sentences into reader-facing prose. For example, instead of “this is the old `A3`” and “reproduces Proposition 3,” say what the proposition means in plain language and relegate the crosswalk to a short appendix note.
3. Move the main equilibrium logic earlier. A reader should see the threshold participation rule, the role of `sigma_j`, and the two continuation values before the paper spends time on regime-specific algebra.
4. Cut or compress sections 8–10. Keep one short numerical example that illustrates the cutoff logic, and move the rest of the architecture comparison to a brief concluding paragraph or appendix.
5. Add one concrete intuition device, ideally a timing diagram or toy example, that shows why low-noise shocks cross `bar{pi}` while high-noise shocks do not. That would make the global-game mechanism feel like the organizing idea rather than a late formal add-on.
