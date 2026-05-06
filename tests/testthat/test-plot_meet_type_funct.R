test_that("plot_meet_type works", {
  x <- plot_meet_type(twohundred_back)
  expect_snapshot(x$layers$geom_point)
})

test_that("test if geom_line works", {
  x <- plot_meet_type(twohundred_back)
  expect_snapshot(x$layers$geom_line)
})

test_that("test if labs works", {
  x <- plot_meet_type(twohundred_back)
  expect_snapshot(x$layers$labs)
})
