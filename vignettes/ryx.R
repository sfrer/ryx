## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ryx)
x=ryx(mtcars, "mpg", c("hp", "wt"))
print(x, digits=3)
summary(x, digits=3)
plot(x)

