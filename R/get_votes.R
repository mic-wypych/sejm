#gets information on votes per proceedings


get_votes <- function(term = 10, proceeding = NULL) {

  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  if(is.null(proceeding)) {
    proceeding <- get_proceeding(term = term) |> pull(number)
  }
  
  map_dfr(proceeding, \(x) bind_rows(req |>
    req_url_path_append(paste0("votings/", x)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)))

}