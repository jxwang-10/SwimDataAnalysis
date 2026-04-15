#' Filter Meet Function
#'
#' @description Function that can be used to filter to a specified meet
#' @details
#' @param x data frame of times, date, and meet
#' @param meet the meet that the user specifies
#' @return data frame with only the rows containing the selected meet
#' @export none
#' @import
#' @examples
#' find_meet(twohundred_fly, "Smith vs Simmons")

find_meet <- function(x, meet){
  filteredx <- x |>
    filter(x$Meet == meet)
  message("Here is your data from the ", meet," meet:")
  return(filteredx)
}
