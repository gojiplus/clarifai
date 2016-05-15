context("Feedback")

image <- system.file("extdata/metro-north.jpg", package = "clarifai")

test_that("feedback works well", {
  skip_on_cran()

  secret_id_file <- file("clarifai_secret_id", "r")
  secret_id_dat  <- suppressWarnings(readLines(secret_id_file))
  secret_id(secret_id)
  close(secret_id_file)

  get_token()
  get_info <- feedback(file_path = image, feedback_type='add_tags', feedback_value="Train")
  expect_that(get_info, is_a("list"))
})