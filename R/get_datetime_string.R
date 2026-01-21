#' Get datetime as a string
#' 
#' Get datetime as a string in the form `"%Y%m%d%H%M"`. Defaults to returning
#' the current datetime.
#'
#' @param x A vector of [POSIXt], numeric, or character objects. Defaults to the
#'   current time.
#'
#' @returns The datetime as a string in the form `"%Y%m%d%H%M"`.
#'
#' @examples
#' get_datetime_string()
#' 
#' @export
get_datetime_string <- function(x = lubridate::now()) {
  format(x, "%Y%m%d%H%M")
}
