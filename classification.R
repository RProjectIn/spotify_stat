

source("tokens.R")

library(e1071)
library(caTools)
library(class)
library(stringi)

#Przypisanie do dodatkowej zmiennej
own_data <- data

#wyciagniecie potrzebnych danych do klasyfikacji
knn_own_data <- own_data[c(3,8,9,c(11:16))]

#losowe rozdzielenie danych na train i test
split <- sample.split(knn_own_data, SplitRatio = 0.75)
train_own <- subset(knn_own_data, split == "TRUE")
test_own <- subset(knn_own_data, split == "FALSE")

#skalowanie danych trenowanych i testowanych
train.scale <- scale(train_own[,2:9])
test.scale <- scale(test_own[,2:9])

#Klayfikacja
classifier <- knn(train = train.scale, test = test.scale, cl = train_own$artist_genres, k=5)

#obliczanie precyzji niestety tylko okolo 20% ze wzgledow zapisanych w sprawozdaniu
miss <- mean(classifier != train_own$artist_genres)
1-miss

