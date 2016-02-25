capture program drop plotdata
program plotdata
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [if] [in] [, at(str) plotindicator(str)]

local varlist = ""
local counter = 1
if "`at'" != "" {
 	foreach p of local at {
 		local whereq = strpos("`p'", "=")
 		if `whereq' == 0 { 	
 			di as err "invalid syntax in at()"
 			exit 198
 		}
 		else {
 			local varname = substr("`p'",1,`whereq'-1)
			capture confirm variable `varname'
 			if _rc {
 				di as err "`varname'" " not a variable in at()"
 				exit
 			}
 			local spec = substr("`p'",`whereq'+1,.)
 			local spec : subinstr local spec "&" " ", all
 			numlist "`spec'"
			local spec "`r(numlist)'"
 			local spec`counter' = "`spec'" 
			local var`counter' = "`varname'"
                         
			
			local numlistcounter = 0
			foreach j of numlist `spec'{
			  local numlistcounter = `numlistcounter' + 1
			  }
			local Nspec`counter' = `numlistcounter'
			local varlist = "`varlist'" + " " + "`varname'"
			
			local counter = `counter' + 1
 		}
 	}
 }

if "`plotindicator'" == "" {
  local plotindicator = "_plotindicator"
}
capture drop `plotindicator'
generate `plotindicator' = 0

tempfile temp1
save "`temp1'"

drop if `plotindicator' == 0
	
local numvars = `counter' - 1
local oldN = _N
local moreN = 0
foreach j of numlist 1/`numvars'{
  if `Nspec`j'' > `moreN' {
    local addN = `Nspec`j'' - `moreN'
    moreobs `addN'
    local moreN = `Nspec`j''
  }
  local startN = `oldN' + 1
  
  foreach jj of numlist `spec`j''{
    replace `var`j'' = `jj' in `startN'/`startN'
    local startN = `startN' + 1
    display "`startN'"
  }
}

keep `varlist' 
fillin _all
drop _fillin
egen nmiss = rowmiss(_all)
drop if nmiss > 0
drop nmiss
generate `plotindicator' = 1

tempfile temp2
save "`temp2'"

use "`temp1'"
append using "`temp2'"
replace `plotindicator' = 0 if `plotindicator' == .
end
 
capture program drop moreobs
program def moreobs
*! 1.0.1 NJC 9 August 1999 
* 1.0.0 NJC 22 January 1998
    version 5.0 	
    if "`2'" != "" {
        di in r "invalid syntax"
        exit 198
    }
    if "`1'" == "" { local newN = _N + 1 }
    else {
        confirm integer number `1'
        local newN = _N + `1'
    }
    set obs `newN'
end
