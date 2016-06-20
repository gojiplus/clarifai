#' List all the languages that the tag API call supports
#'
#'
#' @return character vector listing all the languages that tag API call supports. See \code{\link{tag_images}} and code{\link{tag_image_urls}}
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' list_langs()
#' }

list_langs <- function() {

	clarifai_check_token()
		
    h <- new_handle()
	handle_setopt(h,  customrequest = "GET")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	info_con   <- curl_fetch_memory("https://api.clarifai.com/v1/info/languages/", handle=h)
	info       <- fromJSON(rawToChar(info_con$content))

	langs <- unname(unlist(info[grepl("languages", names(info))]))

	return(invisible(langs))

}