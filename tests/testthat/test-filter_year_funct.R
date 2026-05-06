test_that("filter_year returns only rows from the specified year",{
  x <- filter_year(twohundred_fly, 2025)
  expect_snapshot(x)
})

test_that("filter_year gets error with no date column", {
  expect_error(filter_year(iris, 2026))
})

test_that("filter_year gets error with a year not in data", {
  expect_error(filter_year(twohundred_fly, 2006))
})

test_that("filter_year gets a message", {
  expect_message(filter_year(twohundred_fly, 2026))
})

test_that("filter_year gets the right amount of rows", {
  x <- filter_year(twohundred_fly, 2025)
  expect_equal(nrow(x), 4)
})
