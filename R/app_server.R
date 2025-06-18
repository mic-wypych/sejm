#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_sejm_members_server("member_plot")
  mod_sejm_activity_server("sejm_act")
}
