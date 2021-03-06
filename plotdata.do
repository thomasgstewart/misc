capture program drop plotdata
program plotdata
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [if] [in] [, at(str) ]

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
 			*display "`spec'"
			numlist "`spec'"
			*display "`spec'"
			local spec "`r(numlist)'"
			*display "`spec'"
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
 else {
 display "Use this function to add extra data to your dataset for for plotting."
 display "Example syntax: "
 display "  plotdata, at(bmi=19.5(1)32.5 sex=1/2 age=45)"
 display "Within the at() function, specify the values of the variables at which"
 display "you want predict the outcome."
 exit
 }
 
local plotindicator = "_plotindicator"
capture confirm variable `plotindicator'
if _rc {
  generate `plotindicator' = 0
  gen _maxplot = 0 
}
else{
  egen _maxplot = max(`plotindicator')
}

tempfile temp1
quietly save "`temp1'"

quietly drop if _n > 0
	
local numvars = `counter' - 1
local oldN = _N
local moreN = 0
foreach j of numlist 1/`numvars'{
  if `Nspec`j'' > `moreN' {
    local addN = `Nspec`j'' - `moreN'
    quietly moreobs `addN'
    local moreN = `Nspec`j''
  }
  local startN = `oldN' + 1
  
  foreach jj of numlist `spec`j''{
    quietly replace `var`j'' = `jj' in `startN'/`startN'
    local startN = `startN' + 1
*    display "`startN'"
  }
}

keep `varlist' 
fillin _all
quietly drop _fillin
egen nmiss = rowmiss(_all)
quietly drop if nmiss > 0
quietly drop nmiss

tempfile temp2
quietly save "`temp2'"

use "`temp1'"
append using "`temp2'"
gen _maxplotj = 1
gen _maxplotnext = _maxplot + _maxplotj
quietly replace `plotindicator' = `=_maxplotnext' if `plotindicator' == .
quietly drop _maxplot*
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

capture program drop mkspline_plotindicator
program def mkspline_plotindicator
syntax varlist(max=1) [if] [in] , nknots(integer)


local com2 = "rcs_" + "`varlist'" + "_1"
capture confirm variable `com2'
	if _rc {
		
	}
	else{
		di as err "`com2'" " already exists in dataset"
		exit
	}


marksample touse

if `nknots' == 3 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(10 50 90)
}
else if `nknots'== 4 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 35 65 95)
}
else if `nknots'== 5 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 27.5 50 72.5 95)
}
else if `nknots'== 6 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(5 23 41 59 77 95)
}
else if `nknots'== 7 {
  qui `f'centile `varlist' if _plotindicator == 0, ///
  centile(2.5 18.33 34.17 50 65.83 81.67 97.5)
}
else {
  display as error ///
  "Restricted cubic splines with `nk' knots at default values not implemented."
  display as error ///
  "Number of knots specified in nknots() must be between 3 and 7."
  error 498
}

gen crapola = .

forvalues i=1 / `nknots' {
  local t`i' = r(c_`i')
  quietly replace crapola = r(c_`i') in `i'
}

quietly levelsof crapola

local com1 = "rcs_" + "`varlist'" + "_ = " + "`varlist'"

mkspline `com1' if `touse', cubic knots(`r(levels)') displayknots
	
quietly drop crapola
	
end

