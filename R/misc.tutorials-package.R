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
#' @section Antigravity:
#' The antigravity tutorial comes first. It signs the student in to the
#' Antigravity CLI and uses it for a few small jobs before the data-science
#' tutorials begin.
#'
#' @section R for Data Science Tutorials:
#' The family has ten tutorials, listed here in the order the R Tutorials
#' extension shows them. The organization differs from the book: each tutorial
#' begins by sourcing data from a different sort of storage technology and then
#' works with that data.
#' \itemize{
#'   \item \strong{r4ds-1}: Billboard Hot 100 from a CSV file (data import, data tidying, layers)
#'   \item \strong{r4ds-2}: a Million Song Dataset sample from a CSV file (data import, missing values, exploratory data analysis)
#'   \item \strong{r4ds-3}: US births from a spreadsheet (spreadsheets, layers, exploratory data analysis, communication)
#'   \item \strong{r4ds-4}: NBA recruits from a spreadsheet (spreadsheets, factors, exploratory data analysis)
#'   \item \strong{r4ds-5}: school district test scores from a DuckDB database (databases, logical vectors, numbers)
#'   \item \strong{r4ds-6}: the American Time Use Survey from a DuckDB database (databases, dates and times, factors)
#'   \item \strong{r4ds-7}: cryptocurrency prices from Parquet files (Arrow, joins, dates and times)
#'   \item \strong{r4ds-8}: Manifold prediction markets from Parquet files (Arrow, joins, dates and times)
#'   \item \strong{r4ds-9}: wildfire perimeters from GeoJSON (hierarchical data, layers)
#'   \item \strong{r4ds-10}: IMDb Top 250 snapshots scraped from the Wayback Machine (web scraping, functions, iteration)
#' }
#'
#' @section Census Data Tutorial:
#' Two tutorials cover US Census data with the tidycensus package:
#' \strong{census-1} maps median household income across Texas counties, and
#' the margin of error behind it, with choropleth maps drawn with ggplot2;
#' \strong{census-2} charts educational attainment by state and median age by
#' California county.
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
#' Available tutorial names are: antigravity, r4ds-1 through r4ds-10, census-1, census-2,
#' baseball, ducks, sharks, and movies.
#'
#' @importFrom learnr2 show_file
#'
#' @keywords internal
"_PACKAGE"
