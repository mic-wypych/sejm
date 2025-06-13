test_that("test that result is a dataframe", {
  d <- get_mps()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_mps(term = 2)
  
  expect_s3_class(d, "data.frame")
})