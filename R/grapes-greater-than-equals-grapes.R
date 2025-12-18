#' Safe relational operators
#' 
#' Binary operators which allow the comparison of values in atomic vectors, with
#' a little room for floating point precision issues.
#'
#' @param x,y Numeric vectors.
#' 
#' @details
#' These binary comparison operators make the base relational operators
#' ([base::Comparison]) safer by adding a little room for floating point precision
#' issues. `%>=%` is the counterpart to `>=`, and `%<=%` is the counterpart to
#' `<=`.
#' 
#' @returns
#' A logical vector indicating the result of the element by element comparison.
#' 
#' @examples
#' (0.7 - 0.4) >= 0.3
#' (0.7 - 0.4) %>=% 0.3
#' 
#' @rdname safe-comparison
#' @export
`%>=%` <- function(x, y) {
  if (length(x) == 0 | length(y) == 0) {
    return(logical(0))
  }
  x > y | mapply(function(x, y) isTRUE(all.equal(x, y)), x, y)
}

#' @rdname safe-comparison
#' @export
`%<=%` <- function(x, y) {
  if (length(x) == 0 | length(y) == 0) {
    return(logical(0))
  }
  x < y | mapply(function(x, y) isTRUE(all.equal(x, y)), x, y)
}
