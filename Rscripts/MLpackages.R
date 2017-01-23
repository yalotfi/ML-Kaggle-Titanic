##############
## Packages ##
##############
# install.packages("rpart")
# install.packages("rpart.plot")
# install.packages("tree")
# install.packages("caret")
# install.packages("rattle")
# install.packages("ROSE")
# install.packages("ROCR")
# install.packages("e1071")
# install.packages("randomForest")
# install.packages("class")
# install.packages("gmodels")
# install.packages("party")
# install.packages("neuralnet")
# install.packages("Metrics")
# install.packages("gbm")
library(rpart)  # Recurive Partitioning
library(rpart.plot)
library(tree)
library(caret)  # Data manipulation
# library(rattle)  # Data mining GUI
library(ROSE)  # Resampling algorithms
library(ROCR)
library(e1071)
library(randomForest)
library(class)  # KNN
library(gmodels)  # Confusion Matrix
library(tree)
# library(neuralnet)
library(Metrics)
library(gbm)

## Check Any package that exists in directory
# any(grepl("nueralnet", installed.packages()))