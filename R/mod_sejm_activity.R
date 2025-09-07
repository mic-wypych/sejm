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
    reactable::reactableOutput(ns("sejm_activity"))
  )
}
    
#' sejm_activity Server Functions
#'
#' @noRd 
mod_sejm_activity_server <- function(id, df_mps){
  moduleServer(id, function(input, output, session){
    
    ns <- session$ns
    output$sejm_activity <- reactable::renderReactable({

      df_int <- get_interpellations() |> 
        unnest(from) |> 
        count(from, name = "inter_count") |>
              mutate(from = as.integer(from))
      df_q <- get_questions() |> 
        unnest(from) |> 
        count(from, name = "q_count") |>
        mutate(from = as.integer(from))

      df_mps_act <- df_mps %>%
              left_join(df_q, by = c("id" = "from")) |>
              left_join(df_int, by = c("id" = "from")) |>
              mutate(q_count = replace_na(q_count, 0),
                    inter_count = replace_na(inter_count, 0))

      bar_chart <- function(label, width = "100%", height = "1rem", fill = "#00bfc4", background = NULL) {
              bar <- div(style = list(background = fill, width = width, height = height, transition = "width 0.6s ease"))
              chart <- div(style = list(flexGrow = 1, marginLeft = "0.5rem", background = background), bar)
              div(style = list(display = "flex", alignItems = "center"), label, chart)
            }

      df_mps_act |>
        mutate(photo = paste0("https://api.sejm.gov.pl/sejm/term10/MP/", id, "/photo")) %>%
        select(firstLastName, photo, club, birthDate, districtName, numberOfVotes, q_count, inter_count) |>
        reactable(
          columns = list(
            numberOfVotes = colDef(name = "number of votes", align = "left", cell = function(value) {
              width <- paste0(value / max(df_mps_act$numberOfVotes) * 100, "%")
              bar_chart(value, width = width)
            }),
            photo = colDef(cell = function(value) {
              image <- img(src = sprintf(value), style = "height: 50px; border-radius: 20%;")
              tagList(
                div(style = "display: inline-block; width: 45px;", image)
              )
            }),
            q_count = colDef(name = "number of questions", align = "left", cell = function(value) {
              width <- paste0(value / max(df_mps_act$q_count) * 100, "%")
              bar_chart(value, width = width, fill = "#2a9d8f")
            }),
            inter_count = colDef(name = "number of interpellations", align = "left", cell = function(value) {
              width <- paste0(value / max(df_mps_act$inter_count) * 100, "%")
              bar_chart(value, width = width, fill = "#8338ec")
            })
          ))
          })
        })
        
}
    
## To be copied in the UI
# mod_sejm_activity_ui("sejm_activity_1")
    
## To be copied in the server
# mod_sejm_activity_server("sejm_activity_1")
