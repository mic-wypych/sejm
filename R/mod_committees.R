#' committees UI Function
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
mod_committees_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("committees_plot"))
  )
}
    
#' committees Server Functions
#'
#' @noRd 
mod_committees_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$committees_plot <- plotly::renderPlotly({
      shinipsum::random_ggplotly(type = "bar")
    })
  })
}
    
## To be copied in the UI
# mod_committees_ui("committees_1")
    
## To be copied in the server
# mod_committees_server("committees_1")
