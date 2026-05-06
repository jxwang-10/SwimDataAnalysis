test_that("test if geom_line works", {
  x <- plot_meet_type(twohundred_back)
  expect_snapshot(x$layers$geom_line)
})

test_that("test if labs works", {
  x <- plot_meet_type(twohundred_back)
  expect_snapshot(x$layers$labs)
})

test_that("plot_meet_type errors on empty data", {
  empty_df <- twohundred_back[0, ]
  expect_error(plot_meet_type(empty_df),
               "Input data is empty")
})

test_that("meet_type is computed", {
  x <- plot_meet_type(twohundred_back)
  data <- x$data
  expect_true("meet_type" %in% names(data))
})

test_that("plot_meet_type errors if meet column is missing", {
  df <- data.frame(
    date = c("Jan 18, 2026", "Oct 31, 2025"),
    time = c("2:10.18", "3:11.00"))

  expect_error(plot_meet_type(df),
    "Column 'meet' is required.")
})
