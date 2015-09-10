#' Get Information
#'
#' Learn about the application -- what are maximum sizes allowed etc.
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_token()
#' }

get_info <- function()
{
    app_id=getOption("ClarifaiId"); app_pass=getOption("ClarifaiSecret")
    if(is.null(app_id) | is.null(app_pass)) stop("Please set application id and password using secret_id(c('app_id', 'app_pass')).")
	
    h <- new_handle()
	handle_setopt(h,  customrequest = "GET")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", getOption("ClarifaiToken")))
	info_con   <- curl_fetch_memory("https://api.clarifai.com/v1/info/", handle=h)
	info       <- fromJSON(rawToChar(info_con$content))

	return(invisible(info))

}

