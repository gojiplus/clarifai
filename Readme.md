### clarifai: R Client for the Clarifai API

[![GPL-3.0](http://img.shields.io/:license-gpl-blue.svg)](http://opensource.org/licenses/GPL-3.0)

### Installation

To get the current development version from github:

```{r install}
# install.packages("devtools")
# devtools::install_github("soodoku/clarifair")
```

### Usage

Start by setting Client ID and secret, which you can get from [https://developer.clarifai.com/](https://developer.clarifai.com/)
```{r}
secret_id(c("client_id", "secret"))
```

Next, get the token (the function also sets it):
```{r}
get_token()
```

We are now all set. Let's play. Get tags of a remote image:

```{r}
res <- tag_image_url("http://www.clarifai.com/img/metro-north.jpg")

res$results[,6][[1]][[1]][[2]][1:5]
## "train"          "railroad"       "station"        "rail"           "transportation"

res$results[,6][[1]][[2]][[1]][1:5]
## 0.9993986 0.9980315 0.9970427 0.9950421 0.9950128
```

Get information about your application:
```{r}
get_info()
```

Get tags for a local image:
```{r}
tag_image("path_to_img")
```

#### License
Scripts are released under [GNU V3](http://www.gnu.org/licenses/gpl-3.0.en.html).