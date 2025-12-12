#' Convert underscores to dots
#' 
#' @export
underscores_to_dots <- function(x) gsub("_", "\\.", x)

#' Convert dots to underscores
#' 
#' @export
dots_to_underscores <- function(x) gsub("\\.", "_", x)
