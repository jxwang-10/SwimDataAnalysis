test_that("year pr function works", {
  # test a simple case
  expect_equal(yearly_pr(twohundred_fly, 2026), "2:05.86")

  # test that an error will occur with an input year not included in data
  expect_error(yearly_pr(twohundred_fly, 2006))

  # tests that function can handle ties of fastest time
  # (2021 has two equivalent times)
  expect_equal(yearly_pr(twohundred_back, 2021), "2:08.82")

  # tests that return is a character string of length 1
  result <- yearly_pr(twohundred_fly, 2024)
  expect_type(result, "character")
  expect_length(result, 1)

  # tests that is filters correctly by year
  # (Dec 16, 2018 -> 2:27.35, Dec 16, 2022 -> 2:10.92)
  expect_equal(yearly_pr(twohundred_fly, 2018), "2:27.35")
})
