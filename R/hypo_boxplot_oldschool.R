# hypo boxplots

attach("~/Projects/Attie/GoldStandard/Expression/MLRatios/F2.mlratio.hypo.RData")
library(broman)
hypo.mlratio <- hypo.mlratio[,order(apply(hypo.mlratio, 2, function(a) median(a[!is.na(a) & a > -2 & a < 2])), decreasing=TRUE)]
n.arrays <- ncol(hypo.mlratio)

bgcolor <- rgb(24, 24, 24, maxColorValue=255)

png("../figs/manyboxplots_oldschool.png", width=1000, height=600, pointsize=18, bg=bgcolor)
par(bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white", mar=c(4.1, 3.6, 1.1, 1.1))
boxplot(hypo.mlratio, las=1, range=0, names=rep("", n.arrays))
axis(side=1, at=seq(100, n.arrays, by=100), tick=FALSE, mgp=c(1.8, 0.8, 0))
title(xlab="Arrays, sorted by median expression", mgp=c(1.8, 0.35, 0))
title(ylab="Gene expression", mgp=c(1.8, 0.35, 0))
dev.off()

png("../figs/manyboxplots_oldschoolB.png", width=1000, height=600, pointsize=18, bg=bgcolor)
par(bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white", mar=c(4.1, 3.6, 1.1, 1.1))
boxplot(hypo.mlratio, las=1, cex=0.4, names=rep("", n.arrays), outcol=rgb(170,170,170,maxColorValue=255))
axis(side=1, at=seq(100, n.arrays, by=100), tick=FALSE, mgp=c(1.8, 0.8, 0))
title(xlab="Arrays, sorted by median expression", mgp=c(1.8, 0.35, 0))
title(ylab="Gene expression", mgp=c(1.8, 0.35, 0))
dev.off()

