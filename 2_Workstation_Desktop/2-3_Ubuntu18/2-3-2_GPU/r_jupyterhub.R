#! /usr/bin/env Rscript

options(repos = c(CRAN = "https://cran.seoul.go.kr/"))

install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')

IRkernel::installspec()

IRkernel::installspec(user = FALSE)
