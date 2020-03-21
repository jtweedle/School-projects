#James Tweedle
#Fall 2019 CSCI 390
#Activity 10 part A
#Partners:Maggie Green,Kevin Harrell 

#load libraries
library(tidyverse)
library(socviz)
library(cowplot)
library(RColorBrewer)


#import the csv files
diabetes <- read_csv("data/diabetes2013.csv",skip = 1)

#mutate variables to match county_map data
diabetes<- diabetes %>% 
  mutate(region=str_to_lower(State),
         id=`FIPS Codes`,
         percent=as.numeric(percent),
         number=as.numeric(number)) %>% 
  na.omit()

#join the diabetes dataset with the county map dataset
diabetes<- left_join(diabetes1,county_map,by="id")

#plot the diabetes percentages in the united states         
diabetes%>% 
  ggplot(aes(long,lat,fill=percent,group=group))+
  geom_polygon(color="gray",size=0.5)+
  coord_equal()+
  theme_map()+
  guides(fill=guide_legend(nrow = 1))+
  theme(legend.position = "bottom")+
  scale_color_gradient2(low = "beige",high="red",aesthetics = "fill")

#plot diabetes percentages in the state of MS
diabetes%>% 
  filter(region=="mississippi") %>% 
  ggplot(aes(long,lat,fill=percent,group=group))+
  geom_polygon(color="gray",size=0.5)+
  coord_equal()+
  theme_map()+
  guides(fill=guide_legend(nrow = 1))+
  theme(legend.position = "bottom")+
  scale_color_gradient2(low = "beige",high="red",aesthetics = "fill")
