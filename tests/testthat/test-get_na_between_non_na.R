test_that("returns numeric indices", {
  x <- c(1, NA, 2)
  expect_type(get_na_between_non_na(x), "integer")
})

test_that("returns index of single NA between two non-NA values", {
  x <- c(1, NA, 2)
  expect_equal(get_na_between_non_na(x), 2)
})

test_that("returns indices of NA values between two non-NA values", {
  x <- c(NA, 2, 3, NA, 5, NA, 7, NA, NA, 10, NA)
  expect_equal(get_na_between_non_na(x), c(4, 6, 8, 9))
})

test_that("returns indices of multiple consecutive NAs between non-NA values", {
  x <- c(1, NA, NA, NA, 2)
  expect_equal(get_na_between_non_na(x), c(2, 3, 4))
})

test_that("returns NULL when there are no NAs", {
  x <- c(1, 2, 3, 4, 5)
  expect_null(get_na_between_non_na(x))
})

test_that("returns NULL when all values are NA", {
  x <- c(NA, NA, NA)
  expect_null(get_na_between_non_na(x))
})

test_that("returns NULL when only leading NAs before first non-NA value", {
  x <- c(NA, NA, 1, 2, 3)
  expect_null(get_na_between_non_na(x))
})

test_that("returns NULL when only trailing NAs after last non-NA value", {
  x <- c(1, 2, 3, NA, NA)
  expect_null(get_na_between_non_na(x))
})

test_that("works with non-numeric vectors", {
  x <- c("a", NA, "b", NA, NA, "c")
  expect_equal(get_na_between_non_na(x), c(2, 4, 5))
})

test_that("handles vectors of length one correctly", {
  expect_null(get_na_between_non_na(NA))
  expect_null(get_na_between_non_na(1))
})

test_that("return correct TRUE/FALSE", {
  x1 <- c(NA, 1, 2, 3, NA, 4) # 5
  x2 <- c(NA, 1, 2, 3, NA, NA) # null
  x3 <- c(NA, 1, NA, 3, NA, NA) # 3
  x4 <- c(1, NA, 3, NA, NA) # 2
  x5 <- c(1, NA, 3, NA, 9, NA) # 2, 4
  x6 <- c(1, NA, NA, NA, NA) # null
  expect_equal(get_na_between_non_na(x1), 5)
  expect_null(get_na_between_non_na(x2))
  expect_equal(get_na_between_non_na(x3), 3)
  expect_equal(get_na_between_non_na(x4), 2)
  expect_equal(get_na_between_non_na(x5), c(2, 4))
  expect_null(get_na_between_non_na(x6))
})
