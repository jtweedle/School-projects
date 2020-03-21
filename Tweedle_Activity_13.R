#James Tweedle
#Fall 2019 CSCI 390
#Activity 13
#Partners:Robert Rayburn, Jack Lampton

#load libraries
library(tidyverse)
library(tidytext)
library(genius)
library(gutenbergr)


#dataframe with an artist and album
pink <-genius_album(artist = "Pink Floyd",album = "The Dark Side of the Moon")

#add the name of the album and the artist
pink <- pink %>% 
  mutate(Artist="Pink Floyd",
         Album="The Dark Side of the Moon") %>% 
  na.omit()


#determine the topo 20 words
pink_lyrics <- pink %>% 
  unnest_tokens(word,lyric) %>% 
  anti_join(get_stopwords(source="smart")) %>% 
  count(word) %>% 
  arrange(desc(n)) %>% 
  head(20) %>% 
  na.omit()


#what are the sentiments of the words
pink_sentiment <- pink %>% 
  unnest_tokens(word,lyric) %>% 
  anti_join(get_stopwords(source="smart")) %>% 
  inner_join(get_sentiments("bing")) %>% 
  count(sentiment,word)

#what are the top 20 positive and negative words?
pink_sentiment %>% 
  filter(sentiment=="positive") %>% 
  head(20) %>% 
  arrange(desc(n))

# sentiment word           n
# <chr>     <chr>      <int>
#   1 positive  good           4
# 2 positive  balanced       1
# 3 positive  fairly         1
# 4 positive  faithful       1
# 5 positive  fidelity       1
# 6 positive  helped         1
# 7 positive  love           1
# 8 positive  magic          1
# 9 positive  marvellous     1
# 10 positive  quiet          1
# 11 positive  ready          1
# 12 positive  sane           1
# 13 positive  sharp          1
# 14 positive  smiles         1
# 15 positive  warm           1
# 16 positive  work           1


pink_sentiment %>% 
  filter(sentiment=="negative") %>% 
  head(20) %>% 
  arrange(desc(n))

# sentiment word            n
# <chr>     <chr>       <int>
# 1 negative  dark            5
# 2 negative  dying           3
# 3 negative  died            2
# 4 negative  afraid          1
# 5 negative  beg             1
# 6 negative  blow            1
# 7 negative  breaks          1
# 8 negative  bruising        1
# 9 negative  bullshit        1
# 10 negative  cloud           1
# 11 negative  cold            1
# 12 negative  crime           1
# 13 negative  cry             1
# 14 negative  death           1
# 15 negative  deny            1
# 16 negative  desperation     1
# 17 negative  destroy         1
# 18 negative  distrust        1
# 19 negative  drunk           1
# 20 negative  dull            1

#Faceted plot to show positive and negative
pink_sentiment %>% 
  ggplot()+
  geom_col(aes(reorder(word,n),n,fill=sentiment))+
  coord_flip()+
  facet_wrap(~sentiment,scales = "free")+
  labs(title = "Sentiment of Pink Floyd",
       x=element_blank())


#Does your artist tend to use more positive or negative words?
#Pink Floyd tends to use more negative words 