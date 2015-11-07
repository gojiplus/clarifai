#' Tag Local Images
#'
#' @param file_path path to image file
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' tag_image(file_path="path_to_image")
#' }

tag_image<- function(file_path=NULL) {
	
    app_id = Sys.getenv('ClarifaiId')
	app_pass = Sys.getenv('ClarifaiSecret')

    if(identical(app_id, "") | identical(app_pass, "")) stop("Please set application token using secret_id(c('app_id', 'app_pass')).")

	# if(RCurl::url.exists(img_url))
    
    h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", getOption("ClarifaiToken")))
	handle_setform(h, encoded_image = form_file(file_path))

	tag_con    <- curl_fetch_memory("https://api.clarifai.com/v1/tag/", handle=h)
	tag        <- fromJSON(rawToChar(tag_con$content))

	return(invisible(tag))

}

