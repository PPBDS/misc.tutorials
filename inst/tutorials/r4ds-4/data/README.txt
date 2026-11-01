nba-recruits tutorial data: Spreadsheets (Excel)

nba_recruits.xlsx
  Top-ranked high school basketball recruits (1998–2013 draft classes) and
  their NBA career outcomes. Recruit rankings from 247Sports; career stats
  from Basketball-Reference. Collected by The Pudding for their 2019
  analysis "How Many High School Stars Actually Make It in the NBA?"
  Raw source: https://github.com/the-pudding/data/tree/master/hype
  Article: https://pudding.cool/2019/03/hype/

  Generated from explorations/nba-hype/outputs/players_prepared.rds
  in the dataset-search project:

  library(dplyr)
  library(writexl)

  players <- readRDS(
    "~/Desktop/projects/dataset-search/explorations/nba-hype/outputs/players_prepared.rds"
  )

  nba_recruits <- players |>
    select(name, rank, recruit_year, college, drafted,
           recruit_group, nba_mean_ws48, top_mean_wa,
           total_seasons, tier)

  dir.create("inst/tutorials/nba-recruits/data", recursive = TRUE,
             showWarnings = FALSE)
  writexl::write_xlsx(nba_recruits,
    "inst/tutorials/nba-recruits/data/nba_recruits.xlsx")

  The file was first written to inst/tutorials/r4ds-2/data/ and moved here
  unchanged when the basketball section became its own tutorial.
