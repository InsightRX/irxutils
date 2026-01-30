#' Get a random sequence of letters and numbers of size `n`
#'
#' @param prefix optional prefix
#'
#' @returns character
#' 
#' @export
#' 
get_random_id <- function(prefix = NULL, n = 6) {
  paste0(
    prefix,
    paste0(
      sample(c(letters, LETTERS, 0:9), n, replace = TRUE),
      collapse = ""
    )
  )
}