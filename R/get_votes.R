#' get information on votes per proceeding
#' 
#' 
#' @param term the parliament term
#' @param proceeding specific proceeding to pull votes for. Will get all proceedings if left to NULL
#' 
#' @import httr2
#' @importFrom purrr map_dfr
#' @importFrom dplyr bind_rows pull
#' 
#' @returns A data frame with all interpellations


get_votes <- function(term = 10, proceeding = NULL) {

  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  if(is.null(proceeding)) {
    proceeding <- get_proceedings(term = term) |> pull("number")
  }
  
  map_dfr(proceeding, \(x) bind_rows(req |>
    req_url_path_append(paste0("votings/", x)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)))

}