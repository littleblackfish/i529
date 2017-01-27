#ref: http://www.ats.ucla.edu/stat/r/dae/logit.htm
student <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
student$rank <- factor(student$rank) #rank as categorical
summary(student)

#use family defines error distribution & model
glm.out <- glm(admit ~ gre + gpa + rank, data=student, family=binomial(link=logit)) 

summary(glm.out)
#intepret the coefficients, examples
#For every one unit change in gre, the log odds of admission (versus non-admission) increases by 0.002
#For rank, having rank of 2, versus 1, decreases the log odds of admission by -0.675
exp(coef(glm.out))
#use exp to transform back to odd-ratio

newdata <- with(student, data.frame(gre = c(790, 469), gpa = c(3.9, 2.8), rank = factor(c(1, 4))))
newdata$rankP <- predict(glm.out, newdata=newdata,type="response")
newdata
