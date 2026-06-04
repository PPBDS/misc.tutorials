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

## What this package is

A collection of tutorials covering material from two companion texts:

- **[R for Data Science (2e)](https://r4ds.hadley.nz/)** — the `r4ds-1` … `r4ds-5` tutorials.
- **[Analyzing US Census Data](https://walker-data.com/census-r/)** by Kyle Walker — the `census` tutorial.

**The organizing theme is storage technology.** Each tutorial sources its data from a different sort of storage — delimited files, spreadsheets, databases, Arrow files, spatial formats, and web APIs — and then works with that data using the **[tidyverse](https://www.tidyverse.org/)**. The storage technology is the spine of each tutorial; the subject-area domain (music, cheese/wine, baby names/flights, FIFA/NBA, earthquakes, census demographics) is chosen to suit it.

The division of the R for Data Science material into five tutorials (`r4ds-1` … `r4ds-5`) is reasonable but **arbitrary** — the same material could be split into more or fewer. Treat the count as a convenience, not a fixed boundary, when deciding whether to split a long tutorial (see `TODO.txt` on `r4ds-4`) or merge two short ones.

## Per-tutorial map

| Tutorial | Storage technology | Key packages | Data |
|----------|--------------------|--------------|------|
| `r4ds-1` | Delimited files (CSV) | readr, maps | `music.csv` |
| `r4ds-2` | Spreadsheets | readxl | `cheeses.xlsx`, `wine.xlsx` |
| `r4ds-3` | Databases | DBI, dbplyr, duckdb, nycflights13, babynames | `*.duckdb` |
| `r4ds-4` | Arrow / Parquet | arrow, plotly, scales, viridis | `*.parquet` |
| `r4ds-5` | Spatial / web | sf-style GeoJSON, leaflet, ggrepel, httr2, rvest | `earthquakes.geojson` |
| `census` | Web API | tidycensus, sf | `*.rds` |

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

The base guide prefers stable source copies under `inst/extdata/<tutorial>/` and says to avoid `inst/tutorials/<name>/data/` for new tutorials unless there is a learnr runtime reason. The current state of this package, migrated from `vscode.tutorials`, is mixed and **should converge toward the base-guide convention**:

- **`r4ds-1` follows the guide**: its test chunk reads `../../extdata/r4ds-1/music.csv` (from `inst/extdata/r4ds-1/`), and the student-facing download URL points at the same file on GitHub.
- **`r4ds-2` … `r4ds-5` and `census` do not (yet)**: their test chunks read from a local `data/` directory via relative paths (`read_excel("data/wine.xlsx")`, `open_dataset("data/game.parquet")`, `read_rds("data/age_ca.rds")`). These resolve because a tutorial knits with its own folder as the working directory.

New work should add data under `inst/extdata/<tutorial>/` and reference it as `../../extdata/<tutorial>/<file>`, matching `r4ds-1`. Treat the local-`data/` tutorials as legacy to migrate, not a pattern to copy.

## CRAN / build size

The tutorial data files are large (duckdb, parquet, and geojson run into multiple MB each; the package is ~48 MB on disk). The `.Rbuildignore` keeps a **commented-out** rule —

```
# ^inst/tutorials/.*/data(/.*)?$
```

— that is uncommented only when building a tarball for CRAN, to strip the `data/` directories. `R CMD check` will still report the package as large because it measures the unpacked source, not the compressed `.tar.gz` that CRAN actually evaluates; the size NOTE from that is expected. (See `TODO.txt` for the open question about why `.Rbuildignore` doesn't seem to shrink the checked size.)

The test chunks that depend on these data directories `skip_on_cran()` for the same reason (see `tests/testthat/test-tutorials.R`).

## DESCRIPTION

Per the base guide, every package `library()`-ed in a tutorial must be listed in `DESCRIPTION` (`Imports` or `Suggests`) or GitHub Actions `R CMD check` fails. This package keeps only `tutorial.helpers` and `utils` under `Imports`; every tutorial-specific package (arrow, DBI, duckdb, readxl, sf, tidycensus, leaflet, plotly, …) lives under `Suggests`. When a new tutorial adds a library, add it to `Suggests`.

## Checking

Standard base-guide checks apply (`rmarkdown::render()` for a quick syntax pass, `devtools::check()` before any PR, `learnr::run_tutorial()` for the student view). `devtools::check()` may report a size NOTE — see *CRAN / build size* above.

## Open items

Active TODOs live in [`TODO.txt`](TODO.txt) (authoring conventions, the `r4ds-4` `case_when()` coercion warning, `r4ds-4` length / `r4ds-5` compile time, display options, and new-tutorial ideas). Consult it before starting non-trivial work, and keep it current.
