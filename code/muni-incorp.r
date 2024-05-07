## TITLE: MUNICIPAL INCORPORATION
## Created: 	2020-06-09
## Modified:	2024-05-06

# Description: This script file expands the raw municipal incorporation data into long annual panel

# Setup
library(tidyverse)
library(sf)

`%nin%` = Negate("%in%")

# IMPORTING A CROSSWALK FOR FIPS CODES, CENSUS CODES, NAMES, AND OTHER METADATA
fips_crosswalk =
  read_csv(
    "rawdata/fips-crosswalk.csv",
    col_types = cols(
      census_id_pid6 = col_double(),
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
  # filter out municipalities in COG but not in gazetteer
  # comment out if you want to include all municipalities
  # or not using spatial coordinates
  filter(
    census_id_pid6 %nin% c(
      "189810", "162584", "126093",
      "127628", "107587", "168825",
      "110239", "176012", "176736",
      "136405"
    )
  ) |>
  # create a spatial object
  st_as_sf(
    coords = c("lat", "long"),
    crs = "EPSG:4326"
  )

# PREPARING THE MUNICIPAL INCORPORATION FILE
muni_incorp =
  read_csv(
    "rawdata/muni-incorporation.csv",
    col_types = cols(
      census_id_pid6 = col_double(),
      muniname = col_character(),
      statename = col_character(),
      yr_incorp = col_double()
    )
  )

# MERGE DATA INTO ONE DATASET
muni_incorp_full =
  left_join(
    muni_incorp,
    fips_crosswalk,
    by = c("census_id_pid6", "muniname", "statename")
  ) |>
  # Do some column cleanup
  relocate(census_id, .after = census_id_pid6) |>
  relocate(c(state_abbv, countyname), .after = statename) |>
  relocate(geoid, .after = placecity) |>
  relocate(yr_incorp, .before = geometry)


# EXPORT DATASET TO CSV
write_csv(muni_incorp_full, "exports/muni-incorp-full.csv")