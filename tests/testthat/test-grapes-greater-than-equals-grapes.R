test_that("%>=% behaves like >= for exact comparisons", {
  expect_equal(1 %>=% 1, 1 >= 1)
  expect_equal(2 %>=% 1, 2 >= 1)
  expect_equal(1 %>=% 2, 1 >= 2)
  expect_equal(c(1, 2, 3) %>=% c(1, 1, 3), c(1, 2, 3) >= c(1, 1, 3))
})

test_that("%<=% behaves like <= for exact comparisons", {
  expect_equal(1 %<=% 1, 1 <= 1)
  expect_equal(1 %<=% 2, 1 <= 2)
  expect_equal(2 %<=% 1, 2 <= 1)
  expect_equal(c(1, 2, 3) %<=% c(1, 3, 3), c(1, 2, 3) <= c(1, 3, 3))
})

test_that("%>=% tolerates floating point error where >= fails", {
  x <- 0.7 - 0.4
  y <- 0.3
  expect_false(x >= y)
  expect_true(x %>=% y)
})

test_that("%<=% tolerates floating point error where <= fails", {
  x <- 0.3
  y <- 0.7 - 0.4
  expect_false(x <= y)
  expect_true(x %<=% y)
})

test_that("%>=% gives expected result", {
  expect_true((1 - 0.8) %>=% ((4 - 2) / 10))
  expect_equal(1:4 %>=% 3, c(FALSE, FALSE, TRUE, TRUE))
  expect_equal(1 %>=% NA, NA)
  expect_equal(1:2 %>=% NA, c(NA, NA))
})

test_that("%<=% gives expected result", {
  expect_true(((4 - 2) / 10) %<=% (1 - 0.8))
  expect_equal(1:4 %<=% 3, c(TRUE, TRUE, TRUE, FALSE))
  expect_equal(1 %<=% NA, NA)
  expect_equal(1:2 %<=% NA, c(NA, NA))
})

test_that("safe operators work element-wise for vectors", {
  x <- c(0.7 - 0.4, 1.0, 2.0)
  y <- c(0.3, 1.0, 2.1)
  expect_equal(x %>=% y, c(TRUE, TRUE, FALSE))
  expect_equal(x %<=% y, c(TRUE, TRUE, TRUE))
})

test_that("safe operators return logical(0) if either input is empty", {
  expect_equal(numeric(0) %>=% 1, logical(0))
  expect_equal(1 %>=% numeric(0), logical(0))
  expect_equal(numeric(0) %<=% numeric(0), logical(0))
})

test_that("safe operators respect vector recycling behavior", {
  x <- c(1, 2, 3)
  y <- 2
  expect_equal(x %>=% y, c(FALSE, TRUE, TRUE))
  expect_equal(x %<=% y, c(TRUE, TRUE, FALSE))
})

test_that("safe operators handle NA values consistently", {
  expect_equal(NA %>=% 1, NA)
  expect_equal(1 %<=% NA, NA)
  expect_equal(c(1, NA, 3) %>=% c(1, 2, NA), c(TRUE, NA, NA))
})
