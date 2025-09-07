#' votes_mps UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_votes_mps_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("votes_mps_plot"))
  )
}
    
#' votes_mps Server Functions
#'
#' @noRd 
mod_votes_mps_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$votes_mps_plot <- plotly::renderPlotly({
      shinipsum::random_ggplotly(type = "ribbon")
    })
  })
}
    
## To be copied in the UI
# mod_votes_mps_ui("votes_mps_1")
    
## To be copied in the server
# mod_votes_mps_server("votes_mps_1")
