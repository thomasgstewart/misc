*********************************************
* Desert pool fish species
* 17-f-5_3
*********************************************

import delimited using http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17f5_3DesertPoolFish.csv, clear 


* LOWESS
twoway (lowess nfishspecies poolarea, bwidth(0.7)) (scatter nfishspecies poolarea), ///
 ytitle(Number of species) ///
 xtitle(Pool Area (m^2)) ///
 title(Lowess Fit) legend(off)

* FRACTIONAL POLYNOMIAL
twoway (scatter nfishspecies poolarea) (fpfit nfishspecies poolarea), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(Fractional Polynomial Fit) legend(off)

* CUBIC SPLINE 
twoway (mspline nfishspecies poolarea, n(6)) (scatter nfishspecies poolarea), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(Cubic Spline Fit) legend(off)

* a + poolArea ^ b REGRESSION
nl (nfishspecies = {alpha} +  poolarea  ^ {gamma})
predict pred_species, yhat
twoway (scatter nfishspecies poolarea) (line pred_species poolarea, sort), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(a + poolArea ^ b) ///
 legend(off)

* a + poolArea ^ b
nl (nfishspecies = {alpha} +  {gamma} * log(poolarea))
predict pred_species2, yhat
twoway (scatter nfishspecies poolarea) (line pred_species2 poolarea, sort), ///
 ytitle(Number of Species) ///
 xtitle(Pool Area (m^2)) ///
 title(a + poolArea ^ b) ///
 legend(off)
