#' Get the dominant colors present in images or videos
#'
#' 
#' @param img_urls A string or character vector of URLs of images for which you want tags
#' @param meta Boolean that toggles whether or not you want the entire object. Default is FALSE. 
#' When FALSE, the function returns just a data.frame of results
#' 
#' @param \dots Additional arguments passed to \code{\link{clarifai_POST}}.
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
#' get_color_urls("https://samples.clarifai.com/metro-north.jpg")
#' get_color_urls(c("https://samples.clarifai.com/metro-north.jpg", 
#' 					"https://samples.clarifai.com/metro-north.jpg"))
#' }

get_color_urls <- function(img_urls=NULL, meta=FALSE, ...) {

	if (is.null(img_urls)) stop("Please specify a valid image url.", call. = FALSE)

	clarifai_check_token()
    
    query <- as.list(img_urls)
    names(query) <- rep("url", length(query))

	color <- clarifai_POST(path="color/", query, ...)

	if (color$status_code!="OK") {
		print(color$status)
		return(invisible(list()))
	}

	if (!meta) return(invisible(color$results))

	return(invisible(color))

}