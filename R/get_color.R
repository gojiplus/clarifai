#' Get the dominant colors present in images or videos
#'
#' 
#' @param file_paths a vactor of paths to image file(s) for which you want tags
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
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' # and get token via get_token()
#' 
#' get_color(file_paths="path_to_image")
#' }

get_color <- function(file_paths=NULL, ...) {
        
    if (! all(file.exists(file_paths))) stop("One or more of the files don't exist. Please check the path.", call. = FALSE)

    query <- lapply(file_paths, form_file)
    names(query) <- rep("encoded_image", length(query))

	color <- clarifai_POST(path="color/", query, ...)

	color

}