#' Get Information
#'
#' Learn about the application -- what are maximum sizes allowed etc.
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_info()
#' }

get_info <- function()
{
	app_id = Sys.getenv('ClarifaiId')
	app_pass = Sys.getenv('ClarifaiSecret')

    if(identical(app_id, "") | identical(app_pass, "")) stop("Please set application token using secret_id(c('app_id', 'app_pass')).")
	
    h <- new_handle()
	handle_setopt(h,  customrequest = "GET")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", getOption("ClarifaiToken")))
	info_con   <- curl_fetch_memory("https://api.clarifai.com/v1/info/", handle=h)
	info       <- fromJSON(rawToChar(info_con$content))

	return(invisible(info))

}

