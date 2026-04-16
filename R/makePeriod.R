#' making period
#'
#' @description function to make a period with the name of a time unit pluralized
<<<<<<< HEAD
#' @details return time of period type
=======
#' @details Test.
>>>>>>> 45a48a0 (feedback + proposed changes from cp #1)
#' @param min minutes
#' @param sec seconds
#' @return p time in period type
#' @export
#' @import lubridate
#' @export
#' @examples
#' makePeriod(2, 46.70)

# > "2M 46.7S"
makePeriod <- function(min, sec){
  p <- minutes(min) + seconds(sec)
  return(p)
}


