#GrayWildebeest
#Challenge 4
#last edited:10/31/2018
import numpy as np 
import matplotlib.pyplot as mplot
import math
#reads, seperates and stores the data from the 2 files into lists
data=open("data.csv", "r")                                          
data=data.read()
data=data.split("\n")
del data[-1]
xaxis=[]
yaxis=[]
migration=[]
for x in range (0,len(data)):
    data[x]=data[x].split(",")
    data[x][0]=np.float64(data[x][0])
    data[x][1]=np.float64(data[x][1])
    data[x][2]=np.float64(data[x][2])
    xaxis.append(data[x][0])
    yaxis.append(data[x][1])
    migration.append(data[x][2])
file=open("us_outline.csv","r")
file=file.read()
file=file.split("\n")
del file[-1]
gridx=[]
gridy=[]
for x in range(0,len(file)):
    file[x]=file[x].split(",")
    file[x][0]=np.float64(file[x][0])
    file[x][1]=np.float64(file[x][1])
    gridx.append(file[x][0])
    gridy.append(file[x][1])
#distance function
def dist(a, b):
    return math.sqrt(math.pow(a[0]-b[0],2)+math.pow(a[1]-b[1],2))
x=[]
y=[]
c=[]
print('enter a k value') #prompts the user for K closest neighbors
k=int(input())
#sequential search through row and coloumn to find the closest grid points with migration data
#calculates that distance, sorts by closest and stores those distances
#along with relevelant migration data into a list
for row in range(194):
    for column in range(120):
        distance=[]
        for i in range(len(xaxis)):
            a=[row,column]
            b=[xaxis[i],yaxis[i]]
            distance.append([dist(a,b),migration[i]])
        distance.sort(key=lambda x:x[0])
        x.append(row)  #appends the row and coloumn grids into a list
        y.append(column)
        count=0
        sum=0
        for j in range(k):           #finds the average population change for the user defined K closest neighbors
            h=distance[j]
            sum += h[1]
            count+=1
        avg=sum/count
        c.append(avg)
#plots the outline of the US with the avearge population change throughout
mplot.scatter(x,y,c=c,cmap='viridis')
mplot.plot(gridx,gridy,color='black')
mplot.show()         
           

		
    
                
                
            
            
    
        