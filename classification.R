
# na razie tylko proby XDDD

source("tokens.R")

library(e1071)
library(caTools)
library(class)
library(stringi)

## predykcja gatunkow
#TODO:
#Polaczyc konkretne gatunki w jedne

genre <- c(read.csv("genre.csv")$hip.hop,"hip hop")

own_data <- data.frame()

for(i in c(1:length(top_spotify_list))){
  own_data <- rbind(own_data,top_spotify_list[[i]])
}

own_data$artist_genres <- genre
knn_own_data <- own_data[c(2,7,8,c(10:15))]


split <- sample.split(knn_own_data, SplitRatio = 0.7)
train_own <- subset(knn_own_data, split == "TRUE")
test_own <- subset(knn_own_data, split == "FALSE")

train.scale <- scale(train_own[,2:9])
test.scale <- scale(test_own[,2:9])


classifier <- knn(train = train.scale, test = test.scale, cl = train_own$artist_genres, k=5)

miss <- mean(classifier != train_own$artist_genres)
1-miss
