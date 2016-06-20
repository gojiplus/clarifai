#' Get the dominant colors present in images or videos
#'
#' 
#' @param file_paths a vactor of paths to image file(s) for which you want tags
#' 
#' @return Named list of length 3: \code{status_code}, \code{status_msg}, and \code{results}. 
#' \code{results} is a named list of length 12. Contains information about max. and 
#' min. image and video size allowed etc. 
#' 
#' Prints \code{status_msg} by default 
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' 
#' @examples \dontrun{
#' get_color(file_paths="path_to_image")
#' }

get_color <- function(file_paths=NULL) {

	clarifai_check_token()
        
    if (! all(file.exists(file_paths))) stop("File Doesn't Exist. Please check the path.")

    paths <- lapply(file_paths, form_file)
    names(paths) <- rep("encoded_image", length(paths))

    h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	handle_setform(h, .list=paths)

	color_con    <- curl_fetch_memory("https://api.clarifai.com/v1/color/", handle=h)
	color        <- fromJSON(rawToChar(color_con$content))

	return(invisible(color))

}