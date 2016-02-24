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
