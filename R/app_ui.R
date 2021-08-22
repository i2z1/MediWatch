#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    navbarPage("MediWatch",
               tabPanel("Monitoring",
                        sidebarLayout(
                          sidebarPanel(
                            # dateInput("date_input", "Date"),
                            sliderInput("temp_input",
                                        label = "Body Temperature",
                                        min = 35,
                                        max = 41,
                                        value = 36.6,
                                        step = 0.1),
                            sliderInput("bpres_input",
                                        label = "Blood Pressure",
                                        min = 40,
                                        max = 200,
                                        value = c(80,120),
                                        step = 1),
                            sliderInput("satur_input",
                                        label = "Saturation",
                                        min = 90,
                                        max = 100,
                                        value = 97,
                                        step = 1),
                            numericInput("breath_input",
                                         label = "Breaths per minute",
                                         value = 14),
                            numericInput("pulse_input",
                                         label = "Pulse",
                                         value = 70),
                            actionButton("submit1_input",
                                         label = "Submit")
                          ),
                          mainPanel()
                        )),
               tabPanel("Blood"),
               tabPanel("About")

    )

  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'MediWatch'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

