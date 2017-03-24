#this script is from http://heuristically.wordpress.com/2009/12/23/compare-performance-machine-learning-classifiers-r/
#modified by Yuzhen Ye (for I529) April 17, 2013

#nf <- layout(matrix(c(1,2,3,3), 2, 2, byrow=TRUE), respect=TRUE)
#layout.show(nf)

# load the mlbench package which has the BreastCancer data set
require(mlbench)
# if you don't have any required package, use the install.packages() command

# load the data set
data(BreastCancer)

# some algorithms don't like missing values, so remove rows with missing values
BreastCancer <- na.omit(BreastCancer)

# remove the unique identifier, which is useless and would confuse the machine learning algorithms
BreastCancer$Id <- NULL

# partition the data set for 80% training and 20% evaluation (adapted from ?randomForest)
set.seed(2)
ind <- sample(2, nrow(BreastCancer), replace = TRUE, prob=c(0.8, 0.2))
 
## method 1: create model using recursive partitioning on the training data set
require(rpart)
x.rp <- rpart(Class ~ ., data=BreastCancer[ind == 1,])
# predict classes for the evaluation data set
x.rp.pred <- predict(x.rp, type="class", newdata=BreastCancer[ind == 2,])
# score the evaluation data set (extract the probabilities)
x.rp.prob <- predict(x.rp, type="prob", newdata=BreastCancer[ind == 2,])
 
# To view the decision tree, uncomment this line.
dev.new()
plot(x.rp, main="Decision tree fm rpart")
 
## method 2: create model using conditional inference trees
require(party)
x.ct <- ctree(Class ~ ., data=BreastCancer[ind == 1,])
x.ct.pred <- predict(x.ct, newdata=BreastCancer[ind == 2,])
x.ct.prob <-  1- unlist(treeresponse(x.ct, BreastCancer[ind == 2,]), use.names=F)[seq(1,nrow(BreastCancer[ind == 2,])*2,2)]
 
# To view the decision tree, uncomment this line.
dev.new()
plot(x.ct, main="Decision tree fm party")
 
# method 3: create model using random forest and bagging ensemble using conditional inference trees
x.cf <- cforest(Class ~ ., data=BreastCancer[ind == 1,], control = cforest_unbiased(mtry = ncol(BreastCancer)-2))
x.cf.pred <- predict(x.cf, newdata=BreastCancer[ind == 2,])
x.cf.prob <-  1- unlist(treeresponse(x.cf, BreastCancer[ind == 2,]), use.names=F)[seq(1,nrow(BreastCancer[ind == 2,])*2,2)]
 
# method 4: create model using bagging (bootstrap aggregating)
require(ipred)
x.ip <- bagging(Class ~ ., data=BreastCancer[ind == 1,])
x.ip.prob <- predict(x.ip, type="prob", newdata=BreastCancer[ind == 2,])
 
# method 5: create model using svm (support vector machine)
require(e1071)
# svm requires tuning
x.svm.tune <- tune(svm, Class~., data = BreastCancer[ind == 1,],
                   ranges = list(gamma = 2^(-8:1), cost = 2^(0:4)),
                   tunecontrol = tune.control(sampling = "fix"))
# display the tuning results (in text format)
x.svm.tune
# If the tuning results are on the margin of the parameters (e.g., gamma = 2^-8),
# then widen the parameters.
# I manually copied the cost and gamma from console messages above to parameters below.
x.svm <- svm(Class~., data = BreastCancer[ind == 1,], cost=4, gamma=0.0625, probability = TRUE)
x.svm.prob <- predict(x.svm, type="prob", newdata=BreastCancer[ind == 2,], probability = TRUE)
 
##
## plot ROC curves to compare the performance of the individual classifiers
##
 
# Output the plot to a PNG file for display on web.  To draw to the screen,
# comment this line out.
#png(filename="roc_curve_5_models.png", width=700, height=700)
 
# load the ROCR package which draws the ROC curves
require(ROCR)
 
# create an ROCR prediction object from rpart() probabilities
x.rp.prob.rocr <- prediction(x.rp.prob[,2], BreastCancer[ind == 2,'Class'])
# prepare an ROCR performance object for ROC curve (tpr=true positive rate, fpr=false positive rate)
x.rp.perf <- performance(x.rp.prob.rocr, "tpr","fpr")
# plot it
dev.new()
plot(x.rp.perf, col=2, main="ROC curves for five machine learning models")
 
# Draw a legend.
legend(0.6, 0.6, c('rpart', 'ctree', 'cforest','bagging','svm'), 2:6)
 
# ctree
x.ct.prob.rocr <- prediction(x.ct.prob, BreastCancer[ind == 2,'Class'])
x.ct.perf <- performance(x.ct.prob.rocr, "tpr","fpr")
# add=TRUE draws on the existing chart
plot(x.ct.perf, col=3, add=TRUE)
 
# cforest
x.cf.prob.rocr <- prediction(x.cf.prob, BreastCancer[ind == 2,'Class'])
x.cf.perf <- performance(x.cf.prob.rocr, "tpr","fpr")
plot(x.cf.perf, col=4, add=TRUE)
 
# bagging
x.ip.prob.rocr <- prediction(x.ip.prob[,2], BreastCancer[ind == 2,'Class'])
x.ip.perf <- performance(x.ip.prob.rocr, "tpr","fpr")
plot(x.ip.perf, col=5, add=TRUE)
 
# svm
x.svm.prob.rocr <- prediction(attr(x.svm.prob, "probabilities")[,2], BreastCancer[ind == 2,'Class'])
x.svm.perf <- performance(x.svm.prob.rocr, "tpr","fpr")
plot(x.svm.perf, col=6, add=TRUE)
 
 
# Close and save the PNG file.
#dev.off()
