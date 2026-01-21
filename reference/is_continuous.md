# Test if a vector of values is likely to be continuous or categorical

The function will try to convert all values to numeric. If a certain
fraction of values is able to convert successfully, it will assume the
vector is continuous. Default threshold is 0.8.

## Usage

``` r
is_continuous(x, cutoff = 0.8)
```

## Arguments

- x:

  vector of values

- cutoff:

  A cutoff value between 0 and 1 for deciding between
  continuous/categorical. Default threshold is 0.8.

## Value

`TRUE` if the vector of values is likely to be continuous, otherwise
`FALSE`.

## Details

The function will try to convert all values to numeric. If a certain
fraction of values is able to convert successfully, it will assume the
vector is continuous.

## Examples

``` r
is_continuous(1:3)
#> [1] TRUE
is_continuous(c(1, 3, 5))
#> [1] TRUE
is_continuous(c("a", 1))
#> [1] FALSE
```
