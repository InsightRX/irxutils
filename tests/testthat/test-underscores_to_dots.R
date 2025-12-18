test_that("underscores_to_dots() converts underscores to dots", {
  expect_equal(underscores_to_dots(c("a_b_c", "d_e_f")), c("a.b.c", "d.e.f"))
})

test_that("dots_to_underscores() converts dots to underscores", {
  expect_equal(dots_to_underscores(c("a.b.c", "d.e.f")), c("a_b_c", "d_e_f"))
})

test_that("functions are vectorized", {
  x <- c("a_b", "c_d", "e_f")
  y <- c("a.b", "c.d", "e.f")
  expect_length(underscores_to_dots(x), length(x))
  expect_length(dots_to_underscores(y), length(y))
})

test_that("strings without target characters are unchanged", {
  expect_equal(underscores_to_dots("abc"), "abc")
  expect_equal(dots_to_underscores("abc"), "abc")
})

test_that("empty strings are handled correctly", {
  expect_equal(underscores_to_dots(""), "")
  expect_equal(dots_to_underscores(""), "")
})

test_that("NA values are preserved", {
  x <- c("a_b", NA_character_)
  y <- c("a.b", NA_character_)
  expect_equal(underscores_to_dots(x), y)
  expect_equal(dots_to_underscores(y), x)
})

test_that("round-trip conversion works when all underscores or dots", {
  x <- c("a_b_c", "d_e_f")
  y <- c("a.b.c", "d.e.f")
  expect_equal(dots_to_underscores(underscores_to_dots(x)), x)
  expect_equal(underscores_to_dots(dots_to_underscores(y)), y)
})
