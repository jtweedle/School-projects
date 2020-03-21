#James Tweedle
#Fall 2019 CSCI 390
#Activity 9b
#Partners:Diego Reyes, Mike Davis

#load libraries
library(reshape2)
library(tidyverse)

#create a tibble from french fries
ff <- as_tibble(french_fries)

#make the wide data set to long
ff <- ff %>% 
  gather(category,amount,potato:painty) %>% 
  na.omit()

#finds the average rating by category
avg <- ff %>% 
  group_by(category) %>% 
  summarise(mean=mean(amount))

#plot of Average rating vs Category and displays in descending order
avg %>% 
  ggplot()+
  geom_col(aes(reorder(category,mean),mean,fill=category))+
  labs(title="French Fries",
       x="",
       y="Average Rating")+
  theme(plot.title = element_text(hjust = 0.5))+
  coord_flip()+
  guides(fill=FALSE)
