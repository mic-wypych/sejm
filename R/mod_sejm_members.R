#' sejm_members UI Function
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

mod_sejm_members_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("members_plot"))
  )
}
    
#' sejm_members Server Functions
#'
#' @noRd 
mod_sejm_members_server <- function(id, df_mps){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$members_plot <- plotly::renderPlotly({
      

members_by_party <- df_mps %>%
        group_by(club) %>%
        arrange(lastName) %>%
        mutate(party_size = n()) %>%
        ungroup()
      
      # Order parties by size (optional)
      party_order <- members_by_party %>%
        group_by(club) %>%
        summarize(count = n()) %>%
        arrange(desc(count)) %>%
        pull(club)
      
      members_by_party$club <- factor(members_by_party$club, levels = rev(c("Razem", "Lewica", "Polska2050-TD", "PSL-TD", "KO", "PiS", "Republikanie", "Konfederacja", "niez.")))
      members_arranged <- members_by_party %>% arrange(club, lastName) %>% ungroup()

# trying plotly

map_to_angle <- function(x, a, b) {
  c <- 0
  d <- 180
  c + (x - a) * (d - c) / (b - a)
}

members_arranged %>%
  mutate(position = row_number()) %>%
  mutate(pos_y = c(rep(1:5, 98), 1:4)) %>%
  mutate(angle = map_to_angle(position, min(position), max(position))) %>%
plot_ly(
  type = 'scatterpolar',
  r = ~pos_y,
  text = ~firstLastName,
  theta = ~angle,
  color = ~ club,
  mode = 'markers',
  colors = c("PiS" = "#012b7f", "KO" = "#d41c3c", "PSL-TD" = "#3cb43c",
        "Polska2050-TD" = "#f9c300", "Lewica" = "#a81849", "Razem" = "#870f57",
        "Konfederacja" = "#1b263f", "Republikanie" = "#749cbc", "niez." = "#000000"),
        marker = list(
    size = 8,     # point size
    opacity = 0.6  # transparency (0 = invisible, 1 = solid)
  )
) %>%
  layout(
    polar = list(
      sector = c(0,180),
      radialaxis = list(
        showticklabels = FALSE,  # hide radial tick labels
        ticks = "",              # remove tick marks
        showline = FALSE,        # hide axis line
        showgrid = FALSE         # hide radial grid
      ),
      angularaxis = list(
        showticklabels = FALSE,  # hide angular tick labels
        ticks = "",              
        showline = FALSE,
        showgrid = FALSE
      )
    )
    
  )
    })
  })
}
    
## To be copied in the UI
# mod_sejm_members_ui("sejm_members_1")
    
## To be copied in the server
# mod_sejm_members_server("sejm_members_1")
