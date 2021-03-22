# Municipal Incorporation Data

* Last updated: `2021-03-22`
* Jump to: [`code`](#contents-of-code) [`status`](#status) [`sources`](#sources)

---

## Description

This repository will eventually contain the Stata code and raw spreadsheets needed to create an individual-level and state-specific dataset of dates of municipal incorporation for all active (contained in the Census of Governments) municipalities in the United States.

## Contents of /code/
Run the following do-files to create the individual-level and state-specific extracts. You will need to change the ${home} directory in these do-files to match your directory setup. The running the code will update and replace the contents of the /exports/ and /release/ folders.
* muni-incorp.do - creates an individual-level data
* muni-incorp-state.do - creates state specific data

## Contents of /rawdata/
These spreadsheets are the raw data called by the do-files above:
* cog-muni-incorp.xlsx - individual level dates of incorporation
* crosswalk.xlsx - geographic crosswalk

## Status
This is a work in progress and data collection is on-going. If you have a lead on incorporation data that is currently missing, please do not hesitate to get in touch ([cgoodman@niu.edu](mailto:cgoodman@niu.edu)).

| State | Number of Cities | Number Complete | Percentage Complete |
| --- | ---: | ---: | ---: |
| AK | 149  | 149  | 100.00% |
| AL | 461  | 457  |  99.13% |
| AR | 501  | 497  |  99.20% |
| AZ | 91	  | 91	 | 100.00% |
| CA | 482  | 482  | 100.00% |
| CO | 271  | 271  | 100.00% |
| CT | 30   |	30   | 100.00% |
| DE | 57   |	57   | 100.00% |
| FL | 412  |	412  | 100.00% |
| GA | 537  |	535  | 99.63%  |
| HI | 1	  | 1    | 100.00% |
| IA | 943  |	942  | 99.89%  |
| ID | 200  |	1    | 0.50%   |
| IL | 1297 |	1297 | 100.00% |
| IN | 567  |	533  | 94.00%  |
| KS | 625  |	625  | 100.00% |
| KY | 417  |	413  | 99.04%  |
| LA | 304  |	304  | 100.00% |
| MA | 53   |	53   | 100.00% |
| MD | 157  |	157  | 100.00% |
| ME | 23   |	23   | 100.00% |
| MI | 533  |	533	 | 100.00% |
| MN | 853  |	829	 | 97.19%  |
| MO | 944  |	913	 | 96.72%  |
| MS | 298  |	298	 | 100.00% |
| MT | 129  |	129  | 100.00% |
| NC | 552  |	547  | 99.09%  |
| ND | 357  |	356  | 99.72%  |
| NE | 529  |	261  | 49.34%  |
| NH | 13   |	13	 | 100.00% |
| NJ | 324  |	324	 | 100.00% |
| NM | 105  |	105	 | 100.00% |
| NV | 19   |	19	 | 100.00% |
| NY | 601  |	601	 | 100.00% |
| OH | 931  |	929  | 99.79%  |
| OK | 591  |	6	   | 1.02%   |
| OR | 240  |	240	 | 100.00% |
| PA | 1013 |	1013 | 100.00% |
| RI | 8    |	8	   | 100.00% |
| SC | 270  |	261  | 96.67%  |
| SD | 311  |	253  | 81.35%  |
| TN | 345  |	345  | 100.00% |
| TX | 1217 |	1217 | 100.00% |
| UT | 250  |	73   | 29.20%  |
| VA | 228  |	228  | 100.00% |
| VT | 42   |	42   | 100.00% |
| WA | 281  |	281  | 100.00% |
| WI | 601  |	596  | 99.17%  |
| WV | 232  |	232  | 100.00% |
| WY | 99   |	94   | 94.95%  |
| **Total** | **19,494** | **18,076** | **92.73%** |

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
| ID | |
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
| OK |
| OR | Oregon Secretary of State's Office |
| PA | *Incorporation Dates for Pennsylvania Municipalities* (1965) |
| RI | State of Rhode Island |
| SC | *Towns of South Carolina* (1943, updated 1972), South Carolina State Planning Board |
| SD | South Dakota Municipal League |
| TN | Tennessee Secretary of State's *Blue Book* |
| TX | Texas Municipal League |
| UT |
| VA | Virginia State Law Portal, "Charters" |
| VT | Vermont "Index to Municipal Charters" |
| WA | MRSC of Washington |
| WI | Wisconsin Department of Administration, Division of Intergovernmental Relations |
| WV | West Virginia *Blue Book* |
| WY | Wyoming State Archives |
