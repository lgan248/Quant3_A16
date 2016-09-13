library(causalA16)
library(data.table)
library(ggplot2)
library(texreg)

#open Karreth and Tir JOP article
library(foreign)
IOCW <- read.dta("/Users/liwugan/GitHub/Quant3_A16/causalA16/inst/extdata /igo.cw.replication.dta")


dat <- load_dataset("igo.cw.replication.dta")
setDT(dat)
setkey(dat, onset)
