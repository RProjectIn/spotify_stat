library("spotifyr")
source("tokens.R")

#tak wyglądało powstawanie danych
# 
# countries <- c("Poland","USA","Brazil","Japan","South Korea","Australia", 
#                "France", "switzerland", "Italy", "hong kong","new zeland", 
#                "spain", "united kingdom","mexico","denmark","norway","netherlands",
#                "ukraine", "colombia","greece","finland","latvia","czech republic","slovakia",
#                "lithuania","hungary","turkey","sweden","iceland","belgium","austria","germany","saudi arabia")
# top_50_countries <- get_playlist_top_50_spotify(country)
# jd <- get_playlist_top_50_spotify(c("south africa","ireland","portugal","bulgaria","romania",
#                      "bolivia","luxembourg","mlaysia", "estonia","india","vietnam",
#                      "philippines","thailand","tailand","peru","paraguay","chile","uruguay"))
# 
# top_spotify <- data.frame()
# for (el in top_50_countries) {
#   top_spotify <- rbind(top_spotify,el)
# }
# for(el in jd){
#  top_spotify <- rbind(top_spotify,el) 
# }
# top_spotify_list <- append(top_50_countries, jd)

#odczyt danych wcześniej zapisanych
data <- read.csv("top_spoitfy.csv")
