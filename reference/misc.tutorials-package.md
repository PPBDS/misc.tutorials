# Miscellaneous Tutorials

The misc.tutorials package provides interactive tutorials in two main
categories: R for Data Science fundamentals and US Census data analysis.
The R for Data Science tutorials are based on [*R for Data Science
(2e)*](https://r4ds.hadley.nz/) by Hadley Wickham, Mine
Çetinkaya-Rundel, and Garrett Grolemund. The Census tutorial draws from
[*Analyzing US Census Data: Methods, Maps, and Models in
R*](https://walker-data.com/census-r/) by Kyle Walker.

## Details

A collection of interactive tutorials covering R for Data Science
essentials and US Census data analysis. This package makes extensive use
of the tools in the tutorial.helpers package.

## R for Data Science Tutorials

The package includes five r4ds tutorials (r4ds-1 through r4ds-5). The
organization differs from the book: each tutorial begins by sourcing
data from a different sort of storage technology and then working with
that data.

- **r4ds-1**: Data import, visualization, transformation, and tidying
  (delimited files)

- **r4ds-2**: Spreadsheets, layers, exploratory data analysis, and
  communication

- **r4ds-3**: Databases, logical vectors, numbers, strings, and regular
  expressions

- **r4ds-4**: Arrow, factors, dates and times, missing values, and joins

- **r4ds-5**: Hierarchical data, web scraping, functions, and iteration

## Census Data Tutorial

The census tutorial covers working with US Census data using the
tidycensus package, walking through case studies on income, educational
attainment, and median age, including choropleth maps drawn with
ggplot2.

## Running Tutorials

To run a tutorial, use:
`learnr::run_tutorial(name = "short_tutorial_name", package = "misc.tutorials")`

Available tutorial names are: r4ds-1, r4ds-2, r4ds-3, r4ds-4, r4ds-5,
and census.

## See also

Useful links:

- <https://ppbds.github.io/misc.tutorials/>

- <https://github.com/PPBDS/misc.tutorials>

- Report bugs at <https://github.com/PPBDS/misc.tutorials/issues>

## Author

**Maintainer**: David Kane <dave.kane@gmail.com>
([ORCID](https://orcid.org/0000-0002-6660-3934)) \[copyright holder\]
