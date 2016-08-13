#' List all the languages that the tag API call supports
#'
#'
#' @param \dots Additional arguments passed to \code{\link{clarifai_GET}}.
#' 
#' 
#' @return character vector listing all the languages that tag API call supports. See \code{\link{tag_images}} and code{\link{tag_image_urls}}
#' 
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_langs()
#' }

get_langs <- function(...) {

	clarifai_check_token()
	
	info <- clarifai_GET(path="info/languages/", query=NULL, ...)

	langs <- unname(unlist(info[grepl("languages", names(info))]))

	return(invisible(langs))

}