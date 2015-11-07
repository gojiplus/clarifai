#' Tag Remote Images
#'
#' @param img_url path to the image
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' tag_image_url(img_url="url_of_image")
#' }

tag_image_url <- function(img_url=NULL)
{
    clarifai_CHECKAUTH()
    
	# if(RCurl::url.exists(img_url))
    
    h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	handle_setform(h, url= URLencode(img_url))
	# multiple url = URLencode(img_url2)
	tag_con    <- curl_fetch_memory("https://api.clarifai.com/v1/tag/", handle=h)
	tag        <- fromJSON(rawToChar(tag_con$content))

	return(invisible(tag))
}

