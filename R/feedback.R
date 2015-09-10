#' Provide Feedback on Tags of an Image
#'
#' Suggest tags, suggest removal of tags, suggest (dis)similar documents, or let clarifai know which tag was clicked on 
#' 
#' @param feedback_type must be one of the following types:
#' add_tags vector of suggested tags; default
#' remove_tags vector of tags you suggest be removed
#' search_click which tag(s) where clicked on
#' similar_docids similar documents 
#' dissimilar_docids dissimilar documents
#' @export
#' @references \url{https://developer.clarifai.com/}
#' @examples \dontrun{
#' feedback(file_path="path_to_image", feedback_type="add_tags", feedback_value="suggested_tag")
#' }

feedback <- function(file_path = path_to_image, feedback_type='add_tags', feedback_value="")
{
    app_id=getOption("ClarifaiId"); app_pass=getOption("ClarifaiSecret")
    if(is.null(app_id) | is.null(app_pass)) stop("Please set application id and password using secret_id(c('app_id', 'app_pass')).")
	
    h <- new_handle()
	handle_setopt(h,  customrequest = "POST")
	handle_setheaders(h, "Authorization" = paste0("Bearer ", getOption("ClarifaiToken")))

	switch(feedback_type, 
						add_tags     = {handle_setform(h, encoded_image = form_file(file_path), add_tags          = feedback_value)},
						remove_tags  = {handle_setform(h, encoded_image = form_file(file_path), remove_tags       = feedback_value)},
						search_click = {handle_setform(h, encoded_image = form_file(file_path), search_click      = feedback_value)},
						search_click = {handle_setform(h, encoded_image = form_file(file_path), similar_docids    = feedback_value)},
						search_click = {handle_setform(h, encoded_image = form_file(file_path), dissimilar_docids = feedback_value)})
	

	tag_con    <- curl_fetch_memory("https://api.clarifai.com/v1/feedback/", handle=h)
	tag        <- fromJSON(rawToChar(tag_con$content))
	tag

	return(invisible(tag))

}

