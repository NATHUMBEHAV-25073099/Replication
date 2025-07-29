import excel "NHB_IndividualLevel.xlsx", sheet("Sheet1") firstrow clear

encode username, generate(n_username)
xtset n_username yearmonth

sort username yearmonth
by username: gen time_series = _n

gen exp = 0
replace exp = 1 if experienced_programmer == 1

gen treated_language = 0 
replace treated_language = 1 if copilot_language_ppl == 1 

gen post = 0
replace post = 1 if yearmonth >= 202107

gen copilot = treated_language*post


foreach var in TotalCommits TotalIssues TotalPullRequests TotalPRReview TotalCommitsRepos TotalIssuesRepos TotalPullRequestsRepos TotalPRReviewRepos{
    gen ln_`var' = log(`var'+ 1)
}


*************** Table 7 and Figure3c ***************
preserve
tab time_series post
eststo clear
reghdfe ln_TotalPRReview copilot ln_TotalPullRequests if maintainer == 1 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReview copilot ln_TotalPullRequests if maintainer == 2 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReview copilot ln_TotalPullRequests if maintainer == 3 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReview copilot ln_TotalPullRequests if maintainer == 4 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
restore

*************** Table 8 and Figure3d ***************
preserve
tab time_series post
eststo clear
reghdfe ln_TotalPRReviewRepos copilot ln_TotalPullRequests if maintainer == 1 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReviewRepos copilot ln_TotalPullRequests if maintainer == 2 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReviewRepos copilot ln_TotalPullRequests if maintainer == 3 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPRReviewRepos copilot ln_TotalPullRequests if maintainer == 4 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
restore

*************** Table 9 and Figure3a ***************
preserve
tab time_series post
eststo clear
reghdfe ln_TotalCommits copilot if maintainer == 1 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalCommits copilot if maintainer == 2 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalCommits copilot if maintainer == 3 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalCommits copilot if maintainer == 4 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
restore

*************** Table 10 and Figure3b ***************
preserve
tab time_series post
eststo clear
reghdfe ln_TotalPullRequests copilot if maintainer == 1 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPullRequests copilot if maintainer == 2 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPullRequests copilot if maintainer == 3 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
reghdfe ln_TotalPullRequests copilot if maintainer == 4 | treated_language==0,  absorb(n_username time_series) vce(cluster n_username)
restore
