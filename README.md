
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SwimDataAnalysis

<!-- badges: start -->
<!-- badges: end -->

## About

SwimDataAnalysis is a package to analyze a swimmer’s data (i.e., times)
from [SwimCloud](swimcloud.com). You can analyze: - PRs - Overall
Progress - Filtered data based on criteria

There are data sets included to use for examples from [Jessie Wang’s
swimcloud page](https://www.swimcloud.com/swimmer/1908125/):

- `twohundred_fly`: collection of times for 200 hundred fly SCY
- `twohundred_back`: collection of times for 200 hundred back SCY
- `fivehundred_free`: collection oftimes for 500 hundred free SCY
- `clean_twohundred_fly`: cleaned version of twohundred_fly using the
  `CleanData` function
- `top_three`: collection of the three events above, with an added
  column detailing event

## Installation

You can install the development version of SwimDataAnalysis from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("jxwang-10/SwimDataAnalysis")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(SwimDataAnalysis)
## basic example code
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
