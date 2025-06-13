test_that("test that result is a dataframe", {
  d <- get_bil_groups()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_bil_groups(term = 7)
  
  expect_s3_class(d, "data.frame")
})

test_that("function empty list when with term < 5", {
  d <- get_bil_groups(term = 2)
  
  expect_equal(d, list())
})
