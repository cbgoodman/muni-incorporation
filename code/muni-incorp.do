* ==================================
* TITLE: MUNICIPAL INCORPORATION
* Created: 	2020-06-09
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
rename LatitudeGNIS lat
rename LongitudeGNIS lon
* Saving crosswalk as a temporary file
tempfile crosswalk
save `crosswalk'

* PREPARING THE MUNICIPAL INCORPORATION FILE
* Loading in the municipal incorporation data
import excel using "${raw}`incorp'.xlsx", clear firstrow

format yr_incorp %ty

* Labeling variables
merge 1:1 census_id using `crosswalk', nogen keep(3)
label var census_id "Census ID Number"
label var muniname "Name"
label var statename "State Name"
label var yr_incorp "Earliest Year of Municipal Incorporation"
order census_id muniname statefips statecode statename stateabb countyfips countycode countyname placefips lat lon unitcode govtype yr_incorp

* Exporting to Stata .dta file
sort census_id
compress
save "${exports}muni_incorporation_date.dta", replace

* Exporting to excel spreadsheet format
export excel using "${exports}muni_incorporation_date.xlsx", replace firstrow(varlabels) datestring(%ty)
