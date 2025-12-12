test_that("%<=% gives expected result", {
  expect_true(((4 - 2) / 10) %<=% (1 - 0.8))
  expect_equal(1:4 %<=% 3, c(TRUE, TRUE, TRUE, FALSE))
  expect_equal(1 %<=% NA, NA)
  expect_equal(1:2 %<=% NA, c(NA, NA))
})
