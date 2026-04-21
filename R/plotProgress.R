#' Plotting Progress
#'
#' @description function to plot the progress in one event over the years
#' @details cleans the data and plots the race tiems over the years
#' @param x data frame of at least times and date
#' @return none.
#' @export
#' @examples
#' plotProgress(twohundred_fly)
#'
plotProgress <- function(x){
  # clean function here
  x_new <- cleanData(x)
  plot(x_new$date, x_new$time, xlab = "Date", ylab="Seconds")

  }





