#James Tweedle
#Fall 2019 CSCI 390
#Lab 7

#load libraries
library(tidyverse)
library(readxl)
library(RColorBrewer)
library(socviz)
library(maps)
library(mapproj)
library(usmap)
library(cowplot)

#read the organdonordata and assign to a dataframe called organ
organ <- read_excel("data/OrganDonorData.xlsx")

#read the state_pop, assign to a dataframe us_pop
us_pop <- read_csv("data/state_pop.csv")

#select state and pop from us_pop to a dataframe
state_pop <- us_pop %>% 
  select(state,pop)

#merge organ and us_pop into one dataframe
organ <- left_join(organ,state_pop,"state")

#create a dataframe calles us_states from us_map package
us_states <- us_map("state")

#rename x and y variables to long and lat
us_states <- us_states %>% 
  rename(long=x,lat=y,state=abbr)

#join the organ and us_states dataframe
organ1 <- left_join(us_states,organ)

#plot all organ types by total
organ1 %>% 
  ggplot(aes(long,lat,fill=Total,group=group))+
  geom_polygon(color="black",size=0.5)+
  coord_equal()+
  theme_map()+
  labs(title="US Living Organ Donors")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_distiller(palette = "Set1")

#Which state appears to have the highest number of living donors?
#California appears to have the highest number of living donors

#Find the sum of Total donors by state
organ %>% 
  group_by(state) %>% 
  summarise(sum=sum(Total)) %>% 
  arrange(desc(sum)) %>% 
  head(5)

organ %>% 
  group_by(state) %>% 
  summarise(sum=sum(Total)) %>% 
  arrange(sum) %>% 
  head(5)

#The highest total donor by state:
# state   sum
# 1 CA    16982
# 2 NY    11500
# 3 TX    10737
# 4 IL    8335
# 5 PA    7101

#The lowest total donors are by state:
# state     sum
# 1 WY      264
# 2 VT      400
# 3 DE      470
# 4 DC      471
# 5 SD      550


#Plot the number of living donors by total/population
organ1 %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Living Donors by Population",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))


#which state appears to have the highest number of living donors per capita?
#Minnesota appears to have the most number of donors

organ %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

#What state has the most donors per capita? What major hospital is located in this state?

#Mayo clinic is located in Rochester,MN

# state   pop       sum      pct
# 1 MN    5611179   5070     0.000904
# 2 ND    760077    565      0.000743
# 3 MD    6042718   4349     0.000720
# 4 RI    1057315   725      0.000686
# 5 WI    5813568   3955     0.000680


#plot organ donors by population for each type of organ 
organ1 %>% 
  filter(organ=="Kidney") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Kidney Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

organ1 %>% 
  filter(organ=="Liver") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Liver Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

organ1 %>% 
  filter(organ=="Heart") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Heart Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

organ1 %>% 
  filter(organ=="Pancreas") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Pancreas Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

organ1 %>% 
  filter(organ=="Lung") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Lung Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

organ1 %>% 
  filter(organ=="Intestine") %>% 
  ggplot(aes(long,lat,group=group,fill=Total/pop))+
  geom_polygon(color="black",size=0.5)+
  scale_fill_distiller(palette = "Set1")+
  coord_equal()+
  theme_map()+
  labs(title = "US Intestine Donors",
       fill="per capita")+
  theme(plot.title = element_text(hjust = 0.5))

#identify the top 5 states for each type of organ donation

#Kidney

organ %>% 
  filter(organ=="Kidney") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state   pop      sum    pct
# 1 MN    5611179  4809   0.000857
# 2 ND    760077   544    0.000716
# 3 MD    6042718  4102   0.000679
# 4 WI    5813568  3844   0.000661
# 5 RI    1057315  684    0.000647

#Liver

organ %>% 
  filter(organ=="Liver") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state pop      sum  pct
# 1 VT  626299   34   0.0000543
# 2 ME  1338404  65   0.0000486
# 3 NY  19542209 900  0.0000461
# 4 MA  6902149  301  0.0000436
# 5 NH  1356458  59   0.0000435

#Heart

organ %>% 
  filter(organ=="Heart") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state   pop      sum  pct
# 1 ID    1754208  2    0.00000114 
# 2 OR    4190713  4    0.000000954
# 3 MT    1062305  1    0.000000941
# 4 MN    5611179  3    0.000000535
# 5 AL    4887871  2    0.000000409

#Pancreas

organ %>% 
  filter(organ=="Pancreas") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state pop     sum  pct
# 1 MN  5611179 20   0.00000356
# 2 ND  760077  1    0.00000132
# 3 SD  882235  1    0.00000113
# 4 WV  1805832 2    0.00000111
# 5 DE  967171  1    0.00000103

#Lung

organ %>% 
  filter(organ=="Lung") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state   pop      sum  pct
# 1 ME    1338404  10   0.00000747
# 2 MA    6902149  34   0.00000493
# 3 RI    1057315  4    0.00000378
# 4 NH    1356458  5    0.00000369
# 5 AZ    7171646  25   0.00000349

#Intestine

organ %>% 
  filter(organ=="Intestine") %>% 
  group_by(state,pop) %>% 
  summarise(sum=sum(Total)) %>% 
  mutate(pct=sum/pop) %>% 
  arrange(desc(pct)) %>% 
  head(5)

# state   pop        sum  pct
# 1 IL    12741080   20   0.00000157 
# 2 ND    760077     1    0.00000132 
# 3 MN    5611179    4    0.000000713
# 4 NM    2095428    1    0.000000477
# 5 IN    6691878    3    0.000000448

#Which state seems to support living organ donation the most?
#Minnesota shows in the top 5 of 4 of 6 types of organ donation

#Create columns year and number using the data from `1999` and `2019` 

organ_kidney <- organ1%>%
  filter(organ=="Kidney") %>% 
  gather(Year,Number,`2019`,`1999`)

#Plot faceting by year
organ_kidney %>% 
  ggplot(aes(long,lat,fill=Number,group=group))+
  geom_polygon(color="black",size=0.5)+
  coord_equal()+
  theme_map()+
  labs(title="US Kidney Organ Donors",fill="Donors")+
  theme(plot.title = element_text(hjust = 0.5))+
  scale_fill_distiller(palette = "Paired")+
  facet_wrap(~Year,ncol = 2)

#At a glance, name 2 states seems to have improved most in the last 20 years?
#Texas and Florida appeared to have improved the most in the number of donors

#create a data frame that shows the difference in the numbers of kidney donors in 1999 and 2019
change <- organ %>% 
  filter(organ=="Kidney") %>%
  group_by(state) %>% 
  mutate(diff=`2019`-`1999`) %>%
  select(state,`2019`,`1999`,diff) %>% 
  arrange(desc(diff)) %>% 
  head(5)

change

# state     diff
# 1 TX      224
# 2 OH      62
# 3 GA      59
# 4 IL      35
# 5 NY      26

