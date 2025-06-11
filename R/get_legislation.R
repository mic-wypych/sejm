#get basic info on legislation

get_legislation <- function(term = 10, n = 50) {
  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", 10, "/")
  req <- request(req_url)

  t <- req |>
    req_url_path_append(paste0("processes?offset=0&limit=", n)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)
}