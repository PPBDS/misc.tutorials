r4ds-5 tutorial data: Spatial / web

earthquakes.geojson
  A snapshot of the USGS real-time earthquake feed
  (https://earthquake.usgs.gov/earthquakes/feed/) — GeoJSON with magnitude,
  location, depth, and timestamp per quake.

  WARNING — TIME-SENSITIVE DATA: The tutorial setup chunk filters to
  `datetime >= Sys.Date() - 365`. This file must be refreshed at least once
  per year or it will filter to zero rows and break the tutorial. There is
  currently no automated refresh process; the file must be manually
  re-downloaded from the USGS feed and recommitted. This fragility is a known
  issue and is one reason to consider replacing this dataset entirely.
