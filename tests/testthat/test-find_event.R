test_that("find_event works", {
  x <- find_event(top_three, "200 Back")
  expect_snapshot(x)
})

test_that("find_meet gets error with no event variable", {
  expect_error(find_event(twohundred_back, "200 fly"))
})

test_that("find_meet gets error when event not found", {
  expect_error(find_event(top_three, "50 Free"))
})

test_that("find_event gets a message", {
  expect_message(find_event(top_three, "200 Back"))
})

test_that("find_event gets the right amount of rows", {
  x <- find_event(top_three, "200 Back")
  expect_equal(nrow(x), 51)
})
