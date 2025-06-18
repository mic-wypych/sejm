#' sejm_activity UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sejm_activity_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' sejm_activity Server Functions
#'
#' @noRd 
mod_sejm_activity_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sejm_activity_ui("sejm_activity_1")
    
## To be copied in the server
# mod_sejm_activity_server("sejm_activity_1")
