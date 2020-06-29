#pacote para nuvem de palavras
library(wordcloud)
library(tidytext)
library(stringr)
library(tidyverse)

#baixando 2500 tweets
fakenews<- searchTwitteR("vacinas autismo", lang="pt", n=100)
fakenews<- fakenews %>% twListToDF
View(fakenews)

#frequencia de palavras, limpeza do texto
subs <-"https://t.co/[A-Za-z\\d]+|http://[A-Za-z\\d]+|&amp;|&lt;|&gt;|RT|https"

fake_tokens <- fakenews %>% mutate(text = str_replace_all(text, subs, "")) %>%
  unnest_tokens(palavras, text)

 View(fake_tokens)

 #stopwords
 stopwords_pt <- read_csv("stopwords-pt.csv")
 
  fake_tokens<- anti_join(fake_tokens, stopwords_pt)
  palavras<- count (fake_tokens, palavras, sort = TRUE)
  
 view(palavras)  
 view(stopwords_pt)
  #NUVEM
 wordcloud(palavras$palavras,palavras$n,max.words = 250, colors = c("blue","red","purple"))
 ?wordcloud 
 pal<- brewer.pal(6,"Set1")
wordcloud(palavras$palavras,palavras$n,random.color = TRUE, max.words = 250, colors = pal) 
