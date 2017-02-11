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
