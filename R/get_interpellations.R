#' get all MP interpellations for a given term
#' 
#' 
#' @param term the parliament term
#' 
#' @import httr2
#' 
#' @returns A data frame with all interpellations

get_interpellations <- function(term = 10) {
  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  req |>
    req_url_path_append("interpellations") |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)
}