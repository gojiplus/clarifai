#' @title clarifai: Get Description of (Moving) Images
#' 
#' @name clarifai-package
#' @aliases clarifai
#'
#' @description Get Description of Images. Understand what is in the images. See \url{http://clarifai.com/}. 
#' Details about results of calls to the API can be found at \url{https://api.clarifai.com}.
#'
#' Your need credentials to use this application. 
#' If you haven't already, you can get this at \url{https://developer.clarifai.com/}.
#' 
#' @importFrom utils URLencode
#' @import curl
#' @importFrom jsonlite fromJSON 
#' @docType package
#' @author Gaurav Sood
NULL

#' Check if authentication information is there
#' 

clarifai_CHECKAUTH <- 
function() {

	app_id = Sys.getenv('ClarifaiId')
	app_pass = Sys.getenv('ClarifaiSecret')

    if(identical(app_id, "") | identical(app_pass, "")) stop("Please set application token using secret_id(c('app_id', 'app_pass')).")

}