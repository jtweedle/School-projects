#James Tweedle
#CSCI 390
#Lab 1

#loads the necessary packages
library(tidyverse)
library(datasauRus)

#shows the structure of the dataframe
str(datasaurus_dozen)
#Classes 'tbl_df', 'tbl' and 'data.frame':	1846 obs. of  3 variables:
 # $ dataset: chr  "dino" "dino" "dino" "dino" ...
#$ x      : num  55.4 51.5 46.2 42.8 40.8 ...
#$ y      : num  97.2 96 94.5 91.4 88.3 ...
#- attr(*, "spec")=
#.. cols(
# ..   dataset = col_character(),
# ..   x = col_double(),
# ..   y = col_double()
# .. )


#shows the 13 unique datasets with the datasarus dataframe
unique(datasaurus_dozen$dataset)
#[1] "dino"       "away"       "h_lines"    "v_lines"   
#[5] "x_shape"    "star"       "high_lines" "dots"      
#[9] "circle"     "bullseye"   "slant_up"   "slant_down"
#[13] "wide_lines"

#counts the number of observations in all the datasets 
#and shows the individual datasets
datasaurus_dozen %>% count(dataset)

#assgins the dino data to a variable, plots the data
#and calculates the correlation coefficient
dino_data <- datasaurus_dozen %>% filter(dataset=="dino")
dino_data %>% ggplot(aes(x,y))+geom_point(color="blue")
dino_data %>% summarise(r=cor(x,y))
# A tibble: 1 x 1
#r
#<dbl>
  #1 -0.0645

#assgins the star data to a variable, plots the data
#and calculates the correlation coefficient
star_data <- datasaurus_dozen %>% filter(dataset=="star")
star_data %>% ggplot(aes(x,y))+geom_point(color="green")
star_data %>% summarise(r=cor(x,y))
# A tibble: 1 x 1
#r
#<dbl>
 # 1 -0.0630
#the correlation between the star and dino dataset are negative
#and relatively the same

##assgins the circle data to a variable, plots the data
#and calculates the correlation coefficient
circle_data <- datasaurus_dozen %>% filter(dataset=="circle")
circle_data %>% ggplot(aes(x,y))+geom_point(color="yellow")
circle_data %>% summarise(r=cor(x,y))
# A tibble: 1 x 1
#r
#<dbl>
  #1 -0.0683
#the correlation coeffiecient for the datasets are relatively the same
#and are negative

#makes plots of each unique dataset in the datasaurus dataframe
datasaurus_dozen %>% ggplot(aes(x,y,color=dataset))+
  geom_point(show.legend = FALSE)+
  facet_wrap(~dataset,ncol=3)
             
