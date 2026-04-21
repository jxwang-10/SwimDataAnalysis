#' Filter Year Function
#'
#' @description Function that can be used to filter to a specified year
#' @details input a year and filter out the times from one particular year
#' @param x data frame of times, date, and meet
#' @param year the year that the user specifies
#' @return data frame with only rows of the specified year
#' @export
#' @import dplyr
#' @import lubridate
#' @examples
#' filter_year(twohundred_fly, 2025)

filter_year <- function(x, year){
  # Filter the Year column to only the years specified at function call
  x_clean <- cleanData(x)
  year_data <- x_clean |>
    filter(year(date) == year)
  message("Here is all of your data from ", year,":")
  return(year_data)
}
