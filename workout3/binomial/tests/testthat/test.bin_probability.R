context("Bin Probability")
library(binomial)
test_that("Bin Probability", {
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45), 0.01075277)
})
