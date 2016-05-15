context("Tag Remote Images")

test_that("tag_image_urls works ok", {
  skip_on_cran()
  
  secret_id_file <- file("clarifai_secret_id", "r")
  secret_id_dat  <- suppressWarnings(readLines(secret_id_file))
  secret_id(unlist(strsplit(secret_id_dat, ",")))
  close(secret_id_file)

  get_token()
  tag <- tag_image_urls("http://www.clarifai.com/img/metro-north.jpg")
  expect_that(tag, is_a("data.frame"))
})