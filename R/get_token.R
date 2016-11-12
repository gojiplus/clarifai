#' Get Access Token
#'
#' Once you have set your Application ID and Secret via \code{\link{secret_id}}, get the access token.
#' 
#' 
#' @param \dots Additional arguments passed to \code{\link{clarifai_POST}}.
#' 
#' @return a list with 4 things: access_token, token_type, expires_in, scope
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' 
#' # Before calling the function, set API secret and id via secret_id(c("client_id", "secret")) 
#' 
#' get_token()
#' }

get_token <- function(...) {
	
	clarifai_check_auth()
	
    token_info <- clarifai_POST(path="token/", query=list(grant_type='client_credentials', client_id=Sys.getenv('ClarifaiId'), client_secret=Sys.getenv('ClarifaiSecret')), ...)

	Sys.setenv(ClarifaiToken = token_info$access_token)
	return(invisible(token_info))

}

