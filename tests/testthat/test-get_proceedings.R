test_that("test that result is a dataframe", {
  d <- get_proceedings()
  
  expect_s3_class(d, "data.frame")
})

test_that("function fail if term <7 as there is no data there", {

  expect_error(get_proceedings(term = 6))
})

#there is a problem with get_proceedings with term < 7. It returns an empty list.
# is there no data on proceedings before 7th term?
#