#' get all committees for a given term
#' 
#' 
#' @param term the parliament term
#' 
#' @import httr2
#' 
#' @returns A data frame with all committees in a given parliament term

get_comittees <- function(term= 10) {
  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  req |>
    req_url_path_append("committees") |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)
}