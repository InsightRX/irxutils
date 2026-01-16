test_that("returns a character scalar", {
  x <- random_string()
  expect_type(x, "character")
  expect_length(x, 1)
})

test_that("returns correct length", {
  expect_equal(nchar(random_string(1)), 1)
  expect_equal(nchar(random_string(5)), 5)
  expect_equal(nchar(random_string(10)), 10)
})

test_that("contains only lowercase letters", {
  x <- random_string(100)
  expect_true(grepl("^[a-z]+$", x))
})

test_that("returns empty string with n = 0", {
  expect_equal(random_string(0), "")
})

test_that("is reproducible with set.seed()", {
  x1 <- withr::with_seed(123, random_string(n = 6))
  x2 <- withr::with_seed(123, random_string(n = 6))
  expect_identical(x1, x2)
})
