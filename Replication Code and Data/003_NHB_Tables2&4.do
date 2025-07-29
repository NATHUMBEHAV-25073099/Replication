import excel "NHB_IndividualLevel.xlsx", sheet("Sheet1") firstrow clear

encode username, generate(n_username)
xtset n_username yearmonth

sort username yearmonth
by username: gen time_series = _n

gen exp = 0
replace exp = 1 if maintainer == 4

gen treated_language = 0 
replace treated_language = 1 if copilot_language_ppl == 1 

gen post = 0
replace post = 1 if yearmonth >= 202107

gen copilot = treated_language*post

foreach var in TotalCommits TotalIssues TotalPullRequests TotalPRReview TotalCommitsRepos TotalIssuesRepos TotalPullRequestsRepos TotalPRReviewRepos{
    gen ln_`var' = log(`var'+ 1)
}

***************************** Table 2 ********************************

preserve
tab time_series post
eststo clear
qui reghdfe ln_TotalCommits copilot 1.exp#1.copilot , absorb(n_username time_series)  vce(cluster n_username)
eststo model1
qui reghdfe ln_TotalPullRequests copilot 1.exp#1.copilot,  absorb(n_username time_series) vce(cluster n_username)
eststo model2
qui reghdfe ln_TotalPRReview copilot 1.exp#1.copilot ln_TotalPullRequests,  absorb(n_username time_series) vce(cluster n_username)
eststo model3
qui reghdfe ln_TotalPRReviewRepos copilot 1.exp#1.copilot ln_TotalPullRequests,  absorb(n_username time_series) vce(cluster n_username)
eststo model4
esttab, se stats(N r2 r2_a) b(%9.3g) se(%9.3g) star(* .10 ** .05 *** .01)
restore

****************************** Table 4 **************************

sum copilot ln_TotalCommits ln_TotalPullRequests ln_TotalPRReview ln_TotalPRReviewRepos
