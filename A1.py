#I received a lot of help from Paul
#SpiritAnimalID:GrayWildebeest
#last edited 9/18/18
#challenge 1
#sources:
#file:///C:/Users/Jake%20Tweedle/Desktop/CSCI%20343/Lecture_1_web.pdf
#Data Science from Scratch: First Principles with Python
#math.ecnu.edu.cn/~lfzhou/.../
#[Joel_Grus]_Data_Science_from_Scratch_First_Princ.pdf
#https://blackboard.olemiss.edu/bbcswebdav/pid-969737-dt-content-rid-30521720_1
#/courses/Csci_343_Section_1_JONES_2018-2019_FALL/Lecture_2.pdf


import numpy as np 
import matplotlib.pyplot as mplot
data=open("GrayWildebeest_ch1.csv", "r")                                          
data=data.read()
data=data.split("\n")
del data[-1]

#finds the unique frequency and plots amp vs time at that frequency
xaxis=[]
yaxis=[]
for x in range (0,len(data)):
    data[x]=data[x].split(",")
    data[x][0]=np.float64(data[x][0])
    data[x][1]=np.float64(data[x][1])
    if float(data[x][2])==4.899743:
        xaxis.append(data[x][0])
        yaxis.append(data[x][1])

#compares time column to every unique value in time column
#if equal finds average amplitude per unit time
y=list(set(xaxis))
y.sort()  
mean=[]   
for i in range(0,len(y)):
    sum=0
    count=0
    for j in range(0,len(xaxis)):
        if y[i]==xaxis[j]:
            count=count +1
            sum=sum+yaxis[j]
    avg=sum/count
    mean.append(avg)
            
            
#plots amp vs time at the right frequency and plots avg amp per unit time
mplot.title("Amplitude vs. Time(miliseconds)")
mplot.xlabel("Time(miliseconds)")
mplot.ylabel("Amplitude")
mplot.scatter(xaxis,yaxis)
mplot.plot(y,mean,color="red",linestyle="-")
mplot.show()



    
    
    
    