#' Get Information
#'
#' Basic information about the application --- what are maximum sizes allowed, 
#' default language, max. and min. image and video size, max. batch size, etc.
#' 
#' @param \dots Additional arguments passed to \code{\link{clarifai_GET}}.
#' 
#' 
#' @return Named list of length 3: \code{status_code}, \code{status_msg}, and \code{results}. 
#' \code{results} is a named list of length 12. Contains information about max. and 
#' min. image and video size allowed etc. 
#' 
#' Prints \code{status_msg} by default 
#' 
#' @export
#' 
#' @references \url{https://developer.clarifai.com/}
#' 
#' @examples \dontrun{
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' # and get token via get_token()
#' 
#' get_info()
#' }

get_info <- function(...) {
	
	info <- clarifai_GET(path="info/", query=NULL, ...)

	# Print some important things
	cat("Status message: ", info$status_msg, "\n")

	return(invisible(info))

}