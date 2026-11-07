# misc.tutorials (development version)

* `antigravity` arrives from `vscode.tutorials`, shortened to a sign-in-and-try-it
  tutorial at ordering 1. Every other tutorial's ordering moves up by one.

* The R4DS family now has a deliberate pacing gradient. `r4ds-1` and `r4ds-2`
  open with four slow Introduction exercises, the lowercase-name warning and
  a spelled-out `download.file()`. `r4ds-3` and `r4ds-4` keep the standard
  three-exercise Introduction. From `r4ds-5` on the Introduction is two
  exercises: one creates the repo, `analysis.qmd`, `.gitignore` and the
  libraries chunk, the other the `data/` directory.

* Three tutorials now teach the Codespace itself, a recorded departure from
  the base guide's environment-neutral rule. In `r4ds-5` the student
  downloads the data file to their own computer and drags or pastes it into
  the Codespace. In `r4ds-6` three exercises tour `/workspaces` with `pwd`,
  `ls ..`, `ls -a` and `cd`. In `r4ds-7` the student runs `connect-repo` a
  second time to make `r4ds-7-new`, switches folders with `File -> Open
  Folder...`, and then deletes the extra repo both locally and on GitHub. In
  `r4ds-8` two exercises review the picture with `ls /workspaces` and
  `git remote -v`.

* `census-1` is split in two. `census-1` keeps the Texas income map and adds two
  exercises on the margin of error: a table of the counties where it is
  largest relative to the estimate, and a second map of that share. The new
  `census-2` takes the state education chart and the California
  age scatterplot, with the scatterplot's log scale now a step of its own.
  They run 17 and 18 exercises instead of 28.

* The R4DS family is renumbered `r4ds-1` through `r4ds-10`, each spin-out in
  the slot after its parent: `music` is now `r4ds-2`, the old `r4ds-2`
  (births) is `r4ds-3`, `nba-recruits` is `r4ds-4`, the old `r4ds-3` (school
  districts) is `r4ds-5`, `time-use` is `r4ds-6`, the old `r4ds-4` (crypto) is
  `r4ds-7`, `prediction-markets` is `r4ds-8`, the old `r4ds-5` (wildfires) is
  `r4ds-9`, and `imdb-rankings` is `r4ds-10`. Titles follow ("R4DS 2" and so
  on), as do the repo names and download URLs inside each tutorial. The
  introductory scaffolding moved with the slots: `r4ds-2` now spells out the
  `data/` commands and the `download.file()` call, and `r4ds-3` (births) uses
  the goal-stated form like every later tutorial. Older entries below use the
  names current when they were written.

* The census tutorials' folders are `census-1` and `census-2` (formerly
  `census` and `demographics`), so their order is visible at a glance; their
  titles stay *Mapping Census Data* and *Census Demographics*. The list order
  is `r4ds-1` to `r4ds-10`, then `census-1` and `census-2`, then the topic
  tutorials.

* Every Summary now ends the same way. Its first exercise is a final render,
  commit and push, answered with the URL of `analysis.qmd` (or `index.qmd`)
  on GitHub; that link is the record of the whole file. The whole-file
  `show_file("analysis.qmd")` paste is gone: with no `chunk` argument,
  `show_file()` prints only the last chunk, so the whole-file answer shown
  after Continue never matched what students saw. The separate repo-URL
  exercise is gone too, since the file URL contains it.

* Every commit question asks for `git log --oneline -3`. The three census
  questions that accepted "a short note describing how you committed and
  pushed" now do too.

* No tutorial explains how to take a screenshot any more. That sentence
  belongs to the first three `vscode.tutorials`; every screenshot question
  here just asks for the screenshot.

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
  after its parent (`ordering` 1–10), followed by `census-1`, `baseball`,
  `ducks`, `sharks`, and `movies`.

* `spiderman` is retired; its Spider-Man comparison is now the closing topic
  of `movies`.

* `ducks` and `sharks` are rebuilt on the multi-page website form that
  `baseball` introduced, and every tutorial now follows the three-exercise
  caching arc exactly once. `census-1` and `baseball` were shortened as well;
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
