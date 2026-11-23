*****************************************************************************
***** * at 2-digit level, prepare list with
* (sector code, sector name, average income elasticity, avg diff from agg lsh)
* most of variation captured at 2-digit level
******************************************************************************

capture log close
clear
set more off

* set this to project folder
global base_dir "~/Dropbox/JMP/SUBMIT_code"

global input_dir "${base_dir}/data_interm/"
global cex_dir "${base_dir}/data_interm/CEX/"
global output_dir "${base_dir}/output_est/"

global ngroups = 4 /* default is 4 */

cd $input_dir

use data_pcepfi1, clear

keep if year>=1982 & year<=2012

cd $output_dir

** housekeeping
keep beta com* esh_cex esh_fd esh_pce lsh year

* keep only coms with beta
drop if missing(beta)

* use 2012 lsh for later years
* same for PCE / FD shares
bysort comcode (year): replace lsh = lsh[_n-1] if missing(lsh) & year>2012
bysort comcode (year): replace esh_pce = esh_pce[_n-1] if missing(esh_pce) & year>2012
bysort comcode (year): replace esh_fd = esh_fd[_n-1] if missing(esh_fd) & year>2012

* set esh_cex to zero if missing
replace esh_cex = 0 if missing(esh_cex)

* re-scale expenditure shares
foreach var of varlist esh* {
replace `var' = 0 if missing(`var')
bys year: egen sum_`var' = total(`var')
replace `var' = `var' / sum_`var'
drop sum_`var'
bys year: egen sum_`var' = total(`var')
}
sum
drop sum*

merge m:1 comcode using ${cex_dir}/quantiles_expsh$ngroups, keepusing( d1_logexpsh$ngroups )
drop if _merge<3


* compute covariance at 2-digit level (I/O classif.)
replace comcode = substr(comcode,1,2)
bys comcode year: egen sum_esh = total(esh_cex)
gen w = esh_cex/sum_esh
gen beta_w = beta*w
gen lsh_w = lsh*w
gen d1_logexpsh${ngroups}_w = d1_logexpsh${ngroups}*w
collapse (sum) esh* beta = beta_w lsh = lsh_w d1_logexpsh${ngroups} = d1_logexpsh${ngroups}_w ///
    (first) comname , by(comcode year)
bys year: egen lsh_avg = total(lsh*esh_cex)
bys year: egen beta_avg = total(beta*esh_cex)
gen ice = beta - beta_avg + 1
drop beta*
sum

* compute difference from agg lsh
gen dlsh = lsh - lsh_avg

* collapse to sector level
collapse (mean) d1_logexpsh? dlsh esh* ice lsh lsh_avg (first) comname ///
  (sd) ice_sd = ice , by(comcode)

* name sectors (comname just first 6-digit subsector within 2-digit sector)
replace comname = "Agriculture (nurseries, floriculture)" if comcode=="11"
replace comname = "Mining" if comcode=="21"
replace comname = "Utilities" if comcode=="22"
replace comname = "Construction" if comcode=="23"
replace comname = "Manufacturing I (food, apparel...)" if comcode=="31"
replace comname = "Manufacturing II (wood, chemical...)" if comcode=="32"
replace comname = "Manufacturing III (cars, electronics...) " if comcode=="33"
replace comname = "Wholesale trade" if comcode=="42"
replace comname = "Transportation" if comcode=="48"
replace comname = "Warehousing, couriers, postal service" if comcode=="49"
replace comname = "Retail trade" if comcode=="4A"
replace comname = "Information" if comcode=="51"
replace comname = "Finance and insurance" if comcode=="52"
replace comname = "Rental and leasing" if comcode=="53"
replace comname = "Professional and technical services" if comcode=="54"
replace comname = "Administrative and waste services" if comcode=="56"
replace comname = "Educational services" if comcode=="61"
replace comname = "Health care and social assistance" if comcode=="62"
replace comname = "Arts, entertainment, and recreation " if comcode=="71"
replace comname = "Accomodation and food services" if comcode=="72"
replace comname = "Other services" if comcode=="81"
replace comname = "Housing" if comcode=="oo"

sort esh_cex
gen ice1 = ice - 1
list comcode comname esh_cex esh_pce esh_fd ice ice_sd dlsh

* gen table for latex
sort comcode
format esh_cex esh_pce d1_logexpsh$ngroups ice1 lsh dlsh %8.3f
list comcode comname esh_cex esh_pce d1_logexpsh$ngroups ice1 lsh dlsh

#delimit ;
listtab comcode comname esh_cex esh_pce d1_logexpsh$ngroups ice1 lsh dlsh using TabB1_s2sumstats_adddlogesh.tex, 
  rstyle(tabular) replace 
  head("\begin{tabular}{llrrrrrr} \toprule "
  "\multicolumn{2}{l}{I-O Sector (2-digit)} & $\omega_i^{CEX}$ & " 
  "$\omega_i^{PCE}$ & $\ln\left( \frac{\omega_i^{Q4}}{\omega_i^{Q1}} \right)$ & $(\gamma_i-1)$ & $\theta^L_i$ & $\theta^L_i-\bar\theta^L$" 
  "\\ \midrule")
  foot("\bottomrule \end{tabular}");
#delimit cr








