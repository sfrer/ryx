# ryx
<img src="dog.jpg" width="800"/>

The goal of ryx is to make correlation test easier. It will test the correlation of quantitative response variable and explanatory variables. 

## Installation

You can install the development version of ryx like so:

``` r
if(!require(remotes)){
           install.packages("remotes")
           }
remotes::install_github("sfrer/ryx")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ryx)
data("mtcars")
x=ryx(mtcars, "mpg", c("wt", "hp"))
y=ryx(mtcars, "mpg")

#print method
print(x, digits=3)

#summary method
summary(x, digits=3)

#plot method
plot(x)
```

