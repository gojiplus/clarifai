context("Get Token")

test_that("get_token works well", {
  skip_on_cran()

  secret_id_file <- file("clarifai_secret_id", "r")
  secret_id_dat  <- suppressWarnings(readLines(secret_id_file))
  secret_id(unlist(strsplit(secret_id_dat, ",")))
  close(secret_id_file)

  get_token()
  expect_that(Sys.getenv("ClarifaiToken"), is_a("character"))
})
