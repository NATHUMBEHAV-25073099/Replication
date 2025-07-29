import excel "NHB_Matched.xlsx", sheet("Sheet1") firstrow clear
encode comp_repo, generate(n_comp_repo)
xtset n_comp_repo yearmonth
sort comp_repo yearmonth
by comp_repo: gen time_series = _n

gen treated = 0
replace treated = 1 if language_category == 1

gen post = 0
replace post = 1 if year >= 2022 | (year == 2021 & month >= 7)

gen copilot = treated*post

foreach var in additions changedfiles deletions commit_count issue_count release_count unique_author_count commits_on_PR commits_after_PR PR_merged PR_count PR_comments{
    gen ln_`var' = log(`var'+ 1)
}

preserve
eststo clear
qui reghdfe ln_additions copilot,  absorb(n_comp_repo time_series) vce(cluster n_comp_repo)
eststo model1
qui reghdfe ln_commit_count copilot, absorb(n_comp_repo time_series)  vce(cluster n_comp_repo)
eststo model2
qui reghdfe ln_PR_count copilot,  absorb(n_comp_repo time_series) vce(cluster n_comp_repo)
eststo model3
qui reghdfe ln_commits_after_PR ln_PR_count copilot,  absorb(n_comp_repo time_series) vce(cluster n_comp_repo)
eststo model4
esttab, se stats(N r2 r2_a) b(%9.3g) se(%9.3g) star(* .10 ** .05 *** .01)
restore
