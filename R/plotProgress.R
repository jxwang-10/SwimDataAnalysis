#' Plotting Progress
#'
#' @description function to plot the progress in one event over the years
#' @details
#' @param x data frame of at least times and date
#' @return none.
#' @export
#' @import ggplot2
#' @examples
#'
#'
plotProgress <- function(x){
  # clean function here
  ggplot2::ggplot(data = x, ggplot2::aes(x = date, y = time)) + ggplot2::geom_line() + ggplot2::scale_x_date(date_labels = "%m-%d-%Y")
  }





