# AI Automation, Regime Type, and Crossed Fragility
## Summary for circulation

---

### The question

The US and China lead the AI revolution — one a democracy, the other an autocracy. How does AI-driven automation affect regime stability, and does the answer depend on regime type?

### The setup

We take the economics as given (Open Economy Politics tradition). From Gans and Goldfarb (2026), AI automation can follow two trajectories:

- **Rapid displacement**: workers lose jobs immediately (e.g., factory automation)
- **Threshold automation**: AI initially complements workers, then suddenly substitutes them after a tipping point (O-Ring dynamics)

We ask: under each trajectory, which regime is more fragile?

### The model

Two periods, two regime types, two trajectories. Workers exposed to automation choose between accepting the status quo (M) and pursuing regime change (P). Democracies stabilize by compensating losers; autocracies stabilize by repressing dissent.

Five assumptions drive the results:

- A1-A2: Without automation, regimes are stable; with it, they can be destabilized.
- A3: Democratic compensation is reactive — it requires an observable crisis to activate (microfounded via a voting game in Appendix A).
- A4: Autocratic repression is less effective against organized opposition — and the type of shock determines how organized workers are (microfounded via global games in Appendix B).
- A5: Institutional capacity takes time to build — you cannot create it from scratch during a crisis (endogenized via fiscal constraints in Proposition 9).

There is no strategic interaction between government and workers in the baseline — the model is decision-theoretic. The government's behavior is parameterized by regime type. The appendices provide game-theoretic microfoundations (subgame-perfect equilibrium for A3, Bayesian Nash equilibrium for A4).

### The mechanism

Coordination of affected workers is the single mediating variable, and it has opposite effects on each regime:

- **Rapid shocks** create visible, shared experiences → near-common knowledge of grievance → workers coordinate easily.
  - In democracy: coordination generates political pressure → compensation is built → regime survives.
  - In autocracy: organized opposition degrades repressive effectiveness → regime is threatened.

- **Threshold shocks** are sudden and disorienting → strategic uncertainty → workers cannot coordinate.
  - In democracy: no observable crisis → no political demand → no compensation built → regime collapses when the shock hits.
  - In autocracy: dispersed dissent is easily contained by standing repressive apparatus → regime survives.

### The results

**Crossed fragility (Proposition 3).** For autocracies with moderate repressive capacity:

|  | Rapid | Threshold |
|--|:---:|:---:|
| Democracy | Stable | Unstable |
| Autocracy | Unstable | Stable |

Each regime has differential resilience for one type of shock. Democracies process observable shocks better; autocracies process delayed shocks better.

**Welfare cost (Proposition 4).** When autocracies survive, workers bear the full cost of automation. The welfare gap between a surviving democracy and a surviving autocracy equals exactly the repressive threshold.

**Welfare state as insurance (Propositions 7-8).** Democracies with comprehensive social protection (e.g., Scandinavia) survive threshold automation through the same logic as autocracies with standing repressive capacity: both are permanent institutional capacity that does not need a crisis to activate. The welfare state achieves the same resilience as repression — without the human cost.

**Endogenous fiscal fragility (Proposition 9).** Why can't democracies simply build compensation during the crisis in period 2? Because the crisis itself erodes fiscal capacity and raises political costs, creating a vicious cycle: no preventive investment → crisis → fiscal stress → emergency response unaffordable → collapse.

**Complete typology (Corollary 2).**

| Type | Rapid | Threshold |
|------|:-----:|:---------:|
| Strong democracy (comprehensive welfare state) | Stable | Stable |
| Weak democracy (residual welfare state) | Stable | Unstable |
| Weak autocracy | Unstable | Unstable |
| Moderate autocracy | Unstable | Stable |
| Strong autocracy | Stable | Stable |

### What's new

- No formal model has linked the *shape* of an automation trajectory to comparative regime stability. The closest work (Acemoglu and Robinson 2006) treats shock transitoriness as binary.
- The coordination mechanism (one variable, opposite effects by regime) is the paper's conceptual contribution.
- The welfare state result (functional equivalence with repression, strict welfare dominance) connects the regime stability literature to the class compromise tradition (Przeworski and Wallerstein 1982).

### Limitations (acknowledged in the paper)

- Instruments are regime-specific by assumption (democracies only compensate, autocracies only repress).
- The two-period structure captures timing but not richer dynamics.
- Threshold automation is empirically plausible but not yet observed at scale.

### What I'd like feedback on

1. Is the crossed fragility result interesting enough for [target journal]?
2. Does the coordination mechanism (A4) feel well-motivated, or does it need stronger empirical grounding?
3. Is the welfare state extension (P7-P8) a genuine second contribution, or does it feel like a corollary?
4. Any concerns about the distance between assumptions and conclusions?

---

Paper available at: [link to PDF or repo]
