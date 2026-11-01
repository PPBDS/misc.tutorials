demographics tutorial data: Web API cache

edu_state.rds, age_ca.rds
  American Community Survey (ACS) 2016-2020 5-year estimates pulled once with
  tidycensus::get_acs() and cached so the tutorial renders without hitting the
  Census API. The exact get_acs() calls are recorded (commented) in the
  tutorial's setup chunk: educational attainment (table B15003: total plus the
  four bachelor's-and-higher levels) by state-level geography (edu_state), and
  median age (B01002_001) plus total population (B01003_001) by California
  county (age_ca). Both were part of the census tutorial until it was split in
  October 2026. Students make the live calls in their own analysis.qmd.
