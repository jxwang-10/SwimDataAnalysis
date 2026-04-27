# test_that("filter year function works", {
#   test <- filter_year(twohundred_fly, 2026)
#   subset <- clean_twohundred_fly[c(1, 2, 3),]
#
#   # test a simple case
#   expect_equal(test, subset)
#
#   # test with year not included
#   expect_equal(filter_year(twohundred_fly, 2006), NULL)
# })
