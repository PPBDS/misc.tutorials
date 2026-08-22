r4ds-4 tutorial data: Arrow / Parquet (crypto markets)

daily_prices.parquet
coin_metadata.parquet
categories.parquet
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
