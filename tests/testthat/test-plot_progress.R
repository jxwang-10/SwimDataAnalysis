test_that("test if geom_line works", {
  x <- plot_progress(twohundred_back)
  expect_snapshot(x$layers$geom_line)
})

test_that("test if geom_point works", {
  x <- plot_progress(twohundred_back)
  expect_snapshot(x$layers$geom_point)
})

test_that("test if theme works", {
  x <- plot_progress(twohundred_back)
  expect_snapshot(x$layers$theme)
})

test_that("plot_progress errors on empty data", {
  empty_df <- twohundred_back[0, ]
  expect_error(plot_progress(empty_df),
               "Input data is empty")
})

test_that("plot_progress returns a plotly object", {
  p <- plot_progress(twohundred_back)
  expect_s3_class(p, "plotly")
})
