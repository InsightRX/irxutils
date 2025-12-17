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
