# ' Load dataset from inst/extdata
#'
#' Loads a dataset from inst/extdata into memory.
#' @param dataset the name of the dataset to load
#' @return data set
#' @import foreign
#' @import data.table
#' @export
load_dataset <- function(dataset)
{
  file_name <- paste0("/Users/liwugan/Quant3_A16/causalA16/inst/extdata/",
    dataset, ".csv")
  DATA <- read.csv(file_name)
}

