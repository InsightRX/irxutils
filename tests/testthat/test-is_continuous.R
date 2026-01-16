# TODO: review tests, see if expectations are concordant with what we want
# is_continuous() to do. Update if needed, these aren't sacred yet.

test_that("numeric vectors are classified as continuous", {
  expect_true(is_continuous(1:10))
  expect_true(is_continuous(c(1, 3, 5, 7)))
  expect_true(is_continuous(runif(10)))
})

test_that("character vectors that are numeric are classified as continuous", {
  x <- c("1", "2", "3.5", "4")
  expect_true(is_continuous(x))
})

test_that("mixed character and numeric values respect the cutoff", {
  x <- c("1", "2", "a", "3", "4")
  expect_true(is_continuous(x, cutoff = 0.8))
  expect_false(is_continuous(x, cutoff = 0.9))
})

test_that("clearly categorical vectors are classified as not continuous", {
  x <- c("a", "b", "c", "d")
  expect_false(is_continuous(x))
})

test_that("existing NA values are not counted toward cutoff", {
  x1 <- c("1", "2", NA, "3")
  x2 <- c(1:10, rep(NA, 5))
  x3 <- c(1:8, LETTERS[1:2])
  x4 <- c(1:4, rep(NA, 4), LETTERS[1:2])
  expect_true(is_continuous(x1))
  expect_true(is_continuous(x2))
  expect_true(is_continuous(x3))
  expect_true(is_continuous(x4))
  expect_false(is_continuous(x4, cutoff = 0.9))
})

test_that("new NAs introduced by coercion are counted correctly", {
  x <- c("1", "2", "a", NA)
  
  # One new NA from coercion out of 4 total values
  expect_true(is_continuous(x, cutoff = 0.7))
  expect_false(is_continuous(x, cutoff = 0.9))
})

test_that("cutoff greater than 1 is reset to 1 with a warning", {
  x <- c("1", "2", "a")
  expect_warning(out <- is_continuous(x, cutoff = 1.5), "cutoff greater than 1")
  # With cutoff forced to 1, no new NAs are allowed
  expect_false(out)
})

test_that("cutoff of exactly 1 requires all values to be numeric", {
  expect_true(is_continuous(c("1", "2", "3"), cutoff = 1))
  expect_false(is_continuous(c("1", "2", "a"), cutoff = 1))
})

# TODO: probably expect FALSE here, should be treated as categorical. Should also
# add a test for 0s and 1s.
test_that("logical vectors are treated as numeric", {
  x <- c(TRUE, FALSE, TRUE)
  expect_true(is_continuous(x))
})

# TODO:
# test_that("empty vectors return FALSE", {
#   expect_false(is_continuous(character()))
# })

test_that("is_continuous gives expected results", {
  expect_true(is_continuous(1:10))
  expect_false(is_continuous(LETTERS))
  expect_true(is_continuous(c("a", 1:9), cutoff = 0.8))
  expect_false(is_continuous(c("a", 1:9), cutoff = 1))
})
