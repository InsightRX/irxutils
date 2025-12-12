#' Convert underscores to dots
#' 
underscores_to_dots <- function(x) gsub("_", "\\.", x)

#' Convert dots to underscores
#' 
dots_to_underscores <- function(x) gsub("\\.", "_", x)
