capture program drop getvdata

program getvdata
	args key
	
if `"`key'"' == "" {
  display "Function will load datasets from the collection at"
  display "Vanderbilt Biostatistics (http://biostat.mc.vanderbilt.edu/DataSets)"
  display " "
  display "syntax: getvdata key"
  display " "
  display "Keys of available datasets: abm, acath, birth_estriol, cdystonia,"
  display "dmd, esopH, FEV, lead, nhgh, pbc, prostate, rhc, "
  display "sex.age.response, stressEcho, support, titanic3, valung, "
  display "1.3.2.Sepsis, 1.4.11.Sepsis, 10.7.ERpolymorphism, "
  display "11.2.Isoproterenol, 11.2.Long.Isoproterenol, 11.AreaUnderCurve, "
  display "2.12.Poisson, 2.18.Funding, 2.20.Framingham, 2.ex.vonHippelLindau, "
  display "3.ex.Funding, 4.11.Sepsis, 4.18.Sepsis, 4.21.EsophagealCa, "
  display "4.ex.Sepsis, 5.5.EsophagealCa, 5.ex.InjuryDeath, 6.9.Hemorrhage, "
  display "6.ex.Breast, 8.12.Framingham, 8.7.Framingham, 8.8.2.Person-Years, "
  display "8.8.2.Survival, 8.ex.InjuryDeath, 11.ex.Sepsis"
  display " "
  display "Keys for Whitlock and Schluter datasets at"
  display "http://biostat.mc.vanderbilt.edu/MsciBiostatIIDatasets"
  exit
}
else if `"`key'"' == "e-02-2a" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2aDeathsFromTigers.csv", clear
exit
}
else if `"`key'"' == "e-02-2b" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e2bDesertBirdAbundance.csv", clear
exit
}
else if `"`key'"' == "e-02-3a" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3aBirdMalaria.csv", clear
exit
}
else if `"`key'"' == "e-02-3b" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3bGuppyFatherSonAttractiveness.csv", clear
exit
}
else if `"`key'"' == "e-02-3c" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e3cHumanHemoglobinElevation.csv", clear
exit
}
else if `"`key'"' == "e-02-4a" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02e4aMeaslesOutbreaks.csv", clear
exit
}
else if `"`key'"' == "q-02-05" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q05FrySurvival.csv", clear
exit
}
else if `"`key'"' == "q-02-06" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q06EndangeredSpecies.csv", clear
exit
}
else if `"`key'"' == "q-02-07" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q07FamineSchizophrenia.csv", clear
exit
}
else if `"`key'"' == "q-02-12" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q12ConvictionsAndIncome.csv", clear
exit
}
else if `"`key'"' == "q-02-17" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q17AnemonePersonality.csv", clear
exit
}
else if `"`key'"' == "q-02-19" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv", clear
exit
}
else if `"`key'"' == "q-02-22" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q22CriminalConvictions.csv", clear
exit
}
else if `"`key'"' == "q-02-26" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q26NeotropicalTreePhotosynthesis.csv", clear
exit
}
else if `"`key'"' == "q-02-28" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q28SneakerCannibalism.csv", clear
exit
}
else if `"`key'"' == "q-02-32" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q32ToxoplasmaAccidents.csv", clear
exit
}
else if `"`key'"' == "q-02-33" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q33BirthMonthADHD.csv", clear
exit
}
else if `"`key'"' == "q-02-35" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q35FoodReductionLifespan.csv", clear
exit
}
else if `"`key'"' == "q-02-37" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q37Hurricanes.csv", clear
exit
}
else if `"`key'"' == "e-03-1" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e1GlidingSnakes.csv", clear
exit
}
else if `"`key'"' == "t-03-1" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q12and22CriminalConvictions.csv", clear
exit
}
else if `"`key'"' == "e-03-2" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e2SpiderAmputation.csv", clear
exit
}
else if `"`key'"' == "e-03-3" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03e3SticklebackPlates.csv", clear
exit
}
else if `"`key'"' == "q-03-01" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q01SystolicBP.csv", clear
exit
}
else if `"`key'"' == "q-03-02" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q02SystolicBP.csv", clear
exit
}
else if `"`key'"' == "q-03-04" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q04KenyaFinches.csv", clear
exit
}
else if `"`key'"' == "q-03-09" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q09Rigormortis.csv", clear
exit
}
else if `"`key'"' == "q-03-14" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q14VasopressinVoles.csv", clear
exit
}
else if `"`key'"' == "q-03-15" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q15DietBreadthElVerde.csv", clear
exit
}
else if `"`key'"' == "q-03-19" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q19SparrowReproductiveSuccess.csv", clear
exit
}
else if `"`key'"' == "q-03-21" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q21YeastMutantGrowth.csv", clear
exit
}
else if `"`key'"' == "q-03-22" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q22ZebraFishBoldness.csv", clear
exit
}
else if `"`key'"' == "q-03-28" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter03/chap03q28SeaUrchinBindin.csv", clear
exit
}
else if `"`key'"' == "e-04-1" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04e1HumanGeneLengths.csv", clear
exit
}
else if `"`key'"' == "q-04-07" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q07FireflyFlash.csv", clear
exit
}
else if `"`key'"' == "q-04-09" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q09NumberGenesRegulated.csv", clear
exit
}
else if `"`key'"' == "q-04-18" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04q18Corpseflowers.csv", clear
exit
}
else if `"`key'"' == "e-07-2" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07e2SexAndX.csv", clear
exit
}
else if `"`key'"' == "e-07-3" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07e3RadiologistOffspringSex.csv", clear
exit
}
else if `"`key'"' == "q-07-2" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q2QuestionEar.csv", clear
exit
}
else if `"`key'"' == "q-07-03" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q03LostWallets.csv", clear
exit
}
else if `"`key'"' == "q-07-04" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q04GenghisKhanCancer.csv", clear
exit
}
else if `"`key'"' == "q-07-05" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q05CocaineDollars.csv", clear
exit
}
else if `"`key'"' == "q-07-07" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q07FollicleMites.csv", clear
exit
}
else if `"`key'"' == "q-07-08" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q08GardenSpiderCannibalism.csv", clear
exit
}
else if `"`key'"' == "q-07-09" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q09ClimateRangeShifts.csv", clear
exit
}
else if `"`key'"' == "q-07-11" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q11FetalTestosterone.csv", clear
exit
}
else if `"`key'"' == "q-07-14" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q14WaitingForChristmas.csv", clear
exit
}
else if `"`key'"' == "q-07-15" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q15Latex.csv", clear
exit
}
else if `"`key'"' == "q-07-16" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q16HeroinDollars.csv", clear
exit
}
else if `"`key'"' == "q-07-18" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q18SelectiveLooking.csv", clear
exit
}
else if `"`key'"' == "q-07-19" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q19CutsFromFood.csv", clear
exit
}
else if `"`key'"' == "q-07-20" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q20LoveThroughPets.csv", clear
exit
}
else if `"`key'"' == "q-07-23" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q23ButterSideDown.csv", clear
exit
}
else if `"`key'"' == "q-07-23" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q23SurgicalSiteInfections.csv", clear
exit
}
else if `"`key'"' == "q-07-25" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q25HelpingAtNest.csv", clear
exit
}
else if `"`key'"' == "q-07-26" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q26DogFoodPate.csv", clear
exit
}
else if `"`key'"' == "q-07-27" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q27SuicideSeason.csv", clear
exit
}
else if `"`key'"' == "q-07-28" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q28RoadKill.csv", clear
exit
}
else if `"`key'"' == "q-07-30" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter07/chap07q30CatfishHunting.csv", clear
exit
}
else if `"`key'"' == "e-08-1" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e1DayOfBirth.csv", clear
exit
}
else if `"`key'"' == "e-08-4" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e4XGeneContent.csv", clear
exit
}
else if `"`key'"' == "e-08-5" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e5NumberOfBoys.csv", clear
exit
}
else if `"`key'"' == "e-08-6" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv", clear
exit
}
else if `"`key'"' == "q-08-1" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q1testingComputerProgram.csv", clear
exit
}
else if `"`key'"' == "q-08-02" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q02ShadParasites.csv", clear
exit
}
else if `"`key'"' == "q-08-03" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q03F2Resistance.csv", clear
exit
}
else if `"`key'"' == "q-08-05" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q05WorldCup.csv", clear
exit
}
else if `"`key'"' == "q-08-6" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q6CoinFlipping.csv", clear
exit
}
else if `"`key'"' == "q-08-12" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q12SpiritBearGenetics.csv", clear
exit
}
else if `"`key'"' == "q-08-14" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q14BirdWindowCrash.csv", clear
exit
}
else if `"`key'"' == "q-08-14" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q14Cavalry.csv", clear
exit
}
else if `"`key'"' == "q-08-16" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q16HospitalAdmission.csv", clear
exit
}
else if `"`key'"' == "q-08-16" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q16Truffles.csv", clear
exit
}
else if `"`key'"' == "q-08-18" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q18AnemonefishSexes.csv", clear
exit
}
else if `"`key'"' == "q-08-19" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q19Hurricanes.csv", clear
exit
}
else if `"`key'"' == "q-08-21" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q21FallingCatsByMonth.csv", clear
exit
}
else if `"`key'"' == "q-08-24" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q24DodderGrowth.csv", clear
exit
}
else if `"`key'"' == "q-08-25" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08q25DodderWithPinene.csv", clear
exit
}
else if `"`key'"' == "e-09-2" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e2AspirinCancer.csv", clear
exit
}
else if `"`key'"' == "e-09-3" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e3ToxoplasmaAndAccidents.csv", clear
exit
}
else if `"`key'"' == "e-09-3" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e3ParasiteBrainWarp.csv", clear
exit
}
else if `"`key'"' == "e-09-4" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09e4VampireBites.csv", clear
exit
}
else if `"`key'"' == "q-09-01" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q01CoffeeAndCancer.csv", clear
exit
}
else if `"`key'"' == "q-09-02" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q02DiseaseAndDivorce.csv", clear
exit
}
else if `"`key'"' == "q-09-04" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q04PigeonRumps.csv", clear
exit
}
else if `"`key'"' == "q-09-05" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q05MalariaAndMosquitoFeeding.csv", clear
exit
}
else if `"`key'"' == "q-09-06" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q06RedbackSpiderCannibalism.csv", clear
exit
}
else if `"`key'"' == "q-09-07" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q07FrogsFire.csv", clear
exit
}
else if `"`key'"' == "q-09-08" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q08FishSexChange.csv", clear
exit
}
else if `"`key'"' == "q-09-09" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q09TVAndAggression.csv", clear
exit
}
else if `"`key'"' == "q-09-10" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q10AlcoholHeartAttacks.csv", clear
exit
}
else if `"`key'"' == "q-09-11" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q11PostnatalDepression.csv", clear
exit
}
else if `"`key'"' == "q-09-12" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q12MigraineShunts.csv", clear
exit
}
else if `"`key'"' == "q-09-14" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q14MedDiet.csv", clear
exit
}
else if `"`key'"' == "q-09-16" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q16PrairieDogMultipleMating.csv", clear
exit
}
else if `"`key'"' == "q-09-17" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q17LyingIntuition.csv", clear
exit
}
else if `"`key'"' == "q-09-19" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q19Yawning.csv", clear
exit
}
else if `"`key'"' == "q-09-20" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q20ALLDaycare.csv", clear
exit
}
else if `"`key'"' == "q-09-21" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q21BlueTermites.csv", clear
exit
}
else if `"`key'"' == "q-09-22" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q22SelfRecognition.csv", clear
exit
}
else if `"`key'"' == "q-09-24" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q24HeatSterility.csv", clear
exit
}
else if `"`key'"' == "q-09-26" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q26Because.csv", clear
exit
}
else if `"`key'"' == "q-09-27" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q27WidowHealth.csv", clear
exit
}
else if `"`key'"' == "q-09-29" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q29Denomination.csv", clear
exit
}
else if `"`key'"' == "q-09-30" {
import delimited "http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter09/chap09q30FirearmsSuicide.csv", clear
exit
}
else if `"`key'"' == "abm" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/abm.dta", clear
exit
}
else if `"`key'"' == "acath" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/acath.dta", clear
exit
}
else if `"`key'"' == "birth_estriol" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/birth_estriol.csv", clear
exit
}
else if `"`key'"' == "cdystonia" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/cdystonia.dta", clear
exit
}
else if `"`key'"' == "dmd" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/dmd.csv", clear
exit
}
else if `"`key'"' == "esopH" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/esopH.dta", clear
exit
}
else if `"`key'"' == "FEV" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/FEV.csv", clear
exit
}
else if `"`key'"' == "lead" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/lead.dta", clear
exit
}
else if `"`key'"' == "nhgh" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/nhgh.dta", clear
exit
}
else if `"`key'"' == "pbc" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/pbc.dta", clear
exit
}
else if `"`key'"' == "prostate" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/prostate.dta", clear
exit
}
else if `"`key'"' == "rhc" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/rhc.csv", clear
exit
}
else if `"`key'"' == "sex.age.response" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/sex.age.response.dta", clear
exit
}
else if `"`key'"' == "stressEcho" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/stressEcho.csv", clear
exit
}
else if `"`key'"' == "support" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/support.dta", clear
exit
}
else if `"`key'"' == "titanic3" {
use "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3.dta", clear
exit
}
else if `"`key'"' == "valung" {
import delimited "http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/valung.csv", clear
exit
}
else if `"`key'"' == "1.3.2.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/1.3.2.Sepsis.csv", clear
exit
}
else if `"`key'"' == "1.4.11.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/1.4.11.Sepsis.csv", clear
exit
}
else if `"`key'"' == "10.7.ERpolymorphism" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/10.7.ERpolymorphism.csv", clear
exit
}
else if `"`key'"' == "11.2.Isoproterenol" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.2.Isoproterenol.csv", clear
exit
}
else if `"`key'"' == "11.2.Long.Isoproterenol" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.2.Long.Isoproterenol.csv", clear
exit
}
else if `"`key'"' == "11.AreaUnderCurve" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.AreaUnderCurve.csv", clear
exit
}
else if `"`key'"' == "2.12.Poisson" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.12.Poisson.csv", clear
exit
}
else if `"`key'"' == "2.18.Funding" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.18.Funding.csv", clear
exit
}
else if `"`key'"' == "2.20.Framingham" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.20.Framingham.csv", clear
exit
}
else if `"`key'"' == "2.ex.vonHippelLindau" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/2.ex.vonHippelLindau.csv", clear
exit
}
else if `"`key'"' == "3.ex.Funding" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/3.ex.Funding.csv", clear
exit
}
else if `"`key'"' == "4.11.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.11.Sepsis.csv", clear
exit
}
else if `"`key'"' == "4.18.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.18.Sepsis.csv", clear
exit
}
else if `"`key'"' == "4.21.EsophagealCa" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.21.EsophagealCa.csv", clear
exit
}
else if `"`key'"' == "4.ex.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/4.ex.Sepsis.csv", clear
exit
}
else if `"`key'"' == "5.5.EsophagealCa" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/5.5.EsophagealCa.csv", clear
exit
}
else if `"`key'"' == "5.ex.InjuryDeath" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/5.ex.InjuryDeath.csv", clear
exit
}
else if `"`key'"' == "6.9.Hemorrhage" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/6.9.Hemorrhage.csv", clear
exit
}
else if `"`key'"' == "6.ex.Breast" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/6.ex.Breast.csv", clear
exit
}
else if `"`key'"' == "8.12.Framingham" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.12.Framingham.csv", clear
exit
}
else if `"`key'"' == "8.7.Framingham" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.7.Framingham.csv", clear
exit
}
else if `"`key'"' == "8.8.2.Person-Years" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.8.2.Person-Years.csv", clear
exit
}
else if `"`key'"' == "8.8.2.Survival" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.8.2.Survival.csv", clear
exit
}
else if `"`key'"' == "8.ex.InjuryDeath" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/8.ex.InjuryDeath.csv", clear
exit
}
else if `"`key'"' == "11.ex.Sepsis" {
import delimited "http://biostat.mc.vanderbilt.edu/dupontwd/wddtext/data/11.ex.Sepsis.csv", clear
exit
}
else if `"`key'"' == "key"{
display "abm, acath, birth_estriol, cdystonia, dmd, esopH, FEV, lead, nhgh, pbc, prostate, rhc, sex.age.response, stressEcho, support, titanic3, valung, 1.3.2.Sepsis, 1.4.11.Sepsis, 10.7.ERpolymorphism, 11.2.Isoproterenol, 11.2.Long.Isoproterenol, 11.AreaUnderCurve, 2.12.Poisson, 2.18.Funding, 2.20.Framingham, 2.ex.vonHippelLindau, 3.ex.Funding, 4.11.Sepsis, 4.18.Sepsis, 4.21.EsophagealCa, 4.ex.Sepsis, 5.5.EsophagealCa, 5.ex.InjuryDeath, 6.9.Hemorrhage, 6.ex.Breast, 8.12.Framingham, 8.7.Framingham, 8.8.2.Person-Years, 8.8.2.Survival, 8.ex.InjuryDeath, 11.ex.Sepsis"
}
else {
display "Dataset not found.  Use 'getvdata' to see list of available datasets."
}
end
