#' Invert a character list
#'
#' @param obj list object
#'
#' @export
invert_list <- function(obj) {
  new_obj <- list()
  for(key in names(obj)) {
    new_obj[[as.character(obj[[key]])]] <- key # legacay! remove once all covariates have been moved to md
  }
  return(new_obj)
}
