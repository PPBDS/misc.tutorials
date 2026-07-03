This directory is retired.

Tutorial data no longer lives here. Every tutorial now keeps its data in a
data/ directory inside the tutorial folder (inst/tutorials/<name>/data/<file>),
read from the tutorial with the same relative path a student uses (data/<file>),
and served to students from that same location on GitHub
(.../raw/refs/heads/main/inst/tutorials/<name>/data/<file>). Each data/ dir
carries its own README.txt describing provenance (those READMEs are kept in the
repo but stripped from the installed package via .Rbuildignore).

The old scheme kept stable source copies under inst/extdata/<tutorial>/ and
re-downloaded them on package load via R/zzz.R for the CRAN build. That machinery
(the R/zzz.R data_manifest/.onAttach hook and the commented inst/extdata rule in
.Rbuildignore) is now inert and can be removed. This file and directory can be
deleted once that cleanup happens.
