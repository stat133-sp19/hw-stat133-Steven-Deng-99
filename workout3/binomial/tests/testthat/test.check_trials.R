context("Check Trials")
library(binomial)
test_that("Check Trials", {
  expect_equal(check_trials(2), T)
  expect_equal(check_trials(3), T)
  expect_error(check_trials(-1), "invalid number of trials")
})
