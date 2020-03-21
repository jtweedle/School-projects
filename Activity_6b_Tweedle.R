#James Tweedle
#CSCI 390
#Activity 6b
#Partners:Michael Davis

#load the necesssary package
library(tidyverse)

#read in the text file 
overdose_deaths <- read_delim("Tweedle_data/drugdeaths.txt",delim="^",col_names=TRUE)

#Select the wanted variables and gather the wide data into  a long data set
overdose_deaths <-overdose_deaths %>% 
  select(Sex,Age,15:25) %>% 
  gather(Type,Result,-Sex,-Age) %>% 
  na.omit()

#calculate the number of deaths by type and plot the data
number_of_deaths<- overdose_deaths %>% 
  group_by(Type) %>% 
  count() 
number_of_deaths %>% 
  ggplot()+
  geom_col(aes(Type,n,fill=Type))
