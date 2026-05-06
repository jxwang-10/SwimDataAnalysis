test_that("filter_year returns only rows from the specified year",{
  x <- filter_year(twohundred_fly, 2025)
  expect_snapshot(x)
})
