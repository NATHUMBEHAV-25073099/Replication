clear all
import excel "NHB_LeadLag.xlsx", sheet("Sheet1") firstrow clear

encode comp_repo, generate(n_comp_repo)
xtset n_comp_repo yearmonth
foreach var in additions changedfiles deletions commit_count issue_count release_count unique_author_count commits_on_PR commits_after_PR PR_merged PR_count PR_comments{
    gen ln_`var' = log(`var'+ 1)
}


sort comp_repo yearmonth
by comp_repo: gen time_series = _n

gen treated = 0
replace treated = 1 if language_category == 1

******************** Table 7 *********************
preserve
gen relative_month = time_series - 14
replace relative_month = 11 if treated == 0
gen b12 = (relative_month == -12)
gen b11 = (relative_month == -11)
gen b10 = (relative_month == -10)
gen b9 = (relative_month == -9)
gen b8 = (relative_month == -8)
gen b7 = (relative_month == -7)
gen b6 = (relative_month == -6)
gen b5 = (relative_month == -5)
gen b4 = (relative_month == -4)
gen b3 = (relative_month == -3)
gen b2 = (relative_month == -2)
gen b1 = (relative_month == -1)
gen a0 = (relative_month == 0)
gen a1 = (relative_month == 1)
gen a2 = (relative_month == 2)
gen a3 = (relative_month == 3)
gen a4 = (relative_month == 4)
gen a5 = (relative_month == 5)
gen a6 = (relative_month == 6)
gen a7 = (relative_month == 7)
gen a8 = (relative_month == 8)
gen a9 = (relative_month == 9)
gen a10 = (relative_month == 10)
gen a11 = (relative_month == 11)
eststo clear
reghdfe ln_commits_after_PR b12-b2 a0-a11, a(n_comp_repo time_series) clus(n_comp_repo)
est sto m1

******************** Figure 2 ****************
coefplot (m1,msymbol(D) msize(medsmall)), drop(_cons) vertical recast(connected) graphregion(fcolor(white) lcolor(white)) plotregion(fcolor(white) lcolor(white)) ytitle(Estimate) xtitle(Leads Lags) ylabel(-0.15(0.05)0.15) xline(11.5, lcolor(red) lpattern(dash))
restore

