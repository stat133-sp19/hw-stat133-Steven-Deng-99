context("Check Success")
library(binomial)
test_that("Check Success", {
  expect_equal(check_success(2, 5), T)
  expect_equal(check_success(5, 5), T)
  expect_error(check_success(6, 5), "Invalid number of success")
})
