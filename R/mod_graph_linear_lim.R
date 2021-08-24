#' graph_linear_lim UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_graph_linear_lim_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotOutput(
      ns("plot")
    )
  )
}

#' graph_linear_lim Server Functions
#'
#' @noRd
mod_graph_linear_lim_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({

    })
  })
}

## To be copied in the UI
# mod_graph_linear_lim_ui("graph_linear_lim_ui_1")

## To be copied in the server
# mod_graph_linear_lim_server("graph_linear_lim_ui_1")
