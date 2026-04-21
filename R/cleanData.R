#' Cleaning Data
#'
#' @description cleaning data
#' @details coerces time and date data into proper form
#' @param x data frame of at least times and date
#' @return none.
#' @export
#' @import janitor
#' @import stringr
#' @import tidyr
#' @import dplyr
#' @examples
#' cleanData(twohundred_fly)
#'
cleanData <- function(x) {
  x <- janitor::clean_names(x)
  if ("date" %in% colnames(x) == FALSE){
    stop("No column named Date found")
  }
  if ("time" %in% colnames(x) == FALSE){
    stop("No column named Time found")
  }

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
      )
    )

  x <- x|>
    tidyr::unite(col = date, names, sep = "-")


  x$date <- as.Date(x$date, "%m-%d-%Y")

  x$time_og <- x$time
###----------------------
  # names <- c("Minutes", "Seconds")
  # x <- x |>
  #   tidyr::separate(time_og, names2, ":", remove = FALSE)
  #
  # x$Minutes <- as.double(x$Minutes)
  # x$Seconds <- as.double(x$Seconds)
  #
  # print(x$Minutes)
  # print(x$Seconds)
  #
  # x$time <- unlist(purrr::map2(x$Minutes, x$Seconds, makePeriod))
  #

### ----------------------
  x$time <- lubridate::ms(x$time)
  return(x)
}
