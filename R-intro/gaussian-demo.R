#sample 200 values from a gaussian distribution with mean=10, sd=2
x.norm <- rnorm(n=200, m=10, sd=2)

#specify the layout
nf <- layout(matrix(c(1,2,3,4), 2, 2, byrow=TRUE), respect=TRUE)
layout.show(nf)

#hisogram
hist(x.norm, breaks=20, main="Histogram", xlab="X")

#density plot
plot(density(x.norm, kernel="gaussian"), main="Density plot", xlab="X")

#density function
m <- mean(x.norm)
v <- sd(x.norm)
xfit <- seq(0, 20, 0.001)
yfit <- dnorm(xfit, mean=mean(x.norm), sd=sd(x.norm))
plot(xfit, yfit, type="l", main="PDF", xlab="X", ylab="f(X)")

#cumulative probability function
yfit <- pnorm(xfit, mean=mean(x.norm), sd=sd(x.norm))
plot(xfit, yfit, type="l", main="CDF", xlab="X", ylab="P(X)")
