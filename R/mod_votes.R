#' votes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_votes_ui <- function(id) {
  ns <- NS(id)
  tagList(
    DT::DTOutput(ns("votes_table"))
  )
}
    
#' votes Server Functions
#'
#' @noRd 
mod_votes_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$votes_table <- DT::renderDT({
      shinipsum::random_DT(nrow = 10, ncol = 5, type = "random")
    })
  })
}
    
## To be copied in the UI
# mod_votes_ui("votes_1")
    
## To be copied in the server
# mod_votes_server("votes_1")
