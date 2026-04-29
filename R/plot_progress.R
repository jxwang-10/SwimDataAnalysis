#' Plotting Monthly PRs
#'
#' @description function to plot best times for each month of each year of competition
#' @details cleans the data, converts time to seconds, then plots the times
#' @param x data frame of at least times and date
#' @return none
#' @export
#' @import lubridate
#' @import dplyr
#' @import ggplot2
#' @import plotly
#' @examples
#' plot_progress(twohundred_fly)
#' plot_progress(twohundred_back)

plot_progress <- function(x){
  # clean function here
  x_new <- cleanData(x)

  x_mutated <- x_new |>
    dplyr::mutate(
      year = lubridate::year(date),
      month = lubridate::month(date),
      minutes = as.numeric(sub(":.*", "", time_og)),
      seconds = as.numeric(sub(".*:", "", time_og)),
      time_sec = minutes * 60 + seconds) |>
    dplyr::group_by(year, month) |>
    dplyr::slice_min(time_sec, n = 1) |>
    dplyr::ungroup()
  ggplot2::ggplot(x_mutated, ggplot2::aes(x = interaction(month, year), y = time_sec, group = 1,
                                          text = paste0("<b>Month and Year:</b> ", interaction(month, year), "<br>",
                                                        "<b>Time (seconds):</b> ", time_sec, "<br>"))) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "lm", se = FALSE) +
    ggplot2::labs(x = "Month and Year", y = "Best Time per Month (seconds)") +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
  plotly::ggplotly(p = ggplot2::last_plot(), tooltip = "text")
}

