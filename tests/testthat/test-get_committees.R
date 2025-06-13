test_that("test that result is a dataframe", {
  d <- get_committees()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_committees(term = 2)
  
  expect_s3_class(d, "data.frame")
})