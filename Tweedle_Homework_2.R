#James Tweedle
#Fall 2019 CSCI 390
#Homework 2
#Washington DC Bike Sharing Rentals

#load the necessary packages
library(tidyverse)
library(lubridate)

#import the bike sharing csv
bikes<- dir(path = "data",pattern = "*.csv") %>% 
  map_dfr(function(x) read_csv(file.path("data",x),col_names=TRUE))

#Rename the observations in seasons,holiday,workingday,yr,weathersit,dteday
bikes <- bikes %>% 
  mutate(season=case_when(season==1~"Winter",
                          season==2~"Spring",
                          season==3~"Summer",
                          season==4~"Fall"),
         holiday=case_when(holiday==0~"No",
                           holiday==1~"Yes"),
         workingday=case_when(workingday==0~"Weekend",
                              workingday==1~"Weekday"),
         yr=case_when(yr==0~2011,yr==1~2012),
         weathersit=case_when(weathersit==1~"Clear",
                              weathersit==2~"Mist",
                              weathersit==3~"Light Rain",
                              weathersit==4~"Heavy Rain")) %>% 
  rename("Washington DC Date"=dteday)

glimpse(bikes)

#rename the four weather conditions and convert the two temperatures from celsius to farenheit
bikes <- bikes %>% 
  mutate(Humidity=hum*100,Windspeed=windspeed*67,Temperature=temp*41,"Adjusted Temperature"=atemp*50) %>% 
  mutate(Temperature=Temperature*(9/5)+32,"Adjusted Temperature"=`Adjusted Temperature`*(9/5)+32) 

#Find the difference between total bike rentals, the sum of the bike rentals by regiestered and non-registered members
#Filter for observations not equal to zero
#The difference between them shoud be zero for ALL observations
#Finally rename cnt to Bike Rentals
bikes <- bikes%>% 
  mutate(diff=cnt-(nonregistered+registered)) 

missing_rentals <- bikes %>%  
  filter(diff!=0)

bikes <- bikes %>% 
  rename("Bike Rentals"=cnt)

#Convert Washington DC date from a character to a date data type
#Scatter plots that compare the number of Bike Rentals by date to the four weather conditions
bikes <- bikes %>% 
  mutate("Washington DC Date"=as_date(mdy(`Washington DC Date`)))

bikes %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Temperature))

bikes %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Humidity))

bikes %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Windspeed))

bikes %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=`Adjusted Temperature`))

#Gathers all the weather conditions into two columns
#Scatterplot that compares the number of bike rentals by date with the weather conditions
rentals <- bikes %>% 
  select(`Washington DC Date`,`Bike Rentals`,Temperature,`Adjusted Temperature`,Humidity,Windspeed) %>% 
  gather("Weather Conditions",Measurements,-`Washington DC Date`,-`Bike Rentals`)

rentals %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Measurements))+
  facet_wrap(~`Weather Conditions`)

#Scatterplots to compare Bike rentals by year to the temperature
bikes %>% filter(yr==2011) %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Temperature))

bikes %>% filter(yr==2012) %>% 
  ggplot()+
  geom_point(aes(`Washington DC Date`,`Bike Rentals`,color=Temperature))

#Calculates the correlation coefficient between Temperature and bike rentals and mean temperature by each year
bikes_2011 <- bikes %>%
  filter(yr==2011) %>% 
  group_by(mnth) %>% 
  summarise(avg=mean(Temperature))
            

bikes_2012 <- bikes %>% 
  filter(yr==2012) %>% 
  group_by(mnth) %>% 
  summarise(avg=mean(Temperature))

r <- bikes %>% 
  group_by(yr) %>% 
  summarise(r=cor(Temperature,`Bike Rentals`))

#Creates column plots to compare bike rentals to the type of day(weekday or weekend),
#Compare Bike rentals to season
#Compare Bike rentals to registered vs. non-registered members
bikes %>% 
  ggplot()+
  geom_col(aes(workingday,`Bike Rentals`,fill=workingday))

by_season_rentals <- bikes %>%
  group_by(season) %>%
  summarize(total=sum(`Bike Rentals`))
by_season_rentals %>% 
  ggplot()+
  geom_col(aes(season,total,fill=season))

by_member_rentals <- bikes %>%
select(mnth,registered,nonregistered) %>% 
  gather(Membership,Total,-mnth,) %>% 
  group_by(mnth,Membership) %>% 
  summarise(Total=sum(Total))
by_member_rentals %>% 
  ggplot()+
  geom_col(aes(Membership,Total,fill=Membership))+
  facet_wrap(~mnth)

