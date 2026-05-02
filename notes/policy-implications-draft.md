# Policy Implications & Comparative Statics — Draft Notes

**Date**: 2026-05-02
**Status**: DRAFT — needs rechecking against final model

## CAVEAT

These notes emerged from discussions during intermediate model versions, NOT the final reformulated model (selectorate, absorptive composition, prosperity trap). Some may be wrong or use parameters that no longer exist. Each item needs to be verified against the model in `quality_reports/plans/2026-05-01_reformulacao-modelo.md` before inclusion in the paper.

---

## Policy Implications (two scenarios)

### Scenario 1: AI like previous technologies (moderate displacement, ~3%/year)

- Only democracies need to worry — and specifically about threshold automation
- Recommendation: automatic compensation triggers tied to sector-level displacement indicators (unemployment insurance that activates when displacement in a sector exceeds X%)
- The point: don't depend on protest to activate the response. Democracy fails under threshold exactly because protest arrives late. Automatic triggers bypass the voice problem — compensation is pre-committed, no political demand needed to activate.
- Autocracies resilient to both trajectories in this scenario

### Scenario 2: AI is different (unprecedented displacement, general-purpose, faster)

- Both regimes vulnerable, each to the opposite type. Implications:
- For democracies: same recommendation (triggers), more urgent. Monitor sectors with high task complementarity (O-Ring) — those will generate the surprise shock.
- For those monitoring autocracies (intelligence agencies, international civil society, diplomacy): if AI displacement rates reach unprecedented levels, windows of opportunity open for democratic transition in autocracies under gradual automation. The mechanism: accumulated displacement erodes repressive capacity. The moment is when accumulated volume exceeds what repression can contain — then external push (sanctions, opposition support) can be decisive.

---

## Comparative Statics

### 1. Ratio omega_T2/omega_R (degree of O-Ring)

More O-Ring → crossed fragility more robust. The gap between the two trajectories widens, making it easier for the autocratic elite's visibility threshold to fall between them. Interpretation: industries with high task complementarity (healthcare, law, engineering — where "automating 90% doesn't work, needs to be 100%") generate shocks more dangerous for democracies than industries with independent tasks (logistics, data entry).

### 2. Complementarity bonus (formerly gamma)

**WARNING: gamma was removed from the final model** (decision documented in reformulation plan — moved to appendix as optional extension). The EFFECT that gamma captured (prosperity blocks compensation) now operates via the selectorate's fiscal politics: prosperous voters block taxation. No separate parameter needed. If including this comparative static, reformulate in terms of omega_L (lower omega_L = greater relative prosperity in t=1 under threshold = stronger blocking). Empirical evidence (Finseraas & Nyhus 2025, Dasgupta & Ramirez 2025) remains relevant.

### 3. sigma_A/sigma_D (information quality ratio, derived from selectorate)

More closed regime → noisier information → more severe dictator's dilemma. Sweet spot: intermediate repression (Geddes typology: military, single-party, personalist).

### 4. delta (intertemporal discount)

Higher delta → larger difference between equilibrium with/without compensation. Credible legislative promise reduces protest more when workers value the future. Myopic workers (low delta) protest regardless of promises.

### 5. C_A (cost of protesting in autocracy — sweet spot)

C_A too low = autocracy sees everything, no dictator's dilemma, no crossed fragility. C_A too high = protest totally suppressed, no fall mechanism. Result operates in a sweet spot: C_A high enough to blind autocracy to moderate crises, low enough for accumulated displacement to eventually overcome repression. Maps to autocracies with intermediate repression (most real regimes).

### 6. mu_A (size of autocratic selectorate)

Decreasing selectorate amplifies both sides: elite becomes more blind (sigma_A rises) AND faster (decree easier). Autocracy becomes more vulnerable to gradual crises AND more resilient to massive ones — both effects reinforce.
