tutorial_paths <- function() {
  learnr2::available_tutorials(package = "misc.tutorials", type = "quarto")$path
}

test_that("tutorial paths can be found", {
  expect_true(length(tutorial_paths()) > 0)
})

test_that("tutorials pass learnr2's static checks", {
  expect_no_error(learnr2::check_tutorial(tutorial_paths()))
})

test_that("tutorials render", {
  testthat::skip_on_cran() # Needed because the data directories are not on CRAN.
  testthat::skip_if(is.null(quarto::quarto_path()), "Quarto is not installed")
  expect_no_error(learnr2::render_tutorials(tutorial_paths()))
})
