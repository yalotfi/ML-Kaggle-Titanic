
rm(list = ls())

source("MLpackages.R")

library(RColorBrewer)

#######################
## Read in Data Sets ##
#######################
train <- read.csv("train.csv", header = T, sep = ",")
test  <- read.csv("test.csv" , header = T, sep = ",")


#############################
## Produce Quick CART Tree ##
#############################
## Fit model
fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked
             , data    = train
             , method  = "class")

## Plot
rpart.plot(fit)
printcp(fit)
plotcp(fit)

## Predict
pred   <- predict(fit, test, type = "class")
submit.tree <- data.frame(PassengerId = test$PassengerId, Survived = pred)
write.csv(submit.tree, "submissionCSVs/CARTmodel.csv", row.names = F) ## 78.469%
rm(submit.tree)

#############################
### KAGGLE SCORE: 0.78469 ###
#############################
