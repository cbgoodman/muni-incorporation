# Municipal Incorporation Data

* Last updated: `2024-05-07`
* Jump to: [`code`](#contents-of-code) [`status`](#status) [`sources`](#sources)

---

## Description

This repository contains the **R** code and raw text files needed to create an individual-level and state-specific dataset of dates of municipal incorporation for all active (included in the Census of Governments) municipalities in the United States.

These data generally are not self-reported by the incorporated government. These data are sourced from state-level actors, primarily state agencies responsible for tracking incorporations or state municipal leagues that collect data on their members. Importantly, these data are the first recognized date of incorporation. Many states allow re-incorporation (reasonably common in the late 1800s as statutory incorporation became popular, as opposed to incorporation via an act of the state legislature) that muddy the waters of when a place formed a municipal government.

## Citation

While there is a working paper forthcoming (please cite it when it comes out), I want to get these data into the world. As such, please cite this GitHub repo (see `Cite this repository' to the right).

## Contents of /code/
Run the following scripts to create the individual-level and state-specific extracts. The running the code will update and replace the contents of the /exports/ folder. The code is best run after creating an r project in the root directory of the repository.
* `muni-disincorp.r` - creates individual-level disincorporations data (**EXPERIMENTAL**)
* `muni-incorp-state.r` - creates state-specific annual incorporation count data. This contains annual observations by state from 1800 to 2023. Incorporations older than 1800 are accounted for in their own years; however, the time series is not continuous. 
* `muni-incorp.r` - creates individual-level incorporations data

## Contents of /rawdata/
These spreadsheets are the raw data called by the do-files above:
* `disincorp-fips-crosswalk.csv` - geographic crosswalk for disincorporations (**EXPERIMENTAL**)
* `fips_crosswalk.csv` - geographic crosswalk
* `muni-disincorporation.csv` - individual level dates of disincorporation (**EXPERIMENTAL**)
* `muni-incorporation.csv` - individual level dates of incorporation
* `state_fips_crosswalk.csv` - state-specific geographic crosswalk

## Status
This is a work in progress and data collection is on-going. If you have a lead on incorporation data that is currently missing, please do not hesitate to get in touch ([cgoodman@niu.edu](mailto:cgoodman@niu.edu)).


#### Percent complete of currently active (included in the COG Organizations file) municipalities by state
| State | Number of Cities | Number Complete | Percentage Complete |
| --- | ---: | ---: | ---: |
| AK | 149  | 149  | 100.00% |
| AL | 462  | 458  |  99.13% |
| AR | 499  | 495  |  99.20% |
| AZ | 91	  | 91	 | 100.00% |
| CA | 482  | 482  | 100.00% |
| CO | 272  | 272  | 100.00% |
| CT | 30   |	30   | 100.00% |
| DE | 57   |	57   | 100.00% |
| FL | 412  |	412  | 100.00% |
| GA | 537  |	535  | 99.63%  |
| HI | 1	  | 1    | 100.00% |
| IA | 940  |	939  | 99.89%  |
| ID | 199  |	199  | 100.00% |
| IL | 1295 |	1295 | 100.00% |
| IN | 567  |	533  | 94.00%  |
| KS | 624  |	624  | 100.00% |
| KY | 417  |	413  | 99.04%  |
| LA | 303  |	303  | 100.00% |
| MA | 56   |	56   | 100.00% |
| MD | 157  |	157  | 100.00% |
| ME | 23   |	23   | 100.00% |
| MI | 533  |	533	 | 100.00% |
| MN | 854  |	830	 | 97.19%  |
| MO | 942  |	911	 | 96.71%  |
| MS | 298  |	298	 | 100.00% |
| MT | 128  |	128  | 100.00% |
| NC | 552  |	547  | 99.09%  |
| ND | 356  |	357  | 99.72%  |
| NE | 528  |	262  | 49.62%  |
| NH | 13   |	13	 | 100.00% |
| NJ | 323  |	323	 | 100.00% |
| NM | 105  |	105	 | 100.00% |
| NV | 19   |	19	 | 100.00% |
| NY | 595  |	595	 | 100.00% |
| OH | 926  |	925  | 99.89%  |
| OK | 592  |	279	 | 47.13%  |
| OR | 240  |	240	 | 100.00% |
| PA | 1013 |	1013 | 100.00% |
| RI | 8    |	8	   | 100.00% |
| SC | 271  |	262  | 96.68%  |
| SD | 310  |	253  | 81.61%  |
| TN | 345  |	345  | 100.00% |
| TX | 1225 |	1225 | 100.00% |
| UT | 254  |	183  | 72.05% |
| VA | 228  |	228  | 100.00% |
| VT | 40   |	40   | 100.00% |
| WA | 281  |	281  | 100.00% |
| WI | 605  |	605  | 100.00%  |
| WV | 231  |	231  | 100.00% |
| WY | 99   |	94   | 94.95%  |
| **Total** | **19487** |	**18655** |	**95.73%** |

## Sources

| State | Source |
| --- | --- |
| AK | Alaska Division of Community and Regional Affairs |
| AL | Alabama League of Municipalities |
| AR | Encyclopedia of Arkansas (Central Arkansas Library System) |
| AZ | Arizona League of Cities and Towns |
| CA | California Association of Local Agency Formation Commissions |
| CO | Colorado State Planning Division |
| CT | Connecticut Secretary of State's Office |
| DE | State of Delaware |
| FL | Florida League of Cities |
| GA | Georgia Municipal Association |
| HI | City of Honolulu |
| IA | Iowa Secretary of State's Office |
| ID | *Idaho's 200 Cities* (2017)|
| IL | Illinois Secretary of State's Office |
| IN | Davenport, *Indiana date book: incorporated municipalities and created counties* |
| KS | Kansas Historical Society |
| KY | Kentucky Secretary of State's Office |
| LA | Louisiana Municipal Association |
| MA | Massachusetts Secretary of State's Office |
| MD | *Maryland's 157: The Incorporated Cities and Towns*, Maryland Municipal League |
| ME | Maine Genealogy |
| MI | Michigan Municipal League |
| MN | *Minnesota Place Names*, Minnesota Historical Society |
| MO | Missouri Secretary of State's Office |
| MS | Mississippi Secretary of State's Office |
| MT | 3rd Edition of the *Montana Municipal Officials Handbook* |
| NC | North Carolina Secretary of State's Office |
| ND | *North Dakota Centennial Blue Book, 1889-1989* |
| NE | Nebraska Department of Economic Development |
| NH | New Hampshire Community Profiles |
| NJ | *The Story of New Jersey's Civil Boundaries, 1606-1968* |
| NM | New Mexico Municipal League |
| NV | Nevada League of Cities and Municipalities |
| NY | Office of the New York State Comptroller; *Civil list and constitutional history of the Colony and State of New York* (1888); *Special report of the Commissioners of Statutory Revision in relation to Villages* (1897) |
| OH | Ohio Secretary of State's Office |
| OK | The Encyclopedia of Oklahoma History and Culture |
| OR | Oregon Secretary of State's Office |
| PA | *Incorporation Dates for Pennsylvania Municipalities* (1965) |
| RI | State of Rhode Island |
| SC | *Towns of South Carolina* (1943, updated 1972), South Carolina State Planning Board |
| SD | South Dakota Municipal League |
| TN | Tennessee Secretary of State's *Blue Book* |
| TX | Texas Municipal League |
| UT | Utah Lieutenant Governor City and town information files |
| VA | Virginia State Law Portal, "Charters" |
| VT | Vermont "Index to Municipal Charters" |
| WA | MRSC of Washington |
| WI | Wisconsin Department of Administration, Division of Intergovernmental Relations |
| WV | West Virginia *Blue Book* |
| WY | Wyoming State Archives |
