
# Install the released version from CRAN
install.packages("testthat")
library(testthat)

library(devtools)

install.packages("usethis")
library(usethis)

getwd()
setwd("/Users/urvashisingh/Documents/5PrimeSciences/Function/rmpalSNP")

usethis::use_testthat(3)

devtools::test(fresh = TRUE)


