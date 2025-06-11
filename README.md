
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{sejm}` <img src="man/figures/logo.png" align="right" width="120" >

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The package provides convenience functions to access Polish sejm API and
retrieve information on parties, MPs, votes, interpellations, committees
etc.

It also provides a shiny app to interactively browse information on
Polish sejm.

## Installation

You can install the development version of `{sejm}` like so:

``` r
remotes::install_github("mic-wypych/sejm")
```

## Run

You can launch the application by running (note this is not operational
yet)

``` r
sejm::run_app()
```

## Accessing the Sejm API

All functions for accessing data from the Sejm API start with `get_`.
E.g. `get_parties()` will get basic data on the parties in Polish sejm
like their names, members count and contact info.

``` r
sejm::get_parties()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2025-06-11 12:04:49 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading sejm
#> ── R CMD check results ──────────────────────────────────── sejm 0.0.0.9000 ────
#> Duration: 27.2s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> sejm Coverage: 19.51%
#> R/get_bil_groups.R: 0.00%
#> R/get_bil_groups_members.R: 0.00%
#> R/get_committees.R: 0.00%
#> R/get_interpellations.R: 0.00%
#> R/get_legislation.R: 0.00%
#> R/get_mp_votes.R: 0.00%
#> R/get_mps.R: 0.00%
#> R/get_parties.R: 0.00%
#> R/get_proceedings.R: 0.00%
#> R/get_questions.R: 0.00%
#> R/get_votes.R: 0.00%
#> R/run_app.R: 0.00%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
```
