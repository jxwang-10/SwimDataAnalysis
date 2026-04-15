#' Year PR Function
#'
#' @description Function that can be used to filter to a specified year and output your PR from that year
#' @details
#' @param x data frame of times, date, and meet
#' @param year the year that the user specifies
#' @return one value which is your PR for the specified year
#' @export none
#' @import lubridate
#' @examples
#' yearly_pr(twohundred_fly, 2026)
#'

yearly_pr <- function(x, year){
  x_clean <- cleanData(x)
  pr_data <- x_clean |>
    filter(year(date) == year) |>
    mutate(minutes = as.numeric(sub(":.*", "", time_og)),
      seconds = as.numeric(sub(".*:", "", time_og)),
      time_sec = minutes * 60 + seconds) |>
    slice_min(time_sec, n = 1) |>
    select(time_og)
  message("Printing your PR from ", year,":")
  return(pr_data)
}
