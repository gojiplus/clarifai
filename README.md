## clarifai: R Client for the Clarifai API

[![Build Status](https://travis-ci.org/soodoku/clarifai.svg?branch=master)](https://travis-ci.org/soodoku/clarifai)
[![Build status](https://ci.appveyor.com/api/projects/status/4aa0x74ggm51075o?svg=true)](https://ci.appveyor.com/project/soodoku/clarifai)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/clarifai)](http://cran.r-project.org/package=clarifai)

Find out what is in a (moving) image with perhaps the best off-the-shelf solution: [clarifai.com](http://clarifai.com). Clarifai provides descriptors for images along with how confident it is about each of the descriptors. It is a bit magical. (See also the 2013 [ImageNet LSVR Classification Results](http://www.image-net.org/challenges/LSVRC/2013/results.php).)

### Installation

To get the current development version from GitHub:

```r
install.packages("devtools")
devtools::install_github("soodoku/clarifai")
```


### Using clarifai
-----------------------------------

Load up the lib:
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

#### Get Tags

We are now all set. Let's play. Get tags of a remote image:

![Metro North](http://www.clarifai.com/img/metro-north.jpg)

```r
tag_image_url("http://www.clarifai.com/img/metro-north.jpg")

##           labels     probs
## 1          train 0.9993986
## 2       railroad 0.9980315
## 3        station 0.9970427
## 4           rail 0.9950421
## 5 transportation 0.9950128
## 6       platform 0.9949192
```

Get tags for a local image:
```r
tag_image("path_to_img")
```

Provide feedback about tags for an image, including suggesting new tags, suggesting that some tags be removed etc. 

#### Provide Feedback

```r
feedback(file_path="path_to_image", feedback_type="add_tags", feedback_value="suggested_tag")

## $status_code
## [1] "OK"

## $status_msg
## [1] "Feedback successfully recorded. "
```

-----------------------------------
### License
Scripts are released under [MIT License](https://opensource.org/licenses/MIT).
