#' graph_linear_lim UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom ggplot2 ggplot aes geom_area coord_cartesian
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
mod_graph_linear_lim_server <- function(id, g_data, column_param){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({
      ggplot2::ggplot(data = g_data,
                      aes(
                        x = DateTime,
                        y = column_param
                      )) +
        geom_area() +
        coord_cartesian(ylim = c(35, 41))

    })
  })
}

## To be copied in the UI
# mod_graph_linear_lim_ui("graph_linear_lim_ui_1")

## To be copied in the server
# mod_graph_linear_lim_server("graph_linear_lim_ui_1")
