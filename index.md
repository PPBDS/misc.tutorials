# Miscellaneous Tutorials

Package website: <https://ppbds.github.io/misc.tutorials/>

## About this package

**misc.tutorials** is a collection of interactive tutorials covering *R
for Data Science* essentials, US Census data analysis, and a set of
topic tutorials (baseball, ducks, sharks, movies). Tutorials are built
with the **[learnr2](https://ppbds.github.io/learnr2/)** package and run
in the browser via Quarto and WebR.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r

pak::pak("PPBDS/misc.tutorials")
```

## Tutorials

The recommended way to launch the tutorials is with the [R Tutorials
extension for VS
Code](https://open-vsx.org/extension/PPBDS/vscode-r-tutorials), which
lists every installed tutorial and lets you start one with a click.

As a backup, you can launch a tutorial from the R console with
[`learnr2::run_tutorial()`](https://ppbds.github.io/learnr2/reference/run_tutorial.html),
providing the short name of the tutorial and the package name.

``` R
learnr2::run_tutorial(name = "r4ds-1",
                      package = "misc.tutorials")
```

### R for Data Science

These tutorials cover material from [*R for Data Science
(2e)*](https://r4ds.hadley.nz/) (R4DS) by Hadley Wickham, Mine
Çetinkaya-Rundel, and Garrett Grolemund. There are ten related
tutorials, listed here in the order the R Tutorials extension shows
them. Each begins by sourcing data from a different sort of storage
technology and then works with that data, so the organization of the
tutorials is not the same as the organization of R4DS. The chapters each
tutorial draws on are listed below.

| Tutorial | Data | R4DS chapters |
|----|----|----|
| `r4ds-1` | Billboard Hot 100 (CSV) | Data import; Data tidying; Layers |
| `r4ds-2` | US births (spreadsheet) | Spreadsheets; Layers; Exploratory data analysis; Communication |
| `music` | Million Song Dataset sample (CSV) | Data import; Missing values; Exploratory data analysis |
| `nba-recruits` | NBA recruits (spreadsheet) | Spreadsheets; Factors; Exploratory data analysis |
| `r4ds-3` | School district test scores (DuckDB database) | Databases; Logical vectors; Numbers |
| `time-use` | American Time Use Survey (DuckDB database) | Databases; Dates and times; Factors |
| `r4ds-4` | Cryptocurrency prices (Parquet) | Arrow; Joins; Dates and times |
| `prediction-markets` | Manifold prediction markets (Parquet) | Arrow; Joins; Dates and times |
| `r4ds-5` | Wildfire perimeters (GeoJSON) | Hierarchical data; Layers |
| `imdb-rankings` | IMDb Top 250 snapshots (scraped HTML) | Web scraping; Functions; Iteration |

### Analyzing US Census Data

We have one tutorial, `census`, covering material from [*Analyzing US
Census Data: Methods, Maps, and Models in
R*](https://walker-data.com/census-r/index.html) by Kyle Walker.

### Topic tutorials

Four tutorials are organized around a subject rather than a book:
`baseball` (the Lahman database), `ducks` (GPS-tracked mallards),
`sharks` (the Global Shark Attack File), and `movies` (Rotten Tomatoes
scores). `baseball`, `ducks`, and `sharks` each build and publish a
small multi-page Quarto website; `movies` builds a single page.
