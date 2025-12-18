test_that("invert_list() inverts names and values for a simple list", {
  out <- invert_list(list(a = "b"))
  expect_equal(out, list(b = "a"))
})

test_that("invert_list() works with multiple elements", {
  out <- invert_list(list(a = "b", c = "d"))
  expect_equal(out, list(b = "a", d = "c"))
})

test_that("invert_list() casts values to character for names", {
  out <- invert_list(list(a = 1, b = 2))
  expect_named(out, c("1", "2"))
})

test_that("invert_list() overwrites values when names collide", {
  out <- invert_list(list(loser = "b", winner = "b"))
  expect_equal(out, list(b = "winner")) # last assignment wins
})

test_that("invert_list() returns an empty list when input is empty", {
  out <- invert_list(list())
  expect_equal(out, list())
})

# TODO: fix test and/or revise behaviour
test_that("invert_list errors or behaves unexpectedly for non-length-1 values", {
  x <- list(a = c("b", "c"))
  
  expect_error(
    invert_list(x)
  )
})
