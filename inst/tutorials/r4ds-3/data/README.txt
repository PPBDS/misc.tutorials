r4ds-3 tutorial data: Databases (DuckDB)

seda_2025.duckdb
  District and state reading/math achievement scores from the Stanford Education
  Data Archive (SEDA) Version 2025.1. Three tables:

    district_scores       191,547 rows — one row per school district per year,
                          all students combined. Columns: district_id (int),
                          district_name (chr), state (chr), year (int),
                          rla_score (dbl), mth_score (dbl), rla_se (dbl),
                          mth_se (dbl). Years: 2009–2025 (no 2020–2021 —
                          standardized testing was suspended during COVID).

    district_demographics 1,053,284 rows — same districts, broken out by
                          subgroup. Columns: district_id (int),
                          district_name (chr), state (chr), year (int),
                          subgroup (chr: "asn", "blk", "ecd", "fem", "hsp",
                          "mal", "nam", "nec", "wht"), rla_score (dbl),
                          mth_score (dbl).

    state_scores          756 rows — one row per state per year, all students.
                          Columns: stateabb (chr), state_name (chr), year (int),
                          rla_score (dbl), mth_score (dbl), rla_se (dbl),
                          mth_se (dbl).

  Scores are on the SEDA YS (Year Score) scale in grade-equivalent units;
  0 ≈ national average, 1.0 = one grade level above average.

  Citation: Reardon, S. F., Fahle, E. M., Ho, A. D., Shear, B. R., Saliba, J.,
  Min, J., Shim, J., & Kalogrides, D. (2026). Stanford Education Data Archive
  (Version SEDA 2025.1). https://purl.stanford.edu/hm970gr1371
  DOI: https://doi.org/10.25740/hm970gr1371
  License: CC BY 4.0
  Download page: https://edopportunity.org/trends/data/downloads/

  Built from raw SEDA CSV files in the dataset-search project
  (explorations/us-ed-seda/). The raw district file has 1.24M rows across all
  subgroups; the DuckDB was built by reading the raw CSV, splitting into the
  all-students and by-subgroup tables, selecting key columns, and writing to
  DuckDB with dbWriteTable(). The state file was similarly filtered. Exact
  build steps:

  library(readr); library(dplyr); library(DBI); library(duckdb)

  d <- read_csv("seda_admindist_annualsub_ys_2025.1.csv")
  s <- read_csv("seda_state_annualsub_ys_2025.1.csv")

  district_scores <- d |>
    filter(subcat == "all", subgroup == "all") |>
    select(district_id = sedaadmin, district_name = sedaadminname,
           state = stateabb, year,
           rla_score = ys_mn_avg_rla_ol, mth_score = ys_mn_avg_mth_ol,
           rla_se = ys_mn_avg_rla_ol_se, mth_se = ys_mn_avg_mth_ol_se)

  district_demographics <- d |>
    filter(!(subcat == "all" & subgroup == "all")) |>
    select(district_id = sedaadmin, district_name = sedaadminname,
           state = stateabb, year, subgroup,
           rla_score = ys_mn_avg_rla_ol, mth_score = ys_mn_avg_mth_ol)

  state_scores <- s |>
    filter(subcat == "all", subgroup == "all") |>
    select(stateabb, state_name = sedafipsname, year,
           rla_score = ys_mn_avg_rla_ol, mth_score = ys_mn_avg_mth_ol,
           rla_se = ys_mn_avg_rla_ol_se, mth_se = ys_mn_avg_mth_ol_se)

  con <- dbConnect(duckdb::duckdb(), dbdir = "seda_2025.duckdb")
  dbWriteTable(con, "district_scores", district_scores)
  dbWriteTable(con, "district_demographics", district_demographics)
  dbWriteTable(con, "state_scores", state_scores)
  dbDisconnect(con)

atus.duckdb
  Time-diary microdata from the Bureau of Labor Statistics American Time Use
  Survey (ATUS), 2003–2024. Three tables:

    respondents    252,808 rows — one row per person surveyed. Columns:
                   tucaseid (chr), year (int), sex (chr: "Male"/"Female"),
                   age (int), employment_status (chr: "Employed"/
                   "Unemployed"/"Not in labor force"), day_type (chr:
                   "Weekday"/"Weekend/Holiday"), weight (dbl).

    activities   4,880,021 rows — one row per activity per respondent.
                   Columns: tucaseid (chr), activity_code (int: 6-digit
                   packed integer), duration_min (int), start_hhmm (int:
                   packed HHMM, e.g., 1430 = 2:30 PM).

    activity_codes  426 rows — lookup table. Columns: activity_code (int),
                   major_code (int), major_name (chr), sub_code (int),
                   sub_name (chr), detail_code (int).

  Activity code structure: 6-digit packed integer.
    activity_code %/% 10000        → major category (01–18, plus 50 =
                                     "Data Codes", the survey's bucket for
                                     unclassifiable/missing answers)
    (activity_code %/% 100) %% 100 → sub-category
    activity_code %% 100           → detailed activity
  Example: 120303 = Leisure (12) > TV and Movies (03) > Watching TV (03)

  Source: US Bureau of Labor Statistics. American Time Use Survey, 2003–2024.
  https://www.bls.gov/tus/database.htm
  License: Public domain (US federal government data).

  Raw inputs (atusact, atusresp, atuscps zip files + activity lexicon PDF)
  downloaded from the BLS database page above. Build script reads the CSV
  files entirely inside DuckDB's native engine to avoid holding large data
  frames in R memory; the lexicon PDF is parsed with pdftotext to build the
  major/sub-category lookup tables.

  Build script: dataset-search/explorations/atus/build-duckdb.R
