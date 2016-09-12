#' Simulates some data for a thingy
#'
#' DETAILS
#' William came up with it, don't ask me
#' @param n number of observations
#' @param seed integer value for random seed
#' @return data.table with simulated data
#' @import data.table
#' @export
make_data_for_figure_4_10 <- function(n,
      seed = sample.int(.Machine$integer.max, 1))
{
  set.seed(seed)
  u <- rbinom(n, 1, prob = .5)
  s <- rbinom(n, 1, prob = plogis(-1 + 2 * u))
  x <- rbinom(n, 1, prob = plogis(1 - 2 * u))
  d <- rbinom(n, 1, prob = plogis(-3 + 6 * s))
  y1 <- rbinom(n, 1, prob = plogis(-1 + 2 * 1 - 2 * x))
  y0 <- rbinom(n, 1, prob = plogis(-1 + 2 * 0 - 2 * x))
  y <- d * y1 + (1 - d) * y0
  DATA <- data.table(y1, y0, y, u, s, x, d)
  attr(DATA, "seed") <- seed
  DATA
}
