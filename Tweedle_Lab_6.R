#James Tweedle
#Fall 2019 CSCI 390
#Lab 6
#I want to be part of it New York, New York 

#load libraries
library(tidyverse)
library(lubridate)
library(RColorBrewer)
library(leaflet)

#import the nyc file
nyc <- read_csv("data/AB_NYC_2019.csv")

# Rename the list of variables below:
# neighborhood_group to group
# minimum_nights to min
# number_of_reviews to num_reviews
# calculated_host_listings_count to count
# availability_365 to availability
nyc <- nyc %>% 
  rename(group=neighbourhood_group,
         min=minimum_nights,
         num_reviews=number_of_reviews,
         count=calculated_host_listings_count,
         availability=availability_365)

#convert last_review to a date data type
nyc <- nyc %>% 
  mutate(last_review=as.Date(last_review))

#filter out all availabilities that are 0
nyc <- nyc %>% 
  filter(availability!=0)

#bar chart of the number of available Airbnbs by NYC borough
nyc %>% 
  group_by(group) %>% 
  count() %>% 
  ggplot()+
  geom_col(aes(reorder(group,(n)),n,fill=group))+
  labs(title = "Number of Airbnbs in
NYC",
       x=" NYC Borough",
       y=" Number")+
  theme(panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5)
        )+
  guides(fill=FALSE)

#Which borough has the most Airbnbs?
#Manhattan has the most Airbnbs

#column chart to plot the average price of Airbnbs by NYC borough\
nyc %>% 
  group_by(group) %>% 
  summarise(avg=mean(price)) %>% 
  ggplot()+
  geom_col(aes(reorder(group,avg),avg,fill=group))+
  labs(title="Average Price by NYC
Borough",
       x=" NYC Borough",
       y=" Average Price")+
  theme(panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5))+
  guides(fill=FALSE)

#Which borough has the highest mean price?
#Manhattan has the highest mean price

nyc %>% 
  group_by(group,neighbourhood) %>% 
  summarise(avg=mean(price)) %>% 
  ggplot()+
  geom_col(aes(reorder(neighbourhood,avg),avg,fill=neighbourhood))+
  facet_wrap(~group,scales = "free",ncol=1)+
  labs(title = "Average Price by
Neighborhood",
       x="Neighbourhood",
       y="Average Price")+
  coord_flip()+
  theme(panel.background = element_blank(),
        plot.title = element_text(hjust=0.5),
        axis.text.y = element_blank(),
        axis.ticks.y=element_blank())+
          guides(fill=FALSE)

#Within each of the five boroughs, which neighborhood has the lowest cost?
#What is the lowest average cost?
lowest <- nyc %>% 
  group_by(group,neighbourhood) %>% 
  summarise(avg=mean(price)) %>% 
  top_n(n=-1)

#group           neighbourhood   avg
#1 Bronx         Mount Eden      42.7
#2 Brooklyn      Borough Park    65.3
#3 Manhattan     Inwood          94.3
#4 Queens        Corona          58.7
#5 Staten Island Port Richmond   48.8

#The lowest average price within the 5 boroughs is in the Bronx, Mount Eden
#The average price of this neighbourhood is $42.67

# What are the most expensive neighborhoods for each of the five boroughs? 
# Of these 5, which is the highest?

highest <- nyc %>% 
  group_by(group,neighbourhood) %>% 
  summarise(avg=mean(price)) %>% 
  top_n(n=5)

highest %>% 
  ggplot()+
  geom_col(aes(reorder(neighbourhood,avg),avg,fill=neighbourhood))+
  facet_wrap(~group,scales = "free_x",ncol=1)+
  labs(title = "Average Price by
Neighborhood",
       x="Neighbourhood",
       y="Average Price")+
  theme(panel.background = element_blank(),
        plot.title = element_text(hjust=0.5))+
  guides(fill=FALSE)

#The highest Average Price Neighbourhoods:
#Bronx:Riverdale
#Brooklyn:Sea Gate
#Manhattan:Tribeca
#Queens:Nesponsit
#Staten Island:Wadsworth

#The highest average price is Wadsworth in Staten Island at $800

colorValues <- palette(brewer.pal(n=5, name="Set1"))

nyc %>% 
  filter(year(last_review)==2019)%>% 
  ggplot()+
  geom_point(aes(last_review,num_reviews,color=group,size=price),alpha=0.3)+
  labs(title = "Airbnb Reviews",
       subtitle = " 2019",
       x="Date of Review",
       y=" Number of Reviews")+
  theme(panel.background = element_blank(),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  scale_color_manual(values = colorValues)

#Which neighborhood has the highest number of views (list the month but not the actual number of reviews)?
#Queens had the highest number of reviews in the month of July


colorValues_v2 <- palette(brewer.pal(n=5, name="Dark2"))
nyc %>% 
  filter(year(last_review)==2019) %>% 
  ggplot()+
  geom_point(aes(last_review,num_reviews,color=group,size=price),alpha=0.3)+
  facet_wrap(~group,ncol = 5)+
  labs(title="Airbnb Reviews",
       x=element_blank(),
       y="Number of Reviews",
       subtitle = "2019")+
  theme(legend.position = "bottom",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust=0.5))+
  scale_color_manual(values = colorValues_v2)

#Approximately,what are the maximum number of reviews for each borough? 
#Bronx:325
#Brooklyn:500
#Manhattan:615
#Queens:625
#Staten Island:325

nyc_neighborhood_top3 <- nyc %>% 
  group_by(group,neighbourhood) %>% 
  summarise(avg=mean(price),latitude=mean(latitude),longitude=mean(longitude)) %>% 
  top_n(n=3,avg)
nyc_neighborhood_top3 %>% 
  top_n(nrow(.))

#What are the top 3 Airbnbs for each borough's neighborhood? 
#   group           neighbourhood       avg   latitude longitude
#1  Bronx           City Island         178.  40.8     -73.8
#2  Bronx           Riverdale           567.  40.9     -73.9
#3  Bronx           Spuyten Duyvil      155.  40.9     -73.9
#4  Brooklyn        Brooklyn Heights    238.  40.7     -74.0
#5  Brooklyn        Cobble Hill         242.  40.7     -74.0
#6  Brooklyn        Sea Gate            570.  40.6     -74.0
#7  Manhattan       Battery Park City   512.  40.7     -74.0
#8  Manhattan       Flatiron District   382.  40.7     -74.0
#9  Manhattan       Tribeca             561.  40.7     -74.0
#10 Queens          Arverne             175.  40.6     -73.8
#11 Queens          Breezy Point        213.  40.6     -73.9
#12 Queens          Neponsit            275.  40.6     -73.9
#13 Staten Island   Fort Wadsworth      800   40.6     -74.1
#14 Staten Island   Prince's Bay        484.  40.5     -74.2
#15 Staten Island   Randall Manor       336   40.6     -74.1

nyc_neighborhood_top3 %>%
  leaflet(options = leafletOptions(zoomSnap=0.1)) %>%
  addTiles() %>%
  setView(-74.00, 40.71, zoom = 12) %>%
  addMarkers(~longitude, ~latitude)
