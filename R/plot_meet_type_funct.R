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

  # Get cleaned data
  clean_x <- cleanData(x)

  mutated_x <- clean_x |>
    dplyr::mutate(meet_type = case_when(
      str_detect(meet, regex("championship|olympics", ignore_case = TRUE)) ~ "Championship",
      str_detect(meet, regex("invit|classic", ignore_case = TRUE)) ~ "Invitational",
      str_detect(meet, regex("vs", ignore_case = TRUE)) ~ "Dual",
      str_detect(meet, regex("sectional", ignore_case = TRUE)) ~ "Sectional",
      TRUE ~ "Other")) |>
    make_time_sec()
  ggplot2::ggplot(mutated_x, ggplot2::aes(x = date, y = time_sec, color = meet_type)) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Performance by Meet Type",
                  x = "Date",
                  y = "Time (seconds)",
                  color = "Meet Type")
}
