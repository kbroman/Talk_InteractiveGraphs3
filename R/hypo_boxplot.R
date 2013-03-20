# hypo boxplots

attach("~/Projects/Attie/GoldStandard/Expression/MLRatios/F2.mlratio.hypo.RData")
library(broman)
hypo.mlratio <- hypo.mlratio[,order(apply(hypo.mlratio, 2, function(a) median(a[!is.na(a) & a > -2 & a < 2])), decreasing=TRUE)]

bgcolor <- rgb(24, 24, 24, maxColorValue=255)

png("../figs/manyboxplots.png", width=1000, height=600, pointsize=18, bg=bgcolor)
par(bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white", mar=c(3.1, 3.6, 1.1, 1.1))
manyboxplot(hypo.mlratio, dotcol=NA, c(0.01, 0.05, 0.1, 0.25), ylim=c(-1, 1), hlines=seq(-1, 1, by=0.25),
            vlines=seq(100, 500, by=100), ylab="Gene expression",
            mgp=c(2.1, 0.35, 0), xlab="")
lines(1:ncol(hypo.mlratio), apply(hypo.mlratio, 2, median, na.rm=TRUE), col="blue", lwd=2)
title(xlab="Arrays, sorted by median expression", mgp=c(1.9, 0.35, 0))
plim <- par("usr")
rect(plim[1], plim[3], plim[2], plim[4], col=NA)
dev.off()
