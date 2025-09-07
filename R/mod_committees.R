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
      coms_members_df <- get_committees() |>
        unnest(members)

      waffle_df <- coms_members_df %>%
        group_by(name) %>%
        arrange(club, lastFirstName) %>%
        mutate(
          id = row_number(),        # unique ID per MP in committee
          row = (id - 1) %/% 10,    # 10 tiles per row
          col = (id - 1) %% 10,
          position = `function`,
          name = str_wrap(name, 50),
          position = replace_na(position, " ")
        ) %>%
        ungroup() 
      
      # Tooltip text
      waffle_df <- waffle_df %>%
        mutate(tooltip = glue("MP: {lastFirstName}<br>club: {club}<br>Function: {position}"))
      
      # ggplot
      p <- ggplot(waffle_df, aes(x = col, y = -row, fill = club, text = tooltip)) +
        geom_tile(color = "white", width = 0.9, height = 0.9) +
        facet_wrap(~name) +
          scale_fill_manual(values = c("PiS" = "#012b7f", "KO" = "#d41c3c", "PSL-TD" = "#3cb43c",
        "Polska2050-TD" = "#f9c300", "Lewica" = "#a81849", "Razem" = "#870f57",
        "Konfederacja" = "#1b263f", "Republikanie" = "#749cbc", "niez." = "#000000")) +
        coord_equal() +
        labs(title = "Committees and their members") +
        theme_minimal() +
        theme(
          axis.text = element_blank(),
          axis.title = element_blank(),
          panel.grid = element_blank(),
          strip.text = element_text(size= 4)
        )
      
# Convert to interactive plotly
ggplotly(p, tooltip = "text") %>%
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
# mod_committees_ui("committees_1")
    
## To be copied in the server
# mod_committees_server("committees_1")
