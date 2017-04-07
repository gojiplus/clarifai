#' Tag Remote Images
#'
#' @param img_urls A string or character vector of URLs of images for which you want tags
#' @param meta Boolean that toggles whether or not you want the entire object. 
#' @param simplify Boolean that toggles whether or not you want a simplified data frame with
#' each label and associated probability in a separate row. Default is TRUE.
#' @param model For topic specific answers. Optional. 
#' Can be one of the following: general-v1.3, nsfw-v1.0, weddings-v1.0, travel-v1.0, food-items-v0.1
#' Default is NULL
#' @param language Return tag in another language than english. 2 digit code. Optional. 
#' See \code{list{get_langs}} for the supported languages and their 2 digit codes.
#' @param \dots Additional arguments passed to \code{\link{clarifai_POST}}.
#' 
#' The entire object returned by the API contains a lot of meta data. 
#' By default a simplified data.frame with img_url, associated labels, and probabilities is returned. 
#' 
#' @return If meta is TRUE, a named list of length 4 with following elements is returned: 
#' \code{status_code} OK or not
#' \code{status_msg}  Successful or not
#' \code{meta} Named list of 1 containing another list named \code{tag}
#' Sublist \code{tag} has three elements: \code{timestamp}, \code{model} and \code{config}
#' \code{results} is a data.frame of length 6 and 1 row. Column names are:
#' \code{docid}, \code{status_code}, \code{status_msg}, \code{local_id} and 
#' a data.frame named tag which has a data.frame result which contains two columns: 
#' labels and probabilities
#' 
#' If \code{meta} is FALSE and \code{simplify} is TRUE,
#' a data.frame with three columns: \code{img_urls}, \code{labels} and \code{probs} returned
#'
#' If \code{meta} is FALSE and \code{simplify} is FALSE,
#' a data.frame with two columns carrying a vector of labels, vector of probs is returned
#' for each image
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @seealso \code{\link{tag_images}}
#' 
#' @examples \dontrun{
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' # and get token via get_token()
#' 
#' tag_image_urls(img_urls="url_of_image")
#' tag_image_urls("https://samples.clarifai.com/metro-north.jpg")
#' tag_image_urls("https://samples.clarifai.com/metro-north.jpg", language="es")
#' tag_image_urls("https://samples.clarifai.com/nsfw.jpg", model="nsfw-v1.0")
#' }

tag_image_urls <- function(img_urls = NULL, model = NULL, language = NULL, meta = FALSE, simplify = TRUE, ...) {
    
    if (is.null(img_urls)) stop("Please specify a valid image url.", call. = FALSE)
    
    clarifai_check_token()

    query        <- as.list(img_urls)
    names(query) <- rep("url", length(query))
    query        <- c(query, model = model, language = language)

	tag <- clarifai_POST(path="tag/", query, ...)
	
	if (tag$status_code!="OK") {
		print(tag$status)
		return(list())
	}

	if (identical(meta, FALSE)) {
		
		if (identical(simplify, TRUE)) {
        
		   tags            <- lapply(tag$results$result$tag$classes, unlist)
		   concept_ids     <- lapply(tag$results$result$tag$concept_ids, unlist)
		   probs           <- lapply(tag$results$result$tag$probs, unlist)
		   tags_probs      <- do.call(rbind, Map(cbind, tags, probs, concept_ids))
		   len             <- sapply(probs, length)
		   tags_probs_imgs <- data.frame(img_urls = rep(img_urls, len), tags_probs)
		   names(tags_probs_imgs) <- c("img_url", "tags", "probs", "concept_ids")
		   return(tags_probs_imgs)
		}

		return(tag$results$result$tag)

	}

	tag
}

