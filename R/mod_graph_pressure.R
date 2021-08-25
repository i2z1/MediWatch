#' graph_pressure UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom ggplot2 ggplot aes geom_col theme_classic labs expand_limits geom_rect scale_color_manual geom_point
#'
mod_graph_pressure_ui <- function(id){
  ns <- NS(id)
  tagList(
    plotOutput(
      ns("plot")
    )
  )
}

#' graph_pressure Server Functions
#'
#' @noRd
mod_graph_pressure_server <- function(id,healthdata){
  moduleServer( id, function(input, output, session){
    ns <- session$ns



    output$plot <- renderPlot({


      ggplot2::ggplot(data = healthdata,
             aes(x = Sys,#Sys,
                 y = Dia)#Dia,
                 #colour = Category
             ) +
        theme_classic() +
        labs(
          x = "Systolic Pressure (mmHg)",
          y = "Diastolic Pressure (mmHg)"
        ) +
        expand_limits(x = 60, y = 40) +
        expand_limits(x = 250, y = 150) +
        scale_x_continuous(breaks = seq(60,250,10)) +
        scale_y_continuous(breaks = seq(40,150,10)) +
        geom_rect(xmin = 0, xmax = 250, ymin = 0, ymax = 150, fill = "#E40B06", color=NA, alpha = 0.2) + # Ishemia
        geom_rect(xmin = 70, xmax = 230, ymin = 50, ymax = 130, fill = "#ed6208", color=NA, alpha = 0.2) +#Grade 3
        geom_rect(xmin = 70, xmax = 179, ymin = 50, ymax = 109, fill = "#ED7E08", color=NA, alpha = 1) +#Grade 2
        geom_rect(xmin = 70, xmax = 159, ymin = 50, ymax = 99, fill = "#F8BF78", color=NA, alpha = 1) +#Grade 1
        geom_rect(xmin = 70, xmax = 129, ymin = 50, ymax = 84, fill = "#f6b4fd", color=NA, alpha = 1) +#Hypotension
        geom_rect(xmin = 90, xmax = 129, ymin = 60, ymax = 84, fill = "#BAFDB6", color=NA, alpha = 1) +#Optimal
        #p <- p + scale_color_manual(values=c("darkblue", "lightblue"))
        geom_point()
    })
  })
}

## To be copied in the UI
# mod_graph_pressure_ui("graph_pressure_ui_1")

## To be copied in the server
# mod_graph_pressure_server("graph_pressure_ui_1")
