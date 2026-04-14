#' making period
#'
#' @description function to make a period with the name of a time unit pluralized
#' @details
#' @param min minutes
#' @param sec seconds
#' @return none.
#' @import lubridate
#' @examples
#' makePeriod(2, 46.70)
#' > "2M 46.7S"
makePeriod <- function(min, sec){
  p <- minutes(min) + seconds(sec)
  return(p)
}


