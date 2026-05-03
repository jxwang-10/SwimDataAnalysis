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
  # Get cleaned dataset
  x_clean <- cleanData(x)

  # Error if the year given is not included in the dataset
  if(!(year %in% lubridate::year(x_clean$date))){
    stop("The year ", year," is not included in your data.")}

  # Filter the Year column to only the years specified at function call
  year_data <- x_clean |>
    dplyr::filter(lubridate::year(date) == year)

  # Print message
  message("Here is all of your data from ", year,":")

  # Return filtered data
  return(year_data)
}
