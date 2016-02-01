*********************************************
* Desert pool fish species
* 17-f-5_3
*********************************************
clear
graph drop _all
set more off 

import delimited using http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_3DesertPoolFish.csv, clear 


* LOWESS
twoway (lowess nfishspecies poolarea, bwidth(0.7)) (scatter nfishspecies poolarea), ///
 ytitle(Number of species) ///
 xtitle(Pool Area (m^2)) ///
 title(Lowess Fit) ///
 legend(off) ///
 name(lowess)


* FRACTIONAL POLYNOMIAL
twoway (scatter nfishspecies poolarea) (fpfit nfishspecies poolarea), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(Fractional Polynomial Fit) ///
 legend(off) ///
 name(frac_poly)


* CUBIC SPLINE 
twoway (mspline nfishspecies poolarea, n(6)) (scatter nfishspecies poolarea), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(Cubic Spline Fit) ///
 legend(off) ///
 name(cubic_spline)

* a + poolArea ^ b REGRESSION
nl (nfishspecies = {alpha} +  poolarea  ^ {gamma})
predict pred_species, yhat
twoway (scatter nfishspecies poolarea) (line pred_species poolarea, sort), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(a + poolArea ^ b) ///
 legend(off) ///
 name(power_reg)

* a + b * log(poolArea)
nl (nfishspecies = {alpha} +  {gamma} * log(poolarea))
predict pred_species2, yhat
twoway (scatter nfishspecies poolarea) (line pred_species2 poolarea, sort), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(a + b * log(poolArea)) ///
 legend(off) ///
 name(log)
