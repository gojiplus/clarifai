#' Tag Remote Images
#'
#' @param img_url URL of the image for which you want tags
#' @param meta Boolean that toggles whether or not you want 
#' the entire object. The entire object returned by the API contains
#' a lot of meta data. By default a data.frame with labels and probabilities
#' is returned. 
#' 
#' @return If meta is TRUE, a named list of length 4 with following elements is returned: 
#' \code{status_code} OK or not
#' \code{status_msg}  Successful or not
#' \code{meta} Named list of 1 containing another list named \code{tag}
#' Sublist \code{tag} has three elements: timestamp, model and config
#' \code{results} is a data.frame of length 6 and 1 row. Column names are:
#' \code{docid}, \code{status_code}, \code{status_msg}, \code{local_id} and 
#' a data.frame named tag which has a data.frame result which contains two columns: 
#' labels and probabilities
#' 
#' If meta is FALSE and if labels are returned successfully,
#' a data.frame with two columns: labels and probs returned
#' Initial few rows of the data.frame are printed by default
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @seealso \code{\link{tag_image}}
#' @examples \dontrun{
#' tag_image_url(img_url="url_of_image")
#' }

tag_image_url <- function(img_url=NULL, meta=FALSE) {
    
    clarifai_check_token()
    
	# if(RCurl::url.exists(img_url))
    
    h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	handle_setform(h, url= URLencode(img_url))
	# multiple url = URLencode(img_url2)
	tag_con    <- curl_fetch_memory("https://api.clarifai.com/v1/tag/", handle=h)
	tag        <- fromJSON(rawToChar(tag_con$content))

	if (tag$results$status_msg=="OK") {

		if (!meta) {
			labels <- unlist(tag$results$result$tag[[1]])
			probs  <- unlist(tag$results$result$tag[[2]])
			res <- data.frame(labels, probs)
			print(head(res))
			return(invisible(res))
		}
	} 

	return(invisible(tag))
}

