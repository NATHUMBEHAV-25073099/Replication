import excel "NHB_Repo_Matching.xlsx", sheet("Sheet1") firstrow clear

gen treated = 0
replace treated = 1 if language_category == 1


foreach var in stargazerCount forkCount repo_age commit_count issue_count PR_count commits_on_PR commits_after_PR PR_comments unique_author_count additions deletions{
    gen ln_`var' = log(`var'+ 1)
}


cem ln_additions ln_commit_count ln_PR_count, tr(treated)

local vars ln_additions ln_commit_count ln_PR_count
foreach var of local vars {
    ttest `var', by(treated)
}

preserve
drop if cem_matched == 0
local vars ln_additions ln_commit_count ln_PR_count
foreach var of local vars {
    ttest `var', by(treated)
}
restore



