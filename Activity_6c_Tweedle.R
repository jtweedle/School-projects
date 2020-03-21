#James Tweedle
#Fall 2019 CSCI 390
#Activity 6c
#Partners: Bryant Edwards

#load the necessary package
library(tidyverse)
library(rvest)
library(readxl)

#scrape for the title, gross, number of weeks and weekend gross for the top 10 movies
page <-read_html("https://www.imdb.com/chart/boxoffice")
title<- page %>%
  html_nodes(".titleColumn a") %>%
  html_text()

weekend <- page %>%
  html_nodes(".titleColumn+ .ratingColumn") %>%
  html_text() %>%
  str_replace_all("\\\n", "") %>% 
  str_replace("\\$","") %>% 
  str_replace("\\M","") %>% 
  as.numeric()
  
gross <- page %>%
  html_nodes(".ratingColumn+ .ratingColumn") %>%
  html_text() %>%
  str_replace_all("\\\n", "") %>% 
  str_replace("\\$","") %>% 
  str_replace("\\M","") %>% 
  as.numeric()
weeks <- page %>% 
  html_nodes(".weeksColumn") %>% 
  html_text() %>% 
  str_replace("\\\n","") %>% 
  as.numeric()

#create a tibble of the four variables and calculate the gross average
top <- tibble(title=title,weekend=weekend,gross=gross,weeks=weeks)
average <- top %>% 
  mutate(GrossAverage=gross/weeks) %>% 
  arrange(desc(GrossAverage))
