************************************************************************************************************************************
* README File for Replication Data and Code:
* "The Race Between Preferences and Technology"
* for publication in Econometrica
* September 2022
* Joachim Hubmer
* jhubmer@sas.upenn.edu
************************************************************************************************************************************

Summary:
I. Assemble data
II. Descriptive statistics and estimation of structural model parameters
III. Solve Model

Tested on MATLAB_R2022a (*.m-files) and Stata 16.1 MP (*.do-files), MacOS

Instructions:
To replicate everything, run files in order of description below. Since intermediate data files are provided as well, it is possible to start directly with part II. or part III.

Raw CEX files need to be downloaded first if starting from part I: https://www.bls.gov/cex/pumd_data.htm


**************************************************************************************************************************
* I. Assemble Data
**************************************************************************************************************************
All code files in code_data. MATLAB, Stata.

1. Construct input-output tables objects, including good-level labor shares

*** M1a_construct_io82.m: construct 1982 input-output table
*** M1b_construct_io87.m: construct 1987 input-output table
*** M1c_construct_io92.m: construct 1992 input-output table
*** M1d_construct_io97.m: construct 1987 input-output table
*** M1e_construct_io02.m: construct 2002 input-output table
*** M1f_construct_io07.m: construct 2007 input-output table
*** M1g_construct_io12.m: construct 2012 input-output table

2. Import to Stata and some further housekeeping and descriptive analysis

*** 2a_construct.do: import raw industry labor share and pre-processed MATLAB good-level labor share in Stata
*** 2b_shiftshare.do: harmonize data over consecutive periods, rolling window shift-share analysis of labor share within/between industries/goods; use different options for global fd_type (line 16) to replicate all data fields in Appendix Table C1)
*** 2c_harmonize.do: harmonize data for full time period
*** 2d_gdpshares.do: compute shares of PCE,PFI in GDP

3. CEX

! raw CEX files need to be downloaded, too big for replication kit
! https://www.bls.gov/cex/pumd_data.htm

*** 3a_CEX_import_early.do: import raw CEX files 1980-1995
*** 3b_CEX_merge.do: merge CEX over time 1980-2015
*** 3c_CEX_diary_import.do: import raw CEX diary files
*** 3d_CEX_diary_merge.do: merge CEX diary files
*** 3e_CEX_diary_impute.do: impute CEX diary items in CEX interview files
*** 3f_CEX_link.do: link CEX and I-O data
*** 3g_CEX_panel.do: create panel datasets of linked CEX-IO data for analysis

4. BEA Fixed Asset Tables, Multifactor Productivity Tables

*** 4a_BEA_importFAT.do: import detailed FAT
*** 4b_BEA_importMFP87_2018.do: import MFP industry panel
*** 4c_BEA_merge_FAT_MFP.do: merge the two above


**************************************************************************************************************************
* II. Descriptive statistics and estimation of structural model parameters
**************************************************************************************************************************
All code files in code_estimation. Stata.

1. Descriptive facts on household labor share -- household income relation, plus estimation of income elasticities.

*** 1a_cons_descr_lsh.do: descriptive relation household income percentile--household labor share (Fig1a,2,B1a)
*** 1b_cons_income_inequality.do: linearity log household income/consumption--labor share (FigC2)
*** 1c_cons_imports.do: robustness of household-income--labor share relation to accounting for imported value added (FigB1c)
*** 1d_income_elasticities.do: estimate income elasticities each year
*** 1e_income_elasticities_constant.do: same but with constant income elasticities

2. Combine I-O data with estimated income elasticities and other consumption facts.

*** 2a_data_for_model.do: combine data for export to MATLAB (for consumption model)
*** 2b_data_for_model_invst: same for model with investment
*** 2c_components.do: plot components of aggregate labor share and compare to BLS (FigA1-2)
*** 2d_disaggregate.do: plot covariance labor share -- income elasticities by lvl of aggregation (FigB2b)
*** 2e_sum_2dig.do: create summary stats list consumption (TabB1)
*** 2f_sum_detail.do: same but full list
*** 2g_constant_betas.do: plot relation between labor share and relative expenditure shares/income elasticities (Fig3,B1b,B2a,B3)
*** 2h_ctrl_occu_edu.do: robustness to controlling for education/occupation as opposed to using as instrument for permanent income (FigB4)
*** 2i_cons_markups.do: robustness of consumption fact to accounting for markups (FigB1d)

3. Descriptive facts on delta labor share -- equipment&software intensity relation, plus estimation of K--L elasticity.
*** 3a_KLela_main.do: estimate K--L elasticity main spec + import robustness (TabIII+IV), descriptive fact corresponding (Fig1b + TabI)
- this file calls the following script files:
- 3b_KLela_markup_cstat.do: robustness to compustat markup as confounder (TabIV)
- 3c_KLela_markup_hall.do: robustness to markup estimates from Hall (TabIV)
- 3d_KLela_skills.do: robustness to skill intensity from 1980/2000 census (TabIV)
- 3e_sensitivity.do: sensitivity of eta estimate to equipment-augmenting, good-specific, technical progress (TabB2)
- 3f_fact_robust.do: visualization in Fig4, robustness FigB5
*** 3g_industry_io.do: descriptive fact on industry level (TabII)

4. Descriptive facts about production labor share

*** 4a_BEAFAT_MFP87_reg.do: industry level regression using MFP/FAT data (Tab II)
*** 4b_MFP87_lsh_decompose.do: decompositions of labor share and capital share using standard MFP industry data (Fig5b,A3)
*** 4c_BLS_agg_lsh.do: figure for intro labor/payroll share BLS non-farm biz (Fig1c)
*** 4d_plot_pk.do: plot price of capital (Fig1d,5a)
*** 4e_BEAFAT_es_share_trend.do: plot share of equipment&software in total capital costs (FigA4)
*** 4f_plot_gdpshares.do: plot aggregate investment and consumption shares (FigA5)


**************************************************************************************************************************
* III. Solve Model
**************************************************************************************************************************
All code files in code_model. MATLAB.

*** M1_run_models.m: run various model versions
*** M2_invest.m: run second investment model (TabC1)
*** M3_plot_figs.m: plot model figures (Fig6,8,C1)
*** M4_plot_bars_decomposition.m: plot model figures (Fig7)
*** M5_future.m: run future scenario analysis and plot Fig9






