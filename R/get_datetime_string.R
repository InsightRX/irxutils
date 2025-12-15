#' Get datetime as a string, e.g. 202405070550
#' 
#' @export
get_datetime_string <- function() {
  gsub("[a-zA-Z \\:\\-]", "", substr(as.character(lubridate::now()), 1, 16))
}
