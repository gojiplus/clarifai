### clarifai: R Client for the Clarifai API

[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/soodoku/clarifai.svg?branch=master)](https://travis-ci.org/soodoku/clarifai)

Find out what is in a (moving) image with perhaps the best off-the-shelf solution: [clarifai.com](http://clarifai.com). Clarifai provides descriptors for images along with how confident it is about each of the descriptors. It is a bit magical. (See also the 2013 [ImageNet LSVR Classification Results](http://www.image-net.org/challenges/LSVRC/2013/results.php).)

### Installation

To get the current development version from GitHub:

```{r install}
install.packages("devtools")
devtools::install_github("soodoku/clarifai")
```


### Using clarifai
-----------------------------------

Load up the lib:
```{r load_lib}
library(clarifai)
```

#### Authentication

Start by setting Client ID and secret, which you can get from [https://developer.clarifai.com/](https://developer.clarifai.com/)
```{r}
secret_id(c("client_id", "secret"))
```

Next, get the token (the function also sets it):
```{r}
get_token()
```

#### Get Information

Get information about your application:
```{r}
get_info()
```

#### Get Tags

We are now all set. Let's play. Get tags of a remote image:

![Metro North](https://raw.githubusercontent.com/soodoku/clarifai/master/inst/extdata/metro-north.jpg)

```{r}
res <- tag_image_url("http://www.clarifai.com/img/metro-north.jpg")

res$results[,6][[1]][[1]][[2]][1:5]
## "train"          "railroad"       "station"        "rail"           "transportation"

res$results[,6][[1]][[2]][[1]][1:5]
## 0.9993986 0.9980315 0.9970427 0.9950421 0.9950128
```

Get tags for a local image:
```{r}
tag_image("path_to_img")
```

Provide feedback about tags for an image, including suggesting new tags, suggesting that some tags be removed etc. 

#### Provide Feedback

```{r feedback}
feedback(file_path="path_to_image", feedback_type="add_tags", feedback_value="suggested_tag")

## $status_code
## [1] "OK"

## $status_msg
## [1] "Feedback successfully recorded. "
```

-----------------------------------
### License
Scripts are released under [MIT License](https://opensource.org/licenses/MIT).
