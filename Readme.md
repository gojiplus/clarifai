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

Next, get the token (it also sets it):
```{r}
get_token()
``

Next, let's play. Get tags of an image:

```{r}
tag_image_url("http://www.clarifai.com/img/metro-north.jpg")
```

Get information about your application:
```{r}
get_info()
```

#### License
Scripts are released under [GNU V3](http://www.gnu.org/licenses/gpl-3.0.en.html).