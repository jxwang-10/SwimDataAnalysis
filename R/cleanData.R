#' Cleaning Data
#'
#' @description cleaning data
#' @details
#' @param x data frame of at least times and date
#' @return none.
#' @export
#' @import  # ask
#' @examples
#'
#'
cleanData <- function(x) {
  x <- janitor::clean_names(x)
  f ("date" %in% colnames(x) == FALSE){
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
                                "Dec" ~ 12
      )
    )

  x <- x|>
    tidyr::unite(col = date, names, sep = "-")


  x$date <- as.Date(x$date, "%m-%d-%Y")

  x$time <- strptime(x$time,"%M:$OS") #HELP
}
