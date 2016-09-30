rm(list = ls())

source("MLpackages.R")

# install.packages("DMwR")
library(DMwR)


######################
## Import and Clean ##
######################
## Clean Train
train <- read.csv("train.csv", header = T, sep = ",")
apply(train, 2, function(x) sum(is.na(x)))
clean.train <- knnImputation(train, k = 10)   # Impute NA values via knn weighted avg
train$cleanAge <- clean.train$Age
apply(train, 2, function(x) sum(is.na(x)))
rm(clean.train)

## clean test
test  <- read.csv("test.csv", header = T, sep = ",")
apply(test, 2, function(x) sum(is.na(x)))
clean.test <- knnImputation(test, k = 10)   # Impute NA values via knn weighted avg
test$cleanAge <- clean.test$Age
apply(test, 2, function(x) sum(is.na(x)))
rm(clean.test)

## Combine into full dataset for furhter feature engineering
test$Survived <- NA
titanic <- rbind(train, test)
apply(titanic, 2, function(x) sum(is.na(x)))


####################
## Title Creation ##
####################
## Name to Title
titanic$Name  <- as.character(titanic$Name)
titanic$Title <- sapply(titanic$Name, function(x) {strsplit(x, split = "[,.]")[[1]][2]})
titanic$Title <- gsub(" ", "", titanic$Title)

## Bucket Titles into Factors
titanic$Title[titanic$Title %in% c("Ms", "Mrs", "Miss")] <- "Miss"
titanic$Title[titanic$Title %in% c("Capt", "Don", "Col", "Major", "Sir", "Dr", "Rev", "Jonkheer", "Master")] <- "Sir"
titanic$Title[titanic$Title %in% c("Mlle", "Mme", "Dona", "Lady", "theCountess")] <- "Lady"
titanic$Title <- as.factor(titanic$Title)


####################
## Income Buckets ##
####################
## Fare to Income Buckets
summary(titanic$Fare)  # Determine buckets based on summary stats
  
## 1 NA to deal with
row.ind <- as.numeric(titanic[which(is.na(titanic$Fare) == T),][, 1])  # Storey, Mr. Thomas was well-off, input Fare of third quartile
titanic[grep(row.ind, rownames(titanic)), grep("Fare", colnames(titanic))] <- quantile(titanic$Fare, na.rm = T)[4]
rm(row.ind)

Fare_test <- within(titanic, {
  Class                                                                                                         <- "NA"
  Class[Fare <  quantile(titanic$Fare, na.rm = T)[[2]]]                                                         <- "VeryPoor"
  Class[Fare >= quantile(titanic$Fare, na.rm = T)[[2]] & titanic$Fare < quantile(titanic$Fare, na.rm = T)[[3]]] <- "Poor"
  Class[Fare >= quantile(titanic$Fare, na.rm = T)[[3]] & titanic$Fare < quantile(titanic$Fare, na.rm = T)[[4]]] <- "Average"
  Class[Fare >= quantile(titanic$Fare, na.rm = T)[[4]]]                                                         <- "Rich"
})

#########################
## Feature Engineering ##
#########################
## Cabin data


################
## Fix Embark ##
################
## Embark data
# table(titanic$Embarked)
# attach(titanic)
# 
# chrEmbark <- titanic[titanic$Embarked == "", ]
# chrEmbark <- "S"
# chrEmbark  <- titanic[which(titanic$Embarked == ""), ]  # Replace "" with S
# chrEmbark  <- sub("", "S", chrEmbark)
# rm(chrEmbark)
# 
# detach(titanic)
