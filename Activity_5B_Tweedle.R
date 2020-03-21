#James Tweedle
#CSCI 390
#Activity 5B
#Partners: Josh Hall, Nathan Hill

#load the necessary packages
library(tidyverse)

#import the cat lovers csv
catlover <- dir(path = "data_Tweedle",pattern = "*.csv") %>% 
  map_dfr(function(x) read_csv(file.path("data_Tweedle",x)))

#replace the observations of handedness from the abbrevaitions l,r,a to
#left,right, and ambidextrous
catlover <- catlover %>% 
  mutate(handedness=case_when(handedness=="l"~"left",
                   handedness=="r"~"right",
                   handedness=="a"~"ambidextrous"))

#replace the two character values to numeric values in the number_of_cats 
#column
catlover<- catlover %>%
  mutate(number_of_cats=case_when(number_of_cats=="1.5 - honestly I think one of my cats is half human"~2,
                   number_of_cats=="three"~3,
                   TRUE~as.numeric(number_of_cats)))

#find the mean number of cats owned
catlover <- catlover %>% 
  mutate(catmean=mean(number_of_cats))

#The mean is 0.817

#find all the owners that less than mean number of cats(all people without cats)
below_mean <-catlover %>% 
  filter(number_of_cats<catmean) %>% 
  select(name)

#There are 33 people who don't own cats
                                