context("Tag Local Image")

token <- c(Sys.getenv('ClarifaiId'), Sys.getenv('ClarifaiSecret'))

test_that("tag_image happens successfully", {
  skip_on_cran()
  secret_id(token)
  get_token()
  tag <- tag_image_urls("http://www.clarifai.com/img/metro-north.jpg")
  expect_that(tag, is_a("data.frame"))
})