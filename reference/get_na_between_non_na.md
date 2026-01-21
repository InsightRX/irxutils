# Get NA values between non-NA values

Check if a vector of values has any NAs between at least two non-NA
values. If so, it will return a vector of indices of NA values for which
this is the case. If none are found, it will return `NULL`.

## Usage

``` r
get_na_between_non_na(x)
```

## Arguments

- x:

  A vector of values.

## Value

A vector of numeric indices of NA values that are between at least two
non-NA values. Returns an `NULL` if none are found.

## Details

This can e.g. conveniently be used to test whether there are any BLQ
samples in-between two numeric (above LOQ) values. Within a single PK
curve this is not likely to occur and the individual or data point
should be flagged as an outlier.

## Examples

``` r
get_na_between_non_na(c(NA, 1, 2, NA, 4, NA, 6, NA, NA, 9, NA))
#> [1] 4 6 8 9
```
