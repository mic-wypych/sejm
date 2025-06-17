
test_that("test that result is a dataframe", {
  d <- get_bil_groups_members()
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various sejm terms", {
  d <- get_bil_groups_members(term = 7)
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for specific group_id", {
  d <- get_bil_groups_members(group_id = 1)
  
  expect_s3_class(d, "data.frame")
})

test_that("function empty list when with term < 5", {

  expect_error(d, get_bil_groups_members(term = 4))
})