#' mp_network UI Function
#'
#' @description A shiny Module for visualizing MP voting networks.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom visNetwork visNetwork visNodes visEdges visOptions visPhysics visInteraction visLayout visNetworkOutput renderVisNetwork
#' @import bslib
#' @import dplyr
#' @import tidyr
mod_mp_network_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    bslib::layout_sidebar(
      sidebar = bslib::sidebar(
        width = 300,
        shiny::h5("Network Controls"),
        shiny::sliderInput(
          ns("min_agreement"), 
          "Minimum Agreement (%)", 
          min = 50, 
          max = 100, 
          value = 70, 
          step = 5,
          post = "%"
        ),
        shiny::sliderInput(
          ns("max_connections"), 
          "Max Connections per MP",
          min = 5, 
          max = 20, 
          value = 10, 
          step = 1
        ),
        shiny::selectInput(
          ns("filter_club"), 
          "Filter by Party",
          choices = c("All", "PiS", "KO", "PSL-TD", "Polska2050-TD", 
                     "Lewica", "Razem", "Konfederacja", "Republikanie", "niez."),
          selected = "All"
        ),
        shiny::checkboxInput(
          ns("physics"), 
          "Enable Physics Simulation", 
          value = TRUE
        ),
        shiny::hr(),
        shiny::actionButton(
          ns("recalculate"),
          "Recalculate Network",
          class = "btn-primary",
          width = "100%"
        ),
        shiny::hr(),
        shiny::uiOutput(ns("network_stats"))
      ),
      visNetwork::visNetworkOutput(ns("network_plot"), height = "700px")
    )
  )
}
    
#' mp_network Server Functions
#'
#' @noRd 
mod_mp_network_server <- function(id, df_mps, mp_votes_df){
  shiny::moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    # Reactive value to store calculated agreements (for caching)
    agreements_cache <- shiny::reactiveVal(NULL)
    
    # Calculate agreements when button is clicked or on first load
    agreements_data <- shiny::eventReactive(
      c(input$recalculate, TRUE), 
      {
        shiny::withProgress(message = 'Calculating voting agreements...', value = 0, {
          shiny::incProgress(0.3, detail = "Processing votes")
          
          agreements <- calculate_vote_agreement(
            mp_votes_df = mp_votes_df,
            max_connections = input$max_connections,
            min_agreement = input$min_agreement / 100
          )
          
          shiny::incProgress(0.7, detail = "Preparing network")
          agreements
        })
      },
      ignoreNULL = FALSE
    )
    
    # Prepare network data based on filters
    network_data <- shiny::reactive({
      shiny::req(agreements_data())
      
      prepare_network_data(
        df_mps = df_mps,
        agreements = agreements_data(),
        filter_club = input$filter_club
      )
    })
    
    # Render the network
    output$network_plot <- visNetwork::renderVisNetwork({
      shiny::req(network_data())
      
      net_data <- network_data()
      
      visNetwork::visNetwork(net_data$nodes, net_data$edges) %>%
        visNetwork::visNodes(
          shape = "dot",
          font = list(size = 14)
        ) %>%
        visNetwork::visEdges(
          smooth = list(enabled = TRUE, type = "continuous")
        ) %>%
        visNetwork::visOptions(
          highlightNearest = list(enabled = TRUE, degree = 1, hover = TRUE),
          nodesIdSelection = list(enabled = TRUE, main = "Select MP"),
          selectedBy = list(variable = "group", main = "Select by Party")
        ) %>%
        visNetwork::visPhysics(
          enabled = input$physics,
          stabilization = list(iterations = 100),
          barnesHut = list(
            gravitationalConstant = -2000,
            centralGravity = 0.3,
            springLength = 95,
            springConstant = 0.04,
            damping = 0.09
          )
        ) %>%
        visNetwork::visInteraction(
          navigationButtons = TRUE,
          keyboard = TRUE
        ) %>%
        visNetwork::visLayout(randomSeed = 42)
    })
    
    # Display network statistics
    output$network_stats <- shiny::renderUI({
      shiny::req(network_data())
      
      net_data <- network_data()
      n_nodes <- nrow(net_data$nodes)
      n_edges <- nrow(net_data$edges)
      avg_connections <- if(n_nodes > 0) round(n_edges / n_nodes, 1) else 0
      
      shiny::tagList(
        shiny::h6("Network Statistics", style = "font-weight: bold;"),
        shiny::p(paste("MPs:", n_nodes), style = "margin: 5px 0;"),
        shiny::p(paste("Connections:", n_edges), style = "margin: 5px 0;"),
        shiny::p(paste("Avg per MP:", avg_connections), style = "margin: 5px 0;")
      )
    })
  })
}
    
## To be copied in the UI
# mod_mp_network_ui("mp_network_1")
    
## To be copied in the server
# mod_mp_network_server("mp_network_1")

