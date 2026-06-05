census tutorial data: Web API cache

income_tx.rds, edu_ca.rds, age_ca.rds
  American Community Survey (ACS) 5-year estimates pulled once with
  tidycensus::get_acs() and cached so the tutorial renders without hitting the
  Census API. The exact get_acs() calls are recorded (commented) in the census
  tutorial's setup chunk: median household income by TX county (income_tx),
  educational attainment by CA county (edu_ca), and median age + population by
  CA county (age_ca).
