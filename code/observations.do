* OBSERVATIONS.DO
*
* This script extracts college degree information from the 2016 ACS PUMS data
* published by the US Census Bureau. The script aggregates sample weights by 
* age, sex, degree fields and level of educational attainment.
*
* Ben Davies
* June 2019

global DIR "${PROJECTS}/college-degrees"

log using "${DIR}/_logs/observations.log", replace

* Import data
use agep fod* schl sex pwgtp using "${DATABANK}/pums/ss16pus", clear

* Rename variables
rename agep age
rename pwgtp weight

* Create binary indicator for whether respondent is female
gen female = sex - 1

* Identify levels of educational attainment
gen level = 0
replace level = 1 if schl == 21  // Bachelor's degree
replace level = 2 if inlist(schl, 22, 23)  // Professional or Master's degree
replace level = 3 if schl == 24  // Doctorate

* Sort degree fields
gen field1 = min(fod1p, fod2p)
gen field2 = max(fod1p, fod2p)
replace field2 = . if missing(fod2p)

* Aggregate sample weights by age, female, and degree level and fields
collapse (sum) weight, by(age female level field1 field2)

* Summarise and export data
summ age female level [fw = weight]
codebook
export delimited "${DIR}/data/observations.csv", replace

log close
