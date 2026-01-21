#' Invert a character list
#'
#' @param obj list object
#' 
#' @returns
#' The list object, with values and names inverted.
#' 
#' @examples
#' invert_list(list(a = "b"))
#'
#' @export
invert_list <- function(obj) {
  # TODO: this only works for lists where the value is of length 1. Should probably add a test or something
  new_obj <- list()
  for(key in names(obj)) {
    new_obj[[as.character(obj[[key]])]] <- key # legacy! remove once all covariates have been moved to md
  }
  new_obj
}
