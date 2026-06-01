#' Miscellaneous Tutorials
#'
#' A collection of interactive tutorials covering R for Data Science essentials
#' and US Census data analysis. This package makes extensive use of the tools in
#' the tutorial.helpers package.
#'
#' @description
#' The misc.tutorials package provides interactive tutorials in two main
#' categories: R for Data Science fundamentals and US Census data analysis. The
#' R for Data Science tutorials are based on
#' \href{https://r4ds.hadley.nz/}{\emph{R for Data Science (2e)}} by Hadley Wickham,
#' Mine Çetinkaya-Rundel, and Garrett Grolemund. The Census tutorial draws from
#' \href{https://walker-data.com/census-r/}{\emph{Analyzing US Census Data: Methods, Maps, and Models in R}}
#' by Kyle Walker.
#'
#' @section R for Data Science Tutorials:
#' The package includes five r4ds tutorials (r4ds-1 through r4ds-5). The
#' organization differs from the book: each tutorial begins by sourcing data from
#' a different sort of storage technology and then working with that data.
#' \itemize{
#'   \item \strong{r4ds-1}: Data import, visualization, transformation, and tidying (delimited files)
#'   \item \strong{r4ds-2}: Spreadsheets, layers, exploratory data analysis, and communication
#'   \item \strong{r4ds-3}: Databases, logical vectors, numbers, strings, and regular expressions
#'   \item \strong{r4ds-4}: Arrow, factors, dates and times, missing values, and joins
#'   \item \strong{r4ds-5}: Hierarchical data, web scraping, functions, and iteration
#' }
#'
#' @section Census Data Tutorial:
#' The census tutorial covers working with US Census data using the tidycensus
#' package, walking through case studies on income, educational attainment, and
#' median age, including choropleth maps drawn with ggplot2.
#'
#' @section Running Tutorials:
#' To run a tutorial, use:
#' \code{learnr::run_tutorial(name = "short_tutorial_name", package = "misc.tutorials")}
#'
#' Available tutorial names are: r4ds-1, r4ds-2, r4ds-3, r4ds-4, r4ds-5, and
#' census.
#'
#' @importFrom tutorial.helpers show_file
#' @importFrom utils download.file
#'
#' @keywords internal
"_PACKAGE"
