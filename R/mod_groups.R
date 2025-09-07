#' groups UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_groups_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("groups_plot"))
  )
}
    
#' groups Server Functions
#'
#' @noRd 
mod_groups_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$groups_plot <- plotly::renderPlotly({
      shinipsum::random_ggplotly(type = "bar")
    })
  })
}
    
## To be copied in the UI
# mod_groups_ui("groups_1")
    
## To be copied in the server
# mod_groups_server("groups_1")
