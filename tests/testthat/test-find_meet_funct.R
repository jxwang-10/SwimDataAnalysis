test_that("find_meet works", {
  x <- find_meet(twohundred_fly, "Smith vs Simmons")
  expect_snapshot(x)
})

test_that("find_meet gets error with wrong input meet", {
  expect_error(find_meet(twohundred_fly, "Not a meet"))
})

test_that("find_meet gets error with wrong input meet", {
  expect_error(find_meet(twohundred_fly, "42"))
})
