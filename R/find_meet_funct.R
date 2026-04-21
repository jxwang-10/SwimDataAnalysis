#' Find Meet Function
#'
#' @description Function that can be used to filter to a specified meet
#' @details finds all the times from the same meet, regardless of year
#' @param x data frame of times, date, and meet
#' @param meet the meet that the user specifies
#' @return data frame with only the rows containing the selected meet
#' @export
#' @import dplyr
#' @examples
#' find_meet(twohundred_fly, "Smith vs Simmons")

find_meet <- function(x, meet){
  filteredx <- x |>
    filter(x$Meet == meet)
  message("Here is your data from the ", meet," meet:")
  return(filteredx)
}
