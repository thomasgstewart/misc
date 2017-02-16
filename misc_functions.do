capture program drop gini_mean_difference
program gini_mean_difference, rclass 
* Based on NICK COX'S lmoments

syntax varname [if] [in]

quietly lmoments `1' `if' `in'
local gmd = 2 * `r(l_2)'
display "Gini mean difference: " "`gmd'"
return local gmd = `gmd'
end
