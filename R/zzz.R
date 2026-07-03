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

# Every tutorial's data now lives in inst/tutorials/<name>/data/ (shipped with
# the package), so nothing needs re-downloading on load: the manifest is empty
# and .onAttach() below is a no-op. This whole mechanism (the manifest, the
# .onAttach() hook, and the commented extdata rule in .Rbuildignore) is now
# vestigial and can be removed; it is left in place, inert, pending that cleanup.
data_manifest <- list()

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
