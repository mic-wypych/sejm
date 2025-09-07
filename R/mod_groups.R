#' groups UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_groups_ui <- function(id) {
  ns <- NS(id)
  tagList(
    plotly::plotlyOutput(ns("groups_plot"))
  )
}
    
#' groups Server Functions
#'
#' @noRd 
mod_groups_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$groups_plot <- plotly::renderPlotly({
      df_group_members <- get_bil_groups_members() |>
        rename("group_name" = "name",
              "group_id" = "id") |>
        unnest(members)

      df_group_members <- df_group_members %>%
        filter(senator == FALSE)
      
      
      waffle_df <- df_group_members %>%
        group_by(group_name) %>%
        arrange(club, name) %>%
        mutate(
          id = row_number(),        # unique ID per MP in committee
          row = (id - 1) %/% 10,    # 10 tiles per row
          col = (id - 1) %% 10,
          name = str_wrap(name, 50),
          type = replace_na(type, " ")
        ) %>%
        ungroup() 
      
      # Tooltip text
      waffle_df <- waffle_df %>%
        mutate(tooltip = glue("MP: {name}<br>club: {club}<br>Function: {type}"))
      
      # ggplot
      p <- ggplot(waffle_df, aes(x = col, y = -row, fill = club, text = tooltip)) +
        geom_tile(color = "white", width = 0.9, height = 0.9) +
        facet_wrap(~group_name) +
          scale_fill_manual(values = c("PiS" = "#012b7f", "KO" = "#d41c3c", "PSL-TD" = "#3cb43c",
        "Polska2050-TD" = "#f9c300", "Lewica" = "#a81849", "Razem" = "#870f57",
        "Konfederacja" = "#1b263f", "Republikanie" = "#749cbc", "niez." = "#000000")) +
        coord_equal() +
        labs(title = "Groups and their members") +
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
# mod_groups_ui("groups_1")
    
## To be copied in the server
# mod_groups_server("groups_1")
