
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rwpfunctionality

<!-- badges: start -->
<!-- badges: end -->

This package provides users documentation on both a water point
functionality survey and a management committee survey conducted in
nine countries in sub-Saharan Africa and South Asia.

## Installation

You can install the development version of rwpfunctionality from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/rwpfunctionality")
```

## Project goal

Sustained functionality of rural water systems is a global challenge.
Addressing premature failures and unreliable performance of water points
is crucial to achieve the 2030 Sustainable Development Goal (SDG) 6,
which calls for universal and equitable access to safe and affordable
drinking water for all (WHO, 2017). As of 2020, 771 million people
lacked a basic water service (WHO & UNICEF, 2021). Yet even for those
with water services, unreliable water infrastructure that provides
intermittent supply, or is broken down or abandoned, contributes to
unsustainable and unsafe water access worldwide (Allaire et al., 2018;
Burt et al., 2018; Klug et al., 2018; Valcourt et al., 2020).

## Data

The data set includes observations of water point functionality and
management committee questionnaires.

The package provides access to one single data set.

``` r
library(rwpfunctionality)
```

The `rwpfunctionality` data set has 52 variables and 1793 observations.
For an overview of the variable names, see the following table.

``` r
rwpfunctionality


## Example

This is a basic example which shows you how to solve a common problem:
```

``` r
library(rwpfunctionality)
## basic example code
```

## License

Data are available as
[CC-BY](https://github.com/openwashdata/rwpfunctionality/LICENSE.md).

## Citation

To cite this package, please use:

``` r
citation("rwpfunctionality")
#> To cite package 'rwpfunctionality' in publications use:
#> 
#>   Götschmann M (2024). _rwpfunctionality: Water point functionality
#>   assessment in nine sub-Saharan Africa and South Asia countries_. R
#>   package version 0.0.0.9000.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {rwpfunctionality: Water point functionality assessment in nine sub-Saharan Africa and South
#> Asia countries},
#>     author = {Margaux Götschmann},
#>     year = {2024},
#>     note = {R package version 0.0.0.9000},
#>   }
```
