# Convert underscores to dots (and vice versa)

Convert underscores to dots (and vice versa)

## Usage

``` r
underscores_to_dots(x)

dots_to_underscores(x)
```

## Arguments

- x:

  A character vector.

## Value

The character vector `x`, with all underscores converted to dots for
`underscores_to_dots()` and all dots converted to underscores for
`dots_to_underscores()`.

## Examples

``` r
underscores_to_dots(c("a_b_c", "d_e_f"))
#> [1] "a.b.c" "d.e.f"
dots_to_underscores(c("a.b.c", "d.e.f"))
#> [1] "a_b_c" "d_e_f"
```
