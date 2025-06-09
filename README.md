
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{sejm}` <img src="man/figures/logo.png" align="right" width="120" >

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
#> Skipping install of 'sejm' from a github remote, the SHA1 (0cc26a7c) has not changed since last install.
#>   Use `force = TRUE` to force installation
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
#> [1] "2025-06-09 21:13:02 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ══════════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ───────────────────────────────────────── sejm 0.0.0.9000 ────
#> Duration: 33.5s
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
