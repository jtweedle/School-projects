#James Tweedle
#Fall 2019 CSCI 390
#Homework 3
#Breweries in the US

#load libraries
library(tidyverse)
library(rvest)
library(robotstxt)

#check the website to see if it allows webscraping
paths_allowed(paths = "https://www.ratebeer.com/")

#read the html page
page <- read_html("https://www.ratebeer.com/breweries/mississippi/24/213/")

#check the xml structure
xml_structure(page)

#scrape for the name, city, status(opened or closed),url, established date, and beer count
name <- page %>% 
  html_nodes("#brewerTable a:nth-child(1)") %>% 
  html_text() %>% 
  str_trim(side=c("both"))
  
type <- page %>% 
  html_nodes("td.hidden-sm") %>% 
  html_text() %>% 
  str_trim(side = c("both")) 

beercount <- page %>% 
  html_nodes(".hidden-sm+ td") %>% 
  html_text() %>% 
  str_trim(side=c("both"))
  as.integer()

established <- page %>% 
  html_nodes("td:nth-child(5)") %>% 
  html_text() %>% 
  as.integer()

url <- page %>% 
  html_nodes("#brewerTable a:nth-child(1)") %>% 
  html_attr("href")
url <- paste0("https://www.ratebeer.com",url)

city_opened <- page %>% 
  html_nodes(".filter") %>% 
  html_text %>% 
  str_trim(side=c("both"))
city_opened <- paste0(city_opened,"_opened")

city_closed <- page %>% 
  html_nodes("#brewerTable span") %>% 
  html_text %>% 
  str_trim(side=c("both"))
city_closed <- paste0(city_closed,"_closed")

#combines the cities of every opened and closed brewery into one vector
city <- c(city_opened,city_closed)

#create a tibble of the scraped vectors
ms_breweries <-tibble(name,city,type,beercount,established,url) 

#seperate the city into 2 columns: City and status
ms_breweries <- ms_breweries %>% 
  separate(city,into = c("city","status"),sep="_")

#bar chart to visualize the number of breweries (all types) by year. 
ms_breweries%>% 
  filter(status=="opened") %>% 
  ggplot()+
  geom_bar(aes(established,fill=type))+
  labs(title = "Number of MS Breweries By Year") +
  theme(plot.title = element_text(hjust = 0.5))

#line chart layered with a scatterplot
#shows the time-series of the number of established/opened breweries
ms_breweries %>%
  filter(status=="opened") %>% 
  group_by(established,type) %>% 
  summarise(n=n()) %>% 
  ggplot()+
  geom_point(aes(established,n,color=type))+
  geom_line(aes(established,n,color=type),linetype="dotted")+
  labs(title = "Time-series of Established Breweries(MS)")+
  theme(plot.title = element_text(hjust=0.5))

#line chart and scatterplot
#show the time-series of the number of opened breweries versus number of closed breweries
ms_breweries %>%
  group_by(established,status) %>% 
  summarise(n=n()) %>% 
  ggplot()+
  geom_point(aes(established,n,color=status))+
  geom_line(aes(established,n,color=status),linetype="dotted")+
  labs(title = "Opened and Closed Breweries By Year(MS)")+
  theme(plot.title = element_text(hjust = 0.5))

#imports the states csv and creates a dataframe
states <- read_csv("data/states.csv")

#assigns a variable to the name of the states data frame
statesnames <- states$name

#use stringr functions to guarantee that the names match that of RateBeer
statesnames <- str_to_lower(statesnames)
statesnames <-str_replace(statesnames,"district of columbia","washington d.c.")
statesnames <- str_sort(statesnames)
statesnames <- str_replace_all(statesnames,"\\s","-")

#a for loop to build the url for every state
i<- c()
c <- 0
j <- 1:51
for (i in statesnames) {
  page2 <- read_html("https://www.ratebeer.com/breweries/")
  state<- page2 %>% 
    html_nodes(".breadcrumb li+ li a") %>% 
    html_attr("href")
  i<- paste0("https://www.ratebeer.com",state,statesnames,"/",j,"/213/")
}

#for loop that grabs the desired attributes for every state from ratemybeer
name1 <- c()
city_closed1 <- c()
city_opened1 <- c()
type1 <- c()
beercount1 <- c()
established1 <- c()
for (oneurl in i) {
  page3 <- read_html(oneurl)
  
  name <- page3 %>% 
    html_nodes("#brewerTable a:nth-child(1)") %>% 
    html_text() %>%
    str_trim(side = c("both"))
  name1 <- c(name1,name)
  
  
  type <- page3 %>% 
    html_nodes("td.hidden-sm") %>% 
    html_text() %>% 
    str_trim(side = c("both")) 
  type1 <- c(type1,type)
  
  
  beercount <- page3 %>% 
    html_nodes(".hidden-sm+ td") %>% 
    html_text() %>% 
    str_trim(side=c("both")) %>% 
    as.integer()
  beercount1 <- c(beercount1,beercount)
  
  established <- page3 %>% 
    html_nodes("td:nth-child(5)") %>% 
    html_text() %>% 
    as.integer()
  established1 <- c(established1,established)
  
  city_opened <- page3 %>% 
    html_nodes(".filter") %>% 
    html_text %>% 
    str_trim(side=c("both"))
  city_opened <- paste0(city_opened,"_opened")
  city_opened1 <- c(city_opened1,city_opened)
  
  city_closed <- page3 %>% 
    html_nodes("#brewerTable span") %>% 
    html_text %>% 
    str_trim(side=c("both"))
  city_closed <- paste0(city_closed,"_closed")
  city_closed1 <- c(city_closed1,city_closed)
  print(oneurl)
}

#combines the city opened and city closed vectors    
city <- c(city_opened1,city_closed1)

#assigns the vectors of the desired attributes into a a tibble
us_breweries <- tibble(name=name1,city,type=type1,established=established1,beercount=beercount1)

#seperates the breweries based on their status i.e. opened or closed
us_breweries <- us_breweries %>% 
  separate(city,into = c("city","status"),sep="_")

#a faceted bar chart showing the number of Opened and closed breweries in the US by type
us_breweries %>%
  ggplot()+
  geom_bar(aes(type,fill=type))+
  facet_wrap(~status,ncol=2)+
  labs(x=element_blank(),
       title = "Number of Open and Closed Breweries(US)")+
  theme(axis.text.x =element_blank(),
        axis.ticks.x = element_blank(),
        plot.title = element_text(hjust = 0.5))

#shows the proportion of closed to opened for each type of brewery
us_breweries %>% 
  group_by(type,status) %>% 
  count() %>% 
  spread(status,-type) %>% 
  mutate(diff=(closed/(opened+closed))*100,
         diff2=(opened/(closed+opened))*100) %>% 
  view()

#a line chart, layered with a scatterplot
#show the time-series of the number of established breweries 
us_breweries %>% 
  group_by(established,type) %>% 
  count() %>% 
  ggplot()+
  geom_point(aes(established,n,color=type))+
  geom_line(aes(established,n,color=type),linetype="dotted")+
  labs(title="Number of Established Breweries(US)",
       x="Year Established",
       y="Number")+
  theme(plot.title=element_text(hjust=0.5))

#shows how many breweries opened by year
us_breweries %>% 
  group_by(established) %>% 
  count() %>% 
  view()

#a line chart, layered with a scatterplot 
#show the timeseries of the number of established breweries(1980-2018)
us_breweries %>% filter(established>=1980 & established<=2018) %>% 
  group_by(established,type) %>% 
  count() %>% 
  ggplot()+
  geom_point(aes(established,n,color=type))+
  geom_line(aes(established,n,color=type),linetype="dotted")+
  labs(title="Number of Established Breweries in the US(1980-2018)",
       x="Year Established",
       y="Number")+
  theme(plot.title = element_text(hjust=0.5))

#list the total number of established breweries and closed breweries for 2017
us_breweries %>% 
  filter(established=="2017") %>% 
  group_by(status) %>% 
  summarise(n=n())

#line/scattered chart to 
#show the time-series of the number of breweries by status for all breweries up to the year 2017 
us_breweries %>% 
  filter(established<=2017) %>% 
  group_by(established,status) %>% 
  count() %>% 
  ggplot()+
  geom_point(aes(established,n,color=status))+
  geom_line(aes(established,n,color=status),linetype="dotted")+
  labs(title="Number of Opened/Closed Breweries",
       y="Number")+
  theme(plot.title=element_text(hjust = 0.5))
