#' Year PR Function
#'
#' @description Function that can be used to filter to a specified year and output your PR from that year
#' @details finds the PR of a given year
#' @param x data frame of times, date, and meet
#' @param year the year that the user specifies
#' @return one value which is your PR for the specified year
#' @export
#' @import lubridate
#' @import dplyr
#' @examples
#' yearly_pr(twohundred_fly, 2026)


yearly_pr <- function(x, year){

  # Get cleaned dataset
  x_clean <- cleanData(x)

  # Error if year given is not included in the dataset
  if(!(year %in% lubridate::year(x_clean$date))){
    stop("The year ", year," is not included in your data.")
  }

  # Filter dataset to the year specified, use make_time_sec() function
  pr_data <- x_clean |>
    dplyr::filter(lubridate::year(date) == year) |>
    make_time_sec() |>
    dplyr::slice_min(time_sec, n = 1) |>
    dplyr::select(time_og)

  # Output only the fastest time
  pr_data <- pr_data[1,1]

  # Print message
  message("Printing your PR from ", year,":")

  # Return single value
  return(pr_data)
}
