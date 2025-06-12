test_that("test that result is a dataframe", {
  d <- get_legislation()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_legislation(term = 2)
  
  expect_s3_class(d, "data.frame")
})

test_that("can't get negative n", {

  expect_error(get_legislation(n = -1))
})

test_that("can't get non-integer n", {

  expect_error(get_legislation(n = .5))
})
