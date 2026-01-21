#' Test if a vector of values is likely to be continuous or categorical
#' 
#' The function will try to convert all values to numeric. If a certain fraction
#' of values is able to convert successfully, it will assume the vector is 
#' continuous. Default threshold is 0.8.
#' 
#' @param x vector of values
#' @param cutoff A cutoff value between 0 and 1 for deciding between
#'   continuous/categorical. Default threshold is 0.8.
#' 
#' @details
#' The function will try to convert all values to numeric. If a certain fraction
#' of values is able to convert successfully, it will assume the vector is 
#' continuous.
#' 
#' @returns 
#' `TRUE` if the vector of values is likely to be continuous, otherwise `FALSE`.
#' 
#' @examples
#' is_continuous(1:3)
#' is_continuous(c(1, 3, 5))
#' is_continuous(c("a", 1))
#' 
#' @export
is_continuous <- function(x, cutoff = 0.8) {
  # TODO: should better define the meaning of continuous and categorical here,
  # what type of input `x` accepts (character, logical vectors, 0s and 1s, etc.),
  # expected outputs with different inputs.
  
  # TODO: Want function to behave like this description: Pharmacometric datasets
  # are most often stored just as CSV, so we don’t have info on whether a column
  # in the dataset is numeric or factor. Sometimes we have a data dictionary,
  # sometimes we don’t. If we don’t, we need to figure out whether a columns is
  # likely to be continuous (i.e. double or numeric in progrmaming lingo, like
  # TIME or DV in NONMEM dataset), or categorical (e.g. SEX in NONMEM datasets).
  # That’s all this function is supposed to figure out.

    if (cutoff > 1) {
    warning("Can't have a cutoff greater than 1; setting value to 1 instead")
    cutoff <- 1
  }
  if (is.logical(x)) {
    x <- as.numeric(x)
  }
  tmp <- suppressWarnings(as.numeric(as.character(x)))
  # Are number of *new* NAs/total number of values <= 1 - cutoff?
  ((sum(is.na(tmp)) - sum(is.na(x))) / length(tmp)) %<=% (1 - cutoff)
}
