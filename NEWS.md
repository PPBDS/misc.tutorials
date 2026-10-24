# misc.tutorials (development version)

* Editorial pass over every tutorial: prose has almost no semicolons and
  filler sentences are gone. No exercise asked for two pastes, so none were
  split. The repo line no longer says "You may need to restart this tutorial
  after you do so," which was a learnr artifact.

* Every code block now says what it is: commands carry their language
  (`r`, `bash`, `yaml`), text to type that is in no language (commit
  messages, `.gitignore` lines, download URLs) is `default`, and transcripts
  and the answers shown after Continue are `{.output}`, which renders lighter
  and without a copy button. The 376 bare fences are gone, so
  `learnr2::check_tutorial()` runs clean.

* Every screenshot question is image-only (`allow_text = FALSE`), and the
  first one in each tutorial says how to take a screenshot and paste it.
  Needs the learnr2 that ships `allow_text`.

* The R for Data Science material is now ten tutorials instead of five. Each
  two-topic tutorial was split in two, keeping its first topic and spinning
  the second out under a topic name: `r4ds-1` (Billboard) and `music`,
  `r4ds-2` (US births) and `nba-recruits`, `r4ds-3` (school districts) and
  `time-use`, `r4ds-5` (wildfires) and `imdb-rankings`. With
  `prediction-markets` (split from `r4ds-4` in August) the family runs 18–25
  exercises per tutorial, and the VS Code list shows each spin-out directly
  after its parent (`ordering` 1–10), followed by `census`, `baseball`,
  `ducks`, `sharks`, and `movies`.

* `spiderman` is retired; its Spider-Man comparison is now the closing topic
  of `movies`.

* `ducks` and `sharks` are rebuilt on the multi-page website form that
  `baseball` introduced, and every tutorial now follows the three-exercise
  caching arc exactly once. `census` and `baseball` were shortened as well;
  every tutorial now runs 18–28 exercises.

* Package-wide clean-up: every question carries a complete plain-text copy of
  its prompt; faked listings include the `AGENTS.md` that every fresh repo
  contains; faked `git log` and `quarto publish` transcripts match their real
  shape; knowledge drops are trimmed to two sentences about the data or the
  output; retired AI-tool recommendations are replaced by "Use AI however you
  like."; stale `quarto preview` instructions and maintainer comments are
  gone.

* `r4ds-1` ships `billboard.csv` (a copy of `tidyr::billboard`) instead of
  loading the data from a package; `r4ds-3` and `time-use` have students
  gitignore their `.duckdb` files; `sharks` no longer ships `attacks.csv` or
  `attacks.rds`.

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
