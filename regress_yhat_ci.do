capture program drop regress_yhat_ci
program regress_yhat_ci
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [, forecast alpha(str) stub(str) drop]


local cmd = e(cmd)
if "`cmd'" != "regress" {
  display "This function only works for linear regression."
  error 301
}


	if "`forecast'" == "forecast" {
	  local type = "stdf"
	}
	else {
	  local type = "stdp"
	}

	if "`alpha'" == "" {
	  local alpha = 0.05	
	}


	local dv = e(depvar)
	
	if "`drop'" == "drop" {
		capture fussydrop `stub'`dv'_hat
		capture fussydrop `stub'`dv'_hat_lb
		capture fussydrop `stub'`dv'_hat_ub
	}
	
	predict `stub'`dv'_hat, xb
	predict _yhatse, `type'

	generate `stub'`dv'_hat_lb = `stub'`dv'_hat - invttail(e(df_r),`alpha'/2) * _yhatse
	generate `stub'`dv'_hat_ub = `stub'`dv'_hat + invttail(e(df_r),`alpha'/2) * _yhatse

	drop _yhatse


end

capture program drop fussydrop
program def fussydrop
*! NJC 1.1.0 9 August 2002 
//http://www.stata.com/statalist/archive/2002-08/msg00184.html
 	version 7 
 	syntax varname 
 	args myvar 
 	if "`varlist'" == "`myvar'" { drop `myvar' } 
end 


capture program drop logistic_phat_ci
program logistic_phat_ci
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [,xb alpha(str) stub(str) drop]


local cmd = e(cmd)
if "`cmd'" != "logistic" {
  display "This function only works for logistic regression."
  error 301
}

	if "`alpha'" == "" {
	  local alpha = 0.05
	}
	local z = invnorm(1 - `alpha'/2)
	
	if "`xb'" == "" {
	  local xb = "p"
	}


	predict _xbhat, xb
	predict _xbhatse, stdp

	generate _xbhat_lb = _xbhat - `z' * _xbhatse
	generate _xbhat_ub = _xbhat + `z' * _xbhatse

	local dv = e(depvar)
	if "`drop'" == "drop" {
		capture fussydrop `stub'`dv'_`xb'hat
		capture fussydrop `stub'`dv'_`xb'hat_lb
		capture fussydrop `stub'`dv'_`xb'hat_ub
	}

	if "`xb'" == "xb" {
		generate `stub'`dv'_`xb'hat = _xbhat
		generate `stub'`dv'_`xb'hat_lb = _xbhat_lb
		generate `stub'`dv'_`xb'hat_ub = _xbhat_ub
	}
	if "`xb'" == "p" {
		generate `stub'`dv'_`xb'hat = 1 / ( 1 + exp(-_xbhat))
		generate `stub'`dv'_`xb'hat_lb = 1 / ( 1 + exp(-_xbhat_lb))
		generate `stub'`dv'_`xb'hat_ub = 1 / ( 1 + exp(-_xbhat_ub))
	}

	drop _xbhat _xbhatse _xbhat_lb _xbhat_ub

end

capture program drop ologit_yhat
program ologit_yhat

syntax [if] [in] [, centiles(numlist integer >0 <100) stub(str) drop ]

local cmd = e(cmd)
if "`cmd'" != "ologit" {
  display "This function works for postestimation of ologit"
  error 301
}


local dv =  "`e(depvar)'"

if "`centiles'" == "" {
  local centiles = 50
}

if "`drop'" == "drop" {
  capture fussydrop `stub'`dv'_mean
  foreach j in `centiles' {
    capture fussydrop `stub'`dv'_q`j'
  }
}

capture drop _tgsdrop_*

gen _tgsdrop_cump = 0
gen `stub'`dv'_mean = 0
mat kmat = e(cat)

predict _tgsdrop_p*, p

foreach j in `centiles' {
  quietly gen `stub'`dv'_q`j' = .
  quietly gen _tgsdrop_`stub'`dv'_q`j'_ind = 0
}

forvalues i = 1/`e(k_cat)' {
quietly replace _tgsdrop_cump = _tgsdrop_cump + _tgsdrop_p`i'
quietly replace `stub'`dv'_mean = kmat[1,`i']*_tgsdrop_p`i' + `stub'`dv'_mean
foreach j in `centiles' {
  quietly replace `stub'`dv'_q`j' = kmat[1,`i'] if _tgsdrop_cump >= `j'/100 & _tgsdrop_`stub'`dv'_q`j'_ind == 0
  quietly replace _tgsdrop_`stub'`dv'_q`j'_ind = `i' if _tgsdrop_cump >= `j'/100 & _tgsdrop_`stub'`dv'_q`j'_ind == 0
}
}

quietly drop _tgsdrop*

end


capture program drop cox_lhhat_ci
program cox_lhhat_ci

syntax [,xb rh sp alpha(str) stub(str) qt(numlist integer >0 <100) spt(numlist integer >0) drop]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

	capture drop _tgsdrop*

	if "`alpha'" == "" {
	  local alpha = 0.05
	}
	local z = invnorm(1 - `alpha'/2)
	
	if "`xb'" == "" & "`sp'" == "" & "`rh'" == "" & "`qt'" == "" & "`spt'" == ""{
	  local rh = "rh"
	}
	
	predict _tgsdrop_xbhat, xb
	predict _tgsdrop_xbhatse, stdp

	generate _tgsdrop_xbhat_lb = _tgsdrop_xbhat - `z' * _tgsdrop_xbhatse
	generate _tgsdrop_xbhat_ub = _tgsdrop_xbhat + `z' * _tgsdrop_xbhatse

	local dv = "time"

	if "`xb'" == "xb" {
		if "`drop'" == "drop" {
			capture fussydrop `stub'`dv'_xbhat
			capture fussydrop `stub'`dv'_xbhat_lb
			capture fussydrop `stub'`dv'_xbhat_ub
		}
		generate `stub'`dv'_xbhat = _tgsdrop_xbhat
		generate `stub'`dv'_xbhat_lb = _tgsdrop_xbhat_lb
		generate `stub'`dv'_xbhat_ub = _tgsdrop_xbhat_ub
	}
	if "`rh'" == "rh" {
		if "`drop'" == "drop" {
			capture fussydrop `stub'`dv'_rhhat
			capture fussydrop `stub'`dv'_rhhat_lb
			capture fussydrop `stub'`dv'_rhhat_ub
		}
		generate `stub'`dv'_rhhat = exp(_tgsdrop_xbhat)
		generate `stub'`dv'_rhhat_lb = exp(_tgsdrop_xbhat_lb)
		generate `stub'`dv'_rhhat_ub = exp(_tgsdrop_xbhat_ub)
	}
	if "`sp'" == "sp" {
	*http://www.stata.com/statalist/archive/2012-05/msg00271.html
		if "`drop'" == "drop" {
			capture fussydrop `stub'Sp_`dv'
		}
		capture confirm variable _basesurv
		if _rc{
			capture predict double _basesurv, basesurv
			if _rc != 0 {
				display "Survival probabilities are only calculated for e(sample) data"
			}
		}
		capture predict double _tgsdrop_relhaz, hr
		capture gen double `stub'sp_`dv' = _basesurv^_tgsdrop_relhaz
	}
	if "`spt'" != "" {
		foreach j in `spt'{
			if "`drop'" == "drop" {
				capture fussydrop `stub'sp_`j'
			}
			quietly sp_survival, sp(`j') stub(`stub')
		}
	}
	if "`qt'" != "" {
		foreach j in `qt' {
			if "`drop'" == "drop" {
				capture fussydrop `stub'q`j'_time
			}
			quietly q_survival, q(`j') stub(`stub')
		}
	}
	

	capture drop _tgsdrop*
end


capture program drop q_survival
program q_survival

syntax, q(real) [stub(str)]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

gen _tgsdrop_id = _n

capture confirm variable _basesurv
if _rc{
  predict double _basesurv, basesurv
}

tempfile tmp1
save tmp1, replace

predict xb, xb
gen lmls = log(-log(_basesurv))
gen rhs = log(-log(`q'/100)) - xb
stack _t lmls _tgsdrop_id rhs, into(a b) clear
gsort -b
gen qtime = a if _stack == 1 
replace qtime = qtime[_n-1] if _n > 1 & qtime[_n] == .
drop if _stack == 1
gen _tgsdrop_id = a
drop a b _stack

sort _tgsdrop_id
tempfile tmp2
save tmp2, replace

use tmp1
merge 1:1 _tgsdrop_id using "tmp2"
drop _tgsdrop*
drop _merge

rename qtime `stub'q`q'_time

end

capture program drop sp_survival
program sp_survival

syntax, sp(numlist integer max=1 >0) [stub(str)]

local cmd = e(cmd)
if "`cmd'" != "cox" {
  display "This function is for cox regression"
  error 301
}

capture confirm variable _basesurv
if _rc{
  predict double _basesurv, basesurv
}


gen _tgsdrop_t = _t if _t <= `sp'
egen _tgsdrop_max_t = max(_tgsdrop_t)

gen long _tgsdrop_id = _n 
sum _tgsdrop_id if _t == _tgsdrop_max_t, meanonly 
gen double _tgsdrop_basesurv = _basesurv[`r(min)']

predict _tgsdrop_xb, xb
gen double `stub'sp_`sp' = _tgsdrop_basesurv^exp(_tgsdrop_xb)

drop _tgsdrop*
end
