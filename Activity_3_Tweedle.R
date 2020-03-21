#James Tweedle
#Activity 3
#CSCI 390
# Partners: John McGregor, Nathan Hill

#load necessary packages
library(tidyverse)

#creates vectors for 5 variables name,username,state,completed credit hours,resident GPA, and overall GPA
names <- c("John","Jake","Nathan","Diego","Isiah")
username <- c("jrmcgre1","jtweedle","nhill","dmachado","ivaughn")
state <- c("MS","MS","MS","PU","MD")
completetedcredithours <- c(90,86,100,93,82)
residentGPA <- c(3.2,3.0,3.01,3.75,3.21)
overallGPA <- c(3.2,3.0,3.01,3.75,3.21)

#creates a tibble called students with the 5 vectors from the previous code
students <- tibble(names,username,state,completetedcredithours,residentGPA,overallGPA)
students
class(students)
