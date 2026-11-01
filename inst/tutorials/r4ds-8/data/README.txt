prediction-markets tutorial data: Arrow / Parquet

Split out of the r4ds-4 tutorial in August 2026, when the prediction-market
half became its own tutorial. The crypto files stayed with r4ds-4.

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

Source: Manifold Markets public API (https://api.manifold.markets/v0)
Vintage: Resolved binary markets, Sep 2025 – May 2026; built 2026-06-10
Reuse: Public API data used for educational/non-commercial analysis. Use is
  subject to Manifold's Terms of Service; current API docs prohibit scraping
  outside the API, circumventing rate limits, and commercial AI/ML training on
  API data without a separate data license.

Preparation: acquire.py fetched markets + bets via Manifold API with beforeTime
  pagination; build-parquet.R converted ms timestamps to ISO-8601 strings,
  built daily probability series from raw bets via forward-fill, assembled the
  junction table, and filtered groups to >= 5 markets.

Key signal: MAE declines monotonically from 0.398 (90+ days out) to 0.090
  (final day) -- prediction markets are 4x more accurate near their deadline.
