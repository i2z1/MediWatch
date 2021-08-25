#' blood_analysis UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import htmltools
mod_blood_analysis_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        column(4,
               wellPanel(
                 tags$head(
                   tags$style(type="text/css", "#inline label{ display: table-cell; text-align: center; vertical-align: middle; }
                #inline .form-group { display: table-row;}")
                 ),

                tags$div(id = "inline", numericInput("inp_Hemoglobin",
                                                     label = "Hemoglobin",
                                                     value = 140)),
                tags$div(id = "inline", numericInput("inp_Erythrocytes",
                                                     label = "Erythrocytes ",
                                                     value = 140)),
                tags$div(id = "inline", numericInput("inp_Hematocrit",
                                                     label = "Hematocrit",
                                                     value = 140)),
                            )

               )
      )
    )

  )
}

#' blood_analysis Server Functions
#'
#' @noRd
mod_blood_analysis_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_blood_analysis_ui("blood_analysis_ui_1")

## To be copied in the server
# mod_blood_analysis_server("blood_analysis_ui_1")
