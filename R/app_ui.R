#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bslib
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    bslib::page_navbar(
      title = "Polski Sejm",
      bslib::nav_spacer(),
      bslib::nav_panel(
        "Posłowie",
        bslib::navset_card_underline(
          title = "Członkowie sejmu",
          bslib::nav_panel("Skład sejmu", mod_sejm_members_ui("member_plot")),
          bslib::nav_panel("Aktywność posłów", mod_sejm_activity_ui("sejm_act"))
        )
      ),
      bslib::nav_panel(
        "Komisje",
        bslib::navset_card_underline(
          title = "Członkowie sejmu",
          bslib::nav_panel("komisje sejmowe", mod_committees_ui("committees_1")),
          bslib::nav_panel("Grupy bilateralne", mod_groups_ui("groups_plot"))
        )
      ),
      bslib::nav_panel(
        "Głosowania",
        bslib::navset_card_underline(
          title = "Głosowania w sejmie",
          bslib::nav_panel("Głosowania", mod_votes_ui("votes_1")),
          bslib::nav_panel("Głosowania w czasie", mod_votes_time_ui("votes_time_1")),
          bslib::nav_panel("Głosowania posłów", mod_votes_mps_ui("votes_mps_1"))
        )
      )
      
      
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "sejm"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
