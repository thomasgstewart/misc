capture program drop regress_yhat_ci
program regress_yhat_ci
//http://www.stata.com/statalist/archive/2007-03/msg00372.html

syntax [, type(str) alpha(str)]

if "`type'" == "" {
  local type = "stdp"
}
else if "`type'" == "forecast" {
  local type = "stdf"
}
else {
  exit
}

if "`alpha'" == "" {
  local alpha = 0.05
}


local dv = e(depvar)
display "`dv'"
predict `dv'_hat, xb
predict _yhatse, `type'

generate `dv'_hat_lb = `dv'_hat - invttail(e(df_r),`alpha'/2) * _yhatse
generate `dv'_hat_ub = `dv'_hat + invttail(e(df_r),`alpha'/2) * _yhatse

drop _yhatse

end