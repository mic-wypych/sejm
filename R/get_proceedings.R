#' get proceedings pf polish sejm
#' 
#' 
#' @param term the parliament term
#' @returns A data frame with all proceedings for a given term


get_proceedings <- function(term = 10) {

  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  req |>
    req_url_path_append("proceedings") |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)

}