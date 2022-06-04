library("spotifyr")
source("tokens.R")
countries <- c("Poland","USA","Brazil","Japan","South Korea","Australia", 
               "France", "switzerland", "Italy", "hong kong","new zeland", 
               "spain", "united kingdom","mexico","denmark","norway","netherlands",
               "ukraine", "colombia","greece","finland","latvia","czech republic","slovakia",
               "lithuania","hungary","turkey","sweden","iceland","belgium","austria","germany","saudi arabia")
top_50_countries <- get_playlist_top_50_spotify(countries)
jd <- get_playlist_top_50_spotify(c("south africa","ireland","portugal","bulgaria","romania",
                     "bolivia","luxembourg","mlaysia", "estonia","india","vietnam",
                     "philippines","thailand","tailand","peru","paraguay","chile","uruguay"))
charts <- get_spotify_charts_data(region = "global", timestamp = "daily", date = "latest")


top_spotify <- data.frame()
for (el in top_50_countries) {
  top_spotify <- rbind(top_spotify,el)
}
for(el in jd){
 top_spotify <- rbind(top_spotify,el) 
}
top_spotify_list <- append(top_50_countries, jd)
write.csv(top_spotify,"top_spoitfy.csv")


genre <- top_spotify$artist_genres

write(genre, "genre.csv")
