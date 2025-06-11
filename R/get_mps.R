#' get basic information on MPs in a given term
#' 
#' 
#' @param term the parliament term
#' @returns A data frame with all MPs for a given term



get_mps <- function(term = 10) {

  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)


  req |>
    req_url_path_append("MP") |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)

}