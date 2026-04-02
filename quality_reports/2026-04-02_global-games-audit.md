# Global Games Microfoundation Audit

**Date**: 2026-04-02
**Reviewer**: Adversarial formal theorist
**Files reviewed**: `paper.Rmd` (Sections 2-3, Appendix B), `model/04b_microfoundation_A4_sketch.md`, `model/03_formal_model.md`
**Scope**: Every claim that depends on global games theory (Lemmas 1-2, the coordination mechanism feeding Propositions 1-3, and the mapping from signal noise to institutional outcomes)

---

## 1. Summary Verdict

**Problematic, with one potentially critical gap and several issues that require explicit treatment.** The paper uses global games creatively and the overall intuition is sound: high noise destroys coordination, low noise enables it. But the formal execution has significant holes. The paper never verifies the standard uniqueness conditions for its specific game, silently departs from Morris-Shin in several places without acknowledging this, and the key comparative static (pi* decreasing in sigma) is asserted rather than proved for the paper's payoff structure. The most serious problem is that the coordination game in Appendix B is underspecified to the point where the proofs of Lemmas 1 and 2 are not verifiable.

The good news: nothing I found definitively *breaks* the result. The claimed qualitative pattern (low noise enables coordination, high noise prevents it) is consistent with the global games literature. But "consistent with" is not "derived from," and several of the gaps could become genuine problems under closer scrutiny.

---

## 2. Critical Issues

### Issue 1: Uniqueness is invoked but never verified (Severity: HIGH)

**The claim.** Lemma 1 asserts a unique monotone equilibrium. The proof in Appendix B says: "The best-response mapping from conjectured cutoff $s_x^*$ to optimal cutoff is a contraction under A3 (strategic complementarities in participation with single crossing; see Morris and Shin 2003, Theorem 2.2)."

**The problem.** Morris and Shin (2003, Theorem 2.2) provides uniqueness conditions for a specific class of games. The key requirements are:

1. **Action monotonicity**: the aggregate outcome must be monotone in the state.
2. **State monotonicity**: individual payoffs must be monotone in the state, holding the aggregate fixed.
3. **Diffuse prior or dominance regions**: either the prior on omega is improper/sufficiently diffuse, or there exist dominance regions (states so high that participating is dominant regardless, and states so low that abstaining is dominant regardless).
4. **Sufficient noise**: technically, for finite noise, one needs the prior to be sufficiently flat relative to signal precision.

The paper checks (1) and (2) by invoking MLRP, which is fine. But it never discusses (3) or (4). Specifically:

- **Dominance regions.** In the paper's game, does there exist an omega so high that participating is a dominant strategy? The participation payoff is $q_i b_x - (1 - q_i) m$, which depends on beliefs about others' behavior, not directly on omega. For omega very high, all signals are high and the posterior q_i is near 1, so participation is dominant. For omega very low, q_i is near 0, so abstention is dominant. This structure *should* produce dominance regions. But the paper never verifies this explicitly for its signal structure. The issue is subtle: omega in the paper is binary ($\omega_t \in \{0, L\}$), not continuous. Standard global games require a continuous state space. See Issue 2.

- **Prior diffuseness.** The paper never specifies a prior on omega. Morris-Shin (2003) with a proper prior requires that the prior be sufficiently flat (specifically, limit uniqueness as the prior becomes diffuse). With a binary omega, the "diffuse prior" approach does not apply at all. The paper cannot invoke the limit-diffuse-prior machinery.

**What breaks.** Without verified uniqueness, the paper could have multiple equilibria for intermediate sigma values. If so, the clean comparative static of Lemma 2 (pi* is decreasing in sigma, with a single crossing at sigma-hat) could fail: there might be sigma values where both high-participation and low-participation equilibria coexist. This would undermine the deterministic mapping from trajectory to coordination outcome that drives Proposition 3.

**Recommendation.** The authors must either (a) verify the dominance region conditions explicitly for their game, or (b) reformulate the coordination game with a continuous fundamental (see Issue 2) and then invoke standard Morris-Shin results, or (c) drop the global games uniqueness claim and instead argue that the rapid shock selects the "favorable" equilibrium and the threshold shock selects the "unfavorable" one via a weaker selection argument (e.g., risk dominance, or Harsanyi-Selten style reasoning). Option (c) would be honest but would reduce the contribution of the microfoundation to an equilibrium selection story rather than a uniqueness result.

---

### Issue 2: The fundamental omega is binary, not continuous (Severity: HIGH)

**The problem.** In Section 2 of the paper, omega_t = l_t in {0, L}. Workers receive signals $s_{it} = \omega_t + \sigma_j \varepsilon_{it}$. But standard global games require a *continuous* fundamental: omega must take values on a continuum (typically the real line or an interval). The entire Morris-Shin apparatus --- threshold strategies, indifference conditions, uniqueness via iterated dominance --- relies on the fundamental being continuous.

With a binary omega, the private signals s_it are generated from a *mixture* of two known distributions (centered at 0 and at L), not from a continuous-prior model. The Bayesian updating is structurally different. Each worker forms a posterior over {0, L}, not over a continuum. The "threshold strategy" machinery becomes a different object: instead of "participate iff s_it exceeds a cutoff x*," the worker computes a posterior probability that omega = L and participates iff that posterior exceeds some threshold.

This can be made to work, but it is a *different model* from standard global games. In particular:

- The "indifference condition" from Morris-Shin (which determines x* in the continuous case) does not apply directly.
- The limit results (sigma -> 0 gives common knowledge; sigma -> infinity gives private information) are qualitatively preserved but quantitatively different.
- The uniqueness argument changes fundamentally: with a binary state and common knowledge of the prior, the conditions for uniqueness are different.

**The appendix sketch (04b)** actually uses a *continuous* omega with uniform noise, which is closer to standard global games. But the paper itself defines omega as binary. These two models are inconsistent.

**What breaks.** The inconsistency between the paper's binary omega and the appendix's continuous omega means the formal results are not properly connected. The paper invokes global games through the appendix, but the paper's actual model has a different information structure. A reader attempting to verify Lemma 1 would find that the proof technique in Appendix B does not match the binary-omega setup in the main text.

**Recommendation.** There are two clean solutions:

(a) *Make the fundamental continuous in the main text.* Interpret omega as "severity of the automation shock" on a continuum, with the equilibrium being about whether to participate given uncertainty about the true severity. This is what the appendix sketch does. The binary {0, L} loss structure then becomes a special case (or a simplification for the stability analysis) while the coordination game operates on a continuous fundamental.

(b) *Explicitly develop the binary-state global game.* This is doable (see Angeletos, Hellwig, and Pavan 2006 for related binary-state coordination models), but requires different proof techniques from Morris-Shin.

Either way, the paper must reconcile the main text and the appendix.

---

### Issue 3: The comparative static "pi* decreasing in sigma" is not proved for this game (Severity: MEDIUM-HIGH)

**The claim.** Lemma 2 states that equilibrium participation pi*_x(sigma_j) is weakly decreasing in sigma_j.

**The proof.** Appendix B argues: "Higher sigma_j Blackwell-degrades private signals. For a fixed cutoff, this weakly lowers q_i(s_it) at every signal realization. By monotone comparative statics (Milgrom and Shannon 1994), the equilibrium cutoff s*_x(sigma_j) is weakly increasing in sigma_j, and equilibrium participation pi*_x(sigma_j) is weakly decreasing."

**The problem.** The argument contains a logical gap. The claim is that for a *fixed* cutoff, higher sigma lowers q_i at every signal realization. But this is incorrect in general. Higher sigma spreads out the signal distribution, which can *raise* q_i for high signal realizations (because now there are more people with low signals, making the event "enough others participate" less likely, but the agent with a high signal has a stronger posterior that omega is high). The effect on q_i is ambiguous in general because q_i depends on both the agent's belief about omega AND her belief about the distribution of others' signals (which is a higher-order belief).

In standard global games with a continuous fundamental and uniform prior, the comparative static in sigma does go the "right" way because of the specific structure of the indifference condition. But this requires the uniqueness-via-limit-diffuse-prior argument, which the paper has not established (see Issue 1).

More precisely: the Blackwell degradation argument is valid for the *decision-theoretic* problem (a single agent assessing whether omega is high). It is NOT automatically valid for the *game-theoretic* problem (agents assessing whether enough others will participate), because strategic uncertainty introduces a feedback loop. Milgrom-Shannon monotone comparative statics require that the objective function has the single-crossing property in (action, parameter), but the participation game's expected payoff depends on sigma through both the direct signal and the equilibrium behavior of others.

**What could go wrong.** For intermediate sigma, the equilibrium could be non-monotone in sigma. Specifically, there could exist sigma values where the unique equilibrium "jumps" from high participation to low participation in a non-smooth way, or (if uniqueness fails) where multiple equilibria coexist. The monotonicity of pi* in sigma is a *consequence* of uniqueness in the standard model, not an independent result. Without establishing uniqueness first, you cannot claim monotonicity.

**Recommendation.** The proof of Lemma 2 needs to be tightened. The authors should:
1. First establish uniqueness (fixing Issue 1).
2. Then derive monotonicity as a consequence of the uniqueness characterization (the standard approach: in the unique equilibrium of the Morris-Shin game, the cutoff x* is characterized by an indifference condition that can be shown to be monotone in sigma).
3. Alternatively, if the authors want to keep the proof sketch-level, they should explicitly acknowledge that the monotonicity is a conjecture supported by the standard global games literature, not a theorem proved for their specific game.

---

### Issue 4: Two different games played through one coordination stage (Severity: MEDIUM)

**The claim.** The paper uses one coordination game whose outcome pi* feeds into two different regime-specific continuation maps. In democracy, pi* >= pi-bar activates compensation. In autocracy, pi* >= pi-bar degrades repression.

**The problem.** If the continuation maps are different, the *payoffs from participation* are different across regimes. In democracy, the benefit of coordination (for a participant) is gaining access to the compensation-triggering coalition (benefit b_D). In autocracy, the benefit is access to the revolt-degrading coalition (benefit b_A). The costs of failed participation may also differ (m_D versus m_A). This means the coordination game is *not* the same game in both regimes. It is two separate games with different payoff parameters.

The paper's Appendix B acknowledges this by writing b_x (regime-specific benefits). But then Lemma 1 asserts a unique equilibrium "for each regime x," which implicitly acknowledges two separate games. The issue is that Lemma 2's noise thresholds sigma-hat_x are then *different* across regimes. This is handled by A4, which requires sigma_r < min{sigma-hat_D, sigma-hat_A} and sigma_tau > max{sigma-hat_D, sigma-hat_A}. But the paper never discusses what determines the *relative* magnitudes of sigma-hat_D and sigma-hat_A, or under what conditions the ordering min < max holds (it always holds by definition, but the question is whether the intervals [sigma-hat_D, sigma-hat_A] or [sigma-hat_A, sigma-hat_D] are wide or narrow).

**What could go wrong.** If sigma-hat_D and sigma-hat_A are far apart, the assumption A4 becomes very strong: it requires sigma_r to be below the lower of the two thresholds AND sigma_tau to be above the higher of the two. This shrinks the parameter space. In the extreme, if b_D >> b_A (participation benefits are much larger in democracy), sigma-hat_D could be very large (coordination is easy even with noisy signals in democracy), and A4 would require sigma_tau > sigma-hat_D, which could be unreasonably high.

**Recommendation.** The authors should discuss the determinants of sigma-hat_x and provide conditions (in terms of b_x and m) under which sigma-hat_D and sigma-hat_A are close together, making A4 weak. Alternatively, they could argue that b_D and b_A are similar (the club good benefit of being in a visible coalition is comparable across regimes), which would imply sigma-hat_D approximately equals sigma-hat_A.

---

## 3. Minor Issues

### Issue 5: The visibility threshold pi-bar is exogenous and plays a non-standard role (Severity: LOW-MEDIUM)

In standard Morris-Shin regime-change games, the "attack succeeds iff participation exceeds a threshold" structure is about *regime overthrow*. Here, pi-bar is a *visibility threshold* --- coordination that triggers downstream institutional effects (compensation in democracy, degraded repression in autocracy) rather than direct regime change. This is a creative adaptation but departs from the standard model in ways that are not fully discussed.

In particular, the standard Morris-Shin regime-change game has the regime's strength as endogenous (the regime falls iff the attack is large enough relative to the regime's strength, which itself may be unknown). Here, pi-bar is exogenous and known. This simplifies the game (no uncertainty about the "regime's strength") but also eliminates the interaction between the fundamental and the regime's capacity that generates rich results in Morris-Shin.

**Assessment.** Defensible simplification. The paper is upfront that pi-bar is a step-function visibility threshold, and the mechanism is clear. The departure from standard Morris-Shin is harmless for the qualitative results but should be acknowledged explicitly as a departure.

### Issue 6: Continuum of players --- correct but unstated (Severity: LOW)

The appendix sketch (04b) uses a continuum of players [0,1] with Lebesgue measure, which is standard in global games. The paper's Section 2 also uses the integral $\pi_t = \int_0^1 a_{it} di$. This is correct and consistent. The exact law of large numbers for a continuum of i.i.d. random variables requires some measure-theoretic care (see Sun 2006, "The Exact Law of Large Numbers via Fubini Extension and Characterization of Insurable Risks"), but this is a standard issue in the literature that is typically handled by assumption. No problem here.

### Issue 7: Binary vs. continuous action (Severity: LOW)

The paper uses binary participation ($a_{it} \in \{0,1\}$), which is consistent with standard Morris-Shin (binary attack/not-attack). No issue.

### Issue 8: The sigma -> 0 limit argument in the appendix sketch (Severity: LOW-MEDIUM)

The appendix sketch (04b, Section 3.1) argues that as sigma_r -> 0, the game approaches complete information with two Nash equilibria, and global games selects the risk-dominant one. The condition stated is:

> "pi* = 1 when B/(B+c) > pi-bar"

This is the standard result for 2x2 symmetric coordination games, where risk dominance selects the equilibrium with the higher "basin of attraction." However, the paper's game is *not* a 2x2 game --- it has a continuum of players. The risk dominance criterion for continuum-player games is different from 2x2 games. In the continuum case, the Morris-Shin limit as sigma -> 0 selects the equilibrium where the fraction of types with dominant-strategy participation equals or exceeds pi-bar, which under uniform prior reduces to the condition B/(B+c) > pi-bar (this is indeed the standard result). So the specific claim is correct, but the reasoning via "risk dominance in the two-equilibrium game" is sloppy. The correct argument goes through the limit of the unique threshold equilibrium as sigma -> 0, not through selecting among multiple equilibria of the complete-information game.

**Assessment.** The result is correct but the reasoning is informal in a way that could mislead. Minor issue.

### Issue 9: The sigma -> infinity limit in the appendix sketch (Severity: LOW-MEDIUM)

The appendix sketch claims that as sigma_tau -> infinity:

> "pi*_tau -> pi-bar * c/(B+c), which is strictly less than pi-bar"

In the standard Morris-Shin model with improper uniform prior, the unique equilibrium threshold as noise -> infinity converges to the value where the prior probability of success equals c/(B+c). Under an improper prior, this gives a specific fraction. The formula pi-bar * c/(B+c) does not appear in standard references I know of. The standard result for the Morris-Shin (1998) currency attack model is that as sigma -> infinity (under a flat prior), the equilibrium converges to the one where each agent uses a purely prior-based decision, and the fraction attacking equals the prior probability that attacking is profitable.

For the paper's specific game with pi-bar as the visibility threshold and payoffs B (success) and -c (failure), the limiting behavior as sigma -> infinity should give a participation rate that depends on the prior belief about omega and the ratio B/c. The formula pi-bar * c/(B+c) looks like it might be an error or an approximation specific to a particular prior.

**Assessment.** This is a minor issue for the paper since the main text does not use this specific formula. The qualitative conclusion (participation rate is low when sigma is high) is robust. But the specific formula in the appendix should be checked or removed.

### Issue 10: The absorbing state and coordination across periods (Severity: LOW-MEDIUM)

Under rapid displacement, workers are displaced in both t=1 and t=2 (absorbing state). The paper notes that "opposition remains organized" in t=2. But does the coordination game need to be played again in t=2? If the answer is yes, then the t=2 game might have different equilibrium properties because:

1. Workers already coordinated in t=1 (they achieved pi >= pi-bar). This creates a *history* that could serve as a focal point, independent of signals.
2. The "shock" in t=2 is no longer a surprise --- it is a continuation of the t=1 shock. So sigma in t=2 under rapid displacement should arguably be even lower than sigma_r (the shock is common knowledge at this point, having been observed for a full period).

The paper treats the coordination game as if it resets each period, with the same sigma_j applying. This is a simplification.

**Assessment.** Defensible. The two-period structure is a modeling device, and the paper's claim that "compensation persists by A5" (for democracy) and "opposition remains organized" (for autocracy) handles this adequately for the main results. But the paper should acknowledge that repeated interaction could create richer dynamics.

### Issue 11: The mapping from pi* to eta is underspecified (Severity: LOW)

Section 4 of the appendix sketch offers two functional forms for eta(j) = h(pi*_j): a linear form h(pi) = 1 - alpha*pi and a step function. The paper's main text uses the step-function version (eta = eta_r if pi >= pi-bar, eta = 1 otherwise). The specific value of eta_r is never derived from the coordination game --- it remains a free parameter. The global games apparatus derives *whether* opposition is organized (pi >= pi-bar or not), but not *how much* repression degrades conditional on organization. This is fine as a modeling choice, but it means the microfoundation is incomplete: it endogenizes the *binary* regime of repressive effectiveness but not the *level*.

**Assessment.** Acceptable. The paper is clear that eta_r is a parameter. The global games microfoundation serves the purpose of showing that the binary coordination outcome (organized vs. disorganized) emerges endogenously from the information structure.

---

## 4. The Central Question: Does "Coordination Succeeds Under Rapid / Fails Under Threshold" Actually Follow?

Setting aside the technical issues above, does the *qualitative* conclusion follow from the global games apparatus?

**The argument structure:**
1. Rapid shock: sigma_r low -> high signal precision -> agents confident others also see the shock -> coordination succeeds -> pi* >= pi-bar.
2. Threshold shock: sigma_tau high -> low signal precision -> agents uncertain whether others were caught off guard -> coordination fails -> pi* < pi-bar.

**Assessment.** This argument is *qualitatively correct* and well-grounded in the global games literature. The core insight of Morris-Shin is exactly that higher-order uncertainty about the state (strategic uncertainty) can prevent coordination that would succeed under common knowledge. Low sigma produces near-common-knowledge, enabling coordination; high sigma produces strategic uncertainty, destroying it.

The specific claim that there exist sigma-hat thresholds separating coordination success from failure is also standard: in the canonical model, there is a critical noise level below which the unique equilibrium involves full (or high) participation and above which participation collapses. The paper's use of this threshold structure is appropriate.

**However:** the conclusion depends on three assumptions that the paper should make more explicit:

1. **The fundamental must be "high enough" for coordination to succeed under low noise.** The global games literature shows that low noise enables coordination *only if the fundamental is in the upper dominance region or close to it*. In the paper, when l_t = L, the fundamental omega is at its high value, so this is satisfied. But when l_t = 0 (threshold, t=1), the fundamental is at its low value, and coordination should fail regardless of sigma. The paper implicitly relies on this: in t=1 under threshold, there is nothing to coordinate *about* (no shock, no grievance). The global game is effectively not played. The paper should make this explicit: the coordination game is only relevant in periods where l_t = L.

2. **The sigma ordering sigma_r < sigma_tau must hold.** This is an empirical/structural claim about how the two automation trajectories map to information structures. It is the most novel and consequential modeling choice in the paper. The argument is that gradual/visible shocks produce low sigma (workers can see it coming, talk about it, form common expectations) while sudden/threshold shocks produce high sigma (workers are caught off guard, each privately assessing the situation). This is plausible but is ultimately an assumption, not a theorem. The paper should be more transparent that this is the key modeling judgment.

3. **The noise thresholds sigma-hat must fall between sigma_r and sigma_tau.** This is A4 in the paper. It is the assumption that makes the whole machine work: sigma_r is below the threshold (so coordination succeeds under rapid) and sigma_tau is above it (so coordination fails under threshold). The paper should discuss the conditions under which this is a strong versus weak assumption. If sigma-hat is very large, the threshold would be easy to satisfy on the upper end but hard on the lower end. If sigma-hat is very small, the reverse.

---

## 5. Specific Recommendations

### Must-fix (before submission):

1. **Reconcile binary omega in the main text with continuous omega in the appendix.** Either make the fundamental continuous everywhere or develop the binary-state global game properly. The inconsistency is the most visible gap a referee will spot.

2. **Verify or explicitly assume uniqueness conditions.** At minimum, identify the dominance regions for the paper's coordination game and state them as a lemma or condition. If the standard Morris-Shin conditions cannot be verified (e.g., because omega is binary), state uniqueness as an assumption with appropriate caveats.

3. **Tighten the proof of Lemma 2.** The Blackwell degradation argument is insufficient for the game-theoretic comparative static. Either provide a proper proof (using the uniqueness characterization) or state the result as a maintained assumption supported by the global games literature.

### Should-fix (strengthens the paper):

4. **Discuss sigma-hat_D versus sigma-hat_A.** Provide conditions under which A4 is weak (the two thresholds are close) and discuss what would happen if they are far apart.

5. **State explicitly that the coordination game is only played in periods with l_t = L.** In periods with l_t = 0, there is no grievance and hence no coordination problem. This is implicit but should be made explicit.

6. **Acknowledge the departure from standard Morris-Shin.** The visibility threshold pi-bar plays a different role from the "regime change" threshold in Morris-Shin. The paper's model is a coordination game *about visibility*, not about regime overthrow. This is a feature (it lets the coordination outcome feed into both regime types differently), but it should be discussed.

### Nice-to-have (for a top journal revision):

7. **Provide a complete worked example** with continuous omega, explicit prior, uniform noise, and compute x*, pi*, and sigma-hat in closed form for a specific parameterization. This would demonstrate that the global games machinery actually works in the paper's setting.

8. **Remove the specific limiting formula in the appendix sketch** (pi*_tau -> pi-bar * c/(B+c)) unless it can be properly derived. Replace with a qualitative statement that participation converges to a value below pi-bar.

9. **Discuss the relationship to Edmond (2013) and Shadmehr-Bernhardt (2011) more precisely.** The paper cites both but does not explain how its model differs. Edmond has endogenous information manipulation by the regime; the paper's model has exogenous sigma. Shadmehr-Bernhardt has uncertain payoffs; the paper's has uncertain coordination.

---

## 6. Overall Assessment

| Dimension | Grade | Notes |
|-----------|-------|-------|
| Qualitative intuition | A | Low noise enables coordination, high noise prevents it. Correct and well-argued. |
| Connection to Morris-Shin | B- | References are correct, spirit is captured, but technical execution has gaps. |
| Uniqueness | D | Claimed but never verified for the paper's specific game. |
| Comparative statics | C | Direction is correct but proof is incomplete. Relies on uniqueness not established. |
| Internal consistency | C- | Binary omega in main text vs. continuous omega in appendix. Two different models. |
| Sufficiency for the paper's main results | B | The main results (P1-P3) would survive under weaker microfoundation claims (e.g., equilibrium selection rather than uniqueness). |

**Bottom line.** The global games microfoundation is a valuable contribution to the paper --- it transforms A4 from a bare assumption into a consequence of informational economics. But as currently written, the microfoundation overpromises and underdelivers on the technical side. The paper claims uniqueness and derives comparative statics from the global games apparatus, but the proofs have gaps that a knowledgeable referee would identify. The recommended fixes are tractable: most of them involve making the existing argument more rigorous rather than changing the model. The qualitative story is sound; the formalization needs work.
