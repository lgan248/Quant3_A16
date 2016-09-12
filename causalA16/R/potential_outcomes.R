#' Simulate some potential outcomes
#'
#' Makes binary causal state, binary valued potential outcomes.
#' @param n number of individuals
#' @param seed integer value for random seed
#' @return data.table with potential outcomes
#' @import data.table
#' @export
simulate_potential_outcomes <- function(n,
      seed = sample.int(.Machine$integer.max, 1))
{
  set.seed(seed)
  outcome_values <- c(1, 0)
  prob_y1 <- .55
  prob_y0 <- .45
  DATA <- data.table(
    y0 = 1 * (runif(n) < prob_y0),
    y1 = 1 * (runif(n) < prob_y1))
  attr(DATA, "seed") <- seed
  DATA
}
