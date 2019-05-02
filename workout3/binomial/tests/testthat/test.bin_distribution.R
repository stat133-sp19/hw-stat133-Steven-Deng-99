context("Bin Distribution")
library(binomial)
test_that("Bin Distribution", {
  success <- 0:5
  probs <- bin_probability(success, 5, 0.5)
  result <- structure(data.frame('success' = success, 'probability' = probs), class = c("bindis", "data.frame"))
  expect_equal(bin_distribution(5, 0.5), result)
  success <- 0:6
  probs <- bin_probability(success, 6, 0.7)
  result <- structure(data.frame('success' = success, 'probability' = probs), class = c("bindis", "data.frame"))
  expect_equal(bin_distribution(6, 0.7), result)
  success <- 0:7
  probs <- bin_probability(success, 7, 0.8)
  result <- structure(data.frame('success' = success, 'probability' = probs), class = c("bindis", "data.frame"))
  expect_equal(bin_distribution(7, 0.8), result)
})
