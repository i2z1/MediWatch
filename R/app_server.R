#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  # input$submit1_input <- insert_common_data(input$)
  tdf <- get_test_data()
  mod_graph_pressure_server("graph_pressure_ui_1",tdf)
  mod_graph_linear_lim_server("graph_linear_lim_ui_1",tdf, tdf$Temp, c(35,41), "Time", "Temperature")


  observeEvent( input$submit1_input, {
    data_list <- list(temp = input$temp_input,
                      bpres = input$bpres_input,
                      satur = input$satur_input,
                      bpm = input$breath_input,
                      pulse = input$pulse_input,
                      senses = input$senses_input)
    update_data(data_list)
  })
  #  output$test <- renderText({print(input$bpres_input[2])})

}
