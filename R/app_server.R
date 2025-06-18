#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_sejm_members_server("member_plot")
  mod_sejm_activity_server("sejm_act")
  mod_committees_server("committees_1")
  mod_groups_server("groups_plot")
  mod_votes_server("votes_1")
  mod_votes_time_server("votes_time_1")
  mod_votes_mps_server("votes_mps_1")


}
