# The data files used by these tutorials (r4ds-1 through r4ds-5, census) are
# too large to include in the CRAN package. They live in inst/extdata/<tutorial>/
# (the stable source copies). When a tutorial is run via learnr::run_tutorial(),
# the working directory is the directory containing tutorial.Rmd, and the test
# chunks read the data with a relative path (see example in the manifest comment
# below). So the data files must exist
# in each tutorial's inst/extdata/<tutorial>/ subdirectory within the installed
# package.
#
# When installing from GitHub, inst/extdata/ is included and gets installed
# normally. But the CRAN version ships without these large files. The .onAttach()
# hook below checks for missing data files on package load and downloads them
# from GitHub directly into the installed package's extdata directory. This is
# safe because if a user has permission to install the package, they have
# permission to write into its directory. The manifest below must be updated
# whenever data files are added or removed from any tutorial. Test chunks read
# these files with a relative path, e.g.:
#   open_dataset("../../extdata/r4ds-4/daily_prices.parquet")

#' @importFrom utils download.file
NULL

data_manifest <- list(
  "r4ds-1" = c("music.csv"),
  "r4ds-2" = c("us_births_1994_2014.xlsx", "nba_recruits.xlsx"),
  "r4ds-3" = c("nameby_year.duckdb", "nycflights13.duckdb", "seda_2025.duckdb", "atus.duckdb"),
  "r4ds-4" = c("categories.parquet", "coin_metadata.parquet", "daily_prices.parquet",
               "markets.parquet", "history.parquet", "groups.parquet", "market_groups.parquet"),
  "r4ds-5" = c("imdb_snapshots.rds", "wildfires.geojson"),
  "census" = c("age_ca.rds", "edu_ca.rds", "income_tx.rds")
)

.onAttach <- function(libname, pkgname) {

  base_url <- "https://raw.githubusercontent.com/PPBDS/misc.tutorials/main/inst/extdata"
  files_downloaded <- character(0)

  # Installed package root; extdata/ lives directly under it.
  pkg_dir <- system.file(package = pkgname)
  if (!nzchar(pkg_dir)) return(invisible())

  for (tut in names(data_manifest)) {

    local_data_dir <- file.path(pkg_dir, "extdata", tut)

    # Check which files are missing
    if (dir.exists(local_data_dir)) {
      local_files <- list.files(local_data_dir)
      missing <- setdiff(data_manifest[[tut]], local_files)
    } else {
      missing <- data_manifest[[tut]]
    }

    if (length(missing) == 0) next

    # Create extdata directory if needed
    if (!dir.exists(local_data_dir)) {
      dir.create(local_data_dir, recursive = TRUE)
    }

    # Download missing files
    for (f in missing) {
      dest <- file.path(local_data_dir, f)
      result <- tryCatch({
        download.file(
          paste0(base_url, "/", tut, "/", f),
          dest,
          mode = "wb",
          quiet = TRUE
        )
        TRUE
      }, error = function(e) FALSE)

      if (result) {
        files_downloaded <- c(files_downloaded, file.path("extdata", tut, f))
      }
    }
  }

  # Only print if we downloaded something
  if (length(files_downloaded) > 0) {
    packageStartupMessage(
      "misc.tutorials: Downloaded ", length(files_downloaded), " data file(s):\n",
      paste0("  ", files_downloaded, collapse = "\n")
    )
  }
}
