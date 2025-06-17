test_that("test that result is a dataframe", {
  d <- get_interpellations()
  
  expect_s3_class(d, "data.frame")
})

test_that("function error when with term < 8", {

  expect_error(get_interpellations(term = 7))
})