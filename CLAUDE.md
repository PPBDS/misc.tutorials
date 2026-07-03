# CLAUDE.md — misc.tutorials

`misc.tutorials` is an R package of **"normal" (post-infrastructure) learnr tutorials**. It is governed by the base tutorial guide and adds only what is specific to this package below.

## Base tutorial guide (read this first)

These tutorials inherit the **base tutorial guide** — the default contract for authoring any normal data science tutorial in this ecosystem, at `claude-md/tutorials/CLAUDE.md` in the [PPBDS/ai-rules](https://github.com/PPBDS/ai-rules) repo (locally: [`../ai-rules/claude-md/tutorials/CLAUDE.md`](../ai-rules/claude-md/tutorials/CLAUDE.md)). **Read it before working on any tutorial here.** It is the source of truth for everything common to all such tutorials:

- the AI-era philosophy — students create artifacts by prompting an AI agent, not by typing code into learnr exercise chunks;
- the workflow — student work lives in `analysis.qmd`; they render with `quarto render` in a bash terminal and view the result via **Live Server**;
- exercise rhythm, the `question_text()` question types, knowledge-drop discipline, CP/CR and `show_file()` evidence;
- `echo = FALSE`, test-chunk discipline, code-chunk labeling, the setup-chunk skeleton, data handling, and formatting conventions.

`misc.tutorials` is one of the packages the base guide governs by default — it is **not** an exception (those are `vscode.tutorials` and `tutorial.helpers`).

**Precedence.** On workflow and shared conventions, the base guide wins. On `misc.tutorials`-specific content this file wins. Any departure from the base guide must be an **explicit, on-the-record override** stated here — never a silent difference. (The base guide already carries the *Choosing topics (misc.tutorials-specific)* section; this file does not repeat it.)

**Override — no interpretation exercises.** The base guide (§4, *Analysis path*) requires a dedicated interpretation exercise after each significant visualization, asking students to write one or two sentences about what the plot shows. `misc.tutorials` does **not** follow this rule. The tutorials here are structured around AI-assisted artifact creation; students steer the analysis and judge the output, but are not asked to write prose interpretations in the QMD. Knowledge drops carry the interpretive commentary instead. Do not add interpretation exercises to any tutorial in this package.

## What this package is

A collection of tutorials covering material from two companion texts:

- **[R for Data Science (2e)](https://r4ds.hadley.nz/)** — the `r4ds-1` … `r4ds-5` tutorials.
- **[Analyzing US Census Data](https://walker-data.com/census-r/)** by Kyle Walker — the `census` tutorial.

**The organizing theme is storage technology.** Each tutorial sources its data from a different sort of storage — delimited files, spreadsheets, databases, Arrow files, spatial formats, and web APIs — and then works with that data using the **[tidyverse](https://www.tidyverse.org/)**. The storage technology is the spine of each tutorial; the subject-area domain (music, births/basketball, baby names/flights, crypto/prediction markets, wildfires/film rankings, census demographics) is chosen to suit it.

The division of the R for Data Science material into five tutorials (`r4ds-1` … `r4ds-5`) is reasonable but **arbitrary** — the same material could be split into more or fewer. Treat the count as a convenience, not a fixed boundary, when deciding whether to split a long tutorial (see `TODO.txt` on `r4ds-4`) or merge two short ones.

## Per-tutorial map

| Tutorial | Storage technology | Key packages | Data |
|----------|--------------------|--------------|------|
| `r4ds-1` | Delimited files (CSV) | readr, maps | `music.csv` |
| `r4ds-2` | Spreadsheets | readxl | `us_births_1994_2014.xlsx`, `nba_recruits.xlsx` |
| `r4ds-3` | Databases | DBI, dbplyr, duckdb, nycflights13, babynames | `*.duckdb` |
| `r4ds-4` | Arrow / Parquet | arrow, viridis | `*.parquet` |
| `r4ds-5` | Spatial / web | jsonlite, leaflet, purrr, httr2, rvest | `wildfires.geojson`, `imdb_snapshots.rds` |
| `census` | Web API | tidycensus, sf | `*.rds` |
| `baseball` | R data package (Lahman) | Lahman, tidyverse | `Lahman::Teams`, `Lahman::Batting`, `Lahman::People` |

## Project tutorials (`baseball` and later)

`baseball` is the first of a newer tier of tutorials (topics like baseball, stocks, Bitcoin, weather, US maps) whose distinguishing feature is that **the final artifact is a *project* — not a single published `analysis.qmd` page.** A "project" is any multi-file Quarto/R artifact a student creates and publishes: a simple multi-page **website** (baseball's form), but equally a **Shiny app**, a **Quarto dashboard**, or similar. Students are assumed to have done the `vscode.tutorials` material for whichever project type a tutorial uses, so the project *mechanics* are not re-taught. The following base-guide defaults are written for the single-page model and are **overridden on the record** for this tier (the first three are general to every project type; the fourth is specific to the website form `baseball` uses):

- **A project, not `analysis.qmd`.** The student builds a multi-file project with its own config (e.g. `_quarto.yml`) and a natural place for each topic, rather than one evolving `analysis.qmd`. The base guide's "one evolving working chunk per topic" maps onto "one unit of the project per topic" — for a website, **one page per topic** (`home-runs.qmd`, `sluggers.qmd`); for a dashboard, one card/section; for Shiny, one view. Site/app-wide settings like `execute: echo: false` go in the project config once, not in each file's YAML.
- **Students write AI-drafted prose as project content.** The TODO asks that students add text to the project; they draft framing/landing prose with AI and submit it via `show_file()` on the relevant file. **This is not the forbidden interpretation exercise.** The *no-interpretation-exercises* override still holds: we never ask a student to write graded prose explaining what a plot shows. Writing the project's framing copy is **artifact-content creation** — words the project genuinely needs — and our shown answer is a model paragraph of that copy. Keep prose tasks to framing, not per-plot interpretation.
- **Topic-driven, not a new storage technology.** Per the TODO ("tutorials now are about concepts, not books"), this tier is organized around a **domain plus its gold-standard R data infrastructure**, and need not introduce an unused storage technology. `baseball` does not: its "storage" is simply the **Lahman** R data package. The storage-spine framing in *What this package is* applies to the `r4ds-*`/`census` tutorials; for this tier the spine relaxes to "domain + canonical data source." Still teach the data ecosystem in knowledge drops (for baseball: Lahman as the season-level gold standard, with Retrosheet/Statcast/**baseballr** as the finer-grained frontier).
- **Website form (baseball's project type).** A Quarto *website*: `_quarto.yml` + `index.qmd` + one analysis page per topic. Render the whole site with bare `quarto render`; open `_site/index.html` with Live Server (output lives in `_site/`). `.gitignore` ignores `/_site/`, `/.quarto/`, `/*_files/`, and (after the caching arc) `/*_cache/`. A page's `#| cache: true` chunk creates a top-level `<page>_cache/` directory — same caching arc as the base guide, on a per-page chunk. The Summary publishes the **whole project** with `quarto publish gh-pages` (no filename) and its final evidence is `show_file("index.qmd")`. Other project types will have their own analogous specifics (a dashboard's `_quarto.yml` `format: dashboard`, a Shiny app's `app.R`/`shinyapps.io` deploy); record them here as they are built.

## Choosing topics

This is `misc.tutorials`' content model — how it picks each tutorial's subject. The base guide routes topic selection to each project; this is the routed section. Other projects' models differ (the Primer fixes its topics as the four Cardinal Virtues), so this lives here, not in the base guide.

Tutorials are organized around **storage technologies** (the spine — see above) paired with prominent data sources and real data science domains: US Census data, baseball, stock data, Bitcoin, and other subject areas where students learn what analysts actually use. When adding a tutorial, pick a storage technology not yet covered (or a meaningfully different facet of one), choose a domain that suits it, and follow the base guide's structure.

Each tutorial should teach:

- The gold-standard data sources for that area.
- The main R packages, APIs, file formats, and vocabulary students should mention to AI.
- Common data patterns, data quality issues, and standard analytical questions in that domain.
- A reproducible workflow that ends with a small published Quarto artifact.

**Prefer datasets that hide a discoverable anomaly.** The best data here is rich enough that a simple analysis looks fine but misses something, leaves clues that something is off, and rewards a further step — usually a plot — that reveals and then explains the mystery. The `r4ds-1` Billboard data is the exemplar: only the time-series plot of each song's weekly ranking exposes the strange discontinuity around week 20. Actively search for more datasets with this feature when choosing topics; it generally means reaching for **richer / larger** datasets rather than small, clean ones. (See the base guide's *Analysis path* for how to build the discovery into the exercise sequence. Other data choices for these tutorials are still under discussion.)

## Data handling — package specifics

**A tutorial's data lives in a `data/` directory inside that tutorial's own folder** — `inst/tutorials/<name>/data/<file>`, sitting next to `tutorial.Rmd` and at the same level as the `images/` directory (if there is one). This is now the **base-guide default** (§6, *Data handling*); the rationale — the package's own code becomes identical to the student's code — lives there. This section records the `misc.tutorials`-specific mechanics and the in-progress migration off the old `inst/extdata/` layout:

- **The package's setup and test chunks read data with the exact relative path a student writes:** `read_csv("data/music.csv")`, not `../../extdata/r4ds-1/music.csv`. Both resolve to `data/<file>` because a tutorial knits with its own folder as the working directory, and the student's `analysis.qmd` sits in a repo with its own `data/`. Our answer chunks and the student's prompts now match exactly — the old cosmetic `extdata` vs `data/` mismatch is gone.
- **Student-facing download URLs point at the same in-tutorial location on GitHub:** `.../raw/refs/heads/main/inst/tutorials/<name>/data/<file>`. Students download into their own project's `data/` directory and read `data/<file>`.
- **Each `data/` directory carries a `README.txt`** documenting the provenance of its files. These provenance notes are kept in the repo but **not installed** with the package: `.Rbuildignore` holds the rule `^inst/tutorials/[^/]+/data/README\.txt$`, which strips the READMEs from the build while the data files themselves still ship.
- **`inst/extdata/` is retired for tutorial data.** New tutorials put nothing there. Existing `r4ds-*`/`census` tutorials still read from `../../extdata/<tutorial>/` and must be migrated: move each file to `inst/tutorials/<tutorial>/data/`, change the answer/test-chunk paths to `data/<file>`, and repoint the student download URL. Once a tutorial is migrated it no longer needs a `R/zzz.R` manifest entry.

New work should add data under `inst/tutorials/<name>/data/`, reference it as `data/<file>`, and point the student download URL at `.../inst/tutorials/<name>/data/<file>`.

**Consequence — CRAN.** Because the data now ships *inside* `inst/tutorials/`, it cannot be stripped at build time the way `inst/extdata/` was, so the package will exceed CRAN's size limit and is effectively **not CRAN-distributable** — an accepted trade-off (see `TODO.txt`: *"we can't put the repo on CRAN. But who really cares?"*). The `R/zzz.R` `data_manifest`/`.onAttach()` re-download hook and the commented `.Rbuildignore` `extdata` rule exist only to serve the old CRAN-stripping scheme; both become vestigial and should be removed once every tutorial is migrated off `extdata`.

**Exception — tutorials whose data is an R package.** When a tutorial's data ships *inside an R package* (e.g. `baseball` uses **Lahman**), there is no file to host: students `install.packages()` and `library()` the package, and the tutorial's test chunks reference the package's tables directly (`Teams`, `Batting`, `People`). Such a tutorial has **no `data/` directory, no download step, and no `R/zzz.R` manifest entry** — just add the package to `DESCRIPTION` `Suggests`. This is more honest about how analysts in that domain actually work (loading the canonical data package) and is the default for the project tier where it applies. (`baseball` already follows this, so it needs no migration.)

## CRAN / build size

The tutorial data files are large (duckdb, parquet, and geojson run into multiple MB each; the package is ~48 MB on disk). Under the new `data/`-in-tutorial convention the package **ships its data and is not CRAN-distributable** (see *Data handling* above) — a trade-off we accept in exchange for the package's code matching the student's code.

The old CRAN-stripping machinery is being retired as tutorials migrate off `extdata`:

- The `.Rbuildignore` `# ^inst/extdata/[^/]+/` rule (uncommented at CRAN build time to strip `inst/extdata/<tutorial>/`) and the `R/zzz.R` `data_manifest`/`.onAttach()` re-download hook only served the strip-and-re-download scheme. Remove both once no tutorial reads from `extdata`.
- Until migration is complete, tutorials still using `extdata` keep relying on that hook, so leave it in place for them.

The test chunks that depend on data files `skip_on_cran()` (see `tests/testthat/test-tutorials.R`); that stays regardless, since the point is simply not to run heavy data code on CRAN's checkers.

## DESCRIPTION

Per the base guide, every package `library()`-ed in a tutorial must be listed in `DESCRIPTION` (`Imports` or `Suggests`) or GitHub Actions `R CMD check` fails. This package keeps only `tutorial.helpers` and `utils` under `Imports`; every tutorial-specific package (arrow, DBI, duckdb, readxl, sf, tidycensus, leaflet, plotly, …) lives under `Suggests`. When a new tutorial adds a library, add it to `Suggests`.

## Checking

Standard base-guide checks apply (`rmarkdown::render()` for a quick syntax pass, `devtools::check()` before any PR, `learnr::run_tutorial()` for the student view). `devtools::check()` may report a size NOTE — see *CRAN / build size* above.

## Open items

Active TODOs live in [`TODO.txt`](TODO.txt) (data set selection, workflow questions, display options, and new-tutorial ideas). Consult it before starting non-trivial work, and keep it current.
