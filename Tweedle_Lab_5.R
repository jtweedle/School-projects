#James Tweedle
#CSCI 390
#Lab 5

#Load libraries
library(tidyverse)
library(rvest)
library(robotstxt)

#Check if the website allows web scraping
paths_allowed("https://www.metacritic.com/")

#read in from the webpage 
page <- read_html("https://www.metacritic.com/browse/games/score/metascore/year/all")
xml_structure(page)

#title text and url
title <- page %>% 
  html_nodes("#main .product_title a") %>% 
  html_text %>% 
  str_replace_all("\\n","") %>% 
  str_replace_all("\\s\\s+","")
url <- page %>% 
  html_nodes("#main .product_title a") %>% 
  html_attr("href")
url <-   paste0("https://www.metacritic.com/",url)

#Is your data clean (no extra newlines or whitespace)?
#If not, what stringr function(s) will remove whitespace? 

#The data is not clean. The observations have /n(newline) and extra whitespace. 
#Using str_replace_all, the unwanted characters can be removed

# Is your data clean (including listing an absolute url https://www.metatcritic.com/ . )? 
#If not, what base-R function allows you to concatenate?

#The url data is not clean i.e. it doesn't have an absolute url.
#Using paste0(), the url can be concatenated. 

#scrape for the critic and user scores
metacritic <- page %>% 
  html_nodes("#main .positive") %>% 
  html_text() %>% 
  as.numeric()
user_score<- page %>% 
  html_nodes("#main .textscore") %>% 
  html_text %>% 
  as.numeric()

# Did you get 100 observations?
# How many observations did you get? 

# By using #main, I was able to get 100 observations for the metacritic and usescores

#assigns the first url to a variable. scrapes that url for the genre
one_URL <- url[1]
print(one_URL)
page2 <- read_html("https://www.metacritic.com//game/switch/divinity-original-sin-ii---definitive-edition")
g <- page2 %>% 
  html_nodes('.product_genre ') %>% 
  html_text()

#Did you successfully grab all three with just one value: genre, the metacritic and the userScore?
#What are the values for g, m, and u?

#The url_one variable has one value shown below.
#[1] "https:/d/www.metacritic.com//game/pc/katana-zero"

#For loop to iterate through all 100 URLs and scrape for genre
count <- 1
genre <- c()
for(one_URL in url){
  page2 <- read_html(one_URL)
  t<- page2 %>% 
    html_nodes('.product_genre') %>% 
    html_text()
  genre <- c(genre,t)
  count <- count + 1
}

#Remove the white space from genre
genre <- genre %>% 
  str_replace_all("\\s\\s+","")

#Did you successfully grab all three with just one value: genre, the metacritic and the userScore?
#What are the values for g, m, and u?

 

#assigns metacritic and userscore to a tibble and writes it to a csv
videoGames_noGenre <- tibble(metacritic,user_score)
write_csv(videoGames_noGenre,"data/metacritics_noGenre_2019.csv")

#plots Userscore vs Metacritic score and finds the correlation coefficient
videoGames_noGenre %>% 
  ggplot()+
  geom_point(aes(metacritic,user_score))
r <- videoGames_noGenre %>% 
  summarise(r=cor(metacritic,user_score))

#Does this correlation surprise you?

#The correlation coefficient shows a positive trend between metacritic and userscore
#This doesn't surprise me as people i.e users will tend to agree with critics i.e. metacritic. 
#0.308

#assigns the metacritic, user_score and genres to a tibble then writes to a csv
videoGames <- tibble(metacritic,user_score,genre)
write_csv(videoGames,"data/metacritics_genre_2019.csv")



#Lab 5b

#read in the genre csv file
videoGames <- read_csv("data/metacritics_genre_2019.csv")
glimpse(videoGames)

#replaces the character Genre(s):
videoGames <- videoGames %>% 
  mutate(genre=str_replace_all(genre,"\\(","")) %>% 
  mutate(genre=str_replace_all(genre,"\\)","")) %>%
  mutate(genre=str_replace_all(genre,"\\:","")) %>% 
  mutate(genre=str_replace_all(genre,"Genres",""))

#count how many commas in the genre column which tell how many genres exist
videoGames_commas <- videoGames$genre%>% 
  str_count(",") %>% 
  max()

#What is the maximum number of commas (the maximum count) for the 100 video games? 

# videoGames_commas
# [1] 4
#There are 5 unique genres

#remove the white space
videoGames <- videoGames %>% 
  mutate(genre=str_trim(genre,side=c("both")))

#seperates the genres into the 5 unique genres
videoGames<- videoGames %>%
  separate(genre,into=c("Genre1","Genre2","Genre3","Genre4","Genre5"),sep = ",")

#gather all the genres in two columns
videoGames <- videoGames %>% 
  gather(genre_num,genre,-metacritic,-user_score,na.rm = TRUE)
videoGames$genre %>% n_distinct()

#How many unique genres?
#[1] 44

#counts and plots by the most common genre
most_common_genre<- videoGames %>%
  group_by(genre) %>% 
  count() %>% 
  arrange(desc(n))
most_common_genre %>% 
  ggplot()+
  geom_col(aes(reorder(genre,n),n,fill=genre))+
  coord_flip()+
  guides(fill=FALSE)+
  labs(x="genre")

#What is the most common genre? 
#The most common genre is Action

#finds the average userscore by genre and plots
user_genre <- videoGames %>% 
  group_by(genre) %>% 
  summarise(avg=mean(user_score)) %>% 
  arrange(desc(avg))
user_genre %>% 
  ggplot()+
  geom_col(aes(reorder(genre,avg),avg,fill=genre))+
  coord_flip()+
  guides(fill=FALSE)+
  labs(x="Genre")

#What is the most popular genre based on user scores, filling by genre?
#Massively Multiplayer


#finds the average metacritic score by genre and plots
meta_genre <- videoGames %>% 
  group_by(genre) %>% 
  summarise(avg=mean(metacritic)) %>% 
  arrange(desc(avg))
meta_genre %>% 
  ggplot()+
  geom_col(aes(reorder(genre,avg),avg,fill=genre)) +
  coord_flip()+
  guides(fill=FALSE)+
  labs(x="Genre")

#What is the most popular genre based on metacritic score, filling by genre?
#The most common is Massivley Multiplayer