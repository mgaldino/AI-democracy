# Introduction

We show that the same AI technology can stabilize one regime type while
destabilizing the other, depending entirely on the automation
trajectory. When automation displaces workers immediately, democracies
compensate and survive; autocracies face organized opposition and fall.
When automation complements workers first and replaces them later, the
pattern reverses: democracies see no crisis until it is too late, while
autocracies contain the disoriented workers without difficulty. This
*crossed fragility* is not assumed — it emerges from a single
coordination equilibrium processed through distinct institutional
response mechanisms.

Consider two countries adopting the same AI. In one, factory automation
displaces workers visibly over months: protests build, unions organize,
and the government responds with retraining programs. In the other, AI
first augments professional services — lawyers draft faster, accountants
process more — until a threshold is crossed and entire job categories
vanish overnight. The first shock is legible; the second is a surprise.
The political consequences depend on whether the regime can act without
a visible crisis (autocracies can; democracies cannot) and whether
organized opposition degrades the regime’s coercive capacity (it does in
autocracies; it triggers compensation in democracies).

No formal model specifies how the *shape* of economic disruption
interacts with regime type to determine which regimes survive. The
regime stability literature treats shocks as uniform events defined by
magnitude (Acemoglu and Robinson 2006; Przeworski 2005). The automation
literature distinguishes trajectories — rapid displacement versus
threshold substitution (Gans and Goldfarb 2026; Autor, Levy, and Murnane
2003) — but has not explored their political implications.

This paper fills that gap. We build a two-period model in the Open
Economy Politics tradition (Lake 2009), taking the economics of
automation as given and deriving the political-institutional
implications. The key mechanism operates through worker coordination:
trajectory-dependent signal noise (*σ*) determines whether affected
workers can organize collectively, which in turn activates
regime-specific institutional responses — compensation in democracies,
degraded repression in autocracies.

First, we establish a crossed fragility pattern (Proposition 3). For
autocracies with moderate repressive capacity, democracies are stable
under rapid displacement but unstable under threshold automation;
autocracies exhibit the reverse. The mechanism is the coordination
capacity of affected workers. Rapid shocks generate common knowledge of
grievance (Chwe 2001), enabling collective action that democracies
channel into compensation but that degrades autocratic repression (Kuran
1991; Edmond 2013). Threshold shocks produce strategic uncertainty that
prevents coordination, paralyzing democratic response while preserving
repressive effectiveness.

Second, autocratic stability comes at a welfare cost equal to the
repressive threshold: when autocracies survive threshold shocks, their
citizens absorb the full automation loss, while democratic survival
under rapid shocks comes with compensation (Proposition 4).

Third, we show that the welfare state functions as institutional
insurance against delayed shocks (Propositions 5-6). Democracies with
comprehensive social protection survive threshold automation through the
same logic as autocracies with standing repressive capacity: both
represent permanent institutional capacity that does not require
crisis-triggered activation. The welfare state achieves this resilience
while compensating workers; repression achieves it while leaving them to
bear the full cost. The welfare gap between a surviving democracy and a
surviving autocracy equals exactly the repressive threshold, *κ̄*.

This connects to the class compromise tradition (Przeworski and
Wallerstein 1982; Moene and Wallerstein 2001): the welfare state as
institutional insurance formalizes a specific implication of that
bargain (Section 4).

Section 2 develops a unified coordination model in which
trajectory-dependent signal noise generates both democratic compensation
and autocratic repressive effectiveness as equilibrium outcomes. Section
3 derives Propositions 1-4 and comparative statics. Section 4 develops
the welfare state extension (Propositions 5-7) and a five-type regime
typology with empirical proxies. Section 5 discusses limitations. Two
appendices provide fuller derivations of the democratic voting game and
the coordination equilibrium.

# The Model

## Environment

We consider a polity over two periods *t* ∈ {1, 2} with a group of
workers *E* exposed to AI-driven automation. The remainder of the
economy is captured by the parameter *W*, representing total per capita
output, with *W* &gt; *w*<sub>*E*</sub> (exposed workers earn less than
the economy-wide average). The polity operates under one of two regime
types *x* ∈ {*D*, *A*}: democracy or autocracy.

**Automation trajectories.** Following Gans and Goldfarb (2026), we
distinguish two stylized trajectories of automation. Displacement is an
absorbing state: once AI substitutes a worker’s tasks, the income loss
persists. Under *rapid displacement* (*j* = *r*), automation causes
immediate and permanent job loss:
*y*<sub>1</sub><sup>*r*</sup> = *y*<sub>2</sub><sup>*r*</sup> = *w*<sub>*E*</sub> − *L*,
where *L* ∈ (0, *w*<sub>*E*</sub>\] is the magnitude of the shock. Under
*threshold automation* (*j* = *τ*), automation initially complements
labor (raising income to
*y*<sub>1</sub><sup>*τ*</sup> = *w*<sub>*E*</sub> + *β*, with *β* ≥ 0)
and only later becomes substitutive
(*y*<sub>2</sub><sup>*τ*</sup> = *w*<sub>*E*</sub> − *L*). These income
paths are exogenous to the political model — they represent the economic
premise imported from the automation literature. The parameter *β*
captures the productivity gain from the complementary phase; it does not
affect stability conditions (which depend on per-period income levels)
but enriches the economic premise and connects to the populism
extension.

<figure>
<embed src="figures/fig_income_paths.pdf" style="width:85.0%" />
<figcaption aria-hidden="true">Income paths under two automation
trajectories. Left: rapid displacement (<span
class="math inline"><em>y</em><sub>1</sub> = <em>y</em><sub>2</sub> = <em>w</em><sub><em>E</em></sub> − <em>L</em></span>).
Right: threshold automation (<span
class="math inline"><em>y</em><sub>1</sub> = <em>w</em><sub><em>E</em></sub> + <em>β</em></span>,
<span
class="math inline"><em>y</em><sub>2</sub> = <em>w</em><sub><em>E</em></sub> − <em>L</em></span>).
Same total displacement, different timing. Parameters from the numerical
example (<span
class="math inline"><em>w</em><sub><em>E</em></sub> = 1</span>, <span
class="math inline"><em>L</em> = 1</span>, <span
class="math inline"><em>β</em> = 0.3</span>).</figcaption>
</figure>

**Preferences.** In each period, each member of *E* chooses between *M*
(moderate — accept the status quo) and *P* (protest — pursue regime
change). Payoffs depend on the regime type. All members of *E* are
identical in the baseline; the representative worker notation
*u*<sub>*E*</sub> applies to each individual.

Under democracy:
*u*<sub>*E*</sub>(*M* ∣ *D*, *t*) = *y*<sub>*t*</sub><sup>*j*</sup> + *φ*<sub>*t*</sub> ⋅ max (0, *w*<sub>*E*</sub> − *y*<sub>*t*</sub><sup>*j*</sup>)
*u*<sub>*E*</sub>(*P* ∣ *D*, *t*) = *θ**W* − *k*

When displaced (*y*<sub>*t*</sub> = *w*<sub>*E*</sub> − *L*), this
simplifies to
*u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> − *L*(1 − *φ*<sub>*t*</sub>).
When in complementarity (*y*<sub>*t*</sub> = *w*<sub>*E*</sub> + *β*),
*u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> + *β* (no loss, no
compensation needed).

Under autocracy:
*u*<sub>*E*</sub>(*M* ∣ *A*, *t*) = *y*<sub>*t*</sub><sup>*j*</sup>
*u*<sub>*E*</sub>(*P* ∣ *A*, *t*) = *θ**W* − *k* − *κ*<sub>0</sub> ⋅ *η*(*π*<sub>*t*</sub>)

where *φ*<sub>*t*</sub> ∈ \[0, 1\] is the compensatory capacity of the
democracy, *κ*<sub>0</sub> &gt; 0 is the autocracy’s standing repressive
capacity, *η*(*π*<sub>*t*</sub>) ∈ (0, 1\] is repressive effectiveness
(determined by the coordination game), *θ* ∈ (0, 1) is the share of
total output captured by *E* under regime change, and *k* &gt; 0 is the
cost of transition (violence, uncertainty, capital destruction).

The key structural asymmetry: democracy stabilizes by making *M* more
attractive (compensation reduces losses), while autocracy stabilizes by
making *P* more costly (repression raises the price of revolt).

## Information and Collective Action

The trajectory of automation determines not only when losses occur but
how legible those losses are. We model this through a common
informational and coordination framework that feeds into regime-specific
institutional responses.

**Signals.** In each period, worker *i* ∈ *E* observes a private signal
about the severity of the automation shock:
*s*<sub>*i**t*</sub> = *ω*<sub>*t*</sub> + *σ*<sub>*j*</sub>*ε*<sub>*i**t*</sub>,   *ε*<sub>*i**t*</sub> ∼ *F*
where *ω*<sub>*t*</sub> ∈ ℝ is the latent severity of the shock and *F*
is continuous, symmetric, with full support and monotone likelihood
ratio. Displacement occurs when severity crosses a threshold:
*ℓ*<sub>*t*</sub> = *L* ⋅ **1**\[*ω*<sub>*t*</sub> ≥ *ω̄*\], where *ω̄* is
the automation threshold from Gans and Goldfarb (2026). Under rapid
displacement, *ω*<sub>*t*</sub> is high in both periods; under threshold
automation, *ω*<sub>*t*</sub> is low in *t* = 1 (complementarity) and
high in *t* = 2 (threshold crossed). The continuous fundamental
*ω*<sub>*t*</sub> is what workers receive signals about; the binary
displacement *ℓ*<sub>*t*</sub> is what enters payoffs.[1]

Signal noise *σ*<sub>*j*</sub> captures the *predictability* of the
automation shock before it arrives, not its observability after the
fact. Under rapid displacement, the approaching automation is visible
(factory closures, gradual adoption) and workers organize as the shock
approaches: *σ*<sub>*r*</sub> is low. Under threshold automation, the
complementary phase masks the coming substitution — workers perceive AI
as beneficial until the threshold is crossed. The displacement is a
genuine surprise, and each worker must rapidly assess whether enough
others were equally caught off guard to mount a collective response:
*σ*<sub>*τ*</sub> is high. This is the single reduced-form informational
bridge from the economic to the political model.

**Participation.** After observing *s*<sub>*i**t*</sub>, each member of
*E* chooses *a*<sub>*i**t*</sub> ∈ {0, 1} (join public collective action
or abstain). Aggregate participation is
*π*<sub>*t*</sub> = ∫<sub>0</sub><sup>1</sup>*a*<sub>*i**t*</sub> *d**i*.

**Visibility.** Let *g*(*π*<sub>*t*</sub>) denote how publicly legible
the grievance of *E* becomes at participation level *π*<sub>*t*</sub>.
In the baseline, use the step version:
*g*(*π*<sub>*t*</sub>) = **1**\[*π*<sub>*t*</sub> ≥ *π̄*\]
where *π̄* ∈ (0, 1) is a common visibility threshold. Smooth versions
generate the same qualitative results (see Appendix B).

**Participation payoffs.** When visibility is achieved
(*π*<sub>*t*</sub> ≥ *π̄*), participants receive a coalition-specific
benefit *b*<sub>*x*</sub> &gt; 0 (access to targeted transfers, legal
support, or mutual protection that only organized coalition members
obtain). When visibility is not achieved, participants bear a cost
*m* &gt; 0 (exposure without collective cover). The net gain from
participation is
*q*<sub>*i*</sub>*b*<sub>*x*</sub> − (1 − *q*<sub>*i*</sub>)*m*, where
*q*<sub>*i*</sub> = Pr \[*π*<sub>*t*</sub> ≥ *π̄* ∣ *s*<sub>*i**t*</sub>\].
Worker *i* participates iff
*q*<sub>*i*</sub> ≥ *m*/(*b*<sub>*x*</sub> + *m*). This is a standard
Olson-style selective incentive: the public outcome (compensation or
degraded repression) benefits all of *E*, but what sustains
participation is the member-only club good. See Appendix B for the
formal equilibrium derivation.

The same informational friction and participation technology feed two
regime-specific continuation maps. In democracy, coordination matters by
determining whether an observed *t* = 1 shock becomes a credible threat
before the compensatory window closes. In autocracy, coordination
matters more directly by determining whether repression is degraded by
visible opposition.

<figure>
<embed src="figures/fig_mechanism_flow.pdf" style="width:95.0%" />
<figcaption aria-hidden="true">Mechanism flow: how automation trajectory
maps to regime stability. The only trajectory-varying primitive is
signal noise <span class="math inline"><em>σ</em></span>, which
determines coordination <span
class="math inline"><em>π</em><sup>*</sup></span>, which feeds
regime-specific institutional responses. Green = stable, red =
unstable.</figcaption>
</figure>

## Regime-Specific Continuation Maps

**Democracy.** The non-exposed majority *N* authorizes compensation
*φ*<sub>*t*</sub> = *φ̄* only when two conditions hold: (1) a material
shock is observed (*ℓ*<sub>*t*</sub> = *L*) and (2) a visible coalition
makes the threat from *E* politically credible
(*g*(*π*<sub>*t*</sub>) = 1). Under the majority-cost condition
*γ* ≥ *c*<sub>*s*</sub>*φ̄* (where *γ* &gt; 0 is the cost *N* bears under
regime change and *c*<sub>*s*</sub> &gt; 0 is the per-unit cost of
taxation; see Appendix A for the full voting derivation), the democratic
continuation map is:
*φ*<sub>*t*</sub>(*ℓ*<sub>*t*</sub>, *π*<sub>*t*</sub>) = *φ̄* ⋅ **1**\[*ℓ*<sub>*t*</sub> = *L*\] ⋅ *g*(*π*<sub>*t*</sub>)
where *φ̄* ≡ 1 − |*Δ*|/*L* ∈ (0, 1) is the *compensatory threshold*.
Democratic compensation is historically common after crises (the New
Deal after the Great Depression, the welfare state after World War II),
not before. The coordination requirement adds that an observed shock
must also generate a visible coalition to become politically actionable.

**Autocracy.** Effective repression depends on the visibility of
opposition. Visible mass action causes defections, leakage, and external
scrutiny, degrading repressive effectiveness:
*η*(*π*<sub>*t*</sub>) = 1 − (1 − *η*<sub>*r*</sub>) ⋅ *g*(*π*<sub>*t*</sub>)
where *η*<sub>*r*</sub> ∈ (0, 1). If participation crosses the
visibility threshold (*g*(*π*<sub>*t*</sub>) = 1), repression degrades
to *η*<sub>*r*</sub>. If it does not, repression remains fully effective
(*η* = 1).

**Timing.** Within each period: (1) nature draws *ω*<sub>*t*</sub>;
displacement is
*ℓ*<sub>*t*</sub> = *L* ⋅ **1**\[*ω*<sub>*t*</sub> ≥ *ω̄*\]; (2) each
member of *E* observes *s*<sub>*i**t*</sub> and chooses
*a*<sub>*i**t*</sub>; (3) aggregate participation *π*<sub>*t*</sub>
becomes public; (4) the regime responds — in democracy, *N* decides
whether to authorize *φ̄*; in autocracy, effective repression updates to
*κ*<sub>0</sub> ⋅ *η*(*π*<sub>*t*</sub>); (5) each member of *E* chooses
*M* or *P*. The coordination stage uses Bayesian Nash equilibrium in
monotone threshold strategies; the final *M*/*P* choice is by dominance
given the realized continuation payoffs. The two periods should be read
as two politically distinct moments, not as fixed calendar intervals.
The intertemporal linkage is institutional (A5), not temporal
discounting.

## Assumptions

**Definition.** Regime *x* is *stable under trajectory *j** if
*u*<sub>*E*</sub>(*M* ∣ *x*, *t*) ≥ *u*<sub>*E*</sub>(*P* ∣ *x*, *t*)
for all *t*.

Define the auxiliary variable *Δ* ≡ *θ**W* − *k* − *w*<sub>*E*</sub>,
which represents the net attractiveness of revolt absent automation: how
much *E* would gain (if *Δ* &gt; 0) or lose (if *Δ* &lt; 0) from regime
change when fully employed.

**A1 (Stability without automation).** *Δ* &lt; 0. Without automation,
*E* prefers *M* under both regimes. The regime is inherently stable.

**A2 (Automation can destabilize).** *Δ* + *L* &gt; 0, equivalently
*L* &gt; |*Δ*|. The automation shock is large enough to potentially
trigger regime change.

**A3 (Coordination structure).** Following Morris and Shin (2003,
Section 2.1), the prior on *ω*<sub>*t*</sub> is improper uniform. The
signal family satisfies monotone likelihood ratio, higher *σ*
Blackwell-degrades private signals, and, conditional on others using a
cutoff strategy, the visibility event {*π*<sub>*t*</sub> ≥ *π̄*} is
increasing in the fundamental *ω*. Under these regularity conditions,
the coordination game admits a unique monotone equilibrium in each
regime (Lemma 1, Section 3).[2]

**A4 (Parameter restrictions).** The majority-cost condition
*γ* ≥ *c*<sub>*s*</sub>*φ̄* holds (so that *N* compensates when the
threat is credible). For each regime *x*, the visibility threshold
satisfies *π̄* &lt; *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*) (the
coalition club good strictly exceeds the failed-mobilization cost at the
visibility margin).[3] Signal noise satisfies
*σ*<sub>*r*</sub> &lt; min {*σ̂*<sub>*D*</sub>, *σ̂*<sub>*A*</sub>} and
*σ*<sub>*τ*</sub> &gt; max {*σ̂*<sub>*D*</sub>, *σ̂*<sub>*A*</sub>}, where
*σ̂*<sub>*x*</sub> are the endogenous noise thresholds derived in Lemma 2
(Section 3).

**A5 (Institutional capacity requires lead time).** Compensatory
capacity built in *t* = 1 persists to *t* = 2. No new compensatory
capacity can be built in *t* = 2.

Building social insurance infrastructure — legislative frameworks,
administrative agencies, fiscal instruments — requires institutional
investment that cannot be improvised under crisis. Welfare states are
built during periods of relative stability (the post-war settlement in
Western Europe, the Great Society programs in the United States), not
during the crises they are designed to address. Even the New Deal, an
apparent counterexample, required years of legislative design and was
enabled by prior Progressive-era institutional groundwork. In our
two-period framework, A5 is the minimal expression of this lag: the
window for building capacity closes before the delayed shock arrives.

Note that A5 binds only under threshold automation. Under rapid
displacement, the shock arrives in *t* = 1 and A3 activates compensation
immediately — A5 is irrelevant. A5 matters precisely when the shock is
delayed: the polity cannot build capacity in response to a shock it has
not yet observed. Combined with A3, this produces the democratic
tragedy: reactive institutions require a signal to mobilize, but delayed
shocks provide no signal until it is too late to act.

**Example.** Let *w*<sub>*E*</sub> = 1, *W* = 2, *L* = 1, *θ* = 0.5,
*k* = 0.4, *κ*<sub>0</sub> = 0.8, *η*<sub>*r*</sub> = 0.5, *β* = 0.3.
Then *Δ* = −0.4, *φ̄* = 0.6, *κ̄* = 0.6, *κ̄*/*η*<sub>*r*</sub> = 1.2.
Since *κ*<sub>0</sub> = 0.8 ∈ \[0.6, 1.2), this autocracy is in the
*crossed fragility* range. Income paths: rapid
*y*<sub>1</sub> = *y*<sub>2</sub> = 0; threshold *y*<sub>1</sub> = 1.3,
*y*<sub>2</sub> = 0. Consider the four scenarios:

- *Democracy, rapid*: *t* = 1: *y*<sub>1</sub> = 0. Crisis visible,
  predictable. Compensation activates: *φ*<sub>1</sub> = 0.6.
  *u*<sub>*E*</sub>(*M*) = 0 + 0.6 × 1 = 0.6 = *u*<sub>*E*</sub>(*P*).
  Marginally **stable**. *t* = 2: displacement persists
  (*y*<sub>2</sub> = 0), but compensation persists by A5
  (*φ*<sub>2</sub> = 0.6). Still **stable**.
- *Democracy, threshold*: *t* = 1: *y*<sub>1</sub> = 1.3. Workers
  gaining from AI complementarity.
  *u*<sub>*E*</sub>(*M*) = 1.3 &gt; 0.6 = *u*<sub>*E*</sub>(*P*).
  **Stable** — no crisis, no compensation built. *t* = 2: threshold
  crossed, *y*<sub>2</sub> = 0. *φ*<sub>2</sub> = 0 by A5.
  *u*<sub>*E*</sub>(*M*) = 0 &lt; 0.6 = *u*<sub>*E*</sub>(*P*).
  **Unstable**.
- *Autocracy, rapid*: *t* = 1: *y*<sub>1</sub> = 0. Workers organized
  (shock predictable).
  *κ*<sub>0</sub>*η*<sub>*r*</sub> = 0.4 &lt; 0.6 = *κ̄*. Repression
  insufficient — **unstable**. *t* = 2: displacement persists,
  opposition remains organized. Same condition. **Unstable**.
- *Autocracy, threshold*: *t* = 1: *y*<sub>1</sub> = 1.3. **Stable**
  trivially. *t* = 2: *y*<sub>2</sub> = 0. Workers surprised (shock
  unpredictable). *κ*<sub>0</sub>*η*<sub>*τ*</sub> = 0.8 ≥ 0.6.
  Repression sufficient — **stable**.

Same displacement magnitude, opposite outcomes by regime and trajectory.
Under rapid, A5 is benign: compensation built in *t* = 1 protects
against the absorbing state. Under threshold, A5 is the mechanism of
fragility: no window to build capacity before the surprise. These
parameters are used throughout the figures and corollaries.

# Results

## Equilibrium coordination

Before deriving stability, we establish that the coordination game
generates the regime-specific institutional responses endogenously. The
proofs appear in Appendix B.

**Lemma 1 (Unique cutoff equilibrium).** *Under A3, for each regime
*x* ∈ {*D*, *A*} and trajectory noise *σ*<sub>*j*</sub>, the
coordination game admits a unique monotone equilibrium: worker *i*
participates iff
*s*<sub>*i**t*</sub> ≥ *s*<sub>*x*</sub><sup>\*</sup>(*σ*<sub>*j*</sub>),
with equilibrium participation
*π*<sub>*x*</sub><sup>\*</sup>(*σ*<sub>*j*</sub>).*

**Lemma 2 (Noise comparative statics).** *Equilibrium participation
*π*<sub>*x*</sub><sup>\*</sup>(*σ*<sub>*j*</sub>) is weakly decreasing
in *σ*<sub>*j*</sub>. For each regime *x*, there exists a noise
threshold *σ̂*<sub>*x*</sub> such that
*π*<sub>*x*</sub><sup>\*</sup>(*σ*) ≥ *π̄* for *σ* ≤ *σ̂*<sub>*x*</sub>
and *π*<sub>*x*</sub><sup>\*</sup>(*σ*) &lt; *π̄* for
*σ* &gt; *σ̂*<sub>*x*</sub>.*

These lemmas establish that *σ* is the single trajectory-varying
primitive from which the institutional responses in both regimes are
derived. Under rapid displacement (*σ*<sub>*r*</sub> low), equilibrium
participation crosses the visibility threshold: compensation activates
in democracy and repression degrades in autocracy. Under threshold
automation (*σ*<sub>*τ*</sub> high), participation falls below the
threshold: no credible threat in democracy and fully effective
repression in autocracy.

<figure>
<embed src="figures/fig_threshold_plot.pdf" style="width:75.0%" />
<figcaption aria-hidden="true">Equilibrium participation <span
class="math inline"><em>π</em><sup>*</sup>(<em>σ</em>)</span> as a
function of signal noise (Lemma 2). The curve is strictly decreasing,
crossing the visibility threshold <span
class="math inline"><em>π̄</em></span> at exactly <span
class="math inline"><em>σ̂</em></span>. Rapid displacement (<span
class="math inline"><em>σ</em><sub><em>r</em></sub></span> low) produces
coordination above <span class="math inline"><em>π̄</em></span>;
threshold automation (<span
class="math inline"><em>σ</em><sub><em>τ</em></sub></span> high)
produces coordination below <span class="math inline"><em>π̄</em></span>.
Illustrative parameters: <span
class="math inline"><em>ω</em><sub>0</sub> = 1</span>, <span
class="math inline"><em>ω</em><sup>*</sup> = 0.4</span>, <span
class="math inline"><em>π̄</em> = 0.6</span>.</figcaption>
</figure>

## Stability conditions

The *compensatory threshold* is *φ̄* = 1 − |*Δ*|/*L*. The *repressive
threshold* is *κ̄* = *L* − |*Δ*|.

**Democracy.** When *y*<sub>*t*</sub> ≥ *w*<sub>*E*</sub> (no loss):
stable by A1 (since
*u*<sub>*E*</sub>(*M*) = *y*<sub>*t*</sub> ≥ *w*<sub>*E*</sub> &gt; *θ**W* − *k*).
When *y*<sub>*t*</sub> = *w*<sub>*E*</sub> − *L* and
*π*<sub>*t*</sub> ≥ *π̄*: *φ*<sub>*t*</sub> = *φ̄* and
*u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> + *Δ* = *u*<sub>*E*</sub>(*P*),
stable. When *y*<sub>*t*</sub> = *w*<sub>*E*</sub> − *L* and
*π*<sub>*t*</sub> &lt; *π̄*: *φ*<sub>*t*</sub> = 0 and stability requires
*Δ* + *L* ≤ 0, contradicting A2. *Unstable.*

**Autocracy.** When *y*<sub>*t*</sub> ≥ *w*<sub>*E*</sub>: stable by A1.
When *y*<sub>*t*</sub> = *w*<sub>*E*</sub> − *L* and
*π*<sub>*t*</sub> ≥ *π̄*: *η* = *η*<sub>*r*</sub> and stability requires
*κ*<sub>0</sub>*η*<sub>*r*</sub> ≥ *κ̄*, i.e.,
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub>. When
*y*<sub>*t*</sub> = *w*<sub>*E*</sub> − *L* and
*π*<sub>*t*</sub> &lt; *π̄*: *η* = 1 and stability requires
*κ*<sub>0</sub> ≥ *κ̄*.

Since *η*<sub>*r*</sub> &lt; 1: the autocracy needs
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub> to survive when opposition is
visible but only *κ*<sub>0</sub> ≥ *κ̄* when opposition is dispersed.

## Main propositions

**Proposition 1 (Democratic fragility pattern).** *Under A1-A5: (a)
democracy is stable under rapid displacement; (b) democracy is unstable
under threshold automation.*

*Proof.* (a) *Rapid displacement.* Workers are displaced in *t* = 1:
*y*<sub>1</sub> = *w*<sub>*E*</sub> − *L*. The shock was predictable
(*σ*<sub>*r*</sub> low), so by Lemma 2,
*π*<sub>1</sub><sup>\*</sup> ≥ *π̄*: visible coalition makes the threat
credible. *N* authorizes compensation: *φ*<sub>1</sub> = *φ̄*. By
construction of *φ̄*, workers are indifferent between *M* and *P*.
Stable. In *t* = 2, displacement persists (absorbing state:
*y*<sub>2</sub> = *w*<sub>*E*</sub> − *L*), but compensatory capacity
also persists by A5: *φ*<sub>2</sub> = *φ̄*. Still stable.

1.  *Threshold automation.* In *t* = 1, workers earn
    *w*<sub>*E*</sub> + *β* from AI complementarity:
    *u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> + *β* &gt; *w*<sub>*E*</sub> &gt; *θ**W* − *k*
    (by A1). Stable, with no crisis and no compensation built
    (*φ*<sub>1</sub> = 0). The complementary phase actively
    desmobilizes: workers are gaining, not merely unaffected. In
    *t* = 2, the threshold is crossed:
    *y*<sub>2</sub> = *w*<sub>*E*</sub> − *L*. By A5, no new capacity
    can be built. The high-noise result
    (*σ*<sub>*τ*</sub> &gt; *σ̂*<sub>*D*</sub> implies
    *π*<sub>2</sub><sup>\*</sup> &lt; *π̄*) reinforces: even ex post
    mobilization fails because the displacement was unpredictable. With
    *φ*<sub>2</sub> = 0, stability requires *Δ* + *L* ≤ 0, contradicting
    A2. Unstable. ◼

Note that the democratic failure under threshold automation is primarily
a timing mechanism: the shock arrives after the compensatory window has
closed (A5). The coordination result in *t* = 2 is confirmatory, showing
that even if the window were reopened, the high-noise environment would
prevent credible mobilization.

**Proposition 2 (Autocratic fragility pattern).** *Under A1-A4: (a)
autocracy is stable under rapid displacement iff
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub>; (b) autocracy is stable under
threshold automation iff *κ*<sub>0</sub> ≥ *κ̄*.*

*Proof.* (a) *Rapid.* Workers displaced in *t* = 1:
*y*<sub>1</sub> = *w*<sub>*E*</sub> − *L*. The shock was predictable, so
by Lemma 2, *π*<sub>1</sub><sup>\*</sup> ≥ *π̄*: visible opposition
degrades repression to *η*<sub>*r*</sub>. Stability requires
*κ*<sub>0</sub>*η*<sub>*r*</sub> ≥ *κ̄*, i.e.,
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub>. In *t* = 2, displacement
persists and opposition remains organized (same condition). Stable iff
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub> in both periods.

1.  *Threshold.* In *t* = 1, workers earn *w*<sub>*E*</sub> + *β*:
    stable trivially. In *t* = 2, the threshold is crossed:
    *y*<sub>2</sub> = *w*<sub>*E*</sub> − *L*. The shock was
    unpredictable (*σ*<sub>*τ*</sub> high), so by Lemma 2,
    *π*<sub>2</sub><sup>\*</sup> &lt; *π̄*: opposition fails to cross the
    visibility threshold. Repression at full capacity (*η* = 1).
    Stability requires *κ*<sub>0</sub> ≥ *κ̄*. ◼

**Definition.** The model exhibits *crossed fragility* when democracy is
stable under one trajectory and unstable under the other, while
autocracy exhibits the reverse pattern.

**Proposition 3 (Crossed fragility).** *Under A1-A5, if
*κ*<sub>0</sub> ∈ \[*κ̄*, *κ̄*/*η*<sub>*r*</sub>): (a) under rapid
displacement, democracy is stable and autocracy is unstable; (b) under
threshold automation, democracy is unstable and autocracy is stable.*

*Proof.* The crossed pattern emerges because the same low-noise
coordination equilibrium activates compensation in democracy but
degrades repression in autocracy, while the same high-noise equilibrium
suppresses compensation in democracy but preserves repression in
autocracy.

The interval \[*κ̄*, *κ̄*/*η*<sub>*r*</sub>) is nonempty since
*η*<sub>*r*</sub> &lt; 1. (a) Under rapid displacement
(*σ*<sub>*r*</sub> low), Lemma 2 implies *π*<sup>\*</sup> ≥ *π̄* in both
regimes. In democracy, the visible coalition activates
*φ*<sub>1</sub> = *φ̄*: stable by P1(a). In autocracy, visible opposition
degrades repression to *η*<sub>*r*</sub>, and
*κ*<sub>0</sub> &lt; *κ̄*/*η*<sub>*r*</sub> implies repression is
insufficient: unstable by P2(a). (b) Under threshold automation
(*σ*<sub>*τ*</sub> high), Lemma 2 implies *π*<sup>\*</sup> &lt; *π̄*. In
democracy, no visible coalition forms in *t* = 1 and A5 prevents
recovery: unstable by P1(b). In autocracy, dispersed opposition
preserves full repression and *κ*<sub>0</sub> ≥ *κ̄*: stable by P2(b). ◼

In the unified model, Proposition 3 is not obtained by imposing separate
regime-specific assumptions. It follows from one equilibrium object,
*π*<sup>\*</sup>, generated by the trajectory-dependent information
structure. The crossed pattern is a property of one common
informational-coordination framework interacting with distinct
institutional continuation maps.

<figure>
<embed src="figures/fig_crossed_fragility.pdf" style="width:85.0%" />
<figcaption aria-hidden="true">Regime stability under two automation
trajectories. The crossed fragility pattern (Proposition 3) applies to
the comparison between weak democracies and moderate autocracies: green
cells are stable, red cells are unstable.</figcaption>
</figure>

**Proposition 4 (Welfare cost of autocratic stability).** *Conditional
on regime survival, *E*’s welfare is strictly higher under democracy:*
*u*<sub>*E*</sub>(*M* ∣ *D*, stable) − *u*<sub>*E*</sub>(*M* ∣ *A*, stable) = *κ̄* &gt; 0

*Proof.* Democracy stable (rapid, *t* = 1):
*u*<sub>*E*</sub> = *w*<sub>*E*</sub> + *Δ*. Autocracy stable
(threshold, *t* = 2): *u*<sub>*E*</sub> = *w*<sub>*E*</sub> − *L*.
Difference: *Δ* + *L* = *κ̄* &gt; 0. ◼

Autocratic stability is “stability without welfare.” Note that
Proposition 4 compares welfare across different scenarios: democracy
surviving rapid displacement versus autocracy surviving threshold
automation. This is the relevant comparison because, under the crossed
fragility pattern, each regime survives under its favorable trajectory.
The welfare gap is exactly the repressive threshold *κ̄*: the cost that
autocratic citizens pay for their regime’s stability.

**Remark 1 (Threshold of thresholds).** *Define
*L*<sup>\*</sup> ≡ *κ*<sub>0</sub> + |*Δ*|. For
*L* &gt; *L*<sup>\*</sup>, autocracy is unstable under threshold
automation.*

*Proof.* Stability requires *κ*<sub>0</sub> ≥ *κ̄* = *L* − |*Δ*|.
*L* &gt; *κ*<sub>0</sub> + |*Δ*| ⇒ *κ̄* &gt; *κ*<sub>0</sub>. ◼

Sufficiently large shocks overwhelm even standing repressive capacity.
The “threshold of thresholds” is the point where automation exceeds
repression.

**Remark 2 (Width of the crossed interval).** *The set of
*κ*<sub>0</sub> values generating the crossed pattern has width
*κ̄*(1 − *η*<sub>*r*</sub>)/*η*<sub>*r*</sub>, which is increasing in
*κ̄*, decreasing in *η*<sub>*r*</sub>, and zero when
*η*<sub>*r*</sub> = 1.*

*Proof.*
|*κ̄*/*η*<sub>*r*</sub> − *κ̄*| = *κ̄*(1 − *η*<sub>*r*</sub>)/*η*<sub>*r*</sub>.
Derivatives are immediate. ◼

The parameter *η*<sub>*r*</sub> governs everything. It captures how
vulnerable autocratic repression is to organized opposition. When
*η*<sub>*r*</sub> = 1 (repression is equally effective regardless of
coordination), the crossed pattern vanishes; the model collapses to one
where trajectory does not matter for autocracies. The crossed fragility
result is a consequence of *η*<sub>*r*</sub> &lt; 1 — the empirically
grounded assumption that repression degrades against organized, visible,
legitimate opposition.

**Corollary 1 (Autocratic typology).**

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 31%" />
<col style="width: 20%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Condition</th>
<th style="text-align: center;">Rapid</th>
<th style="text-align: center;">Threshold</th>
</tr>
</thead>
<tbody>
<tr>
<td>Democracy</td>
<td>(by A3)</td>
<td style="text-align: center;">Stable</td>
<td style="text-align: center;">Unstable</td>
</tr>
<tr>
<td>Weak autocracy</td>
<td><span
class="math inline"><em>κ</em><sub>0</sub> &lt; <em>κ̄</em></span></td>
<td style="text-align: center;">Unstable</td>
<td style="text-align: center;">Unstable</td>
</tr>
<tr>
<td>Moderate autocracy</td>
<td><span
class="math inline"><em>κ̄</em> ≤ <em>κ</em><sub>0</sub> &lt; <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span></td>
<td style="text-align: center;">Unstable</td>
<td style="text-align: center;">Stable</td>
</tr>
<tr>
<td>Strong autocracy</td>
<td><span
class="math inline"><em>κ</em><sub>0</sub> ≥ <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span></td>
<td style="text-align: center;">Stable</td>
<td style="text-align: center;">Stable</td>
</tr>
</tbody>
</table>

# Extension: The Welfare State as Institutional Insurance

The baseline model (Propositions 1-4) assumes that democracies have no
standing compensatory capacity (*φ*<sub>0</sub> = 0). But some
democracies maintain comprehensive social insurance that does not
require crisis activation. We now ask: does standing compensatory
capacity protect democracies against threshold automation, in the same
way that standing repressive capacity protects autocracies? Standing
compensatory capacity *φ*<sub>0</sub> bypasses the coordination
bottleneck for threshold shocks: it insures democracy against the
low-participation equilibrium induced by high-noise signals.

**Generalized continuation map.** Allow standing compensatory capacity
*φ*<sub>0</sub> ≥ 0:
*φ*<sub>*t*</sub> = max (*φ*<sub>0</sub>, *φ̄* ⋅ **1**\[*ℓ*<sub>*t*</sub> = *L*\] ⋅ *g*(*π*<sub>*t*</sub>))

**Proposition 5 (Welfare state as insurance against delayed shocks).**
*(a) Democracy is stable under threshold automation iff
*φ*<sub>0</sub> ≥ *φ̄*. (b) For *φ*<sub>0</sub> &lt; *φ̄*, Proposition 1
holds unchanged. (c) For *φ*<sub>0</sub> ≥ *φ̄*, democracy is stable
under both trajectories.*

*Proof.* (a) Threshold, *t* = 2: *ℓ*<sub>2</sub> = *L*,
*φ*<sub>2</sub> = *φ*<sub>0</sub>. Stable iff *φ*<sub>0</sub> ≥ *φ̄*. (b)
*φ*<sub>0</sub> &lt; *φ̄*: threshold *t* = 2 has
*φ*<sub>2</sub> = *φ*<sub>0</sub> &lt; *φ̄*, unstable; rapid *t* = 1 has
*φ*<sub>1</sub> = *φ̄*, stable. Identical to P1. (c)
*φ*<sub>0</sub> ≥ *φ̄*: in any period with *ℓ*<sub>*t*</sub> = *L*,
*φ*<sub>*t*</sub> ≥ *φ*<sub>0</sub> ≥ *φ̄*, stable. ◼

The parameter *φ*<sub>0</sub> is the democratic analogue of
*κ*<sub>0</sub>. Both represent *permanent institutional capacity*
functioning as insurance against delayed shocks: *κ*<sub>0</sub> through
repression, *φ*<sub>0</sub> through social protection. Democracies with
comprehensive welfare states (*φ*<sub>0</sub> ≥ *φ̄*) are functionally
equivalent to strong autocracies
(*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub>) in terms of resilience — but
with strictly superior welfare outcomes.

**Proposition 6 (Functional equivalence with welfare gap).**

*(a) Both strong democracies (*φ*<sub>0</sub> ≥ *φ̄*) and strong
autocracies (*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub>) are stable under
both trajectories.*

*(b) Under threshold automation, *E*’s welfare differs:*
*u*<sub>*E*</sub>(*M* ∣ *D*-strong) − *u*<sub>*E*</sub>(*M* ∣ *A*-strong) ≥ *κ̄* &gt; 0

*Proof.* Part (a): strong democracy is stable under both trajectories by
P5(c). Strong autocracy: under rapid,
*κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub> implies stability by P2(a);
under threshold, *κ*<sub>0</sub> ≥ *κ̄*/*η*<sub>*r*</sub> &gt; *κ̄*
implies stability by P2(b). Part (b): strong democracy, threshold
*t* = 2:
*u*<sub>*E*</sub> = *w*<sub>*E*</sub> − *L*(1 − *φ*<sub>0</sub>) ≥ *w*<sub>*E*</sub> − *L*(1 − *φ̄*) = *w*<sub>*E*</sub> + *Δ*.
Strong autocracy, threshold *t* = 2:
*u*<sub>*E*</sub> = *w*<sub>*E*</sub> − *L*. Difference
 ≥ *Δ* + *L* = *κ̄* &gt; 0 by A2. ◼

Part (a) establishes that comprehensive social insurance and standing
repressive capacity are functionally equivalent as *stabilization*
mechanisms. Part (b) shows they are not equivalent as *welfare*
mechanisms: the welfare gap is at least *κ̄*, exactly the repressive
threshold. A strong democracy stabilizes *and* compensates. A strong
autocracy stabilizes but leaves workers to bear the full cost of
automation. The normative argument for comprehensive social insurance is
that it purchases the same institutional resilience as repression —
without the human cost.

**Illustrative example (continued).** Using the same parameters
(*Δ* = −0.4, *L* = 1, *φ̄* = 0.6, *κ*<sub>0</sub> = 0.8,
*η*<sub>*r*</sub> = 0.5), suppose a strong democracy with
*φ*<sub>0</sub> = 0.6 ≥ *φ̄*. Under threshold automation at *t* = 2:
*u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> − 1(1 − 0.6) = *w*<sub>*E*</sub> − 0.4,
while *u*<sub>*E*</sub>(*P*) = *w*<sub>*E*</sub> − 0.4. Marginally
stable — the welfare state absorbs the shock. Compare with the strong
autocracy (*κ*<sub>0</sub> = 0.8), also stable under threshold:
*u*<sub>*E*</sub>(*M*) = *w*<sub>*E*</sub> − 1 = *w*<sub>*E*</sub> − 1.0.
The welfare gap is (−0.4) − (−1.0) = 0.6 = *κ̄*. Both regimes survive,
but democratic citizens earn 0.6 more than autocratic citizens — exactly
the repressive threshold.

This connects to the class compromise tradition. Przeworski and
Wallerstein (1982) modeled the bargain sustaining democratic capitalism:
workers consent to private profit in exchange for social protection (see
also Moene and Wallerstein 2001 on the demand for social insurance under
inequality). Our P5-P6 formalize a specific implication: when this
compromise is institutionalized as a standing welfare state, it insures
the regime itself against technological disruption. The authoritarian
alternative, welfare spending as a substitute for (or complement to)
repression to prevent insurrection (Desai, Olofsgard, and Yousef 2009),
achieves stabilization but at the cost of leaving citizens
uncompensated.

**Corollary 2 (Complete regime typology).**

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 31%" />
<col style="width: 20%" />
<col style="width: 31%" />
</colgroup>
<thead>
<tr>
<th>Type</th>
<th>Condition</th>
<th style="text-align: center;">Rapid</th>
<th style="text-align: center;">Threshold</th>
</tr>
</thead>
<tbody>
<tr>
<td>Strong democracy</td>
<td><span
class="math inline"><em>φ</em><sub>0</sub> ≥ <em>φ̄</em></span></td>
<td style="text-align: center;">Stable</td>
<td style="text-align: center;">Stable</td>
</tr>
<tr>
<td>Weak democracy</td>
<td><span
class="math inline"><em>φ</em><sub>0</sub> &lt; <em>φ̄</em></span></td>
<td style="text-align: center;">Stable</td>
<td style="text-align: center;">Unstable</td>
</tr>
<tr>
<td>Weak autocracy</td>
<td><span
class="math inline"><em>κ</em><sub>0</sub> &lt; <em>κ̄</em></span></td>
<td style="text-align: center;">Unstable</td>
<td style="text-align: center;">Unstable</td>
</tr>
<tr>
<td>Moderate autocracy</td>
<td><span
class="math inline"><em>κ̄</em> ≤ <em>κ</em><sub>0</sub> &lt; <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span></td>
<td style="text-align: center;">Unstable</td>
<td style="text-align: center;">Stable</td>
</tr>
<tr>
<td>Strong autocracy</td>
<td><span
class="math inline"><em>κ</em><sub>0</sub> ≥ <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span></td>
<td style="text-align: center;">Stable</td>
<td style="text-align: center;">Stable</td>
</tr>
</tbody>
</table>

The crossed fragility pattern (Proposition 3) applies to the comparison
between *weak democracies* and *moderate autocracies*. Figure 1
illustrates the parametric regions.

<figure>
<embed src="figures/fig_parametric_space.pdf" style="width:100.0%" />
<figcaption aria-hidden="true">Stability regions by regime type. Panel
A: autocracy stability as a function of standing repressive capacity
<span class="math inline"><em>κ</em><sub>0</sub></span>. Panel B:
democracy stability as a function of standing compensatory capacity
<span class="math inline"><em>φ</em><sub>0</sub></span>. Parameters:
<span class="math inline"><em>L</em> = 1</span>, <span
class="math inline">|<em>Δ</em>| = 0.4</span>, <span
class="math inline"><em>η</em><sub><em>r</em></sub> = 0.5</span>.</figcaption>
</figure>

**Empirical mapping.**

<table>
<colgroup>
<col style="width: 47%" />
<col style="width: 52%" />
</colgroup>
<thead>
<tr>
<th>Theoretical type</th>
<th>Candidate examples</th>
</tr>
</thead>
<tbody>
<tr>
<td>Strong democracy (<span
class="math inline"><em>φ</em><sub>0</sub> ≥ <em>φ̄</em></span>)</td>
<td>Scandinavia, Germany (comprehensive welfare state)</td>
</tr>
<tr>
<td>Weak democracy (<span
class="math inline"><em>φ</em><sub>0</sub> &lt; <em>φ̄</em></span>)</td>
<td>United States, United Kingdom (residual welfare state)</td>
</tr>
<tr>
<td>Moderate autocracy (<span
class="math inline"><em>κ̄</em> ≤ <em>κ</em><sub>0</sub> &lt; <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span>)</td>
<td>China, Russia, Iran</td>
</tr>
<tr>
<td>Strong autocracy (<span
class="math inline"><em>κ</em><sub>0</sub> ≥ <em>κ̄</em>/<em>η</em><sub><em>r</em></sub></span>)</td>
<td>North Korea, Saudi Arabia</td>
</tr>
<tr>
<td>Weak autocracy (<span
class="math inline"><em>κ</em><sub>0</sub> &lt; <em>κ̄</em></span>)</td>
<td>Competitive autocracies pre-Arab Spring</td>
</tr>
</tbody>
</table>

**Empirical proxies and rough calibration.** The model’s parameters can
be approximated with available data. For democratic resilience,
*φ*<sub>0</sub> maps to public social spending as a share of GDP (OECD
SOCX database): Scandinavian countries spend 26-30% of GDP (Denmark 28%,
Sweden 26%), Germany 26%, while the United States spends 19% and the
United Kingdom 21%. For repressive capacity, *κ*<sub>0</sub> maps to
combined military and internal security spending as a share of GDP,
supplemented by indices of state coercive capacity (e.g., V-Dem’s
Physical Violence Index): Saudi Arabia allocates 6-7% of GDP to defense,
Russia approximately 4%, China roughly 2% on defense alone (internal
security spending is not reported). For repressive effectiveness,
*η*<sub>*r*</sub> is harder to observe directly but should correlate
with security force professionalization, ethnic cohesion of the
military, degree of international isolation, and — increasingly —
surveillance technology deployment.

A back-of-the-envelope exercise illustrates that the crossed fragility
interval is empirically relevant. If *η*<sub>*r*</sub> = 0.5 (repression
loses half its effectiveness against organized opposition), the crossed
interval \[*κ̄*, *κ̄*/*η*<sub>*r*</sub>) spans a factor of 2 in
*κ*<sub>0</sub>: any autocracy whose repressive capacity is sufficient
to contain disoriented dissent but insufficient to contain organized
opposition at full force falls in the crossed range. By Remark 2, the
interval width is *κ̄*/*η*<sub>*r*</sub>, which for
*η*<sub>*r*</sub> = 0.5 equals *κ̄* itself. This suggests that a
substantial fraction of real-world autocracies — those with moderate but
not overwhelming coercive capacity — should exhibit the crossed pattern.
Systematic measurement of *φ*<sub>0</sub>, *κ*<sub>0</sub>, and
*η*<sub>*r*</sub> remains a task for empirical work, but the theoretical
prediction is that the crossed fragility region is wide, not a
knife-edge.

## Why democracies cannot recover in *t* = 2: endogenous fiscal fragility

A natural objection: under threshold automation, the crisis *is*
observable in *t* = 2 (*ℓ*<sub>2</sub> = *L*). Why can’t the democracy
build emergency compensation then? Assumption A5 rules this out by fiat.
We now relax A5 and show that the result survives under an endogenous
fiscal constraint.

**A5’ (Emergency fiscal constraint).** In *t* = 2, the democracy can
attempt to build emergency compensatory capacity
*φ*<sub>2</sub><sup>*e**m*</sup> at cost
*p* ⋅ *c*(*φ*<sub>2</sub><sup>*e**m*</sup>), where *p* ≥ 1 is the
*crisis premium* (reflecting fiscal stress, political polarization, and
borrowing costs under duress) and *c*(⋅) is the normal cost of building
capacity, assumed continuous and strictly increasing with *c*(0) = 0.
Emergency spending is subject to a fiscal constraint:
*p* ⋅ *c*(*φ*<sub>2</sub><sup>*e**m*</sup>) ≤ *F*, where ℱ &gt; 0 is
available fiscal capacity.

**Proposition 7 (Endogenous fiscal fragility).** *Under A5’ replacing
A5, define *p*<sup>\*</sup> ≡ ℱ/*c*(*φ̄*). Democracy is unstable under
threshold automation whenever *p* ≥ *p*<sup>\*</sup>.*

*Proof.* Under threshold, *t* = 2: *ℓ*<sub>2</sub> = *L*,
*φ*<sub>1</sub> = 0 (by A3). Survival requires
*φ*<sub>2</sub><sup>*e**m*</sup> ≥ *φ̄*, costing *p* ⋅ *c*(*φ̄*). This is
affordable iff *p* ⋅ *c*(*φ̄*) ≤ ℱ, i.e., *p* ≤ *p*<sup>\*</sup>. For
*p* ≥ *p*<sup>\*</sup>: emergency compensation is unaffordable. P1(b)
holds. ◼

Three forces push *p* above *p*<sup>\*</sup> during a threshold crisis:

1.  *Fiscal erosion.* The automation shock shrinks the tax base: workers
    who lose income pay less tax. The fiscal capacity ℱ itself declines
    with *ℓ*<sub>2</sub>.
2.  *Political paralysis.* Workers moving toward *P* makes legislative
    bargaining over emergency spending harder. The non-exposed majority
    (who must approve taxation, per Appendix A) faces a more polarized
    environment.
3.  *Credibility collapse.* Emergency programs announced during crisis
    are less credible than established institutions: implementation
    lags, administrative capacity is absent, and beneficiaries cannot
    verify promises.

The asymmetry with autocracy is structural: *κ*<sub>0</sub> is a
pre-built stock, not a crisis-mobilized flow. The repressive apparatus
does not require emergency fiscal authorization — its cost was paid *ex
ante* through continuous maintenance. Compensation, by contrast, must be
fiscally mobilized *during* the crisis, precisely when mobilization is
hardest.

**Corollary 3 (Vicious cycle of democratic fragility).** *Under
threshold automation with endogenous fiscal constraint, weak democracies
(*φ*<sub>0</sub> &lt; *φ̄*) face a vicious cycle: (i) no preventive
investment in *t* = 1 (A3); (ii) crisis in *t* = 2 erodes fiscal
capacity (ℱ↓) and raises political costs (*p*↑); (iii) emergency
response becomes unaffordable (*p* &gt; *p*<sup>\*</sup>); (iv)
instability. Preventive investment (*φ*<sub>0</sub> ≥ *φ̄*, P5) breaks
this cycle by building capacity before fiscal conditions deteriorate.*

This result strengthens the normative case for the welfare state. The
choice is not merely between compensating workers (humane) and
repressing them (effective). It is between investing *before* the
crisis, when fiscal conditions permit, and attempting to invest *during*
the crisis, when they may not. A5 is the limiting case (*p* → ∞); the
endogenous version preserves the result whenever crisis conditions are
severe enough to make emergency response prohibitively expensive.

# Discussion

## Two symmetric tragedies

The model reveals a structural irony in each regime type.

*The tragedy of democratic responsiveness.* The same property that makes
democracies good for citizens — responsiveness to political demands,
leading to compensatory policy — makes them fragile to delayed shocks.
Without observable distress, there is no political demand; without
demand, there is no action. Responsiveness is both the source of
democratic strength and the mechanism of democratic fragility.

*The tragedy of autocratic repression.* The same property that makes
autocracies resilient to delayed shocks — standing repressive capacity
maintained independently of economic conditions — makes them (i)
vulnerable to visible shocks, where organized opposition degrades
repressive effectiveness, and (ii) unable to benefit citizens even when
stability is preserved, since repression contains discontent without
addressing its cause.

## Comparative statics

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 42%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th>Parameter</th>
<th>Effect on stability</th>
<th>Interpretation</th>
</tr>
</thead>
<tbody>
<tr>
<td><span class="math inline"><em>L</em>↑</span></td>
<td><span class="math inline"><em>φ̄</em>↑</span>, <span
class="math inline"><em>κ̄</em>↑</span></td>
<td>Larger shocks destabilize both</td>
</tr>
<tr>
<td><span
class="math inline"><em>η</em><sub><em>r</em></sub>↓</span></td>
<td>Crossed interval widens</td>
<td>More autocracies exhibit the crossed pattern</td>
</tr>
<tr>
<td><span class="math inline"><em>θ</em>↑</span></td>
<td><span class="math inline"><em>Δ</em>↑</span>, both thresholds
rise</td>
<td>Regime change more attractive</td>
</tr>
<tr>
<td><span class="math inline"><em>k</em>↑</span></td>
<td><span class="math inline"><em>Δ</em>↓</span>, both thresholds
fall</td>
<td>Regime change costlier, more stability</td>
</tr>
<tr>
<td><span class="math inline"><em>κ</em><sub>0</sub>↑</span></td>
<td>Autocracy more stable</td>
<td>Moves from weak to moderate to strong</td>
</tr>
<tr>
<td><span class="math inline"><em>φ</em><sub>0</sub>↑</span></td>
<td>Democracy more stable under threshold</td>
<td>Welfare state as insurance</td>
</tr>
</tbody>
</table>

## On the distance between assumptions and results

In the unified model, the crossed fragility result (Proposition 3) is
not obtained by imposing separate regime-specific behavioral
assumptions. The inferential chain runs: trajectory → signal noise *σ* →
equilibrium participation *π*<sup>\*</sup> → regime-specific
continuation map → stability. The only trajectory-varying primitive is
signal noise. Democratic compensation and autocratic repressive
effectiveness are both consequences of one equilibrium object,
*π*<sup>\*</sup>, processed through distinct institutional continuation
maps. This architecture produces a materially longer distance from
premises to conclusions than a setup where compensation and repression
patterns are postulated directly.

The coordination mechanism has asymmetric causal weight across regimes,
and the model is explicit about this. On the democratic side, the
primary driver of fragility under threshold automation remains
institutional timing: *ℓ*<sub>1</sub> = 0 means no shock is observed
while the compensatory window (A5) is still open. The coordination
result in *t* = 2 is confirmatory, showing that even ex post
mobilization would fail under high noise. On the autocratic side,
coordination plays a more directly constitutive role: visible opposition
degrades repression, and the absence of visibility preserves it.

One reduced-form step remains: the mapping from automation trajectory to
signal noise (*σ*<sub>*r*</sub> low, *σ*<sub>*τ*</sub> high). This is a
narrower and more transparent residual assumption than the previous
architecture, where two separate behavioral patterns (reactive
compensation and coordination-dependent repression) had to be postulated
independently.

## Limitations

The underlying coordination mechanism is unified, but the institutional
continuation maps remain regime-specific: democracies compensate,
autocracies repress. In practice, regimes use mixed strategies —
autocracies also redistribute (Knutsen and Rasmussen 2018) and
democracies also coerce. An extension showing that instrument
specialization emerges endogenously from cost advantages would
strengthen the argument.

The model treats *φ*<sub>0</sub> as costless to maintain. In practice,
comprehensive social insurance imposes efficiency costs: tax
distortions, moral hazard, and reduced labor market flexibility. If
sustaining *φ*<sub>0</sub> ≥ *φ̄* reduces output *W*, the welfare state
that insures the regime against threshold automation may simultaneously
weaken growth, potentially generating instability through a different
channel. The optimal level of *φ*<sub>0</sub> involves a trade-off
between institutional resilience and economic efficiency that the model
does not capture. The prescriptive implication — invest in social
insurance before the crisis — remains valid, but its full cost-benefit
analysis requires accounting for these distortions.

The coordination game has different payoff parameters across regimes
(*b*<sub>*D*</sub>, *b*<sub>*A*</sub>), which means the noise thresholds
*σ̂*<sub>*D*</sub> and *σ̂*<sub>*A*</sub> may differ. A4 requires
*σ*<sub>*r*</sub> below both thresholds and *σ*<sub>*τ*</sub> above
both, which is a stronger restriction when the thresholds are far apart.
If the coalition club good is similar across regimes
(*b*<sub>*D*</sub> ≈ *b*<sub>*A*</sub>) — plausible when the benefit of
collective visibility is comparable regardless of whether it triggers
compensation or degrades repression — then
*σ̂*<sub>*D*</sub> ≈ *σ̂*<sub>*A*</sub> and A4 is weak. When
*b*<sub>*D*</sub> ≫ *b*<sub>*A*</sub>, coordination is easier in
democracy, *σ̂*<sub>*D*</sub> is large, and A4 requires high
*σ*<sub>*τ*</sub> to ensure coordination failure in both regimes.

The two-period structure treats each period’s coordination game as
independent. Under rapid displacement, workers who coordinated in
*t* = 1 enter *t* = 2 with a shared history that could serve as a focal
point, potentially making *σ* effectively even lower in *t* = 2. The
model’s assumption that the same *σ*<sub>*j*</sub> applies in both
periods is a simplification that understates the coordination advantage
under rapid displacement. This reinforces rather than undermines the
crossed fragility result.

The parameter *η*<sub>*r*</sub> is assumed, not estimated. Empirically,
*η*<sub>*r*</sub> should correlate with security force
professionalization, ethnic cohesion of the military, international
isolation, and surveillance technology. Systematic measurement remains a
task for future research.

The two-period structure captures timing but not richer dynamics. A
multi-period extension with learning and adjustment would allow for
adaptive institutional responses. The binary distinction between rapid
and threshold can be relaxed within the current framework by
parameterizing trajectory as *ℓ*<sub>1</sub> = *p**L*,
*ℓ*<sub>2</sub> = (1 − *p*)*L* for *p* ∈ \[0, 1\], where *p* = 1 is
rapid and *p* = 0 is threshold. For intermediate values, partial
compensation is triggered in *t* = 1 (proportional to *p**L*) and the
residual shock (1 − *p*)*L* arrives in *t* = 2 without protection. The
crossed fragility pattern emerges most sharply for extreme values of *p*
and weakens as *p* approaches interior values, confirming that the
result does not depend on the binary assumption but is strongest when
trajectories are maximally distinct.

# Conclusion

We have shown that the trajectory of AI automation — rapid displacement
versus threshold substitution — produces systematically different
fragility patterns across regime types. The key mechanism is the
coordination capacity of affected workers, which has opposite effects on
democracies (enables compensation) and autocracies (degrades
repression).

Three results stand out. First, the crossed fragility pattern: each
regime has comparative advantage in processing one type of shock
(Proposition 3). Second, the welfare cost of autocratic resilience: when
autocracies survive, their citizens bear the full cost of disruption
(Proposition 4). Third, the functional equivalence of social insurance
and repressive capacity as institutional insurance, with the former
strictly dominating in welfare (Propositions 5-6).

The crossed fragility logic is not specific to AI: it applies whenever
economic shocks differ in observability, including financial crises
(slow-building versus sudden crashes), climate change (gradual warming
versus extreme events), and demographic transitions.

The policy implication is direct. Democracies facing AI automation with
potential threshold dynamics — sectors where automation initially
complements and later substitutes — should invest in standing social
insurance *before* the crisis materializes. The welfare state is the
democratic substitute for the repressive apparatus that autocracies
maintain as a matter of course. Social insurance protects both the
regime and its citizens; repression protects only the regime.

# References

Acemoglu, D., and J. A. Robinson. 2006. *Economic Origins of
Dictatorship and Democracy*. Cambridge University Press.

Acemoglu, D., and P. Restrepo. 2020. “Robots and Jobs: Evidence from US
Labor Markets.” *Journal of Political Economy* 128(6): 2188-2244.

Autor, D. H., F. Levy, and R. J. Murnane. 2003. “The Skill Content of
Recent Technological Change: An Empirical Exploration.” *Quarterly
Journal of Economics* 118(4): 1279-1333.

Boix, C. 2003. *Democracy and Redistribution*. Cambridge University
Press.

Chwe, M. S.-Y. 2001. *Rational Ritual: Culture, Coordination, and Common
Knowledge*. Princeton University Press.

Desai, R. M., A. Olofsgard, and T. M. Yousef. 2009. “The Logic of
Authoritarian Bargains.” *Economics and Politics* 21(1): 93-125.

Edmond, C. 2013. “Information Manipulation, Coordination, and Regime
Change.” *Review of Economic Studies* 80(4): 1422-1458.

Gans, J. S., and A. Goldfarb. 2026. “O-Ring Automation.” Working paper.

Knutsen, C. H., and M. Rasmussen. 2018. “The Autocratic Welfare State:
Old-Age Pensions, Credible Commitments, and Regime Survival.”
*Comparative Political Studies* 51(5): 659-695.

Kuran, T. 1991. “Now Out of Never: The Element of Surprise in the East
European Revolution of 1989.” *World Politics* 44(1): 7-48.

Lake, D. A. 2009. “Open Economy Politics: A Critical Review.” *Review of
International Organizations* 4(3): 219-244.

Moene, K. O., and M. Wallerstein. 2001. “Inequality, Social Insurance,
and Redistribution.” *American Political Science Review* 95(4): 859-874.

Morris, S., and H. S. Shin. 2003. “Global Games: Theory and
Applications.” In *Advances in Economics and Econometrics*, edited by M.
Dewatripont, L. P. Hansen, and S. J. Turnovsky. Cambridge University
Press.

Przeworski, A. 2005. “Democracy as an Equilibrium.” *Public Choice* 123:
253-273.

Przeworski, A. 2006. “Self-Enforcing Democracy.” In *Oxford Handbook of
Political Economy*, edited by B. R. Weingast and D. A. Wittman. Oxford
University Press.

Przeworski, A., M. E. Alvarez, J. A. Cheibub, and F. Limongi. 2000.
*Democracy and Development: Political Institutions and Well-Being in the
World, 1950-1990*. Cambridge University Press.

Przeworski, A., and F. Limongi. 1997. “Modernization: Theories and
Facts.” *World Politics* 49(2): 155-183.

Przeworski, A., and M. Wallerstein. 1982. “The Structure of Class
Conflict in Democratic Capitalist Societies.” *American Political
Science Review* 76(2): 215-238.

Svolik, M. W. 2012. *The Politics of Authoritarian Rule*. Cambridge
University Press.

# Democratic Continuation Map — Voting Derivation

This appendix provides a richer derivation of the democratic
continuation map *φ*<sub>*t*</sub>(*ℓ*<sub>*t*</sub>, *π*<sub>*t*</sub>)
introduced in Section 2.

## Setup

Two groups within the democracy: *E* (exposed, mass *μ*<sub>*E*</sub>)
and *N* (non-exposed, mass *μ*<sub>*N*</sub> &gt; *μ*<sub>*E*</sub>).
Within each period, after *ℓ*<sub>*t*</sub> is revealed and aggregate
participation *π*<sub>*t*</sub> is observed: (1) *E* announces political
stance (*M* or *P*); (2) *N* votes on a tax rate *τ*<sub>*t*</sub>
financing compensation *φ*<sub>*t*</sub>; (3) *E* takes final action.

*N*’s payoff:
*U*<sub>*N*</sub> = *w*<sub>*N*</sub> − *τ*<sub>*t*</sub>*c*<sub>*s*</sub> − *γ* ⋅ *g*(*π*<sub>*t*</sub>) ⋅ **1**\[*ℓ*<sub>*t*</sub> = *L*\],
where *c*<sub>*s*</sub> &gt; 0 is the per-unit cost of taxation,
*α* ∈ (0, 1) is the fraction of *N*’s income preserved under regime
change, and *γ* ≡ (1 − *α*)*w*<sub>*N*</sub> &gt; 0 is the cost *N*
bears under regime change. The visibility function
*g*(*π*<sub>*t*</sub>) enters because *N* perceives the instability
threat as credible only when both a material shock exists and the
coalition is publicly visible.

## Equilibrium

**When *ℓ*<sub>*t*</sub> = 0:** By A1, *E* cannot credibly threaten *P*.
*N*’s optimal tax is *τ*<sup>\*</sup> = 0.

**When *ℓ*<sub>*t*</sub> = *L* and *g*(*π*<sub>*t*</sub>) = 0:** No
visible coalition. The threat from *E* is not politically credible.
*N*’s optimal tax is *τ*<sup>\*</sup> = 0.

**When *ℓ*<sub>*t*</sub> = *L* and *g*(*π*<sub>*t*</sub>) = 1:** *E*’s
threat is credible (visible coalition + material loss). *N* compares
pacification (*τ* = *φ̄*, payoff
*w*<sub>*N*</sub> − *φ̄**c*<sub>*s*</sub>) versus instability (*τ* = 0,
payoff *w*<sub>*N*</sub> − *γ*). *N* pacifies iff
*γ* ≥ *φ̄**c*<sub>*s*</sub>.

**Parameter restriction (P-R):** *γ*/*c*<sub>*s*</sub> ≥ *φ̄*. Under
(P-R), the unique subgame-perfect equilibrium yields
*φ*<sup>\*</sup>(*ℓ*<sub>*t*</sub>, *π*<sub>*t*</sub>) = *φ̄* ⋅ **1**\[*ℓ*<sub>*t*</sub> = *L*\] ⋅ *g*(*π*<sub>*t*</sub>),
recovering the democratic continuation map stated in Section 2.

# Coordination Equilibrium — Proofs

This appendix provides the formal derivations for Lemmas 1 and 2 stated
in Section 3, and establishes the existence of endogenous noise
thresholds *σ̂*<sub>*x*</sub>.

## Setup

The coordination game is as described in Section 2. Worker *i* in regime
*x* observes
*s*<sub>*i**t*</sub> = *ω*<sub>*t*</sub> + *σ*<sub>*j*</sub>*ε*<sub>*i**t*</sub>
and chooses *a*<sub>*i**t*</sub> ∈ {0, 1}. Participation generates a
club good for coalition members when visibility is achieved: if
*π*<sub>*t*</sub> ≥ *π̄*, each participant receives
*b*<sub>*x*</sub> &gt; 0 (access to coalition-specific benefits) and
each member of *E* benefits from the regime-specific continuation
outcome *Y*<sub>*x*</sub> &gt; 0. If visibility is not achieved,
participants bear cost *m* &gt; 0.

## Proof of Lemma 1

We first verify the conditions for Morris and Shin (2003, Theorem 2.2).
The net payoff from participation given belief
*q*<sub>*i*</sub> = Pr \[*π*<sub>*t*</sub> ≥ *π̄* ∣ *s*<sub>*i**t*</sub>\]
is *q*<sub>*i*</sub>*b*<sub>*x*</sub> − (1 − *q*<sub>*i*</sub>)*m*,
which is strictly increasing in *q*<sub>*i*</sub> (since
*b*<sub>*x*</sub> + *m* &gt; 0). At *q*<sub>*i*</sub> = 1, this equals
*b*<sub>*x*</sub> &gt; 0: participation is strictly dominant. At
*q*<sub>*i*</sub> = 0, this equals −*m* &lt; 0: abstention is strictly
dominant. The critical belief threshold
*q*<sup>\*</sup> = *m*/(*b*<sub>*x*</sub> + *m*) ∈ (0, 1) defines exact
indifference. By MLRP (A3), the posterior
*q*<sub>*i*</sub>(*s*<sub>*i**t*</sub>) is increasing in
*s*<sub>*i**t*</sub>, and for the continuous fundamental
*ω*<sub>*t*</sub>: as *ω* → ∞, all signals are high and
*q*<sub>*i*</sub> → 1 (participation dominant); as *ω* → −∞, all signals
are low and *q*<sub>*i*</sub> → 0 (abstention dominant). These are the
dominance regions required by Morris-Shin.

Fix a conjectured cutoff *s*<sub>*x*</sub><sup>\*</sup> for all other
agents. Because aggregate participation is increasing in the common
fundamental *ω* (by A3), there exists a visibility cutoff
*ω̃*<sub>*x*</sub> such that *g*(*π*<sub>*t*</sub>) = 1 iff
*ω* ≥ *ω̃*<sub>*x*</sub>. Worker *i*’s posterior probability of
visibility is
*q*<sub>*i*</sub>(*s*<sub>*i**t*</sub>) = Pr \[*ω* ≥ *ω̃*<sub>*x*</sub> ∣ *s*<sub>*i**t*</sub>\],
which is increasing in *s*<sub>*i**t*</sub> by the monotone likelihood
ratio property. The incremental payoff
*q*<sub>*i*</sub>*b*<sub>*x*</sub> − (1 − *q*<sub>*i*</sub>)*m* is
increasing in *s*<sub>*i**t*</sub> (single-crossing in signal and
action). Hence best responses are threshold strategies. The
best-response mapping from conjectured cutoff
*s*<sub>*x*</sub><sup>\*</sup> to optimal cutoff is a contraction: the
dominance regions established above, combined with strategic
complementarities and single crossing, satisfy the conditions of Morris
and Shin (2003, Theorem 2.2), yielding a unique monotone equilibrium. ▫

## Proof of Lemma 2

Under the improper uniform prior (A3), the Laplacian property (Morris
and Shin 2003, Proposition 2.1) implies that the marginal type at the
equilibrium cutoff holds a uniform belief over the proportion of agents
above the cutoff. The equilibrium cutoff in fundamental space,
*ω*<sub>*x*</sub><sup>\*</sup>, is therefore pinned by the condition
*π̄* = *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*) and is independent of
*σ*.[4]

At the realized fundamental *ω*<sub>0</sub> when displacement occurs
(*ℓ*<sub>*t*</sub> = *L*, so *ω*<sub>*t*</sub> ≥ *ω̄*), equilibrium
participation is:
$$\pi\_x^\*(\sigma) = 1 - F\\\left(\frac{\omega\_x^\* - \omega\_0}{\sigma}\right)$$
Since *π̄* &lt; *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*) (A4), we have
*ω*<sub>*x*</sub><sup>\*</sup> &lt; *ω*<sub>0</sub>, so
(*ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub>)/*σ* &lt; 0.
Therefore:

1.  *π*<sub>*x*</sub><sup>\*</sup>(*σ*) is strictly decreasing in *σ*:
    differentiating,
    *d**π*<sub>*x*</sub><sup>\*</sup>/*d**σ* = *f*((*ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub>)/*σ*) ⋅ (*ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub>)/*σ*<sup>2</sup> &lt; 0
    since *f* &gt; 0 and
    *ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub> &lt; 0.

2.  As *σ* → 0:
    (*ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub>)/*σ* → −∞, so
    *F* → 0 and *π*<sub>*x*</sub><sup>\*</sup> → 1 &gt; *π̄*.

3.  As *σ* → ∞:
    (*ω*<sub>*x*</sub><sup>\*</sup> − *ω*<sub>0</sub>)/*σ* → 0, so
    *F* → *F*(0) = 1/2 (by symmetry of *F*) and
    *π*<sub>*x*</sub><sup>\*</sup> → 1/2.

By strict monotonicity, continuity, and the intermediate value theorem,
there exists a unique *σ̂*<sub>*x*</sub> such that
*π*<sub>*x*</sub><sup>\*</sup>(*σ̂*<sub>*x*</sub>) = *π̄*, with
*π*<sub>*x*</sub><sup>\*</sup>(*σ*) ≥ *π̄* for *σ* ≤ *σ̂*<sub>*x*</sub>
and *π*<sub>*x*</sub><sup>\*</sup>(*σ*) &lt; *π̄* for
*σ* &gt; *σ̂*<sub>*x*</sub>. ▫

The mechanism is informational: *E* desires revolt equally under both
shock types (*u*<sub>*E*</sub>(*P*) is the same). What differs is the
capacity to coordinate, determined by the information structure of the
shock (Chwe 2001; Kuran 1991; Morris and Shin 2003).[5]

[1] The continuous fundamental *ω*<sub>*t*</sub> enables the standard
global games uniqueness result (Morris and Shin 2003, Theorem 2.2). The
binary displacement *ℓ*<sub>*t*</sub> that enters payoffs is a
deterministic function of *ω*<sub>*t*</sub>, so the information
structure operates on a richer space than the payoff-relevant state.

[2] The mechanism is informational, not preferential: *E* desires revolt
equally under both shock types (*u*<sub>*E*</sub>(*P*) is the same).
What differs is the capacity to coordinate, determined by the
information structure of the shock. The improper uniform prior yields
uniqueness for all *σ* &gt; 0 and permits closed-form comparative
statics via the Laplacian property (Morris and Shin 2003, Proposition
2.1).

[3] This ensures that risk dominance selects participation in the
low-noise limit (Morris and Shin 2003). When
*π̄* ≥ *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*), coordination fails
even under common knowledge of the shock.

[4] Specifically, the Laplacian property gives: the fraction of
participants at *ω*<sub>*x*</sub><sup>\*</sup> equals
1 − *q*<sup>\*</sup> = *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*), and
the visibility threshold
*π̄* &lt; *b*<sub>*x*</sub>/(*b*<sub>*x*</sub> + *m*) (by A4) ensures
that *ω*<sub>*x*</sub><sup>\*</sup> is below the realized fundamental
when displacement occurs.

[5] Przeworski and Limongi (1997) established the empirical precursor:
economic development does not cause transitions to democracy, but
existing democracies at higher income levels survive longer. Our model
provides a mechanism for why economic disruptions differentially affect
regime survival depending on both the trajectory of the disruption and
the type of regime.
