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
