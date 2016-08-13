#' Get API usage for the current month and hour
#'
#' @param \dots Additional arguments passed to \code{\link{clarifai_GET}}.
#' 
#' @return named list with four items \code{status_code}, \code{status_msg}, \code{results} (user and application details --- credits consumed, total credit)
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_usage()
#' }

get_usage <- function(...) {

	clarifai_check_token()
		
    usage <- clarifai_GET(path="usage/", query=NULL, ...)

	return(invisible(usage))

}
