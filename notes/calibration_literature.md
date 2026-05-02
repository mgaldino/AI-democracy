# Calibration Literature: Empirical Values for Model Parameters

**Date**: 2026-05-01
**Model**: AI Automation and Regime Stability (v5, selectorate)

---

## Summary Table

| Parameter | Symbol | Recommended | Range | Key source |
|-----------|--------|-------------|-------|------------|
| Rapid displacement rate | ω_R | 0.15 | [0.10, 0.25] | Acemoglu & Restrepo (2020), BLS |
| Threshold t=1 displacement | ω_T1 | 0.03 | [0.01, 0.05] | Brynjolfsson et al. (2023), bank teller history |
| Threshold t=2 displacement | ω_T2 | 0.50-0.80 | [0.30, 0.80] | Feigenbaum & Gross (2024, QJE), telephone operators |
| Normal churn | ω_N | 0.02 | [0.01, 0.03] | BLS Displaced Worker Surveys |
| Protest cost ratio | C_A/C_D | 4 | [2, 10] | Chenoweth & Stephan (2011), participation data |
| Information quality ratio | σ_A/σ_D | 1.7 | [1.3, 3.0] | Martinez (2022 JPE), HRV index |
| Compensation generosity | B | 0.55 | [0.20, 0.80] | OECD replacement rates |
| Discount factor | δ | 0.80 | [0.70, 0.90] | Standard macro calibration (5-year periods) |

---

## 1. ω_R: Displacement rate under rapid automation (per period)

**Acemoglu & Restrepo (2020, JPE)** "Robots and Jobs"
- One additional robot per 1,000 workers reduces employment-to-population ratio by **0.2 pp** and wages by **0.42%**.
- ~5.6 workers displaced per robot. US: ~1 robot per 1,000 workers added 1993-2007.

**Acemoglu (2024)** "The Simple Macroeconomics of AI" (NBER WP 32487)
- AI-driven TFP gains < 0.66% over 10 years. Modest aggregate displacement.

**Frey & Osborne (2017)** "The Future of Employment"
- 47% of US jobs at >70% probability of computerization within 20 years.
- STOCK measure. Naive annualization: ~2.3%/year (assumes linear, full realization — unrealistic).

**BLS Displaced Worker Surveys**
- ~2% of US workers displaced per year (all causes). ~1.3%/year recent (2021-2023).

**Recommended**: ω_R = 0.15 (15% per 5-year period = ~3%/year for exposed sectors). Range [0.10, 0.25].

**Note for two-scenario framing**: Historical calibration uses ω_R = 0.15. "AI is different" scenario uses ω_R = 0.30.

---

## 2. ω_T2: Displacement when O-Ring threshold is crossed

**Gans & Goldfarb (2025, NBER WP 34639)** "O-Ring Automation"
- Threshold crossing triggers rapid, complete automation of the task bundle. No specific rate but sharp, discontinuous displacement.

**Feigenbaum & Gross (2024, QJE)** "Answering the Call of Automation"
- Telephone operators upon dial service adoption: **50-80% immediate reduction** in young operator employment.
- Within each city, displacement was abrupt.

**Bank tellers post-threshold (2010+)**
- ~30% decline in 12 years (mobile banking crossed the threshold). ~3%/year.

**Recommended**: ω_T2 = 0.60 for baseline. Historical analogies support 0.50-0.80 for true O-Ring collapse.

---

## 3. ω_T1: Displacement during complementarity phase

**Noy & Zhang (2023, Science)**: ChatGPT experiment — 0.8 SD productivity gain, zero displacement.

**Brynjolfsson, Li & Raymond (2023/2025, QJE)**: AI assistant for customer support — 15% productivity increase, no displacement.

**Dell'Acqua et al. (2023)**: BCG consultants with GPT-4 — 12.2% more tasks, 25.1% faster, no displacement.

**Bank tellers pre-threshold (1980s-2000s)**: Employment GREW ~20% during ATM era (complementarity phase).

**Recommended**: ω_T1 = 0.03 (3% per 5-year period = ~0.6%/year). Near-baseline, slightly above churn.

---

## 4. C_A/C_D: Protest cost ratio

**Chenoweth & Stephan (2011)** "Why Civil Resistance Works"
- 3.5% rule: no nonviolent campaign failed once peak participation reached 3.5%.
- Nonviolent campaigns succeeded 53% vs 26% for violent.

**Participation data**:
- Egypt pre-Arab Spring: 2% had attended a demonstration; 91% would never.
- US Women's March 2017: >1.2% in a single day, routinely.

**Svolik (2012)**, **Wintrobe (1998)**: C_A >> C_D as structural feature; no specific ratio.

**Recommended**: C_A/C_D = 4, range [2, 10]. Triangulated from participation rates.

**Calibration tension**: Model's C_A constraint (C_A < 2.04 with ω_R = 0.30) limits ratio to ~1.33. With ω_R = 0.15, constraint tighter. Resolved via two-scenario framing: "Historical" accepts C_A/C_D = 4 (only democracy vulnerable); "AI-different" uses C_A/C_D ≈ 1.3 (crossed fragility).

---

## 5. σ_A/σ_D: Information quality ratio

**Martinez (2022, JPE)** "How Much Should We Trust the Dictator's GDP Growth Estimates?"
- Autocracies overstate GDP growth by ~35%. Night-light elasticity significantly larger in autocracies.

**Hollyer, Rosendorff & Vreeland (2011, 2015)**
- HRV Transparency Index: democracies report economic data at substantially higher rates.
- Transparency destabilizes autocracies, stabilizes democracies.

**Recommended**: σ_A/σ_D = 1.7, range [1.3, 3.0].

**Note**: In v5 model, σ_x is the selectorate's information quality, derived from selectorate size. σ_A/σ_D may be endogenous (larger selectorate → more diverse information → lower σ). Martinez provides cross-check.

---

## 6. B: Compensation generosity

**OECD Net Replacement Rates** (initial unemployment, single at average wage):
| Country | Rate |
|---------|------|
| Luxembourg | 85% |
| Denmark | 78% |
| Norway | 78% |
| Sweden | 72% |
| France, Germany | 66% |
| OECD average | 58% |
| US | ~27% |
| UK | 17% |

**Recommended**: B = 0.55 (OECD average). Sensitivity: B = 0.25 (US/UK) and B = 0.75 (Nordic).

**For T > 2 extension**: B' = 0.20 (degraded compensation under massive crisis). Consistent with US/UK levels when fiscal capacity is strained.

---

## 7. δ: Discount factor

**Standard macro**: β_annual = 0.95-0.96.

| Period length | δ |
|---------------|---|
| 1 year | 0.95 |
| 3 years | 0.86 |
| 5 years | 0.77 |
| 10 years | 0.60 |

**Recommended**: δ = 0.80 (5-year period at ~4.5% annual discount). Range [0.70, 0.90].

---

## References

- Acemoglu, D. (2024). "The Simple Macroeconomics of AI." NBER WP 32487.
- Acemoglu, D. & Restrepo, P. (2020). "Robots and Jobs." JPE 128(6).
- Brynjolfsson, E., Li, D. & Raymond, L. (2023/2025). "Generative AI at Work." QJE 140(2).
- Chenoweth, E. & Stephan, M. (2011). Why Civil Resistance Works. Columbia UP.
- Dell'Acqua, F. et al. (2023). "Navigating the Jagged Technological Frontier." HBS WP.
- Feigenbaum, J. & Gross, D. (2024). "Answering the Call of Automation." QJE 139(3).
- Frey, C. & Osborne, M. (2017). "The Future of Employment." Tech. Forecasting & Social Change 114.
- Gans, J. & Goldfarb, A. (2025). "O-Ring Automation." NBER WP 34639.
- Hollyer, J., Rosendorff, B.P. & Vreeland, J.R. (2015). "Transparency, Protest, and Autocratic Instability." APSR 109(4).
- Martinez, L.R. (2022). "How Much Should We Trust the Dictator's GDP Growth Estimates?" JPE 130(10).
- Noy, S. & Zhang, W. (2023). "Experimental Evidence on the Productivity Effects of Generative AI." Science.
- Svolik, M. (2012). The Politics of Authoritarian Rule. Cambridge UP.
- Wintrobe, R. (1998). The Political Economy of Dictatorship. Cambridge UP.
