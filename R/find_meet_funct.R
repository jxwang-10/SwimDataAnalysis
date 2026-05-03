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
#' find_meet(twohundred_fly, "Speedo Sectionals - Providence")

find_meet <- function(x, meet){

  # Error if event given is not included in the dataset
  if(!(meet %in% x_clean$Meet)){
    stop("This meet, ", meet,", is not included in your data.")}

  # Error if event given is not included in the dataset
  if(is.character(meet) != TRUE){
    stop("Input value for meet, ", event,", is not of the character type.")}

  # Filter the data to only rows with the specified meet
  filteredx <- x |>
    dplyr::filter(x$Meet == meet)

  # Output message
  message("Here is your data from the ", meet," meet:")

  # Return filtered data
  return(filteredx)
}
