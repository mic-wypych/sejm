
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{sejm}` <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

THe package provides convenience functions to access Polish sejm API and
retrieve information on parties, MPs, votes, interpellations, committees
etc.

It also provides a shiny app to interactively browse information on
Polish sejm.

## Installation

You can install the development version of `{sejm}` like so:

``` r
remotes::install_github("mic-wypych/sejm")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo mic-wypych/sejm@HEAD
#> Warning in untar2(tarfile, files, list, exdir, restore_times): skipping pax
#> global extended headers
#> Warning in untar2(tarfile, files, list, exdir, restore_times): skipping pax
#> global extended headers
#> rlang      (1.1.5  -> 1.1.6 ) [CRAN]
#> cli        (3.6.4  -> 3.6.5 ) [CRAN]
#> fs         (1.6.5  -> 1.6.6 ) [CRAN]
#> sass       (0.4.9  -> 0.4.10) [CRAN]
#> mime       (0.12   -> 0.13  ) [CRAN]
#> jsonlite   (1.9.1  -> 2.0.0 ) [CRAN]
#> later      (1.4.1  -> 1.4.2 ) [CRAN]
#> promises   (1.3.2  -> 1.3.3 ) [CRAN]
#> commonmark (1.9.2  -> 1.9.5 ) [CRAN]
#> httpuv     (1.6.15 -> 1.6.16) [CRAN]
#> Installing 10 packages: rlang, cli, fs, sass, mime, jsonlite, later, promises, commonmark, httpuv
#> Installing packages into 'C:/Users/wypyc/AppData/Local/R/cache/R/renv/library/sejm-a1bee6da/windows/R-4.4/x86_64-w64-mingw32'
#> (as 'lib' is unspecified)
#> package 'rlang' successfully unpacked and MD5 sums checked
#> package 'cli' successfully unpacked and MD5 sums checked
#> package 'fs' successfully unpacked and MD5 sums checked
#> package 'sass' successfully unpacked and MD5 sums checked
#> package 'mime' successfully unpacked and MD5 sums checked
#> package 'jsonlite' successfully unpacked and MD5 sums checked
#> package 'later' successfully unpacked and MD5 sums checked
#> package 'promises' successfully unpacked and MD5 sums checked
#> package 'commonmark' successfully unpacked and MD5 sums checked
#> package 'httpuv' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\wypyc\AppData\Local\Temp\Rtmpy6unpQ\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────────────────
#>       ✔  checking for file 'C:\Users\wypyc\AppData\Local\Temp\Rtmpy6unpQ\remotes5b3c61586604\mic-wypych-sejm-0cc26a7/DESCRIPTION' (469ms)
#>       ─  preparing 'sejm':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts (422ms)
#>   ─  checking for empty or unneeded directories
#>      Omitted 'LazyData' from DESCRIPTION
#>       ─  building 'sejm_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/wypyc/AppData/Local/R/cache/R/renv/library/sejm-a1bee6da/windows/R-4.4/x86_64-w64-mingw32'
#> (as 'lib' is unspecified)
```

## Run

You can launch the application by running:

``` r
sejm::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2025-06-09 21:08:24 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ──────────────────────────────────────────────── sejm 0.0.0.9000 ────
#> Duration: 34.4s
#> 
#> ❯ checking for future file timestamps ... NOTE
#>   unable to verify current time
#> 
#> 0 errors ✔ | 0 warnings ✔ | 1 note ✖
```

``` r
covr::package_coverage()
#> sejm Coverage: 68.57%
#> R/run_app.R: 0.00%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
```
