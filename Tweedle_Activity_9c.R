#James Tweedle
#Fall 2019 CSCI 390
#Activity 9c
#Partners:Reid Jumper

#load packages
library(tidyverse)
library(RColorBrewer)

#import the top 250 csv file
top <- read_csv("data/top_250.csv")

#plots the top 250 grossing movies by year
top %>% 
  ggplot()+
  geom_histogram(aes(year),fill=palette(brewer.pal(n=9,name = "Set1")),bins=9)+
  labs(title = "Top 250 Grossing Movies")+
  theme(plot.title = element_text(hjust=0.5),
        panel.background = element_blank())
