#' votes_time UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import plotly
#' @importFrom shiny NS tagList 
mod_votes_time_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    plotly::plotlyOutput(ns("votes_time_plot"))
  )
}
    
#' votes_time Server Functions
#'
#' @noRd 
mod_votes_time_server <- function(id, vote_df){
 shiny::moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$votes_time_plot <- plotly::renderPlotly({
      vote_time_plot <- vote_df %>%
        dplyr::mutate(date = as.Date(date)) %>%
        dplyr::count(date) |>
        ggplot2::ggplot(aes(x = date, y = n, text = glue::glue("data: {date}<br>votes: {n}"))) +
        ggplot2::geom_col(fill = "#780000", width = 1.5) +
        ggplot2::scale_x_date(date_breaks = "month") +
        ggplot2::theme_minimal() +
        ggplot2::labs(title = "Number of votes per day", y = "ilosć głosowań", x = NULL) +
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90),
            panel.grid = ggplot2::element_blank(),
            panel.grid.major.x = ggplot2::element_line(color = "grey80", linetype = "dashed"))

      plotly::ggplotly(vote_time_plot, tooltip = "text") %>%
        plotly::layout(
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
