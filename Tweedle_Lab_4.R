#James Tweedle
#CSCI 390
#Lab 4

#load the necessary packages
library(tidyverse)

#Function to calculate distance
haversine <- function(long1, lat1, long2, lat2, round = 3) {
  # convert to radians
  long1 = long1 * pi / 180
  lat1  = lat1  * pi / 180
  long2 = long2 * pi / 180
  lat2  = lat2  * pi / 180
  
  R = 6371 # Earth mean radius in km
  
  a = sin((lat2 - lat1)/2)^2 + cos(lat1) * cos(lat2) * sin((long2 - long1)/2)^2
  d = R * 2 * asin(sqrt(a))
  
  return( round(d,round) ) # distance in km
}

#import the requires files
dn <- read_csv("Tweedle_data/dennys.csv")
lq <- read_csv("Tweedle_data/laquinta.csv")

#How many Denny's locations are there in Alaska?
dn_ak <- dn %>% 
  filter(state=="AK")

#There are 3 Denny's locations in Alaska

#How many La Quinta locations are there in Alaska?
lq_ak <- lq %>% 
  filter(state=="AK")

#There are 2 Laquinta's in Alaska

#Peform a full join on the locations of Denny's and Laquinta's in Alaska
ak_all <- full_join(dn_ak,lq_ak,by="state")

#How many observations in the full join and what are the variable names? 
glimpse(ak_all)

# Observations: 6
# Variables: 11
# $ address.x   
# $ city.x      
# $ state       
# $ zip.x       
# $ longitude.x 
# $ latitude.x  
# $ address.y   
# $ city.y      
# $ zip.y       
# $ longitude.y
# $ latitude.y 

#Calculate the distances from each Denny's to each Laquinta in Alaska
dn_lq_ak <- ak_all %>% 
  mutate(distance=haversine(longitude.x,latitude.x,longitude.y,latitude.y))

#What are the closest locations?
closest <- dn_lq_ak %>% 
  group_by(city.x,address.x) %>% 
  summarise(x=min(distance))

closest

# city.x    address.x            x
# <chr>     <chr>            <dbl>
# 1 Anchorage 2900 Denali       2.04
# 2 Anchorage 3850 Debarr Road  6.00
# 3 Fairbanks 1929 Airport Way  5.20

#create a vector of deep south states
deep_south <- c("AL", "SC", "MS", "GA", "LA")

#Find Denny's in the deep south
dn_ds <- dn %>% 
  filter(state == deep_south)

#Find the Laquinta's in deep south
lq_ds <- lq %>% 
  filter(state==deep_south)

#Perform a full join
ds_all <- full_join(dn_ds,lq_ds,by="state")

#Find the distance between every Denny's and Laquinta locations in the deep south
dn_lq_ds <- ds_all %>% 
  mutate(distance=haversine(longitude.x,latitude.x,longitude.y,latitude.y))

#Find the 10 closest Denny's and Laquinta locations
ds_all_min<- dn_lq_ds %>% 
  group_by(state,city.x,address.x) %>% 
  summarise(x=min(distance)) %>% 
  arrange(x)

ds_all_min


#What are the closest locations?
# 1	GA	Columbus	3239 MacOn Rd	2.731
# 2	GA	Richmond Hill	3944 Highway 17 S	9.129
# 3	SC	Columbia	5901 Fairfield Dr	12.449
# 4	GA	Suwanee	2925 Lawrenceville Suwanee Rd	19.496
# 5	GA	Kingsland	1222 Boone St	49.262
# 6	AL	Birmingham	900 16th St S, Commons on Gree	79.072
# 7	SC	St George	113 Motel Drive	92.011
# 8	SC	N Charleston	2280 Ashley Phosphate Rd	137.955
# 9	MS	Greenville	1839 Highway 1 South	149.507
#10 LA	Greenwood	9510 Greenwood Road	253.794 

#Find the mean distance of the 10 closest locations
avg_dist<- ds_all_min %>%
  group_by(state) %>% 
  summarise(avg=mean(x))

#Plot the average distances by state 
avg_dist %>% 
  ggplot()+
  geom_col(aes(state,avg,fill=state))

#On average, in which state are Denny's and La Quinta the furthest apart? 
#On average, in which state are they the closest?

#Denny's and Laquita hotels are closest in Georgia.
#They are farthest apart in Louisana
