##Overview

------------------------------------

Binomial is a package that allows the user to create binomial distributions with customized number of trials and probability of success. This package also enables users to calculate various measurements of the distribution ranging from mean, variance, skewness and etc. Also, plotting distribution is also supported. 

##Installation

------------------------------------

Install the package from Github using "devtools":

```{r}
#install.packages("devtools") 

# install "binomial" (with vignettes)
devtools::install_github("https://github.com/stat133-sp19/hw-stat133-Steven-Deng-99/workout3/binomial", build_vignettes = TRUE)
```

##Usage

------------------------------------

```
library(binomial)

# create a binomial variable
var <- bin_variable(5, 0.5)
var
#> "Binomial Variable"
#>
#>
#> Parameters
#> -number of trials: 5 
#> -prob of success: 0.5 

# calculate bin probability
prob <- bin_probability(3, 5, 0.5)
prob
#> 0.3125

# calculate n choose k
choose <- bin_choose(5,3)
choose
#> 10

# return the distribution
dis <- bin_distribution(5, 0.5)
dist

# return the mean of the binomial distribution
bin_mean(5, 0.5)
#> 2.5

# return the variance of the binomial distribution
bin_variance(5, 0.5)
#> 1.25

# return the mode of the binomial distribution
bin_mode(5, 0.5)
#> 3

# return the skewness of the binomial distribution
bin_skewness(5, 0.5)
#> 0

# return the kurtosis of the binomial distribution
bin_kurtosis(5, 0.5)
#> -0.4

# return the distribution of success with cumulative probability
bin_cumulative(5, 0.5)
#>    success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000
```
