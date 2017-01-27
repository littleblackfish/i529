library(MASS)

mge_host_viz <- function(inputfile="lm-demo.txt", savefile="",legendpos="topleft") {

data <- read.table(inputfile)
colnames(data) <- c("sample", "host", "mge")

#estimate outlier (using Cook's distance)
lm.fitted <- lm(data[[3]] ~ data[[2]])
r <- stdres(lm.fitted)
d1 <- cooks.distance(lm.fitted)
rabs <- abs(r)
a <- cbind(data, d1, r, rabs)
sample <- length(data[[1]])
outlier <- a[d1 > 4/sample, ]

#sort by abs of residual
outliersorted <- outlier[order(-outlier$rabs), ]
outliernum <- length(outlier[[1]])

if(savefile != "") pdf(savefile, 7, 5)

stepy <- (max(data[[3]]) - min(data[[3]])) / 10
offsety <- stepy / 3

plot(data[[2]],data[[3]],xlab="Host genome abundance", ylab="Virus abundance")
thissample <- substr(inputfile, 1, 9)
tmp <- subset(data, sample==thissample)
points(tmp[[2]][1], tmp[[3]][1], col="red",pch=16)
text(tmp[[2]][1], tmp[[3]][1]+offsety, col="black", thissample)
displayn <- 1

#the first three outliers
if (outliernum >= 1) {
	for(i in 1:min(displayn, outliernum)) {
		points(outliersorted[[2]][i], outliersorted[[3]][i], col="green",pch=16)
		offsetx <- 0
		if(outliersorted[[2]][i] > max(data[[2]]) * 0.9) offsetx <- max(data[[2]]) * 0.1
		if(outliersorted[[2]][i] < max(data[[2]]) * 0.1) offsetx <- -1 * max(data[[2]]) * 0.1
		text(outliersorted[[2]][i]-offsetx, outliersorted[[3]][i]-offsety, as.character(outliersorted[[1]][i]))
	}
}

rr.huber <- rlm(data[[3]] ~ data[[2]])
abline(coef=c(0, 1), col="black")
abline(coef=lm.fitted$coef, col="green")
abline(coef=rr.huber$coef, col="red")
leg.txt <- c("1:1", sprintf("lm: coef=%.2f", lm.fitted$coef[2]), sprintf("rlm: coef=%.2f", rr.huber$coef[2]))
leg.col <- c("black", "green", "red")
legend(legendpos, legend = leg.txt, col=leg.col, lty=1, merge=TRUE, inset = .05)

if(savefile != "") dev.off()
}

mge_host_viz()
