## TITLE: MUNICIPAL INCORPORATION
## Created: 	2020-06-09
## Modified:	2024-05-06

# Description: This script file expands the raw municipal incorporation data into long annual panel

# Setup
library(tidyverse)
library(sf)

`%nin%` = Negate("%in%")

# IMPORTING A CROSSWALK FOR FIPS CODES, CENSUS CODES, NAMES, AND OTHER METADATA
disincorp_fips_crosswalk =
  read_csv(
    "rawdata/disincorp-fips-crosswalk.csv",
    col_types = cols(
      census_id = col_character(),
      geoid = col_character(),
      muniname = col_character(),
      statefips = col_character(),
      state_abbv = col_character(),
      statename = col_character(),
      countyfips = col_character(),
      countyname = col_character(),
      placecity = col_character(),
      lat = col_double(),
      long = col_double()
    )
  ) |>
  # create a spatial object
  st_as_sf(
    coords = c("lat", "long"),
    crs = "EPSG:4326"
  )

# PREPARING THE MUNICIPAL INCORPORATION FILE
muni_disincorp =
  read_csv(
    "rawdata/muni-disincorporation.csv",
    col_types = cols(
      census_id = col_character(),
      muniname = col_character(),
      statename = col_character(),
      yr_incorp = col_double(),
      yr_dissolve = col_double()
    )
  )

# MERGE DATA INTO ONE DATASET
muni_disincorp_full =
  left_join(
    muni_disincorp,
    disincorp_fips_crosswalk,
    by = c("census_id", "muniname", "statename")
  ) |>
  # Do some column cleanup
  relocate(c(state_abbv, countyname), .after = statename) |>
  relocate(geoid, .after = placecity) |>
  relocate(c(yr_incorp, yr_dissolve), .before = geometry)

# EXPORT DATASET TO CSV
write_csv(muni_disincorp_full, "exports/muni-disincorp-full.csv")