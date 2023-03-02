* ==================================
* TITLE: MUNICIPAL INCORPORATION
* Created: 	2021-09-17
* Modified:	2023-03-02
* ==================================

* Description: This .do file expands the raw municipal incorporation data into long annual panel

set more off
clear all

* GLOBALS
* The $home directory will need to be changed
global home "~/HOME/muni-incorporation/"
global raw "${home}rawdata/"
global exports "${home}exports/"

local incorp "muni-incorporation"
local lastyear 2017

* IMPORTING A CROSSWALK FOR FIPS CODES, CENSUS CODES, NAMES, AND OTHER METADATA
* Importing and "loading in" the crosswalk
import excel using "${raw}fips_crosswalk.xlsx", clear firstrow
* Rename variables
rename CensusIDNumber census_id
rename Name muniname
rename FIPSStateNumericCode statefips
rename CensusStateNumericCode statecode
rename StateName statename
rename OfficialUSPSCode stateabb
replace stateabb = upper(stateabb)
rename FIPSCountyNumericCode countyfips
rename CensusCountyNumericCode countycode
rename CountyName countyname
rename FIPSPlaceNumericCode placefips
rename CensusUnitNumericCode unitcode
rename CensusGovtTypeCode govtype
* Saving crosswalk as a temporary file
tempfile crosswalk
save `crosswalk'

* IMPORTING A CROSSWALK FOR FIPS CODES, CENSUS CODES, NAMES, AND OTHER METADATA
* Importing and "loading in" the crosswalk
import excel using "${raw}state_fips_crosswalk.xlsx", clear firstrow
* Renaming variables
rename Name statename
rename FIPSStateNumericCode statefips
rename OfficialUSPSCode stateabb
replace stateabb = upper(stateabb)
keep statename statefips stateabb
*Saving crosswalk as a temporary file
tempfile stcrosswalk
save `stcrosswalk'

* PREPARING THE MUNICIPAL INCORPORATION FILE
* Loading in the municipal incorporation data
import excel using "${raw}`incorp'.xlsx", clear firstrow

format yr_incorp %ty
drop if yr_incorp == .

* Labeling variables
merge 1:1 census_id using `crosswalk', nogen keep(3)
label var census_id "Census ID Number"
label var muniname "Name"
label var statename "State Name"
label var yr_incorp "Earliest Year of Municipal Incorporation"
order census_id muniname statefips statecode statename stateabb countyfips countycode countyname placefips unitcode govtype yr_incorp

* CREATE STATE-LEVEL DATASET
* Tag the first year of incorporation for later
preserve
egen tag = tag(census_id)
keep if tag == 1
tempfile localities
save `localities'
restore

gen yr_last = 2020
destring census_id, gen(census_num)

* Gen first and last years, merge back in first year
reshape long yr_, i(census_id) j(year, string)
joinby census_id using `localities'

* Expanding the date variable
tsset census_num yr_
tsfill

* Collapse by year
collapse (count) yr_incorp , by(statefips yr_)
destring statefips, replace
drop if statefips==.

* Expand out all missing years and fill in years with zero incorporations
tsset statefips yr_
tsfill
replace yr_incorp = 0 if yr_incorp==.

* Populate the initial number of incorporations
bysort statefips (yr_): gen minyear = yr_ == yr_[1]
gen muni = yr_incorp if minyear == 1

* Create running list of incorporations by state
bysort statefips: replace muni = l.muni + yr_incorp if minyear==0

* End at 2017
drop if yr_>`lastyr'
drop minyear

* Renaming variables
merge m:1 statefips using `stcrosswalk', nogen keep(3)
rename yr_ year
rename yr_incorp incorp
format incorp %5.0f
rename muni tot_muni
* Labeling variables
label var incorp "Incorporations per year"
label var tot_muni "Total Municipalities"
order statefips statename stateabb year incorp tot_muni

* Exporting to Stata .dta file
sort stateabb year
compress
save "${exports}muni_incorporation_state.dta", replace

* Exporting to excel spreadsheet format
export excel using "${exports}muni_incorporation_state.xlsx", replace firstrow(varlabels)
