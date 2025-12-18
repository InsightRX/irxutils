#' Random string
#'
#' @param n number of characters for random string
#' 
#' @returns 
#' A string of random letters with `n` characters.
#' 
#' @examples
#' random_string(3)
#' 
#' @export
random_string <- function(n = 5) {
  paste(letters[floor(stats::runif(n, 0, 26)) + 1], collapse="")
}
