#TwitteR
library(tidyverse)
library(twitteR)
library(readr)

#validação twitter dev
consumer_key <-" "
consumer_secret <-" "
access_token <-" "
access_secret<- " "

#connect
setup_twitter_oauth(consumer_key, consumer_secret,access_token, access_secret)

#algumas funções
?getTrends

availableTrendLocations() %>% View
getTrends("455827") %>% View

#buscando e baixando tweets
searchTwitteR("fakenews")
  ?searchTwitter

  fakenews<- searchTwitteR(" fake news vacinas ", n = 100, since = '2020-05-01', until = '2020-06-30')

fakenews<- fakenews %>% twListToDF

view(fakenews)

 write.table(fakenews, file = "fakenews3.txt", sep = "\t")
 ?write_csv
?write_excel_csv
