#' sejm_members UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @import ggplot2
#' @importFrom shiny NS tagList 
#' @importFrom shinipsum random_ggplotly
#' @importFrom plotly renderPlotly plotlyOutput

mod_sejm_members_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("members_plot"))
  )
}
    
#' sejm_members Server Functions
#'
#' @noRd 
mod_sejm_members_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$members_plot <- plotly::renderPlotly({
      shinipsum::random_ggplotly(type = "point")
    })
  })
}
    
## To be copied in the UI
# mod_sejm_members_ui("sejm_members_1")
    
## To be copied in the server
# mod_sejm_members_server("sejm_members_1")
