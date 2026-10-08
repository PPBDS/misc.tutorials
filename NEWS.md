# misc.tutorials (development version)

* Rebuilt every tutorial on **learnr2**, which renders each one to a static
  Quarto page whose code runs in the browser via WebR. **learnr2** is the
  package's only tutorial dependency (it also supplies `show_file()`), and the
  tests and CI render tutorials with `learnr2::check_tutorial()` and
  `learnr2::render_tutorials()`. Plot exercises now ask for a screenshot of
  the rendered plot instead of the code that drew it.

# misc.tutorials 0.0.1

* Initial release.

* Contains the R for Data Science tutorials (`r4ds-1` through `r4ds-5`) and the
  `census` tutorial, migrated from the `vscode.tutorials` package.
