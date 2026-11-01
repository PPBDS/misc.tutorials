time-use tutorial data: Databases (DuckDB)

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
