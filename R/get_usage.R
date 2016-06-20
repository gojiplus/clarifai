#' Get API usage for the current month and hour
#'
#'
#' @return named list 
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_usage()
#' }

get_usage <- function() {

	clarifai_check_token()
		
    h <- new_handle()
	handle_setopt(h,  customrequest = "GET")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	usage_con   <- curl_fetch_memory("https://api.clarifai.com/v1/usage/", handle=h)
	usage       <- fromJSON(rawToChar(usage_con$content))

	return(invisible(usage))

}