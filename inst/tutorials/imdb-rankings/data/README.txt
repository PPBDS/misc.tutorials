imdb-rankings tutorial data: Scraped HTML

imdb_snapshots.rds
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

  Moved here from inst/tutorials/r4ds-5/data/ in October 2026 when the movie
  rankings topic was split out of R4DS 5 into its own tutorial.
