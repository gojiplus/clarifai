# clarifai 0.4.2

* Letting go of invisible returns as they seem to confuse people
* Moved clarifai_check_token to POST with exception for get_token
* 

# clarifai 0.4.1

* Moved clarifai_check_token() to clarifai_GET() for functions that rely on clarifai_GET()
* Added a comment asking people to call secret_id() and get_token() in each example

# clarifai 0.4.0

* Rationalized internals. GET and POST abstracted out, except for feedback
* Better documentation.
* Supports color for remote images, models
* Return for image tags was changed by clarifai, adjusted code to handle that
* Supports languages

# clarifai 0.3.1

* Clarifai removed link to metro north. Fixed that by changing to GitHub.

# clarifai 0.3.0

* Support for color, languages, usage 
* More tests

# clarifai 0.2.0

* Bug fix: cases where fewer than 20 tags are returned now handled nicely  
* More unit tests added  
* New vignette  
  