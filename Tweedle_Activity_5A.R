#James Tweedle
#CSCI 390
#Activity A
#Partner:Adam Whitten

#load necessary packages
library(tidyverse)
library(reshape2)

#create a tibble from the French fries data
ff <- french_fries %>% 
  as_tibble() %>% 
  arrange(time,subject) %>% 
  mutate(meanscore=rowMeans(french_fries[5:9],na.rm = TRUE))

#create a new tibble that groups by time,treatment, and subject
#and then finds the mean of each different taste e.g. potato
ff1 <- french_fries %>% 
  group_by(time,treatment,subject) %>% 
  summarise(potatomean=mean(potato),
            rancidmean=mean(rancid),
            grassymean=mean(grassy),
            paintymean=mean(painty),
            butterymean=mean(buttery))%>%
  na.omit() %>%
  View()
