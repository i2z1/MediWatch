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
#' @import ggplot2
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
mod_graph_linear_lim_server <- function(id, g_data, column_param, limits_vec, x_label, y_label){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot <- renderPlot({
      spline.d <- as.data.frame(spline(g_data$DateTime, g_data$Temp,
                                       method = c("fmm")))

      ggplot2::ggplot(data = g_data,
                      aes(
                        x = DateTime,
                        y = column_param
                      )) +
        geom_line(size = 2) +
        geom_point(size = 4) +
        coord_cartesian(ylim = limits_vec) +
        labs(
          x = x_label,
          y = y_label
        ) +
          geom_hline(yintercept = 37, color = "red", size = 2)

    })
  })
}

## To be copied in the UI
# mod_graph_linear_lim_ui("graph_linear_lim_ui_1")

## To be copied in the server
# mod_graph_linear_lim_server("graph_linear_lim_ui_1")
