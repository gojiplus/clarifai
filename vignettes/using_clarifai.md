---
title: "Using clarifai"
author: "Gaurav Sood"
date: "2015-11-10"
vignette: >
  %\VignetteIndexEntry{Using clarifai}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

## Using clarifai

### Installation

To get the current development version from GitHub:



```r
# install.packages("devtools")
devtools::install_github("soodoku/clarifai")
```

#### Load up the lib:


```r
library(clarifai)
```

#### Authentication

Start by setting Client ID and secret, which you can get from [https://developer.clarifai.com/](https://developer.clarifai.com/)


```r
secret_id(c("client_id", "secret"))
```

Next, get the token (the function also sets it):


```r
get_token()
```

#### Get Information

Get information about your application:


```r
get_info()
```

```
## Status message:  All images in request have completed successfully.
```

#### Get Tags

We are now all set. Let's play. Get tags of a remote image:

![Metro North](https://raw.githubusercontent.com/soodoku/clarifai/master/inst/extdata/metro-north.jpg)


```r
res <- tag_image_urls("https://raw.githubusercontent.com/soodoku/clarifai/master/inst/extdata/metro-north.jpg")
head(res)
```

Get tags for a local image:


```r
path <- system.file("inst/extdata/", package = "clarifai")
filep <- paste0(path, "/metro-north.jpg")
tag_images(filep)
```

Provide feedback about tags for an image, including suggesting new tags, suggesting that some tags be removed etc. 

#### Provide Feedback


```r
feedback(file_path="path_to_image", feedback_type="add_tags", feedback_value="suggested_tag")
```
