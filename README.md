
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
#> [1] "2025-06-11 10:39:31 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ──────────────────────────────────────────────────────────────────────────────────────────────── sejm 0.0.0.9000 ────
#> Duration: 20.3s
#> 
#> ❯ checking for future file timestamps ... NOTE
#>   unable to verify current time
#> 
#> ❯ checking top-level files ... NOTE
#>   Non-standard file/directory found at top level:
#>     'scratch'
#> 
#> ❯ checking R code for possible problems ... NOTE
#>   get_bil_groups: no visible global function definition for 'request'
#>   get_bil_groups: no visible global function definition for
#>     'resp_body_json'
#>   get_bil_groups: no visible global function definition for 'req_perform'
#>   get_bil_groups: no visible global function definition for
#>     'req_user_agent'
#>   get_bil_groups: no visible global function definition for
#>     'req_url_path_append'
#>   get_bil_groups_members: no visible global function definition for
#>     'request'
#>   get_bil_groups_members: no visible global function definition for
#>     'pull'
#>   get_bil_groups_members: no visible binding for global variable 'id'
#>   get_bil_groups_members: no visible global function definition for
#>     'map_dfr'
#>   get_bil_groups_members : <anonymous>: no visible global function
#>     definition for 'bind_rows'
#>   get_bil_groups_members : <anonymous>: no visible global function
#>     definition for 'resp_body_json'
#>   get_bil_groups_members : <anonymous>: no visible global function
#>     definition for 'req_perform'
#>   get_bil_groups_members : <anonymous>: no visible global function
#>     definition for 'req_user_agent'
#>   get_bil_groups_members : <anonymous>: no visible global function
#>     definition for 'req_url_path_append'
#>   get_comittees: no visible global function definition for 'request'
#>   get_comittees: no visible global function definition for
#>     'resp_body_json'
#>   get_comittees: no visible global function definition for 'req_perform'
#>   get_comittees: no visible global function definition for
#>     'req_user_agent'
#>   get_comittees: no visible global function definition for
#>     'req_url_path_append'
#>   get_interpellations: no visible global function definition for
#>     'request'
#>   get_interpellations: no visible global function definition for
#>     'resp_body_json'
#>   get_interpellations: no visible global function definition for
#>     'req_perform'
#>   get_interpellations: no visible global function definition for
#>     'req_user_agent'
#>   get_interpellations: no visible global function definition for
#>     'req_url_path_append'
#>   get_legislation: no visible global function definition for 'request'
#>   get_legislation: no visible global function definition for
#>     'resp_body_json'
#>   get_legislation: no visible global function definition for
#>     'req_perform'
#>   get_legislation: no visible global function definition for
#>     'req_user_agent'
#>   get_legislation: no visible global function definition for
#>     'req_url_path_append'
#>   get_mp_votes: no visible global function definition for 'request'
#>   get_mp_votes: no visible global function definition for 'pull'
#>   get_mp_votes: no visible binding for global variable 'votingNumber'
#>   get_mp_votes: no visible global function definition for 'map2_dfr'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'bind_rows'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'pluck'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'resp_body_json'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'req_perform'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'req_user_agent'
#>   get_mp_votes : <anonymous>: no visible global function definition for
#>     'req_url_path_append'
#>   get_mps: no visible global function definition for 'request'
#>   get_mps: no visible global function definition for 'resp_body_json'
#>   get_mps: no visible global function definition for 'req_perform'
#>   get_mps: no visible global function definition for 'req_user_agent'
#>   get_mps: no visible global function definition for
#>     'req_url_path_append'
#>   get_parties: no visible global function definition for 'request'
#>   get_parties: no visible global function definition for 'resp_body_json'
#>   get_parties: no visible global function definition for 'req_perform'
#>   get_parties: no visible global function definition for 'req_user_agent'
#>   get_parties: no visible global function definition for
#>     'req_url_path_append'
#>   get_proceedings: no visible global function definition for 'request'
#>   get_proceedings: no visible global function definition for
#>     'resp_body_json'
#>   get_proceedings: no visible global function definition for
#>     'req_perform'
#>   get_proceedings: no visible global function definition for
#>     'req_user_agent'
#>   get_proceedings: no visible global function definition for
#>     'req_url_path_append'
#>   get_questions: no visible global function definition for 'request'
#>   get_questions: no visible global function definition for
#>     'resp_body_json'
#>   get_questions: no visible global function definition for 'req_perform'
#>   get_questions: no visible global function definition for
#>     'req_user_agent'
#>   get_questions: no visible global function definition for
#>     'req_url_path_append'
#>   get_votes: no visible global function definition for 'request'
#>   get_votes: no visible global function definition for 'pull'
#>   get_votes: no visible global function definition for 'get_proceeding'
#>   get_votes: no visible binding for global variable 'number'
#>   get_votes: no visible global function definition for 'map_dfr'
#>   get_votes : <anonymous>: no visible global function definition for
#>     'bind_rows'
#>   get_votes : <anonymous>: no visible global function definition for
#>     'resp_body_json'
#>   get_votes : <anonymous>: no visible global function definition for
#>     'req_perform'
#>   get_votes : <anonymous>: no visible global function definition for
#>     'req_user_agent'
#>   get_votes : <anonymous>: no visible global function definition for
#>     'req_url_path_append'
#>   Undefined global functions or variables:
#>     bind_rows get_proceeding id map2_dfr map_dfr number pluck pull
#>     req_perform req_url_path_append req_user_agent request resp_body_json
#>     votingNumber
#> 
#> 0 errors ✔ | 0 warnings ✔ | 3 notes ✖
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
