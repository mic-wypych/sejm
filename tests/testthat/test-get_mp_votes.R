test_that("test that result is a dataframe", {
  d <- get_mp_votes()
  
  expect_s3_class(d, "data.frame")
})

test_that("function error when with term < 7", {

  expect_error(get_mp_votes(term = 6))
})

test_that("function works for various proceedings", {
  d <- get_mp_votes(proceeding = 2)
  
  expect_s3_class(d, "data.frame")
})

test_that("function works for various vote ids", {
  d <- get_mp_votes(proceeding = 1, vote_id = 2)
  
  expect_s3_class(d, "data.frame")
})

#there is a problem with get_proceedings for low 