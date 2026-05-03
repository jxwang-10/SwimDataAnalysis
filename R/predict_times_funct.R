#' Creating a moving average
#'
#' @description function to plot points with all times and create a moving average
#' @details creates new variable called moving_avg and plots it on a graph
#' @param x data frame of at least times and date
#' @return none
#' @export
#' @import lubridate
#' @import dplyr
#' @import ggplot2
#' @import zoo
#' @examples
#' moving_avg(twohundred_fly)
#' moving_avg(twohundred_back)

moving_avg <- function(x){

  # Get cleaned data
  x_new <- cleanData(x)

  # Mutate data to add year, month, date_num, time_sec, and moving_avg variables
  x_mutated <- x_new |>
    dplyr::mutate(
      year = lubridate::year(date),
      month = lubridate::month(date),
      date_num = as.numeric(date)) |>
    make_time_sec() |>
    dplyr::arrange(date) |>
    dplyr::mutate(moving_avg = zoo::rollmean(time_sec, k = 5, fill = NA))

  # Create plot of times and moving average
  ggplot2::ggplot(x_mutated, ggplot2::aes(x = date)) +
    ggplot2::geom_point(ggplot2::aes(y = time_sec), alpha = 0.5) +
    ggplot2::geom_line(ggplot2::aes(y = moving_avg), linewidth = 1, color = "hot pink") +
    ggplot2::labs(title = "Performance with Moving Average",
                  x = "Date",
                  y = "Time (seconds)")
}
