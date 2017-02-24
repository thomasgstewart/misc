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

syntax [,xb rh sp alpha(str) stub(str) drop]


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
	
	if "`xb'" == "" & "`sp'" == "" & "`rh'" == "" {
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
		capture predict double _tgsdrop_surv, basesurv
		if _rc != 0 {
		  display "Survival probabilities are only calculated for e(sample) data"
		}
		capture predict double _tgsdrop_relhaz, hr
		capture gen double `stub'sp_`dv' = _tgsdrop_surv^_tgsdrop_relhaz
	}

	drop _tgsdrop*
end



