source("tokens.R")
source("functions.R")
library(plotrix)
library(ggplot2)
library(tidyverse)
library(colorspace)
library(RColorBrewer)

# zebrane dane pochodza z dnia 04.06.2022r.
# danceability wykres gestosci
danceability_plot <- ggplot(data = data, aes(y=danceability, fill=countries))
danceability_plot+geom_boxplot()+ggtitle("Wykres pudelkowy tanecznosci piosenek dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# energy wykres gestosci
energy_plot <- ggplot(data = data, aes(y=energy, fill=countries))
energy_plot+geom_boxplot()+ggtitle("Wykres pudelkowy energicznosci piosenek dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# loudness wykres gestosci
loudness_plot <- ggplot(data = data, aes(y=loudness, fill=countries))
loudness_plot+geom_boxplot()+ggtitle("Wykres pudelkowy glosnosci piosenek dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# speechiness wykres gestosci, ilosc slow
speechiness_plot <- ggplot(data = data, aes(y=speechiness, fill=countries))
speechiness_plot+geom_boxplot()+ggtitle("Wykres pudelkowy ilosci slow w piosence dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# danceability wykres gestosci
acousticness_plot <- ggplot(data = data, aes(y=acousticness, fill=countries))
acousticness_plot+geom_boxplot()+ggtitle("Wykres pudelkowy akustyki piosenek dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# liveness wykres gestosci, algorytm wykrywa czy dana piosenka zostala nagrana na zwyco
liveness_plot <- ggplot(data = data, aes(y=liveness, fill=countries))
liveness_plot+geom_boxplot()+ggtitle("Wykres pudelkowy piosenek na zywo dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# valence wykres gestosci
valence_plot <- ggplot(data = data, aes(y=valence, fill=countries))
valence_plot+geom_boxplot()+ggtitle("Wykres pudelkowy nastrojowosci piosenek dla wszystkich krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))

# tempo wykres gestosci
tempo_plot <- ggplot(data = data, mapping=aes(y=tempo, fill=countries))
tempo_plot+geom_boxplot()+ggtitle("Wykres pudelkowy tempa piosenek dla wszystkich krajow z dnia 04.06.2022")

##### wykresy dla wybranych krajow w celu dostrzezenia roznicy kulturowej#####
###############################################################################

countries <- data[data$countries %in% c("Australia","Poland","USA","south africa","iceland","Brazil","South Korea","saudi arabia","uruguay"),]
paleta <- choose_palette()
View(paleta)
colors <- c("#005F00", "#007700", "#008F00", "#00A700", "#00B700", "#0FC500" ,"#77D174", "#B1DCB0" ,"#E5E5E5")
col <- c("#123012","#3e6223","#51802d","#619b36","#7cbf4a","#a5d284","#c9e3b5","#e9f4e1","#ffffff")
# danceability wykres gestosci dla wybranych krajow
danceability_plot_countries <- ggplot(data = countries, aes(y=danceability, fill=countries))
danceability_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy tenecznosci piosenek dla wybranych krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# energy wykres gestosci dla wybranych krajow
energy_plot_countries <- ggplot(data = countries, aes(y=energy, fill=countries))
energy_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy energicznosci piosenek dla wybranych krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# loudness wykres gestosci dla wybranych krajow
loudness_plot_countries <- ggplot(data =countries, aes(y=loudness, fill=countries))
loudness_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy glosnosci piosenek dla wybranych krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# speechiness wykres gestosci dla wybranych krajow
speechiness_plot_countries <- ggplot(data = countries, aes(y=speechiness, fill=countries))
speechiness_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy iloœci slow w piosence dla wybranych krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# danceability wykres gestosci dla wybranych krajow
acousticness_plot_countries <- ggplot(data = countries, aes(y=acousticness, fill=countries))
acousticness_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy akustyki piosenek dla wybranych krajow z dnia 04.06.2022")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# liveness wykres gestosci dla wybranych krajow
liveness_plot_countries <- ggplot(data = countries, aes(y=liveness, fill=countries))
liveness_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy piosenek nagranych na zywo dla wybranych krajow z dnia 04.06.2002")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# valence wykres gestosci dla wybranych krajow
valence_plot_countries <- ggplot(data = countries, aes(y=valence, fill=countries))
valence_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy nastrojowosci piosenek dla wybranych krajow z dnia 04.06.2002")+
  guides(fill=guide_legend(title="Kraje:"))+
  scale_fill_brewer(palette="Greens")

# tempo wykres gestosci dla wybranych krajow
tempo_plot_countries <- ggplot(data = countries, mapping=aes(y=tempo, fill=countries))
tempo_plot_countries+geom_boxplot()+ggtitle("Wykres pudelkowy tempa piosenek dla wybranych krajow z dnia 04.06.2022")+
  scale_fill_brewer(palette="Greens")

## wykresy slupkowe dla wybranych krajow - najpopularniejsze gatunki i artysci
(kolor <- c(brewer.pal(9,"BuGn"),brewer.pal(11,"BuGn")))
(kolor <- kolor[c(4:9)])

polska <- data[data$countries %in% c("Poland"),]
polska_plot <- plot(factor(polska$artist_genres),col = col, main="Wykres najpopularniejszych gatunkow w Polsce z dnia 04.06.2022")

par(mai = c(2.5,1,1,1))
polska_plot2 <- plot(factor(polska$artist),col = col, las=2, 
                    main="Wykres najpopularniejszych artystow w Polsce z dnia 04.06.2022")

france <- data[data$countries %in% c("France"),]
france_plot <- plot(factor(france$artist_genres),col = col, main="Wykres najpopularniejszych gatunkow we Francji z dnia 04.06.2022")

france_plot2 <- plot(factor(france$artist),col = col, las=2, 
                    main="Wykres najpopularniejszych artystow we Fracji z dnia 04.06.2022")

southk <- data[data$countries %in% c("South Korea"),]
sk_plot <- plot(factor(southk$artist_genres),col = col, main="Wykres najpopularniejszych gatunkow w Korei Poludniowej z dnia 04.06.2022")

sk_plot <- plot(factor(southk$artist),col = col, las=2, 
                 main="Wykres najpopularniejszych artystow w Korei Poludniowej z dnia 04.06.2022")
world <- plot(factor(data$artist_genres), col = col, las=2, main="Wykres najpopularniejszych gatunkow muzycznych na swiecie z dnia 04.06.2022")
par(mai = c(3,1,1,1))
x <- data$artist_genres
x <- sort(prop.table(table(x)), decreasing=TRUE)
x <- head(x,-50)
barplot(x,las=2,col = col,main="Wykres najpopularniejszych gatunkow muzycznych na swiecie z dnia 04.06.2022")

