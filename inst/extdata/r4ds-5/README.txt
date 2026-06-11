r4ds-5 tutorial data: Spatial / web

wildfires.geojson
  Finalized wildfire perimeter polygons from the NIFC
  InterAgencyFirePerimeterHistory All Years View dataset, contributed by USFS,
  NPS, BLM, BIA, CAL FIRE, Alaska Interagency Fire Center, and WFIGS.
  883 fires; western US (CA, OR, WA, ID, MT, NV, AZ, NM, CO, UT, WY);
  >= 10,000 acres; 1990-2023. 8 properties per feature: incident, gis_acres,
  fire_year, agency, state, map_method, date_current, unique_fire_id.
  Polygon geometry, WGS84, single ring per fire (largest ring kept, coordinates
  thinned 10x). 25 duplicate records removed (kept largest gis_acres per
  unique_fire_id group).

  NOTE: date_current is the date the perimeter record was last modified in the
  database, NOT the fire date. Use fire_year for temporal analysis.

  Source: NIFC ArcGIS REST API
    https://data-nifc.opendata.arcgis.com/datasets/nifc::interagencyfireperimeterhistory-all-years-view/about
  License: Public Domain (US federal open data)
  Acquired: 2026-06-10

  Built from the NIFC ArcGIS REST API using
  explorations/wildfire-perimeters/build-geojson.R in the dataset-search repo.

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
