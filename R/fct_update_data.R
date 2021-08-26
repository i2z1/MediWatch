#' update_data
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
update_data <- function(ndf){

 ndf <- convert_nested_list(ndf)

}

convert_nested_list <- function( mylist){

  nlist <- mylist[c(3:5)] %>% as.data.frame()
  nnlist <- mylist[c(1)] %>% as.data.frame()# temp
  sys <- mylist[c(2)][[1]][2]
  dia <- mylist[c(2)][[1]][1]
  smell <- mylist[c(6)][[1]][1]=="S"
  taste <- mylist[c(6)][[1]][2]=="T"
  chemesthesis <- mylist[c(6)][[1]][3]=="C"

  ndf <- cbind(nnlist,nlist,sys,dia,smell,taste, chemesthesis)
}