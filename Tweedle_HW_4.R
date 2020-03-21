#James Tweedle
#Fall 2019 CSCI 390
#Homework 4
#Colleges in the US

#load libraries
library(tidyverse) 
library(socviz) 
library(RColorBrewer)
library(usmap) 
library(maps) 
library(cowplot)

#create a data frame of the US states
us_states <- us_map("states")

#view the us_states data set
glimpse(us_states)

#Rename your state abbreviation variable state
us_states <- us_states %>% 
  rename(state=abbr,long=x,lat=y)

#plot the US states
us_states %>% 
  ggplot(aes(long,lat,group=group))+
  geom_polygon(fill="cornsilk2",color="darkgray")+
  coord_equal()+
  theme_map()

#dataframe of US states with counties
us_counties <- county_map

#view the us_counties dataset
glimpse(us_counties)

#plot the US by counties 
us_counties %>% 
  ggplot(aes(long,lat,group=group))+
  geom_polygon(fill="cornsilk2",color="darkgray")+
  coord_equal()+
  theme_map()

#Read the college dataset and assign to the data frame college
college <- read_csv("data/college.csv")

#view the college dataset
glimpse(college)

#convert the city observational units to lowercase in the college dataset
college <- college %>% 
    mutate(city=str_to_lower(city))

#Read the ZIP-COUNTY-FIPS_2018-03 dataset and assign to the data frame fips
fips <- read_csv("data/ZIP-COUNTY-FIPS_2018-03.csv")

#view the fips dataset
glimpse(fips)

#What is the FIPS code for Oxford, Lafayette County, MS?
fips %>% filter(ZIP==38655 & COUNTYNAME=="Lafayette County")

#Select and rename the variables STATE, CITY, STCOUNTYFP to state, city, and fips
#convert the city variable to lowercase in the fips dataset
fips <- fips %>% 
  select(state=STATE,city=CITY,fips=STCOUNTYFP) %>%
  mutate(city=str_to_lower(city))

#view the wrangled fips dataset
glimpse(fips)

#Left join college and fips by city
college_fips <- left_join(college,fips,"city")

# select the distinct combinations of name,state,andvcity, keeping all of the columns
college_fips <- select(college_fips,-state.y) %>% 
  rename(state=state.x) %>% 
  distinct(name,city,state,.keep_all = TRUE)

#Correct the fips code to match the county_map fips code name
college_fips<- college_fips %>%
  rename(id=fips,number=id) %>%
  mutate(loan_default_rate=as.numeric(loan_default_rate)) %>% 
  na.omit()

#convert the us_counties fips to match the data type of college_fips
us_counties <- us_counties %>%
  mutate(id=as.double(id))
  

#create another data frame, college_default, that contains state, fips, and the average loan_default_rate (
college_default <- college_fips %>%
  group_by(state,id) %>% 
  summarise(avg=mean(loan_default_rate))

#Join county_map and college_default, calling your data frame college_default_map
college_default_map <- left_join(us_counties,college_default)

#Plot the map, filling by the average loan_default_rate with Color Brewer's Set1 palette
college_default_map %>% 
  ggplot(aes(long,lat,group=group,fill=avg))+
  geom_polygon(color="black",size=0.5)+
  coord_equal()+
  theme_map()+
  scale_fill_distiller(palette = "Set1")+
  labs(title = "Average Loan Default Rate by County")+
  theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=FALSE)


#create a data frame that contains state and average loan_default_rate
college_default_state_level <- college_fips %>% 
  group_by(state) %>% 
  summarise(avg=mean(loan_default_rate))%>%
  na.omit()

#join the us_states and college_default_state_level dataframe
college_default_state_level_map <- left_join(us_states,college_default_state_level)

#plot the avg loan rate by state
college_default_state_level_map %>% 
  ggplot(aes(long,lat,group=group,fill=avg))+
  geom_polygon(color="black")+
  scale_fill_distiller(palette = "RdPu",trans="reverse")+
  labs(title=" Loan
Default Rate ",fill="Average")+
  coord_equal()+
  theme_map()+
  theme(plot.title = element_text(hjust = 0.5))


#Top 10 schools with the highest loan default rate
college_fips %>% 
  group_by(state) %>% 
  summarise(avg=mean(loan_default_rate)) %>% 
  top_n(10,avg) %>% 
  arrange(desc(avg))

#Top 10 schools with lowest average loan default rate
college_fips %>% 
  group_by(state) %>% 
  summarise(avg=mean(loan_default_rate)) %>% 
  top_n(-10,avg) %>% 
  arrange(avg)

#create a dataframe that shows the average sat score by state
sat_avg_state_level <- college_fips %>% 
  group_by(state) %>% 
  summarise(avg=mean(sat_avg))

#join us_states and sat_avg_state_level
sat_avg_state_level_map <- left_join(us_states,sat_avg_state_level)

#create a datafram that aggrates the avg sat score and mean longitude and latitude
centroid <- aggregate(data=sat_avg_state_level_map, cbind(long, lat) ~ avg, FUN=mean)

#plot the average Sat score
sat_avg_state_level_map %>% 
  ggplot(aes(long,lat,fill=avg))+
  geom_polygon(aes(group=group),color="gray",size=0.5)+
  scale_fill_gradient(low="orange",high="purple")+
  labs(title="Average",
       fill="SAT")+
  coord_equal()+
  theme_map()+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "bottom")+
  guides(fill=guide_legend(nrow = 1))+
  geom_text(data = centroid,aes(long,lat,label=sprintf("%0.0f",avg)),color="black")

#which 5 states have the highest average SAT score?
sat_avg_state_level %>% 
  top_n(5,avg) %>% 
  arrange(desc(avg))

#Which 5 states have the highest average SAT score?
sat_avg_state_level %>% 
  top_n(-5,avg) %>% 
  arrange(avg)

#dataframe of the colleges in Mississippi
ms_colleges <- college %>% 
  filter(state=="MS")

#dataframe of Mississippi counties
ms_counties <- map_data("county",region="mississippi")

#plot the SAT scores of the colleges in Mississippi
ms_counties %>% 
  ggplot(aes(long,lat))+
  geom_polygon(aes(group=group),fill="cornsilk2",color="lightgray")+
  coord_equal()+
  theme_map()+
  labs(title = "Mississippi",
       subtitle="Average SAT Scores")+
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  geom_text(data=ms_colleges,aes(lon,lat,label=sat_avg),size=2)
