test_that("test that result is a dataframe", {
  d <- get_parties()
  
  expect_s3_class(d, "data.frame")
})

test_that("function error when with term < 6", {

  expect_error(d, get_parties(term = 5))
})