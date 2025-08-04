
<!-- README.md is generated from README.Rmd. Please edit that file -->

# reviewlinters

<!-- badges: start -->

<!-- badges: end -->

The goal of reviewlinters is to provide some linters to draw your
attention to specific dubious patterns during your R package review.

The difference with the [lintr](https://lintr.r-lib.org/) are:

- this package also provides linters that can generate many false
  positives since they will be reviewed manually. This is diametrically
  opposed to lintr approach which tries to avoid false positives as much
  as possible
- this package sometimes provide very niche linters, useful to maybe
  only one or two of my own packages
- this package provides very experimental, unpolished and sometimes
  undocumented linters

Linters from this package are regularly reviewed to determine if they
are worth upstreaming to the lintr package itself.

## Installation

You can install the development version of reviewlinters from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Bisaloo/reviewlinters")
```
