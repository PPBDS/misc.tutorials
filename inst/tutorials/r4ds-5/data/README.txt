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
