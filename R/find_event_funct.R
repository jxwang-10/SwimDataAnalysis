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

  # Error if event given is not included in the dataset
  if(!(event %in% x_clean$Event)){
    stop("This event, ", event,", is not included in your data.")}

  # Error if event given is not included in the dataset
  if(is.character(event) != TRUE){
    stop("Input value for event, ", event,", is not of the character type.")}

  # Filter to the event given
  filteredx <- x |>
    dplyr::filter(Event == event)

  # Arrange rows by time
  filteredx <- filteredx |>
    dplyr::arrange(Time)

  # Output message
  message("Here is your data from the ", event,":")

  # Return filtered + arranged data
  return(filteredx)
}

