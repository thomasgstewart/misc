capture program drop validate_with_bootstrap
program validate_with_bootstrap, rclass

syntax, command(str)

tokenize `"`command'"'

preserve
bsample
quietly `command'
restore
predict _yhat, xb

quietly corr _yhat `2'

drop _yhat

return scalar rho = r(rho)
end


capture program drop validate_regress
program validate_regress

syntax , reps(str) seed(str)

tempfile tmpfile
save `tmpfile'

tokenize `"`e(cmdline)'"'
predict _yhat, xb
quietly corr _yhat `2'
local obs_r2 = r(rho)^2
drop _yhat

simulate r2 = (r(rho)^2), ///
  reps(`reps') seed(`seed'): validate_with_bootstrap, command(`e(cmdline)')

label variable r2 "Bootstrapped R2"

  
generate obs_r2 = `obs_r2'
generate optimism = obs_r2 - r2
label variable obs_r2 "Observed R2"

quietly summarize r2
hist r2, xline(`obs_r2', lwidth(vthick) lcolor(red) extend) xline(`r(mean)', lwidth(vthick) lcolor(green) extend)


quietly summarize optimism
local optimism = "`r(mean)'"
display  "Optimism: " %4.3f `optimism'
display "Let beta(i) be a single bootstrapped estimate of beta"
display "Let Yhat(i) = X * beta(i); NOTE X is the original X."
display "Let R(i) = correlation(Yhat(i), Observed Y)"
display "Optimism = Observed R2 - mean(R(i)^2)"

clear

use `tmpfile'
  
end




capture program drop optimism_one_rep
program optimism_one_rep, eclass

syntax, [obs cmdline(str)]

preserve
if "`obs'" != "obs" {
bsample
}

if "`cmdline'" != "" {
  local command = "`cmdline'"
}
else {
  local command = e(cmdline)
  estimates store original
}

tokenize `"`command'"'

if "`1'" == "regress" {
quietly `command'
restore
predict _yhat, xb
quietly corr _yhat `2'
drop _yhat
matrix optimism = (r(rho)^2)
matrix colnames optimism = R2
matrix rownames optimism = optimism
}
else if inlist("`1'", "logistic", "logit") == 1 {
quietly `command'
restore
predict _phat, pr
quietly brier `e(depvar)' _phat
matrix optimism = (r(brier), r(roc_area))
matrix colnames optimism = Brier AUC
drop _phat
}

if "`cmdline'" != "" {
  
}
else {
  quietly estimates restore original
}

ereturn post optimism
end


capture program drop optimism
program optimism

syntax , [reps(str) seed(str)]

if "`reps'" == "" {
local reps = "100"
display "setting reps(" "`reps'" ")"
}

if "`seed'" == "" {
local seed = "1"
display "setting seed(" "`seed'" ")"
}

if inlist("`e(cmd)'", "logistic", "logit", "regress") != 1 {
  display "This command is for linear and logistic regression at the moment."
  display "The most recent estimation command was " "`e(cmd)'"
  exit
}

local cmdline = "`e(cmdline)'"

estimates store original
preserve
quietly drop if _est_original != 1

optimism_one_rep, cmdline(`cmdline') obs
matrix o = e(b)
matrix rownames o = Observed
display " "
display "Observed discrimination measures: "
matrix list o, noheader
quietly simulate _b, reps(`reps') seed(`seed'): optimism_one_rep, cmdline(`cmdline')
rename _b_*  *
display " "
display "Optimism corrected measures: "
summarize


*use `tmpfile'
restore
quietly estimates restore original
  
end


