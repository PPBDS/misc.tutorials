test_that("all tutorial data files are accessible on GitHub", {
  skip_on_cran()
  skip_if_offline("raw.githubusercontent.com")

  base_url <- "https://raw.githubusercontent.com/PPBDS/misc.tutorials/main/inst/extdata"

  for (tut in names(misc.tutorials:::data_manifest)) {
    for (f in misc.tutorials:::data_manifest[[tut]]) {
      url  <- paste(base_url, tut, f, sep = "/")
      resp <- httr2::request(url) |>
        httr2::req_method("HEAD") |>
        httr2::req_timeout(10) |>
        httr2::req_perform()
      expect_lt(httr2::resp_status(resp), 400L, label = paste0(tut, "/", f))
    }
  }
})
