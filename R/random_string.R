#' Random string
#'
#' @param n number of characters for random string
#' 
#' @export
random_string <- function(n = 5) {
  paste(letters[floor(runif(n, 0, 26)) + 1], collapse="")
}
