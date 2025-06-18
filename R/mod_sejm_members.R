#' sejm_members UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sejm_members_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' sejm_members Server Functions
#'
#' @noRd 
mod_sejm_members_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sejm_members_ui("sejm_members_1")
    
## To be copied in the server
# mod_sejm_members_server("sejm_members_1")
