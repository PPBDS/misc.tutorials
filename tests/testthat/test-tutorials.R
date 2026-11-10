test_that("tutorials can be found", {
  expect_gt(nrow(learnr2::available_tutorials(package = "misc.tutorials")), 0)
})

test_that("every tutorial passes learnr2's checks and renders", {
  testthat::skip_on_cran() # Rendering every tutorial needs Quarto and takes minutes.
  expect_no_error(learnr2::check_tutorials(
    "misc.tutorials",
    render = !is.null(quarto::quarto_path())
  ))
})
