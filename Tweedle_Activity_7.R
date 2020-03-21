#James Tweedle
#Fall 2019 CSCI 390
#Activity 7
#Partners: Diego Reyes, Isiah Vaughnn

#load libraries
library(tidyverse)
library(lubridate)

#read in the weather file
weather <- read_csv("data/weather.csv")

#wrangle the days columns
weather2 <- weather %>% 
  select(station,year,month,d1:d30) %>% 
  gather(Day,Element,-station,-year,-month)
weather3 <- weather2 %>% 
  mutate(Day=str_replace_all(Day,"d",""))
weather4 <-  weather3 %>%
  mutate(Date=mdy(paste(year,month,Day,sep = ","))) %>% 
  na.omit()

