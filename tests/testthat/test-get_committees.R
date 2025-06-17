test_that("test that result is a dataframe", {
  d <- get_committees()
  
  expect_s3_class(d, "data.frame")
})

test_that("function error when with term < 3", {

  expect_error(get_committees(term = 2))
})