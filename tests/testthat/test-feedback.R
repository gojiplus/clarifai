context("Get App. Info.")

token <- c(Sys.getenv('ClarifaiId'), Sys.getenv('ClarifaiSecret'))

image <- system.file("extdata/metro-north.jpg", package = "clarifai")

test_that("get_info happens successfully", {
  skip_on_cran()
  secret_id(token)
  get_token()
  get_info <- feedback(file_path = image, feedback_type='add_tags', feedback_value="Train")
  expect_that(get_info, is_a("list"))
})