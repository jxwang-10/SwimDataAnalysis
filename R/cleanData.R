#' Cleaning Data
#'
#' @description cleans data by modifying variables for usability
#' @details coerces time and date data into proper format
#' @param x data frame with at least time and date variables
#' @return none.
#' @export
#' @import janitor
#' @import stringr
#' @import tidyr
#' @import dplyr
#' @examples
#' cleanData(twohundred_fly)

cleanData <- function(x) {
  x <- janitor::clean_names(x)

  # error if there is no date variable included in data
  if ("date" %in% colnames(x) == FALSE){
    stop("No column named Date found")
  }

  # error if there is no time variable included in data
  if ("time" %in% colnames(x) == FALSE){
    stop("No column named Time found")
  }

  # Transform the date column
  names <- c("Month", "Day", "Year")
  x <- x |>
    tidyr::separate(date, names, " ", remove = FALSE)

  x$Day <- x$Day |>
    stringr::str_replace_all(",", "")

  x <- x |>
    dplyr::mutate(
      Month = dplyr::case_match(Month,
                                "Jan" ~ 01,
                                "Feb" ~ 02,
                                "Mar" ~ 03,
                                "Apr" ~ 04,
                                "May" ~ 05,
                                "Jun" ~ 06,
                                "Jul" ~ 07,
                                "Aug" ~ 08,
                                "Sep" ~ 09,
                                "Oct" ~ 10,
                                "Nov" ~ 11,
                                "Dec" ~ 12,
                                "January" ~ 01,
                                "Febuary" ~ 02,
                                "March" ~ 03,
                                "April" ~ 04,
                                "May" ~ 05,
                                "June" ~ 06,
                                "July" ~ 07,
                                "August" ~ 08,
                                "September" ~ 09,
                                "October" ~ 10,
                                "November" ~ 11,
                                "December" ~ 12
))

  x <- x|>
    tidyr::unite(col = date, names, sep = "-")

  # assign month day and year back to the same variable called date (replace)
  x$date <- as.Date(x$date, "%m-%d-%Y")

  # keep old time variable and create new variable with modified format
  x$time_og <- x$time

  # turn old time column into ms format
  x$time <- lubridate::ms(x$time)
  return(x)
}
