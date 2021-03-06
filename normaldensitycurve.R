#!/usr/bin/Rscript

# using EBVs as an example
## import EBVs
EBV_A <- read.table('example/EBV_A.txt',stringsAsFactors = F)[,2]
EBV_B <- read.table('example/EBV_B.txt',stringsAsFactors = F)[,2]
#EBV_A <- rnorm(10000,mean=0,100)
#EBV_B <- rnorm(10000,mean=100,100)

## compute the kernels of the EBVs
densEBV_A <- density(EBV_A,adjust=2)
densEBV_B <- density(EBV_B,adjust=2)

## for plotting, determine x and y axis
(xlims <- round(range(c(EBV_A,EBV_B)),2))
(xlims <- xlims+c(-200,200)) ## just fudging the the tails of the graph
(ylims <- range(c(densEBV_A$y,densEBV_B$y)))
namesEBV_AB <- c('HLwgt','FLwgt')

### plot the normal density curve
pdf('example.pdf')
plot(1,xlim=xlims,ylim=ylims,xlab='EBV',ylab='Frequency')
lines(densEBV_A,lty="dotted",col="darkgreen",lwd=2)
lines(densEBV_B,lty="dotted",col="red",lwd=2) 
legend('topright',legend=namesEBV_AB,col=c('darkgreen','red'),bty='n',lty=2)

## add lines for the means if needed
abline(v=mean(EBV_A),lwd=1,col="darkgreen")
abline(v=mean(EBV_B),lwd=1,col="red")
dev.off()


### other plotting tools "tiff" instead of pdf
dpi=300;width.cm<-14;height.cm<-14;width.in<-width.cm/2.54;height.in<-height.cm/2.54
tiff(file=outfile,width=width.in*dpi,height=height.in*dpi,units="px",res=dpi,compress="lzw")
par(mar=c(4,4,1,0.1))

dev.off()
