test_that("test that result is a dataframe", {
  d <- get_interpellations()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_interpellations(term = 2)
  
  expect_s3_class(d, "data.frame")
})