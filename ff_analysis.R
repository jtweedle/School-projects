#James Tweedle
#CSCI 390
#Partners:John McGregor, Nathan Hill

#load necessary packages
library(tidyverse)

#import the ff_data files
ff <- dir(path = "ff_data",pattern = "*.csv") %>% 
  map_dfr(function(x) read_csv(file.path("ff_data",x),col_names=FALSE))

#create a vector called names with the desired column headers and then assigning those headers
names <- c("subject","potatoey","buttery","grassy","rancid","painty")
colnames(ff) <- names

#plot the potatoey data in a bar chart
ff %>% ggplot(aes(potatoey))+
  geom_bar(fill="purple")
