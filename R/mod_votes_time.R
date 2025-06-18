#' votes_time UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_votes_time_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' votes_time Server Functions
#'
#' @noRd 
mod_votes_time_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_votes_time_ui("votes_time_1")
    
## To be copied in the server
# mod_votes_time_server("votes_time_1")
