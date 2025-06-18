#' committees UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_committees_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' committees Server Functions
#'
#' @noRd 
mod_committees_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_committees_ui("committees_1")
    
## To be copied in the server
# mod_committees_server("committees_1")
