#' Get Access Token
#'
#' Once you have set your Application ID and Secret via \link{\code{secret_id}}, get the access token.
#' 
#' @return a list with 4 things: access_token, token_type, expires_in, scope
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' get_token()
#' }

get_token <- function()
{
    app_id=getOption("ClarifaiId"); app_pass=getOption("ClarifaiSecret")
    if(is.null(app_id) | is.null(app_pass)) stop("Please set application id and password using secret_id(c('app_id', 'app_pass')).")
	
    h <- new_handle()
	handle_setopt(h, customrequest = "POST")
	handle_setform(h, grant_type='client_credentials', client_id=app_id, client_secret=app_pass)
	token_con    <- curl_fetch_memory(url="https://api.clarifai.com/v1/token/", handle=h)
	token_info   <- fromJSON(rawToChar(token_con$content))

	options(ClarifaiToken = token_info$access_token)
	return(invisible(token_info))

}


