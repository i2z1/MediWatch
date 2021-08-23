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
      #data_inp <- input$bpres_input |> as.data.frame()
      data_inp <- data.frame(Sys = input$bpres_input[2],
                                 Dia = input$bpres_input[1])
      print(data_inp)
      ggplot2::ggplot(data = healthdata,
             aes(x = Sys,#Sys,
                 y = Dia)#Dia,
                 #colour = Category
             ) +
        theme_classic() +
        labs(
          x = "Systolic Pressure (mmHg)",
          y = "Diastolic Pressure (mmHg)",
          colour = "Time of day",
          title = "Blood pressure (on Coveram 5mg/5mg) - 29 April 2020 to 17 May 2020"
        ) +
        expand_limits(x = 0, y = 0) +
        expand_limits(x = 250, y = 150) +
        geom_rect(xmin = 0, xmax = 250, ymin = 0, ymax = 150, fill = "#E40B06", color=NA, alpha = 1) +#Grade 3
        geom_rect(xmin = 0, xmax = 179, ymin = 0, ymax = 109, fill = "#ED7E08", color=NA, alpha = 1) +#Grade 2
        geom_rect(xmin = 0, xmax = 159, ymin = 0, ymax = 99, fill = "#F8BF78", color=NA, alpha = 1) +#Grade 1
        geom_rect(xmin = 0, xmax = 139, ymin = 0, ymax = 89, fill = "#BAFDB6", color=NA, alpha = 1) +#Normal
        geom_rect(xmin = 0, xmax = 129, ymin = 0, ymax = 84, fill = "#BAFDB6", color=NA, alpha = 1) +#Optimal
        #p <- p + scale_color_manual(values=c("darkblue", "lightblue"))
        geom_point()
    })
  })
}

## To be copied in the UI
# mod_graph_pressure_ui("graph_pressure_ui_1")

## To be copied in the server
# mod_graph_pressure_server("graph_pressure_ui_1")
