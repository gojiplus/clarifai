context("Tag Local Image")

samp_image <- system.file("extdata/metro-north.jpg", package = "clarifai")

test_that("tag_images works ok", {
  skip_on_cran()

  secret_id_file <- file("clarifai_secret_id", "r")
  secret_id_dat  <- suppressWarnings(readLines(secret_id_file))
  secret_id(unlist(strsplit(secret_id_dat, ",")))
  close(secret_id_file)

  get_token()
  tag <- tag_images(samp_image, meta = TRUE)
  expect_that(tag, is_a("list"))
})
