#' making period
#'
#' @description function to make a period with the name of a time unit pluralized
#' @details return time of period type
#' @param min minutes
#' @param sec seconds
#' @return p time in period type
#' #' @import lubridate
#' @examples
#' makePeriod(2, 46.70)
#' > "2M 46.7S"
makePeriod <- function(min, sec){
  p <- minutes(min) + seconds(sec)
  return(p)
}


