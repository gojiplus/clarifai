#' Tag Images on the Computer
#'
#' @param file_paths a vactor of paths to image file(s) for which you want tags
#' @inheritParams tag_image_urls
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
#' If meta is FALSE and simplify is TRUE,
#' a data.frame with three columns: file_paths, labels and probs returned
#'
#' If meta is FALSE and simplify is FALSE,
#' a data.frame with two columns carrying a vector of labels, vector of probs is returned
#' for each image
#' 
#' @export
#' 
#' @references \url{https://developer.clarifai.com/}
#' 
#' @seealso \code{\link{tag_image_urls}}
#' 
#' @examples \dontrun{
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' # and get token via get_token()
#' 
#' tag_images(file_paths="path_to_image")
#' }


tag_images <- function(file_paths=NULL, model=NULL, language = NULL, meta=FALSE, simplify=TRUE, ...) {
	        
    if (! all(file.exists(file_paths))) stop("File Doesn't Exist. Please check the path.", call. = FALSE)

    query <- lapply(file_paths, form_file)
	names(query) <- rep("encoded_image", length(query))
	query$model <- model
	query$language <- language

	if (is.null(model)) {    
		tag <- clarifai_POST(path="tag/", query, ...)
	} else {
		query$model <- model
		tag <- clarifai_POST(path="tag/", query, ...)
	}

	if (identical(meta, FALSE)) {
		
		if (identical(simplify, TRUE)) {
        
		   tags  <- lapply(tag$results$result$tag$classes, unlist)
		   concept_ids <- lapply(tag$results$result$tag$concept_ids, unlist)
		   probs <- lapply(tag$results$result$tag$probs, unlist)
		   tags_probs <- do.call(rbind, Map(cbind, tags, probs, concept_ids))
		   len <- sapply(probs, length)
		   tags_probs_imgs <- data.frame(file_paths=rep(file_paths, len), tags_probs)
		   names(tags_probs_imgs) <- c("file_paths", "tags", "probs", "concept_ids")
		   return(tags_probs_imgs)
		}

		return(tag$results$result$tag)

	}

	tag

}

