# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}
#Check if the given prob is a valid probability
check_prob <- function(prob) {
  if (0 <= prob && prob <= 1) {
    return(T)
  } else {
    stop("invalid prob value")
  }
}

#Check if the given trail number is valid
check_trials <- function(trials) {
  if (trials >= 0) {
    return(T)
  } else {
    stop("invalid number of trials")
  }
}

#Check if the given number of success is valid for the given number of trials
check_success <- function(success, trials) {

  if (sum((0 <= success) * (success <= trials)) == length(success)) {
    return(T)
  } else {
    stop("Invalid number of success")
  }
}

#Calculate the mean
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

#Calculate the variance
aux_variance <- function(trials, prob) {
  return(trials * prob * (1 - prob))
}

#Calculate the mode
aux_mode <- function(trials, prob) {
  return(floor(trials * prob + prob))
}

#Calculate the skewness
aux_skewness <- function(trials, prob) {
  return((1 - 2 * prob) / (sqrt(aux_variance(trials, prob))))
}

#Calculate the Kurtosis
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob)) / aux_variance(trials, prob))
}

#' calculates the number of combinations in which k successes can occur in n trials
#'
#' @param n number of trails
#' @param k number of success
#' @return number of combinations
#' @examples
#' bin_choose(5, 3)
#' @export
bin_choose <- function(n, k) {
  if (sum(k > n) != 0) {
    stop("k cannot be greater than n")
  } else {
    return(factorial(n) / (factorial(n - k) * factorial(k)))
  }
}

#' calculates the probability in which k successes can occur in n trials
#'
#' @param success number of success
#' @param trials number of trials
#' @param prob probability
#' @return the probability
#' @examples
#' bin_probability(3, 5, 0.5)
#' @export
bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_success(success, trials)
  check_trials(trials)
  return(bin_choose(trials, success) * (prob ^ success) * ((1 - prob) ^ (trials - success)))
}

#' return the distribution of success
#'
#' @param trials number of trails
#' @param prob the probability
#' @return a dataframe of distribution
#' @examples
#' bin_distribution(5, 0.5)
#' @export
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probs <- bin_probability(success, trials, prob)
  result <- structure(data.frame('success' = success, 'probability' = probs), class = c("bindis", "data.frame"))
  return(result)
}

#' @export
plot.bindis <- function(dist) {
  barplot(dist$probability, xlab = "Success", ylab = "Probability")
}

#' return the distribution of success with cumulative probability
#'
#' @param trials number of trails
#' @param prob the probability
#' @return a dataframe of distribution with cumulative probability
#' @examples
#' bin_cumulative(5, 0.5)
#' @export
bin_cumulative <- function(trials, prob) {
  success <- 0:trials
  probs <- bin_probability(success, trials, prob)
  cumulative <- cumsum(probs)
  result <- structure(data.frame('success' = success, 'probability' = probs, 'cumulative' = cumulative), class = c("bincum", "data.frame"))
  return(result)
}

#' @export
plot.bincum <- function(dist) {
  plot(x = dist$success, y = dist$cumulative)
  lines(dist$success, dist$cumulative)
}

#' return the binomial variables
#'
#' @param trials number of trails
#' @param prob the probability
#' @return a list of trials and probability
#' @examples
#' bin_variable(5, 0.5)
#' @export
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(structure(list('trials' = trials, 'probability' = prob), class = 'binvar'))
}

#' @export
print.binvar <- function(binvar) {
  cat('"Binomial Variable"\n\n')
  cat('Parameters\n')
  cat('-number of trials:', binvar$trials, '\n')
  cat('-prob of success:', binvar$probability, '\n')
}

#' @export
summary.binvar <- function(binvar) {
  trials <- binvar$trials
  prob <- binvar$probability
  mean <- aux_mean(trials, prob)
  variance <- aux_variance(trials, prob)
  mode <- aux_mode(trials, prob)
  skewness <- aux_skewness(trials, prob)
  kurtosis <- aux_kurtosis(trials, prob)
  struct <- structure(list('trials' = trials, 'prob' = prob,
                           'mean' = mean, 'variance' = variance, 'mode' = mode,
                           'skewness' = skewness, 'kurtosis' = kurtosis), class = 'summary.binvar')
  return(struct)
}

#' @export
print.summary.binvar <- function(summary.binvar) {
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat('-number of trials:', summary.binvar$trials, '\n')
  cat('-prob of success:', summary.binvar$prob, '\n\n')
  cat('Measures\n')
  cat('-mean    :', summary.binvar$mean, '\n')
  cat('-variance:', summary.binvar$variance, '\n')
  cat('-mode    :', summary.binvar$mode, '\n')
  cat('-skewness:', summary.binvar$skewness, '\n')
  cat('-kurtosis:', summary.binvar$kurtosis, '\n')
}

#' return the mean of the binomial distribution
#'
#' @param trials number of trails
#' @param prob the probability
#' @return mean of the binomial distribution
#' @examples
#' bin_mean(5, 0.5)
#' @export
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' return the variance of the binomial distribution
#'
#' @param trials number of trails
#' @param prob the probability
#' @return variance of the binomial distribution
#' @examples
#' bin_variance(5, 0.5)
#' @export
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' return the mode of the binomial distribution
#'
#' @param trials number of trails
#' @param prob the probability
#' @return mode of the binomial distribution
#' @examples
#' bin_mode(5, 0.5)
#' @export
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' return the skewness of the binomial distribution
#'
#' @param trials number of trails
#' @param prob the probability
#' @return skewness of the binomial distribution
#' @examples
#' bin_skewness(5, 0.5)
#' @export
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' return the kurtosis of the binomial distribution
#'
#' @param trials number of trails
#' @param prob the probability
#' @return kurtosis of the binomial distribution
#' @examples
#' bin_kurtosis(5, 0.5)
#' @export
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
