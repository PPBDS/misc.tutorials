This directory holds stable source copies of data files used by tutorials.
Each tutorial subdirectory has its own README describing its data files and
their provenance:

  r4ds-1/   Delimited files (CSV)    — music.csv
  r4ds-2/   Spreadsheets (Excel)     — us_births_1994_2014.xlsx, nba_recruits.xlsx
  r4ds-3/   Databases (DuckDB)       — nameby_year.duckdb, nycflights13.duckdb,
                                        seda_2025.duckdb, atus.duckdb
  r4ds-4/   Arrow / Parquet          — daily_prices.parquet, coin_metadata.parquet,
                                        categories.parquet
  r4ds-5/   Spatial / web            — earthquakes.geojson, imdb_snapshots.rds
  census/   Web API cache            — income_tx.rds, edu_ca.rds, age_ca.rds

Student exercises download files via GitHub raw URLs into the student's own
data/ directory; the tutorials' own test chunks read them with a relative path
from the tutorial folder, e.g.:

  read_excel("../../extdata/r4ds-2/us_births_1994_2014.xlsx")

The file-per-tutorial manifest lives in R/zzz.R, which re-downloads any missing
files on package load (needed for the CRAN build, which ships without them).

---

r4ds-4/daily_prices.parquet
r4ds-4/coin_metadata.parquet
r4ds-4/categories.parquet
  Crypto market composition data from Coin Metrics Community Data.
  Daily price, market cap, and volume for 22 major cryptocurrencies, 2018-2026.
  Three parquet files: daily_prices (59,436 rows), coin_metadata (22 rows),
  categories (6 rows). Intentional messiness added for teaching.

    daily_prices    59,436 rows — one row per coin per day (2018-01-01 through
                    2026-05-23). Columns: date_raw (chr, uniform "YYYY-MM-DD"),
                    coin_id (chr, Coin Metrics ticker e.g. "btc"), price_usd
                    (dbl), market_cap_usd (dbl, clean numeric), market_cap_str
                    (chr, formatted e.g. "$1.24T"; ~5% missing — intentional),
                    volume_usd (dbl).
                    NOTE: category_id is NOT in this file — students must join
                    to coin_metadata to get it.

    coin_metadata   22 rows — one row per coin. Columns: coin_id (chr, join key),
                    coin_name (chr), symbol (chr; stablecoins lowercase,
                    others uppercase — intentional), category_id (chr, join key
                    for categories), launch_date (chr; mixed "January 3, 2009"
                    mdy and "2015-07-30" ymd formats — intentional), consensus
                    (chr; inconsistent caps: "Proof of Work", "proof-of-work",
                    "POW" — intentional; NAs for stablecoins/DeFi), description
                    (chr; btc/eth/doge have embedded \n — intentional).

    categories      6 rows — one row per category. Columns: category_id (chr),
                    category_name (chr), era_introduced (chr), description (chr).
                    Categories: bitcoin, smart-contract-platform, stablecoin,
                    defi, meme-coin, exchange-token.

  Source: Coin Metrics Community Data (https://github.com/coinmetrics/data)
  License: CC BY 4.0
  Acquired: 2026-06-10

  Built from raw Coin Metrics GitHub CSVs using
  explorations/crypto-markets/acquire.py (acquisition) and
  explorations/crypto-markets/build-parquet.R (transformation and parquet
  writing). Intentional messiness was added in build-parquet.R for teaching.

r4ds-5/imdb_snapshots.rds
  IMDb Top 250 panel data from five Wayback Machine snapshots (2015–2022).
  1 table / 1,250 rows.

    imdb_snapshots  1,250 rows — one row per film per snapshot year. Columns:
                    snap_year (dbl: 2015, 2017, 2019, 2021, 2022), rank (int:
                    1–250), title (chr), year (int, film release year), rating
                    (dbl, IMDb weighted average), number (dbl, raw vote count).

  Source: Wayback Machine snapshots of https://www.imdb.com/chart/top/
  Scraped dates: January 1 of 2015, 2017, 2019, 2021; February 1, 2022.
  License: Public use (Wayback Machine; educational scraping).
  Archive index: https://web.archive.org/web/*/https://www.imdb.com/chart/top/

  Built using explorations/imdb-wayback/explore.R in the dataset-search project.
  Key steps: request() + resp_body_html() -> html_element("table") -> html_table()
  + html_elements("td strong") -> html_attr("title") -> separate_wider_regex() ->
  str_extract() for vote counts -> purrr::map2() across 5 URLs -> list_rbind().
