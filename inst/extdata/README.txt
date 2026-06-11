This directory holds stable source copies of data files used by tutorials.
Each tutorial subdirectory has its own README describing its data files and
their provenance:

  r4ds-1/   Delimited files (CSV)    — music.csv
  r4ds-2/   Spreadsheets (Excel)     — us_births_1994_2014.xlsx, nba_recruits.xlsx
  r4ds-3/   Databases (DuckDB)       — nameby_year.duckdb, nycflights13.duckdb,
                                        seda_2025.duckdb, atus.duckdb
  r4ds-4/   Arrow / Parquet          — daily_prices.parquet, coin_metadata.parquet,
                                        categories.parquet; markets.parquet,
                                        history.parquet, groups.parquet,
                                        market_groups.parquet
  r4ds-5/   Spatial / web            — earthquakes.geojson
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

prediction-markets dataset
--------------------------
Source:       Manifold Markets public API (https://api.manifold.markets/v0)
Vintage:      Resolved binary markets, Sep 2025 – May 2026; built 2026-06-10
License:      Manifold API is fully public; no stated restrictions on data reuse

markets.parquet         800 rows x 11 cols
  market_id             chr    Manifold internal market identifier
  question              chr    The market question text
  creator               chr    Username of the market creator
  created_at            chr    ISO-8601 UTC timestamp of market creation
  closed_at             chr    ISO-8601 UTC timestamp when betting closed
  resolved_at           chr    ISO-8601 UTC timestamp of resolution
  outcome               chr    "YES" or "NO"
  total_traders         int    Number of unique traders
  total_liquidity       dbl    Total liquidity added (Mana, play money)
  volume                dbl    Total trading volume (Mana, play money)
  group_slugs           chr    Semicolon-separated topic group slugs (may be empty)

history.parquet         43,694 rows x 3 cols
  market_id             chr    Foreign key to markets.parquet
  date                  date   Calendar date (UTC)
  probability           dbl    Crowd-implied YES probability at end of day (0-1)

groups.parquet          115 rows x 4 cols
  group_slug            chr    Manifold topic group slug identifier
  group_name            chr    Human-readable title (title-cased from slug)
  broad_category        fct    9-level factor: Politics, World/Geopolitics, ...
  market_count          int    Number of markets in this group (>= 5)

market_groups.parquet   2,820 rows x 2 cols
  market_id             chr    Foreign key to markets.parquet
  group_slug            chr    Foreign key to groups.parquet
  Note: junction table; each market appears once per group it belongs to.

Preparation: acquire.py fetched markets + bets via Manifold API with beforeTime
  pagination; build-parquet.R converted ms timestamps to ISO-8601 strings,
  built daily probability series from raw bets via forward-fill, assembled the
  junction table, and filtered groups to >= 5 markets.

Key signal: MAE declines monotonically from 0.398 (90+ days out) to 0.090
  (final day) -- prediction markets are 4x more accurate near their deadline.
