#get members of bilateral groups

get_bil_groups_members <- function(term = 10, group_id = NULL) {
  if(is.null(group_id)) {
    group_id <- get_bil_groups(term = term) |> pull(id)
  }
  
  map_dfr(group_id, \(x) bind_rows(req |>
    req_url_path_append(paste0("bilateralGroups/", x)) |>
    req_user_agent("sejm (https://github.com/mic-wypych/sejm)") |>
    req_perform() |>
    resp_body_json(simplifyVector = TRUE)))

}