
# na razie tylko proby XDDD

source("tokens.R")

library(e1071)
library(caTools)
library(class)
library(stringi)

test <- na.omit(read.csv("test.csv", encoding = "UTF-8"))
train <- na.omit(read.csv("train.csv", encoding = "UTF-8"))

popularity <- c()
counter <- 1

for(i in c(1:100)){
  al <- search_spotify(test$name[i],type = "album", limit = 1)
  if(length(al) != 0 | "id" %in% colnames(al) | !is.null(al$id)){
    data <- get_album(al$id)$popularity
  }
  else{
    data <- 0
  }
  
  ar <- search_spotify(test$artists[1],type = "artist", limit = 1)
  
  popularity <- append(popularity, mean(data,ar$popularity))
  print(counter)
  print(al$id)
  counter <- counter+1
}

test_100 <- cbind(test[1:100,c(9:44)],popularity)
train_800 <- cbind(train[,c(9:44)],popularity = train$popularity)

pop_test_scale <- scale(test_100[,1:36])
pop_train_scale <- scale(train_800[,1:36])

classi <- knn(train = pop_train_scale,test = pop_test_scale, cl=train_800$popularity, k = 3)
miss_class <- mean(classi != test_100$popularity)
print(paste('Accuracy=',1-miss_class))

own_data <- data.frame()

for(i in c(1:length(x))){
  own_data <- rbind(own_data,x[[i]])
}

knn_own_data <- own_data[c(2,7,8,c(10:15))]


split <- sample.split(knn_own_data, SplitRatio = 0.7)
train_own <- subset(knn_own_data, split == "TRUE")
test_own <- subset(knn_own_data, split == "FALSE")

train.scale <- scale(train_own[,2:9])
test.scale <- scale(test_own[,2:9])


classifier <- knn(train = train.scale, test = test.scale, cl = train_own$artist_genres, k=5)

miss <- mean(classifier != train_own$artist_genres)

