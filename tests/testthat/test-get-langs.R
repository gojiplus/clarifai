context("Get List of Languages")

test_that("get_langs happens successfully", {
  skip_on_cran()

  secret_id_file <- file("clarifai_secret_id", "r")
  secret_id_dat  <- suppressWarnings(readLines(secret_id_file))
  secret_id(unlist(strsplit(secret_id_dat, ",")))
  close(secret_id_file)

  get_token()
  get_langs <- get_langs()
  expect_that(get_langs, is_a("character"))
})
