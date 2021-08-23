#' get_data
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
#' @import dplyr
get_test_data <- function(){
  tdf <- read.csv2(file = "data/test.csv", sep = ",")
  tdf$DateTime <- Sys.time()
  tdf <- tdf %>% mutate_at(c(2:7),as.numeric)
}
