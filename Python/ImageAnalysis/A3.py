#https://blackboard.olemiss.edu/webapps/blackboard/execute/content/file?cmd=view&content_id=_989070_1&course_id=_37882_1
#GrayWildebeest
#last edited:10/10/18
#Challenge 3
import matplotlib.pyplot as mplot
import numpy as np
import glob
from PIL import Image
#opens the image file and appends all the images to a list
file=glob.glob('unionconstruction//unionconstruction*.jpg')
list=[]
for j in file:
    img=Image.open((j))
    list.append(np.float64(img))
#calculates the average image and the standard deviation image
avg_img=(list[0])
for index in range(1,len(list)):
    avg_img+=list[index]
avg_img/=len(list)
std_img=0
for i in list:
    std_img+=(i-avg_img)**2
std_img/=len(list)
std_img=std_img**(1/2)
#asks the user for input and compares the value to the threshold values
#if the user input is greater than the threshold value, the input to changed to red
print('enter the threshold value')
tv=float(input())
for row in range(0,len(std_img)):
    for col in range(0,len(std_img[row])):
        if (std_img[row][col] > [tv,tv,tv]).any():
            avg_img[row][col]=[255,0,0]
#displays the average image after the user input
avg_img=np.clip(avg_img,0,255)
avg_img=np.uint8(avg_img)
mplot.imshow(avg_img)
mplot.show()

