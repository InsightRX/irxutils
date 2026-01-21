# Safe relational operators

Binary operators which allow the comparison of values in atomic vectors,
with a little room for floating point precision issues.

## Usage

``` r
x %>=% y

x %<=% y
```

## Arguments

- x, y:

  Numeric vectors.

## Value

A logical vector indicating the result of the element by element
comparison.

## Details

These binary comparison operators make the base relational operators
([base::Comparison](https://rdrr.io/r/base/Comparison.html)) safer by
adding a little room for floating point precision issues. `%>=%` is the
counterpart to `>=`, and `%<=%` is the counterpart to `<=`.

## Examples

``` r
(0.7 - 0.4) >= 0.3
#> [1] FALSE
(0.7 - 0.4) %>=% 0.3
#> [1] TRUE
```
