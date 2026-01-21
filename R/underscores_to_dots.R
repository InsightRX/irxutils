#' Convert underscores to dots (and vice versa)
#' 
#' @param x A character vector.
#' 
#' @returns The character vector `x`, with all underscores converted to dots for
#'   `underscores_to_dots()` and all dots converted to underscores for
#'   `dots_to_underscores()`.
#'
#' @examples
#' underscores_to_dots(c("a_b_c", "d_e_f"))
#' dots_to_underscores(c("a.b.c", "d.e.f"))
#' 
#' @export
underscores_to_dots <- function(x) gsub("_", "\\.", x)

#' @rdname underscores_to_dots
#' @export
dots_to_underscores <- function(x) gsub("\\.", "_", x)
