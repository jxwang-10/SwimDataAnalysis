test_that("moving average function works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$geom_point)
})

test_that("moving average function works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$geom_line)
})

test_that("moving average function works", {
  x <- moving_avg(twohundred_back)
  expect_snapshot(x$layers$labs)
})
