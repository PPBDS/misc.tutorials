
<!-- README.md is generated from README.Rmd. Edit ONLY this file if you need to make a change in README.md. But, after you edit it, you run `rmarkdown::render("README.Rmd")` in order to create the new README.md, which is the thing which is actually used. Must be a better way of doing this! -->

# Miscellaneous Tutorials

<!-- badges: start -->

[![R build
status](https://github.com/PPBDS/misc.tutorials/workflows/R-CMD-check/badge.svg)](https://github.com/PPBDS/misc.tutorials/actions)
<!-- badges: end -->

Package website: <https://ppbds.github.io/misc.tutorials/>

## About this package

**misc.tutorials** is a collection of interactive tutorials covering *R
for Data Science* essentials and US Census data analysis. Makes
extensive use of the tools in the
**[tutorial.helpers](https://ppbds.github.io/tutorial.helpers/)**
package.

## Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
remotes::install_github("PPBDS/misc.tutorials")
```

## Tutorials

The recommended way to launch the tutorials is with the [R Tutorials
extension for VS
Code](https://open-vsx.org/extension/PPBDS/vscode-r-tutorials), which
lists every installed tutorial and lets you start one with a click.

As a backup, you can launch a tutorial from the R console with
`learnr::run_tutorial()`, providing the short name of the tutorial and
the package name.

    learnr::run_tutorial(name = "r4ds-1",
                         package = "misc.tutorials")

### R for Data Science

These tutorials cover material from [*R for Data Science
(2e)*](https://r4ds.hadley.nz/) (R4DS) by Hadley Wickham, Mine
Çetinkaya-Rundel, and Garrett Grolemund. There are five related
tutorials in the package: `r4ds-1`, `r4ds-2`, `r4ds-3`, `r4ds-4`, and
`r4ds-5`. Different tutorials cover different chapters from the book as
follows.

#### r4ds-1

Data import Data visualization Data transformations Data tidying

#### r4ds-2

Spreadsheets Layers Exploratory data analysis Communication

#### r4ds-3

Databases Logical vectors Numbers Strings Regular expressions

#### r4ds-4

Arrow Factors Dates and times Missing values Joins

#### r4ds-5

Hierarchical-data Web scraping Functions Iterations

The organization of the tutorials is not the same as the organization of
R4DS. Instead, each tutorial begins by sourcing data from a different
sort of storage technology and then working with that data.

### Analyzing US Census Data

We have one tutorial, `census`, covering material from [*Analyzing US
Census Data: Methods, Maps, and Models in
R*](https://walker-data.com/census-r/index.html) by Kyle Walker.
