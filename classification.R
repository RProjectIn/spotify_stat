
# na razie tylko proby XDDD

source("tokens.R")

library(e1071)
library(caTools)
library(class)
library(stringi)

## predykcja gatunkow
#TODO:
#Polaczyc konkretne gatunki w jedne

own_data <- data.frame()

for(i in c(1:length(top_50_countries))){
  own_data <- rbind(own_data,top_50_countries[[i]])
}

knn_own_data <- own_data[c(2,7,8,c(10:15))]


split <- sample.split(knn_own_data, SplitRatio = 0.7)
train_own <- subset(knn_own_data, split == "TRUE")
test_own <- subset(knn_own_data, split == "FALSE")

train.scale <- scale(train_own[,2:9])
test.scale <- scale(test_own[,2:9])


classifier <- knn(train = train.scale, test = test.scale, cl = train_own$artist_genres, k=5)

miss <- mean(classifier != train_own$artist_genres)
1-miss
