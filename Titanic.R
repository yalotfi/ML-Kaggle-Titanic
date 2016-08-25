
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
write.csv(submit.tree, "CARTmodel.csv", row.names = F) ## 78.469%
rm(submit.tree)


#########################
## Feature Engineering ##
#########################
## Recombine test and train sets
test$Survived <- NA
combine <- rbind(train, test)

## Get sense of missing data, mostly in Age
apply(train, 2, function(x) (sum(is.na(x))))
ageNA <- subset(train, is.na(train$Age) == T)
table(ageNA$Survived)  # 29.37% passengers of unknown age survived
table(train$Survived)  # as opposed to general survival rate of ~38.38%

## Explore Fares
summary(combine$Fare)


