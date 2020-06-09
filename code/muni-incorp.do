* ==================================
* TITLE: MUNICIPAL INCORPORATION
* Created: 	2020-06-09
* Modified:	2020-06-09
* ==================================

* Description: This .do file expands the raw municipal incorporation data into long annual panel

set more off
clear all

* GLOBALS
* The $home directory will need to be changed
global home "~/Dropbox/Data/Municipal Incorporation/muni-incorp"
global raw "${home}rawdata/"
global exports "${home}exports/"
global release "${home}release/"
