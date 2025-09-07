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
    plotly::plotlyOutput(ns("votes_time_plot"))
  )
}
    
#' votes_time Server Functions
#'
#' @noRd 
mod_votes_time_server <- function(id, vote_df){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$votes_time_plot <- plotly::renderPlotly({
      vote_time_plot <- vote_df %>%
        mutate(date = as.Date(date)) %>%
        count(date) |>
        ggplot(aes(x = date, y = n, text = glue("data: {date}<br>votes: {n}"))) +
        geom_col(fill = "#780000", width = 1.5) +
        scale_x_date(date_breaks = "month") +
        theme_minimal() +
        labs(title = "Number of votes per day", y = "ilosć głosowań", x = NULL) +
        theme(axis.text.x = element_text(angle = 90),
            panel.grid = element_blank(),
            panel.grid.major.x = element_line(color = "grey80", linetype = "dashed"))

      ggplotly(vote_time_plot, tooltip = "text") %>%
        layout(
          hoverlabel = list(
            bgcolor = "white", 
            bordercolor = "black", 
            font = list(family = "Arial", size = 12)
          ),
          legend = list(orientation = "h", y = -0.1)
        )
    })
  })
}
    
## To be copied in the UI
# mod_votes_time_ui("votes_time_1")
    
## To be copied in the server
# mod_votes_time_server("votes_time_1")
