#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  df_mps <- get_mps()
  vote_df <- get_votes()

  mod_sejm_members_server("member_plot", df_mps)
  mod_sejm_activity_server("sejm_act", df_mps)
  mod_committees_server("committees_1")
  mod_groups_server("groups_plot")
  mod_votes_server("votes_1", vote_df)
  mod_votes_time_server("votes_time_1", vote_df)
  mod_votes_mps_server("votes_mps_1")


}
