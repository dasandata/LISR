#! /usr/bin/env Rscript

install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))

51

install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')

IRkernel::installspec()

IRkernel::installspec(user = FALSE)
