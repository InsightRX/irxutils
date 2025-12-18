test_that("get_datetime_string() returns a character string", {
  out <- get_datetime_string()
  expect_type(out, "character")
  expect_length(out, 1)
})

test_that("get_datetime_string() uses ymdhm format", {
  out <- get_datetime_string()
  expect_match(out, "^\\d{12}$") # exactly 12 digits: YYYYMMDDHHMM
})

test_that("get_datetime_string() matches current time to the minute", {
  withr::local_timezone("UTC")
  expected <- format(lubridate::now(), "%Y%m%d%H%M")
  out <- get_datetime_string()
  expect_equal(out, expected)
})

test_that("get_datetime_string() returns numeric-only output", {
  out <- get_datetime_string()
  expect_false(grepl("[^0-9]", out))
})

test_that("get_datetime_string() formats a supplied datetime correctly", {
  x <- lubridate::ymd_hms("2024-05-07 05:50:42", tz = "UTC")
  out <- get_datetime_string(x)
  expect_equal(out, "202405070550")
})
