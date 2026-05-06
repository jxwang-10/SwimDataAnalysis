test_that("moving_avg geom_point works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$geom_point)
})

test_that("moving_avg geom_line works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$geom_line)
})

test_that("moving_avg labs works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$labs)
})

test_that("moving_avg errors on empty data", {
  empty_df <- twohundred_back[0, ]
  expect_error(moving_avg(empty_df),
               "Input data is empty")
})

test_that("moving_avg is computed", {
  x <- moving_avg(twohundred_back)
  data <- x$data
  expect_true("moving_avg" %in% names(data))
})
