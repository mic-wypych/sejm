#' get information how MPs voted in particular votes
#' 
#' 
#' @param term the parliament term
#' @param proceeding specific proceeding to pull votes from. Will get all proceedings if left to NULL
#' @param vote_id specific id of a vote to pull how each MP voted. Will get all votes if left to NULL
#' @returns A data frame with information how each MP voted in given votes

get_mp_votes <- function(term = 10, proceeding = NULL, vote_id = NULL) {
  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)

  if(is.null(vote_id)) {
    votes <- get_votes(term = term, proceeding = proceeding)
    vote_id <- votes |>
      pull(votingNumber)
    sitting <- votes |>
      pull(sitting)
  }

  map2_dfr(sitting, vote_id, \(x, y) bind_rows(req |>
    req_url_path_append(paste0("votings/", x, "/", y)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE) |>
    pluck("votes")))

}