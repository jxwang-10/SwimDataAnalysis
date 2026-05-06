#' Plotting performance by meet type
#'
#' @description function to plot different types of meets by times
#' @details creates new variable called meet type and shows a line graph for each type
#' @param x data frame of at least times, date, and meet name
#' @return none
#' @export
#' @import dplyr
#' @import ggplot2
#' @import stringr
#' @examples
#' plot_meet_type(twohundred_fly)
#' plot_meet_type(twohundred_back)

plot_meet_type <- function(x){

  # Error for invalid data frame
  if(nrow(x) == 0){
    stop("Input data is empty. Cannot plot anything.")}

  # Get cleaned data
  clean_x <- cleanData(x)

  # Error if meet variable not included in the data frame
  if(!"meet" %in% names(clean_x)){
    stop("Column 'meet' is required.")}

  # Mutate to get meet_type variable and time_sec variable
  mutated_x <- clean_x |>
    dplyr::mutate(meet_type = dplyr::case_when(
      stringr::str_detect(meet, stringr::regex("championship|olympics", ignore_case = TRUE)) ~ "Championship",
      stringr::str_detect(meet, stringr::regex("invit|classic", ignore_case = TRUE)) ~ "Invitational",
      stringr::str_detect(meet, stringr::regex("vs", ignore_case = TRUE)) ~ "Dual",
      stringr::str_detect(meet, stringr::regex("sectional", ignore_case = TRUE)) ~ "Sectional",
      TRUE ~ "Other")) |>
    make_time_sec()

  # Create a plot that maps date, time, and meet type
  ggplot2::ggplot(mutated_x, ggplot2::aes(x = date, y = time_sec, color = meet_type)) +
    ggplot2::geom_line(ggplot2::aes(group = meet_type)) +
    ggplot2::labs(title = "Performance by Meet Type",
                  x = "Date",
                  y = "Time (seconds)",
                  color = "Meet Type")
}
