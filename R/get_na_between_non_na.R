#' Check if a vector of values has an NA in between at least two non-NA
#' values. If so, it will return a vector of indices of NA values for which
#' this is the case. If none are found, it will return an empty vector.
#' 
#' This can e.g. conveniently be used to test whether there are any BLQ 
#' samples in-between two numeric (above LOQ) values. Within a single PK 
#' curve this is not likely to occur and the individual or data point should be 
#' flagged as an outlier.
#' 
#' @param x vector of samples
#' 
#' @returns vector of indices (numeric)
#' 
#' @export
#' 
get_na_between_non_na <- function(x) {
  idx <- (1:(length(x)))[is.na(x)]
  na_idx <- c()
  if(length(idx) > 0) {
    for(i in 1:length(idx)) {
      if( any(!is.na(x[1:idx[i]])) & any(!is.na(x[(idx[i]+1):length(x)])) ) {
        na_idx <- c(na_idx, idx[i])
      }
    }
  }
  na_idx
}