# Seção 2 reescrita: The Logic of Crossed Fragility

**Arquivo original**: paper.Rmd, lines 37-85
**Data**: 2026-04-03

---

# The Logic of Crossed Fragility

Before the formalization in Section 3, we develop the logic verbally: why the same automation technology destabilizes one regime type while stabilizing the other, and why the pattern reverses when the trajectory changes.

## Automation trajectories and the structure of displacement

The model imports two stylized trajectories from the O-Ring automation framework [@GansGoldfarb2026]. Under task separability, tasks are independent: automating one does not affect the productivity of the others. If AI substitutes a sufficient share of tasks, the result is rapid displacement. Exposed workers lose their jobs, and the affected population experiences a uniform, shared loss. The displaced form a recognizable group with a common condition.

When tasks are quality complements, automation follows a different path. Automating some tasks raises the productivity of the remaining ones, because workers can concentrate on what has not yet been automated. Exposed workers become more productive, firms expand, and incomes rise, provided demand is sufficiently elastic. Some workers and sectors may still be negatively affected, but the aggregate experience of the exposed group is one of gain. At some point, AI capabilities cross a threshold and substitution begins. The key feature of this transition is its unevenness. The O-Ring structure means that some tasks are automated while others are not, some firms adopt faster than others, and some workers lose their jobs while others continue to benefit from complementarity. When displacement finally becomes widespread, the affected workers are not a homogeneous group experiencing a shared condition. They are scattered among firms still thriving and coworkers still gaining from AI-augmented productivity.

The final displacement of exposed workers is the same under both trajectories: all of them eventually lose their jobs. What differs is the structure of that displacement and the experience that precedes it. Under rapid automation, displacement is uniform and simultaneous; no exposed worker ever gained from AI. Under threshold automation, displacement is heterogeneous and dispersed among workers who benefited from the complementary phase --- some of whom were still gaining when others began to lose.

## From trajectories to coordination capacity

The structure of displacement determines the capacity for collective action. The model captures this through a single parameter: signal noise ($\sigma$), representing the dispersion of private experiences within the affected population.

Under rapid displacement, all exposed workers experience the same loss at the same time. Each worker can see that others are in the same condition. This homogeneity generates precise, clustered signals about the state of the world. Workers share a common assessment of the crisis, and each knows that others share it. In the language of coordination theory [@Chwe2001], this is close to common knowledge of grievance. The affected population can organize, form visible coalitions, and present a unified political front.

Under threshold automation, the population's experience is fragmented. Some workers have lost their jobs. Others, at firms that adopted AI earlier or in complementary roles, continue to earn higher wages. The productivity gains of the complementary phase created winners who coexist with the newly displaced losers. Each displaced worker observes her own loss but cannot easily assess how many others are in the same situation, because many in her professional and social network are still benefiting. This heterogeneity undermines the shared assessment that coordination requires. The displaced cannot easily form a coalition because they are a minority surrounded by beneficiaries who have no grievance and no incentive to join collective action.

Workers desire the same political outcome under both trajectories. What differs is their capacity to act collectively. Uniform displacement enables coordination; dispersed displacement prevents it.

## How coordination activates institutional responses

Coordination feeds into two regime-specific institutional mechanisms.

In a democracy, the political system responds to organized demands. Compensation requires two conditions: a material shock that creates losses, and a visible coalition that makes the threat of instability politically credible. The non-exposed majority authorizes transfers because the cost of pacification is lower than the cost of regime instability. Without a visible coalition, there is no credible threat, no political demand, and no legislative action. Democratic compensation is reactive: it requires a visible crisis to activate. The New Deal followed the Great Depression; European welfare states followed World War II.

In an autocracy, the regime maintains standing repressive capacity that deters collective action. Repression works best when opposition is dispersed and unorganized. Visible, organized mass opposition degrades repressive effectiveness: security forces face defections, international scrutiny increases, and the focal-point effect of seeing others on the streets emboldens further participation [@Kuran1991; @Edmond2013]. The autocratic regime maintains its coercive advantage only when visible opposition is absent.

Democracy stabilizes by making the status quo more attractive (compensation reduces losses). Autocracy stabilizes by making revolt more costly (repression raises the price of opposition). Both mechanisms depend on coordination, in opposite directions: democracy needs coordination to activate its stabilization mechanism; autocracy needs coordination to fail.

## The four scenarios

These building blocks produce four outcomes.

*Democracy under rapid displacement.* Workers lose their jobs simultaneously, forming a uniform group. They coordinate, build a visible coalition, and present a credible political threat. The non-exposed majority, facing the cost of instability, authorizes compensation. The crisis is absorbed. Compensatory capacity built during the crisis persists into subsequent periods. Democracy is stable.

*Autocracy under rapid displacement.* The same uniform displacement produces the same coordination. In an autocracy, a visible and organized opposition degrades repressive capacity. If the regime's standing apparatus is insufficient to contain organized resistance, it falls. This is the condition under which autocracies with moderate repressive capacity are unstable.

*Democracy under threshold automation.* In the first period, AI complements labor and workers are gaining. There is no crisis, no political demand for compensation, and no institutional capacity is built. When the threshold is crossed in the second period, displacement arrives, but the displaced workers are dispersed among those still benefiting from AI. Coordination fails. Without a visible coalition, the democratic system receives no political signal to act. The window for building compensatory capacity has closed. Democracy is unstable.

*Autocracy under threshold automation.* The first period is identical: complementarity, no crisis. In the second period, displacement arrives with the same dispersed structure. Workers cannot coordinate. Without visible opposition, the repressive apparatus operates at full capacity. The autocracy contains the scattered dissent. The regime is stable.

The crossed fragility pattern follows: under rapid displacement, democracy is stable and autocracy (with moderate repressive capacity) is unstable; under threshold automation, the pattern reverses. One equilibrium object drives this, the level of collective participation ($\pi^*$). The trajectory-dependent dispersion of experiences generates a coordination outcome that activates opposite institutional responses in each regime. Figure 1 summarizes the sequence of events under both trajectories. The formalization in the next section makes this precise.

![Game timeline under two automation trajectories. Each column shows the sequence within a period: shock realization, displacement structure, coordination outcome, institutional response, and stability. Left panel: rapid displacement (both periods). Right panel: threshold automation (complementarity in period 1, dispersed displacement in period 2). The crossed fragility pattern emerges from the contrast between columns.](figures/fig_game_timeline.pdf){width=100%}
