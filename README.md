
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rwpfunctionality

<!-- badges: start -->
<!-- badges: end -->

The goal of rwpfunctionality is to …

## Installation

You can install the development version of rwpfunctionality from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/rwpfunctionality")
```

## Project goal

The primary goal of BaSIS (Basic Sanitation Information System) within
the context of implementing Community-Led Total Sanitation (CLTS) in
Ghana is to combat open defecation. By collecting data on communities
practicing open defecation, the project aims to shift away from previous
subsidy-based approaches and focus on community engagement. BaSIS seeks
to empower communities, particularly in regions like Upper West,
Eastern, Northern, Volta, and Central, to abandon open defecation
practices through CLTS. The objective is to break the cycle of
fecal-oral contamination, reduce the spread of diseases linked to poor
sanitation, and promote sustainable, community-driven solutions to
improve overall hygiene and sanitation practices.

## Data

The data set includes the locations of the existing open defecation free
(ODF) communities in various districts of Ghana. It was last updated in
September 2017.

The package provides access to one data set.

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
#>     title = {rwpfunctionality: Water point functionality assessment in nine sub-Saharan Africa
#> and South Asia countries},
#>     author = {Margaux Götschmann},
#>     year = {2024},
#>     note = {R package version 0.0.0.9000},
#>   }
```
