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
#' 
#' @examples \dontrun{
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' # and get token via get_token()
#' 
#' get_langs()
#' }

get_langs <- function(...) {
	
	info <- clarifai_GET(path="info/languages/", query=NULL, ...)

	langs <- unname(unlist(info[grepl("languages", names(info))]))

	langs

}