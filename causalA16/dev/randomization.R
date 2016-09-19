## Randomization
#If you had 1,000 observations you wouldn't list out the potential outcomes for each one.
#It's very similar to boostrapping
#Null hypothesis that we criticized in class was the weak null of no average effect
#We're testing a different, more rigorous null effect. It's called the sharp null, but
#should be called strong null
#Classical inference, we assume average effect and invoke consistency
#Randomization inference- we get to see the "pretend"- we overcome the fundamental problem
#of causal inference in a way


library(causalA16)
set.seed(1)
D <- simulate_potential_outcomes(1000)
D

#' @param DATA data.table containing variables named y1 and y0
#' @param n number of observations
#' @return data.table with simulated data
#' @import data.table
#' @export
randomize <- function(DATA)
{
treated <- sample.int(1000,500)
#make a list of numbers 1-1000, then subtract out the treated
control <- (1:1000)[-treated]
# control <- setdiff(1:1000, treated) # another way to do it

DATA[treated, y := y1]
DATA[control, y := y0]
DATA[treated, mean(y)] - DATA[control, mean(y)]
}

permutation_distribution <- replicate(1000,randomize(D))
mean(permutation_distribution)
sd(permutation_distribution)
hist(permutation_distribution, breaks = 100)

#needs documentation
simulate_paired_experiment <- function(n,
seed = sample.int(.Machine$integer.max, 1))
{
  stopifnot(n %% 2 == 0) #a test that stops the funciton if the thing inside parentheses is
  #not true. n mod (remainder) 2 is equal to 0
  set.seed(seed)
  DATA <- simulate_potential_outcomes(n)
  treated <- sample.int(n, n / 2)
  #make a list of numbers 1-1000, then subtract out the treated
  control <- (1:n)[-treated]
  DATA[treated, d := 1]
  DATA[control, d := 0]
  DATA[, y := d * y1 + (1 - d) * y0]
  DATA[, `:=`(y1 = NULL, y0 = NULL)]
  attr(DATA, "seed") <- seed
  DATA
}
#needs to be written as a function
experiment <- simulate_paired_experiment(1000)
experiment[, y1 := y]
experiment[, y0 := y]
randomize(experiment)
experiment[, .N, .(d, y)]

