#James Tweedle
#CSCI 390
#Lab 3

#load the necessary packages
library(tidyverse)
library(sjmisc)

#load in the three csv files
dn <- read_csv("Tweedle_data/dennys.csv")
lq <- read_csv("Tweedle_data/laquinta.csv")
states <- read_csv("Tweedle_data/states.csv")

#What are the dimensions of the Denny's dataset?
# What does each row in the dataset represent? 
# What are the variables?

str(dn)

#The dimensions are 1643 rows(observations) by 6 columns(variables).
#Each row is the location of a single Denny's given by the 6 variables
#The 6 variables are address,city,state,zip,latitude, and longitude

# What are the dimensions (Variables and Rows) of the La Quinta dataset? 
# What does each row in the dataset represent? 
# What are the variables?

str(lq)

#The dimensions of the Laquinta dataset is 909 observations by 6 variables
#The rows represent a location of a single Laquinta Hotel given by the variables address, city, state, zip,latitude, and longitude

dn_us <- dn %>% 
  filter(state %in% states$abbreviation)

dn_not_us <- dn %>% 
  filter(state %nin% states$abbreviation)

#How many Denny's locations are inside and outside the US?
#There are 1643 Denny's in the US. There are no Denny's outside the US

lq_us <- lq %>% 
  filter(state %in% states$abbreviation)

lq_not_us <- lq %>% 
  filter(state %nin% states$abbreviation)

#How many Laquinta locations are inside and outside the US?
#There are 909 Laquinta's inside the US, and there are 14 Laquinta's outside the US

dn_us_count <- dn_us %>% 
  group_by(state) %>% 
  count(state) %>% 
  arrange(desc(n)) %>% 
  head(10)

dn_us_count

# Which states have the most Denny's?
# 1 CA      403
# 2 TX      200
# 3 FL      140
# 4 AZ       83
# 5 IL       56
# 6 NY       56
# 7 WA       49
# 8 OH       44
# 9 MO       42
# 10 PA      40

lq_us_count <- lq_us %>% 
  group_by(state) %>% 
  count(state) %>% 
  arrange(desc(n)) %>% 
  head(10)

lq_us_count

# Which states have the most Laquinta's?
# 1 TX      237
# 2 FL       74
# 3 CA       56
# 4 GA       41
# 5 TN       30
# 6 OK       29
# 7 LA       28
# 8 CO       27
# 9 NM       19
#10 NY       19

#create new variables that associate with Laquinta and Denny's
dn_us <- dn_us %>% 
  mutate(establishment="Denny's") 
lq_us <- lq_us %>% 
  mutate(establishment="Laquinta")

#bind the dn_us and lq_us together
dn_lq <- bind_rows(dn_us,lq_us)

#Plot the dn_lq data
dn_lq %>% 
  ggplot()+
  geom_point(aes(longitude,latitude,color=establishment),alpha=0.25)

#What is the apparent trend of Denny's locations to La Quinta locations on a national level?
#To say that Denny's and Laquinta Hotels are next to each other is stretch especially on a national. An analysis of the plot from above can attest. 
#There are multiple areas with a high a density of either establishment without a high density of the other such as in Texas.

#Plots for California, Kentucky, Texas, and Oregon
dn_lq %>% 
  filter(state=="CA") %>% 
  ggplot()+
  geom_point(aes(longitude,latitude,color=establishment),alpha=0.25)

dn_lq %>% 
  filter(state=="OR") %>% 
  ggplot()+
  geom_point(aes(longitude,latitude,color=establishment),alpha=0.25)

dn_lq %>% 
  filter(state=="KY") %>% 
  ggplot()+
  geom_point(aes(longitude,latitude,color=establishment),alpha=0.25)

dn_lq %>% 
  filter(state=="TX") %>% 
  ggplot() +
  geom_point(aes(longitude,latitude,color=establishment),alpha=0.25)

#Do you agree with Mitch Hedberg that La Quinta is Spanish for "Next to Denny's"? Explain.
#I don't agree with Mitch Hedberg. After viewing the five plots, I couldn't find an area where there was a 1:1 ratio for both establishments.
#Mulitple areas had high densities of one establishement with little to no density of the other. 

