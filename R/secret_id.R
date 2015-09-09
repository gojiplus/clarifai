#' Sets Application ID and Secret
#'
#' Set Client ID and Secret. Needed for interfacing with Clarifai. Run this before anything else.
#' @param appdetails Required; A vector of client_id, client_secret. Get these from \url{https://developer.clarifai.com/}. 
#' Set them before you use other functions.
#' @keywords Sets Client ID and Secret
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' setapp(c("client_id", "client_secret"))
#' }

secret_id <- function(appdetails=NULL){
    if(!is.null(appdetails))
        options(ClarifaiId = appdetails[1], ClarifaiSecret=appdetails[2])
    else
        return(getOption('ClarifaiId'))    
}

