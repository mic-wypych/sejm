
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{sejm}` <img src="man/figures/logo.png" align="right" width="120" >

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The package provides convenience functions to access Polish [sejm
API](https://api.sejm.gov.pl/sejm.html) and retrieve information on
parties, MPs, votes, interpellations, committees etc.

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
#> [1] "2025-06-13 11:38:50 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading sejm
#> ── R CMD check results ──────────────────────────────────────────── sejm 0.0.0.9000 ────
#> Duration: 6m 14.7s
#> 
#> ❯ checking tests ...
#>   See below...
#> 
#> ── Test failures ───────────────────────────────────────────────────────── testthat ────
#> 
#> > # This file is part of the standard setup for testthat.
#> > # It is recommended that you do not modify it.
#> > #
#> > # Where should you do additional test configuration?
#> > # Learn more about the roles of various files in:
#> > # * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
#> > # * https://testthat.r-lib.org/articles/special-files.html
#> > 
#> > library(testthat)
#> > library(sejm)
#> > 
#> > test_check("sejm")
#> Loading required package: shiny
#> [ FAIL 13 | WARN 0 | SKIP 1 | PASS 24 ]
#> 
#> ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
#> • rlang_is_interactive() is not TRUE (1): 'test-golem-recommended.R:72:5'
#> 
#> ══ Failed tests ════════════════════════════════════════════════════════════════
#> ── Failure ('test-get_bil_groups.R:10:3'): function works for various sejm terms ──
#> `d` is not an S3 object
#> ── Error ('test-get_bil_groups_members.R:8:3'): function works for various sejm terms ──
#> Error in `UseMethod("pull")`: no applicable method for 'pull' applied to an object of class "list"
#> Backtrace:
#>     ▆
#>  1. └─sejm::get_bil_groups_members(term = 2) at test-get_bil_groups_members.R:8:3
#>  2.   └─dplyr::pull(get_bil_groups(term = term), "id")
#> ── Error ('test-get_bil_groups_members.R:14:3'): function works for specific group_id ──
#> <purrr_error_indexed/rlang_error/error/condition>
#> Error in `map(.x, .f, ...)`: i In index: 1.
#> Caused by error in `resp_body_json()`:
#> ! Unexpected content type "NA".
#> * Expecting type "application/json" or suffix "json".
#> ── Error ('test-get_committees.R:2:3'): test that result is a dataframe ────────
#> Error in `get_committees()`: could not find function "get_committees"
#> ── Error ('test-get_committees.R:8:3'): function works for various sejm terms ──
#> Error in `get_committees(term = 2)`: could not find function "get_committees"
#> ── Failure ('test-get_interpellations.R:10:3'): function works for various sejm terms ──
#> `d` is not an S3 object
#> ── Error ('test-get_mp_votes.R:8:3'): function works for various sejm terms ────
#> Error in `UseMethod("pull")`: no applicable method for 'pull' applied to an object of class "list"
#> Backtrace:
#>     ▆
#>  1. └─sejm::get_mp_votes(term = 2) at test-get_mp_votes.R:8:3
#>  2.   └─sejm::get_votes(term = term, proceeding = proceeding)
#>  3.     └─dplyr::pull(get_proceedings(term = term), "number")
#> ── Error ('test-get_mp_votes.R:20:3'): function works for various vote ids ─────
#> Error in `get_mp_votes(proceeding = 1, vote_id = 2)`: object 'sitting' not found
#> Backtrace:
#>     ▆
#>  1. └─sejm::get_mp_votes(proceeding = 1, vote_id = 2) at test-get_mp_votes.R:20:3
#>  2.   └─purrr::map2_dfr(...)
#>  3.     └─purrr::map2(.x, .y, .f, ...)
#>  4.       └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
#>  5.         └─purrr:::vctrs_vec_compat(.x, .purrr_user_env)
#> ── Failure ('test-get_mps.R:10:3'): function works for various sejm terms ──────
#> `d` is not an S3 object
#> ── Failure ('test-get_parties.R:10:3'): function works for various sejm terms ──
#> `d` is not an S3 object
#> ── Failure ('test-get_proceedings.R:10:3'): function works for various sejm terms ──
#> `d` is not an S3 object
#> ── Failure ('test-get_questions.R:10:3'): function works for various sejm terms ──
#> `d` is not an S3 object
#> ── Error ('test-get_votes.R:8:3'): function works for various sejm terms ───────
#> Error in `UseMethod("pull")`: no applicable method for 'pull' applied to an object of class "list"
#> Backtrace:
#>     ▆
#>  1. └─sejm::get_votes(term = 2) at test-get_votes.R:8:3
#>  2.   └─dplyr::pull(get_proceedings(term = term), "number")
#> 
#> [ FAIL 13 | WARN 0 | SKIP 1 | PASS 24 ]
#> Error: Test failures
#> Execution halted
#> 
#> 1 error ✖ | 0 warnings ✔ | 0 notes ✔
#> Error: R CMD check found ERRORs
```

``` r
covr::package_coverage()
#> Error: Failure in `C:/Users/wypyc/AppData/Local/Temp/Rtmp2leq72/R_LIBS48e02d3d1e7e/sejm/sejm-tests/testthat.Rout.fail`
#> terms ──
#> `d` is not an S3 object
#> ── Error ('test-get_votes.R:8:3'): function works for various sejm terms ───────
#> Error in `UseMethod("pull")`: no applicable method for 'pull' applied to an object of class "list"
#> Backtrace:
#>     ▆
#>  1. └─sejm::get_votes(term = 2) at test-get_votes.R:8:3
#>  2.   └─dplyr::pull(get_proceedings(term = term), "number")
#> 
#> [ FAIL 13 | WARN 0 | SKIP 1 | PASS 24 ]
#> Error: Test failures
#> Execution halted
```
