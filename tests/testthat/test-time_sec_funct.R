test_that("make_time_sec works", {
  x <- make_time_sec(clean_twohundred_fly)
  expect_snapshot(x)
})

test_that("make_time_sec errors if time_og is missing", {
  df <- data.frame(date = c("Jan 18, 2026", "Oct 31, 2025"))
  expect_error(make_time_sec(df),
    "doesn't contain the necessary variable")
})

test_that("make_time_sec correctly converts to seconds", {
  df <- data.frame(time_og = c("1:00.00", "2:30.00", "0:45.00"))
  result <- make_time_sec(df)
  expect_equal(result$time_sec, c(60, 150, 45))
})

test_that("make_time_sec adds minutes, seconds, and time_sec columns", {
  result <- make_time_sec(clean_twohundred_fly)
  expect_true(all(c("minutes", "seconds", "time_sec") %in% names(result)))
})

test_that("make_time_sec errors on empty data", {
  empty_df <- twohundred_back[0, ]
  expect_error(make_time_sec(empty_df),
               "Input data is empty")
})
