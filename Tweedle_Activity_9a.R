#James Tweedle
#Fall 2019 CSCI 390
#Activity 9a
#Partner:Isiah Vaughnn,Diego Reyes

#load libraries
library(tidyverse)
library(readxl)
library(lubridate)
library(RColorBrewer)

#import the file 
coresample <- read_xlsx("coresample.xlsx")

glimpse(coresample)

#convert date column from double to date data type
coresample <- coresample %>% 
  mutate(date=as.character(date))
coresample <- coresample %>% 
  mutate(date=as.Date(date,format="%Y"))

#make a long data set from the elemetents and their values
newsample <- coresample %>% 
  gather(Element,Value,Li:U)

#Plot the value vs date by the element
newsample %>% 
  ggplot() +
  geom_line(aes(date,Value,color=Element))


#plot the value vs date by element and set colors to Set1 using Rcolorbrewer
newsample %>% 
  filter(Element=="Mn"|Element=="Ba") %>% 
  ggplot()+
  geom_line(aes(date,Value,color=Element))+
  scale_color_brewer(palette = "Set1")
  
            