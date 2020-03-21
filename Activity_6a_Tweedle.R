#James Tweedle
#CSCI 390
#Activity 6a
#Partners:Jason Wells

#load the necessary packages
library(tidyverse)

#import the inpatient TSV
inpatient <- read_tsv("http://594442.youcanlearnit.net/inpatient.tsv",
                      col_names=TRUE)

#selects, reanames, replaces the $ and finds the average of total payments and medicare payments
Average_payment <- inpatient %>%
  select(`Average Total Payments`,
         `Average Medicare Payments`) %>% 
  rename(Averagetotalpayments=`Average Total Payments`,
         Averagemedicarepayments=`Average Medicare Payments`) %>%
  mutate(Averagetotalpayments=str_replace(Averagetotalpayments,"\\$",""),
         Averagemedicarepayments=str_replace(Averagemedicarepayments,"\\$",""))%>%
  mutate(Averagetotalpayments=as.numeric(Averagetotalpayments),
         Averagemedicarepayments=as.numeric(Averagemedicarepayments)) %>% 
  summarise('Average Payments'=mean(Averagetotalpayments),
            'Average Medicare Payments'=mean(Averagemedicarepayments))
  
