
# COICOP Package

The main purpose of this package is to receive different kinds of
datasets and return a dataframe labeled as “data” in the users global
environment, which includes an additional column that classifies the
COICOP codes based on the four classes (Durables, Semi-Durables,
Non-Durables and Services)

## Install Package

First, you have to install devtools package

``` r
install.packages("devtools", repos ="http://cran.us.r-project.org")
library(devtools)
```

And then you can download COICOP package by tools that devtools provides

``` r
install_github("tunay5/COICOP")
library(coicop)
```

## classified_data()

The usage of classified_data() is simple. One has to put the data that
it wants to be classified between brackets.

Assume that we have a consumption dataset for an individual:

``` r
data_1
```

    ##       value codes
    ## 1  5.593052  6212
    ## 2  6.232743  7322
    ## 3  7.437120  9112
    ## 4  9.449247  9150
    ## 5  5.210092 11111
    ## 6  9.390338  4549
    ## 7  9.668052  1113
    ## 8  7.964787  1181
    ## 9  7.774684  1212
    ## 10 4.370718  4210
    ## 11 5.235847  4310

To classify these COICOP codes, we will use classified_data

``` r
classified_data(data_1)
```

    ##       value codes class_4
    ## 1  5.593052  6212       S
    ## 2  6.232743  7322       S
    ## 3  7.437120  9112       D
    ## 4  9.449247  9150       S
    ## 5  5.210092 11111       S
    ## 6  9.390338  4549      ND
    ## 7  9.668052  1113      ND
    ## 8  7.964787  1181      ND
    ## 9  7.774684  1212      ND
    ## 10 4.370718  4210       S
    ## 11 5.235847  4310      ND
