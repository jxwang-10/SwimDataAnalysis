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

  # Error if dataset invalid
  if(nrow(x) == 0){
    stop("Input data is empty. Cannot plot anything.")
  }

  # Get cleaned data
  x_new <- cleanData(x)

  # Mutate data to add year, month, and time_sec vars, then get only best time
  x_mutated <- x_new |>
    dplyr::mutate(
      year = lubridate::year(date),
      month = lubridate::month(date)) |>
    make_time_sec() |>
    dplyr::group_by(year, month) |>
    dplyr::slice_min(time_sec, n = 1) |>
    dplyr::ungroup()

  # Create ggplot with month/year as x and time_sec as y
  ggplot2::ggplot(x_mutated, ggplot2::aes(x = interaction(month, year), y = time_sec, group = 1,
                                          text = paste0("<b>Date:</b> ", date, "<br>",
                                                        "<b>Time:</b> ", time_og, "<br>"))) +
    ggplot2::geom_point(alpha = 0.5) +
    ggplot2::geom_line(color = "purple") +
    ggplot2::labs(x = "Month and Year",
                  y = "Best Time per Month (seconds)",
                  title = "Plotting Monthly PRs for Each Year") +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

  # Add labels to points on plot
  plotly::ggplotly(p = ggplot2::last_plot(), tooltip = "text")
}

