# Get datetime as a string

Get datetime as a string in the form `"%Y%m%d%H%M"`. Defaults to
returning the current datetime.

## Usage

``` r
get_datetime_string(x = lubridate::now())
```

## Arguments

- x:

  A vector of [POSIXt](https://rdrr.io/r/base/DateTimeClasses.html),
  numeric, or character objects. Defaults to the current time.

## Value

The datetime as a string in the form `"%Y%m%d%H%M"`.

## Examples

``` r
get_datetime_string()
#> [1] "202601300622"
```
