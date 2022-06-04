library(spotifyr)
library(rvest)
library(stringi)

source("tokens.R")

# funkcja zwracajaca dane z playlist
get_playlist_top_50_spotify <- function(countries){
  
  playlists_ids <- c()
  
  all_playlists <- list()
  
  for(country in countries){
    print(country)
    phrase = sprintf("Top 50 - %s",country)
    playlist = search_spotify(phrase, type ="playlist", limit = 10)
    playlist = playlist[playlist$owner.display_name == "Spotify",]
    playlist = playlist[1,]
    playlists_ids <- append(playlists_ids, playlist$id)
  }
  
  
  for(id in playlists_ids){
    tracks <- get_playlist(id)$tracks$items
    tracks_artist <- tracks$track.artist
    
    artist <- c()
    artist_id <- c()
    
    for(artist_data in tracks_artist){
      artist <- append(artist, artist_data$name[1])
      artist_id <- append(artist_id, artist_data$id[1])
    }
    
    artist_genres <- c()
    for(id in artist_id){
      if(!is.list(get_artist(id)$genres[1])){
        artist_genres <- append(artist_genres,get_artist(id)$genres[1])
      }
      else{
        artist_genres <- append(artist_genres, "other")
      }
    }
    
    audio_features <- data.frame()
    
    for(id in tracks$track.id){
      audio = get_track_audio_features(id)[c(1,2,3,4,6,7,9,10,11)]
      audio_features <- rbind(audio_features,audio)
    }
    
    artist_genres <- unlist(artist_genres)
    
    topsongs <- data.frame(
      artist,
      artist_genres,
      tracks$track.name,
      artist_id,
      tracks$track.id,
      tracks$track.popularity
    )
    topsongs <- cbind(topsongs,audio_features)
    topsongs <- unique(topsongs)
    
    all_playlists <- append(all_playlists, list(topsongs))
    
  }
  
  return(all_playlists)
  
}

# funkcja zwracajaca dane z chartow
get_spotify_charts_data <- function(
    region = c("global","pl","de","ua","us","sk"), 
    timestamp = c("daily", "weekly"),
    date = "latest"
) 
{
  #Webscraping ze strony spotifyCharts
  link <- sprintf("https://spotifycharts.com/regional/%s/%s/%s",
                  region,timestamp,date)
  spotify_html <- html_elements(read_html(link), xpath = 
                                  "/html/body/div/div/div/div/span/table")
  spotify_table <- html_table(read_html(link))
  spotify_df <- as.data.frame(spotify_table)
  print(spotify_df[c(2,4,5)])
  spotify_df <- spotify_df[c(2,4,5),]
  
  #Odzielenie artystow od tytulow piosenek
  title <- c()
  artist <- c()
  streams <- as.numeric(stri_replace_all_fixed(spotify_df$Streams,",",""))
  splited <- strsplit(spotify_df$Track, "\n")
  
  for(i in c(1:200)){
    title <- append(title, splited[[i]][1])
    
    list_of_song_artist <- substring(unlist(stri_extract_all_regex(
      splited[[i]][2],"(by {1}.*)")), 4)
    artist <- append(artist, list_of_song_artist)
    
  }
  #koncowa ramka
  data.frame(title, artist, streams)
}

# funkcja zwracajaca dane top artystow (dziala tylko pl)
artist_data <- function(region, from_date, to_date){
  y_weeks <- seq(as.Date(from_date), as.Date(to_date), by="weeks")
  
  artist_trought_time <- c()
  
  for(el in by_weeks){
    spo <- get_spotify_charts_data(region = region, timestamp = "daily", date = as.character(as.Date(el, origin = "1970-01-01")))
    artist_trought_time <- append(artist_trought_time, unique(unlist(strsplit(spo$artist, ", "))))
  }
  
  artist_trought_time <- sort(unique(artist_trought_time))
  
  
  genres_df <- spotifyr::search_spotify(artist_trought_time[1], type = "artist", market=region, limit = 1)[c(5,3,1,6)]
  
  for(i in 2:length(artist_trought_time)){
    x <- spotifyr::search_spotify(artist_trought_time[i], type = "artist", market=region, limit = 1)[c(5,3,1,6)]
    genres_df <- rbind(genres_df,x)
    
  }
  
  for(i in 1:length(genres_df$genres)){
    if(is.vector(genres_df$genres[[i]])){
      genres_df$genres[[i]] <- paste(genres_df$genres[[i]], collapse = ", ")
    }
  }
  
  genres_df$genres <- unlist(unlist(genres_df$genres))
  genres_df[genres_df==""]<-NA
  genres_df <- na.omit(genres_df)
  genres_df
  
}

# funkcja zwracajaca dane top artystow z kraju sprawdzanego (dziala tylko pl)
regional_artist_data <- function(region,language){
  genres_df <- artist_data(region)
  
  regional_genres_df <- genres_df[grep(language,genres_df$genres),]
  regional_genres_df <- regional_genres_df[order(regional_genres_df$popularity, decreasing = T),]
  regional_genres_df
}

#------------Testy: get_playlist_top_50_spotify ----------#
#countries <- c("Poland","USA","Brazil","Japan","South Korea","Australia", "France", "switzerland", "Italy")
#x <- get_playlist_top_50_spotify(countries = countries)


#dance_poland <- x[[1]]$danceability[c(1:50)]
#dance_usa <- x[[2]]$danceability[c(1:50)]
#dance_brazil <- x[[3]]$danceability[c(1:50)]
#dance_japan <- x[[4]]$danceability[c(1:50)]

#df <- data.frame(
#  country = c(replicate(50,"Poland"),replicate(50,"USA"),replicate(50,"Brazil"),replicate(50,"Japan")),
#  danceability = c(dance_poland,dance_usa,dance_brazil,dance_japan)
#)

#library(ggplot2)

#ggplot(df, aes(x = danceability, fill=country, alpha=0.3))+geom_density()
#summary(dance_poland)
