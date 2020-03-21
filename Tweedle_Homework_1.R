#James Tweedle
#Fall 2019 CSCI 390
#Homework 1
#Myers-Briggs Personality Test

#load the necessary packages
library(tidyverse)

#create a vector of names
names <- c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "Q10", "Q11", "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", 
           "Q18", "Q19", "Q20", "Q21", "Q22", "Q23", "Q24", "Q25", "Q26", "Q27", "Q28", "Q29", "Q30", "Q31", "Q32", "Q33",
           "Q34", "Q35", "Q36", "Q37", "Q38", "Q39", "Q40", "Q41", "Q42", "Q43", "Q44", "Q45", "Q46", "Q47", "Q48", "Q49",
           "Q50", "Q51", "Q52", "Q53", "Q54", "Q55", "Q56", "Q57", "Q58", "Q59", "Q60", "Q61", "Q62", "Q63", "Q64", "Q65",
           "Q66", "Q67", "Q68", "Q69", "Q70", "EI", "SN", "TF", "JP", "Personality_Type" )

#import the Myers-Briggs cvs files
mb <- dir(path = "Tweedle_data",pattern = "*.csv") %>% 
  map_dfr(function(x) read_csv(file.path("Tweedle_data",x),col_names=FALSE))

#assign the column headers to the names vector
colnames(mb) <- names
View(mb)

#Plot the personality types and fill by personality
mb %>% ggplot(aes(Personality_Type,fill=Personality_Type))+
  geom_bar()

#Tidies the data 
responses <- mb %>% 
  gather(question,answer,Q1:Q70) %>% 
  select(question,answer)
#Count the number of A and B responses for each question
number <- responses %>% 
  group_by(question)%>% 
  count(answer)

#Plot the number of instances of A and B for each question
number %>% 
  ggplot()+
  geom_col(aes(answer,n,fill=answer))+
  facet_wrap(~question,ncol=7)+
  ggtitle("Myers Briggs Questions",subtitle = "James Tweedle")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.subtitle = element_text(hjust = 0.5))

#Find the 2 observations with miniumum number of responses
minority <-number%>% 
  filter(n==min(.$n))








  
