# Miscellaneous Tutorials

The misc.tutorials package provides interactive tutorials in three
groups: the R for Data Science family, a US Census data tutorial, and
topic tutorials organized around a subject rather than a book. The R for
Data Science tutorials are based on [*R for Data Science
(2e)*](https://r4ds.hadley.nz/) by Hadley Wickham, Mine
Çetinkaya-Rundel, and Garrett Grolemund. The Census tutorial draws from
[*Analyzing US Census Data: Methods, Maps, and Models in
R*](https://walker-data.com/census-r/) by Kyle Walker.

## Details

A collection of interactive tutorials covering R for Data Science
essentials, US Census data analysis, and a set of topic tutorials. The
tutorials are built with the learnr2 package, which renders each one to
a static page whose code runs in the browser via WebR.

## R for Data Science Tutorials

The family has ten tutorials, listed here in the order the R Tutorials
extension shows them. The organization differs from the book: each
tutorial begins by sourcing data from a different sort of storage
technology and then works with that data.

- **r4ds-1**: Billboard Hot 100 from a CSV file (data import, data
  tidying, layers)

- **r4ds-2**: US births from a spreadsheet (spreadsheets, layers,
  exploratory data analysis, communication)

- **music**: a Million Song Dataset sample from a CSV file (data import,
  missing values, exploratory data analysis)

- **nba-recruits**: NBA recruits from a spreadsheet (spreadsheets,
  factors, exploratory data analysis)

- **r4ds-3**: school district test scores from a DuckDB database
  (databases, logical vectors, numbers)

- **time-use**: the American Time Use Survey from a DuckDB database
  (databases, dates and times, factors)

- **r4ds-4**: cryptocurrency prices from Parquet files (Arrow, joins,
  dates and times)

- **prediction-markets**: Manifold prediction markets from Parquet files
  (Arrow, joins, dates and times)

- **r4ds-5**: wildfire perimeters from GeoJSON (hierarchical data,
  layers)

- **imdb-rankings**: IMDb Top 250 snapshots scraped from the Wayback
  Machine (web scraping, functions, iteration)

## Census Data Tutorial

The census tutorial covers working with US Census data using the
tidycensus package, walking through case studies on income, educational
attainment, and median age, including choropleth maps drawn with
ggplot2.

## Topic Tutorials

Four tutorials are organized around a subject: **baseball** (the Lahman
database), **ducks** (GPS-tracked mallards), **sharks** (the Global
Shark Attack File), and **movies** (Rotten Tomatoes scores). The first
three each build and publish a small multi-page Quarto website; movies
builds a single page.

## Running Tutorials

To run a tutorial, use:
`learnr2::run_tutorial(name = "short_tutorial_name", package = "misc.tutorials")`

Available tutorial names are: r4ds-1, r4ds-2, music, nba-recruits,
r4ds-3, time-use, r4ds-4, prediction-markets, r4ds-5, imdb-rankings,
census, baseball, ducks, sharks, and movies.

## See also

Useful links:

- <https://ppbds.github.io/misc.tutorials/>

- <https://github.com/PPBDS/misc.tutorials>

- Report bugs at <https://github.com/PPBDS/misc.tutorials/issues>

## Author

**Maintainer**: David Kane <dave.kane@gmail.com>
([ORCID](https://orcid.org/0000-0002-6660-3934)) \[copyright holder\]
