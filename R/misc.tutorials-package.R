#' Miscellaneous Tutorials
#'
#' A collection of interactive tutorials covering R for Data Science essentials,
#' US Census data analysis, and a set of topic tutorials. The tutorials are
#' built with the learnr2 package, which renders each one to a static page
#' whose code runs in the browser via WebR.
#'
#' @description
#' The misc.tutorials package provides interactive tutorials in three groups:
#' the R for Data Science family, a US Census data tutorial, and topic
#' tutorials organized around a subject rather than a book. The R for Data
#' Science tutorials are based on
#' \href{https://r4ds.hadley.nz/}{\emph{R for Data Science (2e)}} by Hadley Wickham,
#' Mine Çetinkaya-Rundel, and Garrett Grolemund. The Census tutorial draws from
#' \href{https://walker-data.com/census-r/}{\emph{Analyzing US Census Data: Methods, Maps, and Models in R}}
#' by Kyle Walker.
#'
#' @section R for Data Science Tutorials:
#' The family has ten tutorials, listed here in the order the R Tutorials
#' extension shows them. The organization differs from the book: each tutorial
#' begins by sourcing data from a different sort of storage technology and then
#' works with that data.
#' \itemize{
#'   \item \strong{r4ds-1}: Billboard Hot 100 from a CSV file (data import, data tidying, layers)
#'   \item \strong{r4ds-2}: US births from a spreadsheet (spreadsheets, layers, exploratory data analysis, communication)
#'   \item \strong{music}: a Million Song Dataset sample from a CSV file (data import, missing values, exploratory data analysis)
#'   \item \strong{nba-recruits}: NBA recruits from a spreadsheet (spreadsheets, factors, exploratory data analysis)
#'   \item \strong{r4ds-3}: school district test scores from a DuckDB database (databases, logical vectors, numbers)
#'   \item \strong{time-use}: the American Time Use Survey from a DuckDB database (databases, dates and times, factors)
#'   \item \strong{r4ds-4}: cryptocurrency prices from Parquet files (Arrow, joins, dates and times)
#'   \item \strong{prediction-markets}: Manifold prediction markets from Parquet files (Arrow, joins, dates and times)
#'   \item \strong{r4ds-5}: wildfire perimeters from GeoJSON (hierarchical data, layers)
#'   \item \strong{imdb-rankings}: IMDb Top 250 snapshots scraped from the Wayback Machine (web scraping, functions, iteration)
#' }
#'
#' @section Census Data Tutorial:
#' The census tutorial covers working with US Census data using the tidycensus
#' package, walking through case studies on income, educational attainment, and
#' median age, including choropleth maps drawn with ggplot2.
#'
#' @section Topic Tutorials:
#' Four tutorials are organized around a subject: \strong{baseball} (the
#' Lahman database), \strong{ducks} (GPS-tracked mallards), \strong{sharks}
#' (the Global Shark Attack File), and \strong{movies} (Rotten Tomatoes
#' scores). The first three each build and publish a small multi-page Quarto
#' website; movies builds a single page.
#'
#' @section Running Tutorials:
#' To run a tutorial, use:
#' \code{learnr2::run_tutorial(name = "short_tutorial_name", package = "misc.tutorials")}
#'
#' Available tutorial names are: r4ds-1, r4ds-2, music, nba-recruits, r4ds-3,
#' time-use, r4ds-4, prediction-markets, r4ds-5, imdb-rankings, census,
#' baseball, ducks, sharks, and movies.
#'
#' @importFrom learnr2 show_file
#'
#' @keywords internal
"_PACKAGE"
