#' votes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import plotly
#' @import reactable
mod_votes_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    reactable::reactableOutput(ns("votes_table"))
  )
}
    
#' votes Server Functions
#'
#' @noRd 
mod_votes_server <- function(id, vote_df){
  shiny::moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$votes_table <- reactable::renderReactable({
      

 bar_chart <- function(label, width = "100%", height = "1rem", fill = "#00bfc4", background = NULL) {
              bar <- htmltools::div(style = list(background = fill, width = width, height = height, transition = "width 0.6s ease"))
              chart <- htmltools::div(style = list(flexGrow = 1, marginLeft = "0.5rem", background = background), bar)
              htmltools::div(style = list(display = "flex", alignItems = "center"), label, chart)
            }
      
      vote_df |>
        dplyr::select(date, title, topic, yes, abstain, no) |>
        reactable::reactable(
          columns = list(
            yes = reactable::colDef(name = "yes votes", align = "left", cell = function(value) {
              width <- paste0(value / max(vote_df$yes) * 100, "%")
              bar_chart(value, width = width, fill = "#0081a7")
            }),
            abstain = reactable::colDef(name = "abstain votes", align = "left", cell = function(value) {
              width <- paste0(value / max(vote_df$abstain) * 100, "%")
              bar_chart(value, width = width, fill = "#8d99ae")}),
            no = reactable::colDef(name = "no votes", align = "left", cell = function(value) {
              width <- paste0(value / max(vote_df$no) * 100, "%")
              bar_chart(value, width = width, fill = "#780000")
            })
            
      ),
      filterable = TRUE)
    })
  })
}
    
## To be copied in the UI
# mod_votes_ui("votes_1")
    
## To be copied in the server
# mod_votes_server("votes_1")
