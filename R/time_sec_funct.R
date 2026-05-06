#' Making time_sec
#'
#' @description function to make variable called time_sec
#' @details outputs a mutated dataset with new variable time_sec (times given only in seconds)
#' @param x dataset
#' @return mutated dataset with time_sec variable
#' @export
#' @import dplyr
#' @examples
#' make_time_sec(clean_twohundred_fly)

make_time_sec <- function(x){
  # Error if dataset invalid
  if(nrow(x) == 0){
    stop("Input data is empty. Cannot plot anything.")}

  # Error if time_og is not included in data
  if(!("time_og" %in% names(x))){
    stop("This dataset doesn't contain the necessary variable for this function.")}

  # Mutate data to add minutes, seconds, and time_sec
  seconds_x <- x |>
    dplyr::mutate(minutes = as.numeric(sub(":.*", "", time_og)),
                  seconds = as.numeric(sub(".*:", "", time_og)),
                  time_sec = minutes * 60 + seconds)

  # Return mutated data
  return(seconds_x)
}


