test_that("year pr function works", {
  # test a simple case
  expect_equal(yearly_pr(twohundred_fly, 2026), "2:05.86")

  # test against known value
  expect_error(yearly_pr(twohundred_fly, 2006))
})
