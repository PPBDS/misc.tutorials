r4ds-1 tutorial data: Delimited files (CSV)

billboard.csv
  The `billboard` dataset from the tidyr package: Billboard Hot 100 rankings
  for the songs that appeared on the chart in 2000, one row per song, with
  the artist, the track, the date the song entered the chart, and its rank
  in each of the following 76 weeks (wk1-wk76; NA once the song has left
  the chart). 317 rows x 79 columns. Written with
  readr::write_csv(tidyr::billboard, "inst/tutorials/r4ds-1/data/billboard.csv").
