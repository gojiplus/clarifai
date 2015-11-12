## clarifai: R Client for the Clarifai API

[![Build Status](https://travis-ci.org/soodoku/clarifai.svg?branch=master)](https://travis-ci.org/soodoku/clarifai)
[![Build status](https://ci.appveyor.com/api/projects/status/4aa0x74ggm51075o?svg=true)](https://ci.appveyor.com/project/soodoku/clarifai)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/clarifai)](http://cran.r-project.org/package=clarifai)
![](http://cranlogs.r-pkg.org/badges/grand-total/clarifai)

Find out what is in a (moving) image with perhaps the best off-the-shelf solution: [clarifai.com](http://clarifai.com). Clarifai provides descriptors for images along with how confident it is about each of the descriptors. It is a bit magical. (See also the 2013 [ImageNet LSVR Classification Results](http://www.image-net.org/challenges/LSVRC/2013/results.php).)

### Installation

To get the current released version from CRAN:
```r
install.packages("clarifai")
```

To get the current development version from GitHub:

```r
install.packages("devtools")
devtools::install_github("soodoku/clarifai", build_vignettes = TRUE)
```

To learn about how to use clarifai, [read the vignette](vignettes/using_clarifai.Rmd) or launch it within R:
```r
vignette("using_clarifai", package = "clarifai")
```

-----------------------------------
### License
Scripts are released under [MIT License](https://opensource.org/licenses/MIT).
