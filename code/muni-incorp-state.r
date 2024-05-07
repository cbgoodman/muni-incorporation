## TITLE: MUNICIPAL INCORPORATION
## Created: 	2020-06-09
## Modified:	2024-05-06

# Description: This script file expands the raw municipal incorporation data into long annual panel

# Setup
library(tidyverse)
library(sf)

`%nin%` = Negate("%in%")

# IMPORTING A CROSSWALK FOR FIPS CODES, CENSUS CODES, NAMES, AND OTHER METADATA
state_crosswalk =
  read_csv(
    "rawdata/state-fips-crosswalk.csv",
    col_types = cols(
      statefips = col_character(),
      state_abbv = col_character(),
      statename = col_character()
    )
  ) |>
  mutate(
    statename = str_to_upper(statename)
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
muni_incorp_state_full =
  left_join(
    muni_incorp,
    state_crosswalk,
    by = "statename"
  ) |>
  group_by(statename, statefips, state_abbv) |>
  # collapse into a state dataframe
  pivot_wider(
    names_from = yr_incorp,
    names_prefix = "yr_",
    values_from = muniname
  ) |>
  # needs to removed here because it uniquely identifies cities previously
  select(-census_id_pid6) |>
  # regroup
  group_by(statename, statefips, state_abbv) |>
  # generate per year counts
  summarize(
    across(
      starts_with("yr_"),
      ~n_distinct(na.omit(.))
    )
  ) |>
  # collapse into a long format
  pivot_longer(
    cols = starts_with("yr_"),
    names_to = "year",
    names_prefix = "yr_",
    values_to = "incorp_count"
  ) |>
  # remove counts of obs with no incorporation year
  filter(year != "NA") |>
  arrange(desc(year), .by_group = TRUE) |>
  ungroup()

# EXPORT DATASET TO CSV
write_csv(muni_incorp_state_full, "exports/muni-incorp-state-full.csv")