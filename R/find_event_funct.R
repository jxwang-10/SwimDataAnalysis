#' Find Event Function
#'
#' @description Function that can be used to filter to a specified event
#' @details finds all the times corresponding to an event, regardless of year, then sort rows based on best times
#' @param x data frame of times, date, event, and meet
#' @param event the event that the user specifies
#' @return data frame with only the rows containing the selected event, ascending by time
#' @export
#' @import dplyr
#' @examples
#' find_event(top_three, "200 Back")

find_event <- function(x, event){
  filteredx <- x |>
    dplyr::filter(Event == event)
  filteredx <- filteredx |>
    dplyr::arrange(Time)
  message("Here is your data from the ", event,":")
  return(filteredx)
}

