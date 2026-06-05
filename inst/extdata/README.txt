This directory holds stable source copies of data files used by tutorials.
Each tutorial subdirectory has its own README describing its data files and
their provenance:

  r4ds-1/   Delimited files (CSV)    — music.csv
  r4ds-2/   Spreadsheets (Excel)     — us_births_1994_2014.xlsx, nba_recruits.xlsx
  r4ds-3/   Databases (DuckDB)       — nameby_year.duckdb, nycflights13.duckdb,
                                        seda_2025.duckdb, atus.duckdb
  r4ds-4/   Arrow / Parquet          — fifa.parquet, game.parquet, line_score.parquet
  r4ds-5/   Spatial / web            — earthquakes.geojson
  census/   Web API cache            — income_tx.rds, edu_ca.rds, age_ca.rds

Student exercises download files via GitHub raw URLs into the student's own
data/ directory; the tutorials' own test chunks read them with a relative path
from the tutorial folder, e.g.:

  read_excel("../../extdata/r4ds-2/us_births_1994_2014.xlsx")

The file-per-tutorial manifest lives in R/zzz.R, which re-downloads any missing
files on package load (needed for the CRAN build, which ships without them).
