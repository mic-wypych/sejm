test_that("test that result is a dataframe", {
  d <- get_votes()
  
  expect_s3_class(d, "data.frame")
})

test_that("function error when with term < 7", {

  expect_error(get_votes(term = 6))
})