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
