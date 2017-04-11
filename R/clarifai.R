#' @title clarifai: Get Description of (Moving) Images
#' 
#' @name clarifai-package
#' @aliases clarifai
#'
#' @description Get Description of Images. Understand what is in the images. See \url{http://clarifai.com/}. 
#' Details about results of calls to the API can be found at \url{https://developer.clarifai.com}.
#'
#' Your need credentials to use this application. 
#' If you haven't already, you can get this at \url{https://developer.clarifai.com/}.
#'
#' @seealso \code{\link{get_token}}
#'  
#' @importFrom utils URLencode
#' @import curl
#' @importFrom jsonlite fromJSON 
#' @docType package
#' @author Gaurav Sood
NULL

#' 
#' Base POST AND GET functions. Not exported.

#'
#' POST
#' 
#' @param path path to specific API request URL 
#' @param query query list 
#' @param \dots Additional arguments passed to \code{\link[curl]{curl_fetch_memory}}.
#' 
#' @return list
#' 

clarifai_POST <- 
function(path, query = NULL, ...) {

	if (path != "token/") clarifai_check_token()

	full_path <- paste0("https://api.clarifai.com/v1/", path)

	h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	handle_setform(h, .list=query)

	con    <- curl_fetch_memory(full_path, handle=h, ...)
	res    <- fromJSON(rawToChar(con$content))
	
	clarifai_check_results(res)

	res
}

#'
#' GET
#' 
#' @param path path to specific API request URL 
#' @param query query list 
#' @param \dots Additional arguments passed to \code{\link[curl]{curl_fetch_memory}}.
#' 
#' @return list
#' 

clarifai_GET <- 
function(path, query, ...) {

	clarifai_check_token()

	full_path <- paste0("https://api.clarifai.com/v1/", path)

	h <- new_handle()
	handle_setopt(h,  customrequest = "GET")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", Sys.getenv("ClarifaiToken")))
	
	con    <- curl_fetch_memory(full_path, handle=h, ...)
	res    <- fromJSON(rawToChar(con$content))
	
	clarifai_check_results(res)

	res
}

#' Check if authentication information is in the environment
#' 

clarifai_check_auth <- function() {

	app_id = Sys.getenv('ClarifaiId')
	app_pass = Sys.getenv('ClarifaiSecret')

    if(identical(app_id, "") | identical(app_pass, "")) stop("Please set application token using secret_id(c('app_id', 'app_pass')).\n After that, set token using get_token()")
}

#' Check if authentication token is in the environment
#'

clarifai_check_token <- function() {

	app_token = Sys.getenv('ClarifaiToken')
    if(identical(app_token, "")) stop("Please get a token using get_token()")

}

#' Check results
#' @param res results being returned by the API

clarifai_check_results <- function(res) {

	if ("detail" %in% names(res)) print(res$detail)
	
}
