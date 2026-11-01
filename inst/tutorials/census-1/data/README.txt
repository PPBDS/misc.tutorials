census-1 tutorial data: Web API cache

income_tx.rds
  American Community Survey (ACS) 2016-2020 5-year estimates pulled once with
  tidycensus::get_acs() and cached so the tutorial renders without hitting the
  Census API: median household income (B19013_001) by Texas county, with
  county geometry. The exact get_acs() call is recorded (commented) in the
  tutorial's setup chunk. Students make the live call in their own
  analysis.qmd.

  edu_state.rds and age_ca.rds, formerly here, moved to the census-2
  tutorial (inst/tutorials/census-2/data/) when census was split in two in
  October 2026.
