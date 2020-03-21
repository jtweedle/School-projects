#GrayWildebeest
#last edited:11/13/18
#Challenge 5
#https://john.cs.olemiss.edu/~jones/doku.php?id=csci343_polynomial_regression
#https://john.cs.olemiss.edu/~jones/doku.php?id=csci343_linear_regression
#lines 7-12,necessary imports, reads and splits the data file by newline
import numpy as np 
import matplotlib.pyplot as mplot
data=open("GrayWildebeest.csv", "r")                                          
data=data.read()
data=data.split("\n")
del data[-1]
#lines 15-25, creates three lists, splits the data file by commas
#store the three columns of data in three lists
frequency=[]
time=[]
intensity=[]
for x in range (0,len(data)):
    data[x]=data[x].split(",")
    data[x][1]=np.float64(data[x][1])
    data[x][0]=np.float64(data[x][0])
    data[x][2]=np.float64(data[x][2])
    frequency.append(data[x][1])
    time.append(data[x][0])
    intensity.append(data[x][2])
#lines 28-64, creates a list of the 5 frequency values, store times/intensity data in 10 lists 
#the time/intensity data is stored based on the unique frequencies it appears at
unique=list(set(frequency))
x1=[]
x2=[]
x3=[]
x4=[]
x5=[]
y1=[]
y2=[]
y3=[]
y4=[]
y5=[]
for i in range(len(data)):
    if data[i][1]==unique[0]:
        data[i][0]=np.float64(data[i][0])
        data[i][2]=np.float64(data[i][2])
        x1.append(data[i][0])
        y1.append(data[i][2])
    elif data[i][1]==unique[1]:
        data[i][0]=np.float64(data[i][0])
        data[i][2]=np.float64(data[i][2])
        x2.append(data[i][0])
        y2.append(data[i][2])
    elif data[i][1]==unique[2]:
        data[i][0]=np.float64(data[i][0])
        data[i][2]=np.float64(data[i][2])
        x3.append(data[i][0])
        y3.append(data[i][2])
    elif data[i][1]==unique[3]:
        data[i][0]=np.float64(data[i][0])
        data[i][2]=np.float64(data[i][2])
        x4.append(data[i][0])
        y4.append(data[i][2])
    elif data[i][1]==unique[4]:
        data[i][0]=np.float64(data[i][0])
        data[i][2]=np.float64(data[i][2])
        x5.append(data[i][0])
        y5.append(data[i][2])
#lines 66-70, find the correlation of the 5 sets of time/intensity data at each unique frequency
c1=np.corrcoef(x1,y1)
c2=np.corrcoef(x2,y2)
c3=np.corrcoef(x3,y3)
c4=np.corrcoef(x4,y4)
c5=np.corrcoef(x5,y5)
#lines 76-93, stores time/intensity data with its correlation value
#based on each unique frequency
#finds the highest 2 correlation values
#performs linear and polynomic regression on the corresponding time/intensity data
#plots the linear/polynomic regressions against the raw data 
dataset=[[x1,y1,c1[0][1]],[x2,y2,c2[0][1]],[x3,y3,c3[0][1]],[x4,y4,c4[0][1]],[x5,y5,c5[0][1]]]
for data in dataset:
    if abs(data[2]) > 0.7:
            m=data[2]*(np.std(data[1])/np.std(data[0]))
            b=np.mean(data[1])-(m*np.mean(data[0]))
            y=[]
            for xval in (data[0]):
                y.append(m*xval+b)
            degree=2
            model_param=np.polyfit(data[0],data[1],degree)
            y_predicted=np.polyval(model_param,data[0])
            mplot.plot(data[0],y,color='red')
            mplot.plot(sorted(data[0]),sorted(y_predicted, reverse=True),color='blue')
            
mplot.show()
mplot.title("Challenge 5")
mplot.xlabel("Time(ms)")
mplot.ylabel("Signal Intensity")       
mplot.scatter(x1,y1,color='yellow')
mplot.scatter(x2,y2,color='green')
mplot.scatter(x3,y3,color='magenta')
mplot.scatter(x4,y4,color='crimson')
mplot.scatter(x5,y5,color='violet')   
