library("spotifyr")
source("tokens.R")
countries <- c("Poland","USA","Brazil","Japan","South Korea","Australia", 
               "France", "switzerland", "Italy", "hong kong","new zeland", 
               "spain", "united kingdom","mexico","denmark","norway","netherlands",
               "ukraine", "colombia","greece","finland","latvia","czech republic","slovakia",
               "lithuania","hungary","turkey","sweden","iceland","belgium","austria","germany","saudi arabia")
top_50_countries <- get_playlist_top_50_spotify(countries)

charts <- get_spotify_charts_data(region = "global", timestamp = "daily", date = "latest")
