#' get members of bilateral groups
#' 
#' 
#' @param term the parliament term
#' @param group_id the id (or ids as a vector) of the bilateral group. If left to NULL will get data for all bilateral groups 
#' @returns A data frame with members of bilateral groups


get_bil_groups_members <- function(term = 10, group_id = NULL) {

  req_url <- paste0("https://api.sejm.gov.pl/sejm/term", term, "/")
  req <- request(req_url)


  if(is.null(group_id)) {
    group_id <- get_bil_groups(term = term) |> pull(id)
  }
  
  map_dfr(group_id, \(x) bind_rows(req |>
    req_url_path_append(paste0("bilateralGroups/", x)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)))

}