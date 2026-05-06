# Create sample data
df1 <- data.frame(
  date = as.Date(c("2020-01-01", "2021-05-10", "2021-12-25")),
  time_og = c("1:00.00", "2:00.00", "3:00.00"),
  time = ms(c("1M 0.00S", "2M 0.00S", "3M 0.00S")))


test_that("filter_year returns only rows from the specified year", {
  expect_equal(filter_year(df1, 2021), df1[c(2, 3), ])
})

test_that("filter_year throws error if year not present", {
  expect_error(filter_year(df1, 2019))
})
