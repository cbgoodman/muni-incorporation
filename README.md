# Municipal Incorporation

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
This is a work in progress and data collection is on-going.

| State | Number of Cities | Number Complete | Percentage Complete |
| --- | ---: | ---: | ---: |
| AK | 149  | 149  | 100.00% |
| AL | 461  | 457  |  91.13% |
| AR | 501  | 497  |  99.20% |
| AZ | 91	  | 91	 | 100.00% |
| CA | 482  | 482  | 100.00% |
| CO | 271  | 271  | 100.00% |
| CT | 30   |	30   | 100.00% |
| DE | 57   |	47   | 82.46%  |
| FL | 412  |	412  | 100.00% |
| GA | 537  |	535  | 99.63%  |
| HI | 1	  | 1    | 100.00% |
| IA | 943  |	942  | 99.89%  |
| ID | 200  |	1    | 0.50%   |
| IL | 1297 |	1297 | 100.00% |
| IN | 567  |	0    | 0.00%   |
| KS | 625  |	625  | 100.00% |
| KY | 417  |	413  | 99.04%  |
| LA | 304  |	304  | 100.00% |
| MA | 53   |	53   | 100.00% |
| MD | 157  |	157  | 100.00% |
| ME | 23   |	23   | 100.00% |
| MI | 533  |	533	 | 100.00% |
| MN | 853  |	276	 | 32.36%  |
| MO | 944  |	913	 | 96.72%  |
| MS | 298  |	298	 | 100.00% |
| MT | 129  |	0	   | 0.00%   |
| NC | 552  |	0	   | 0.00%   |
| ND | 357  |	356  | 99.72%  |
| NE | 529  |	0	   | 0.00%   |
| NH | 13   |	13	 | 100.00% |
| NJ | 324  |	324	 | 100.00% |
| NM | 105  |	105	 | 100.00% |
| NV | 19   |	19	 | 100.00% |
| NY | 601  |	145	 | 24.13%  |
| OH | 931  |	0	   | 0.00%   |
| OK | 591  |	6	   | 1.02%   |
| OR | 240  |	240	 | 100.00% |
| PA | 1013 |	1013 | 100.00% |
| RI | 8    |	8	   | 100.00% |
| SC | 270  |	0	   | 0.00%   |
| SD | 311  |	0	   | 0.00%   |
| TN | 345  |	345  | 100.00% |
| TX | 1217 |	1217 | 100.00% |
| UT | 250  |	2    | 0.80%   |
| VA | 228  |	0    | 0.00%   |
| VT | 42   |	0    | 0.00%   |
| WA | 281  |	281  | 100.00% |
| WI | 601  |	596  | 99.17%  |
| WV | 232  |	0    | 0.00%   |
| WY | 99   |	94   | 94.95%  |
| **Total** | **19,494** | **13,571** | **69.62%** |
