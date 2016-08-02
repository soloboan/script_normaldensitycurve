#!/usr/bin/Rscript
## import EBVs
EBV_A <- read.table('',stringsAsFactors = F)
EBV_B <- read.table('',stringsAsFactors = F)
EBV_A <- rnorm(10000,mean=0,100)
EBV_B <- rnorm(10000,mean=100,100)

## compute the kernels of the EBVs
densEBV_A <- density(EBV_A,adjust=2)
densEBV_B <- density(EBV_B,adjust=2)

## for plotting, determine x and y axis
(xlims <- round(range(c(EBV_A,EBV_B)),2))
(xlims <- xlims+c(-200,200)) ## just fudging the the tails of the graph
(ylims <- range(c(densEBV_A$y,densEBV_B$y)))

### plot the normal density curve
plot(1,xlim=xlims,ylim=ylims,xlab='EBV',ylab='Frequency')
lines(densEBV_A,lty="dotted",col="darkgreen",lwd=2) 
lines(densEBV_B,lty="dotted",col="red",lwd=2) 

## add lines for the means if needed
abline(v=mean(EBV_A),col='grey',lwd=1)
abline(v=mean(EBV_B),col='grey',lwd=1)
