test_that("clean data works",{
  x <- cleanData(twohundred_fly)
  expect_snapshot(x)
})

test_that("cleanData gets error with no date column", {
  expect_error(cleanData(iris))
})

test_that("cleanData gets error with no time column", {
  x <- twohundred_fly[, 2:3]
  expect_error(cleanData(x))
})

test_that("time_og column has correct type", {
  x <- cleanData(twohundred_fly)
  expect_equal("time_og" %in% colnames(x), TRUE)
})

test_that("cleanData does not alter rows", {
  x <- cleanData(twohundred_fly)
  expect_equal(nrow(x), 35)
})
