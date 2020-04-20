#https://blackboard.olemiss.edu/webapps/blackboard/execute/content/file?cmd=view&content_id=_978943_1&course_id=_37882_1
#Received all my help from Paul
import numpy as np 
import matplotlib.pyplot as mplot
import glob
import re

#reads through series A and appends the words to a list
sA=glob.glob('scripts//a*.txt')
L1=[]
L2=[]
for x in sA:
    file = open(x)
    file =file.read()
    file=re.sub('[^a-zA-Z]',' ',file)
    file=file.replace("\n","")
    file = file.split(" ")
    L1.append(file)
#reads through series B and appends the words to a list
sB=glob.glob('scripts//b*.txt')
for y in sB:
    file1=open(y)
    file1=file1.read()
    file1=re.sub('[^a-zA-Z]',' ',file1)
    file1=file1.replace("\n","")
    file1=file1.split(" ")
    L2.append(file1)
#reads in the sentiment lexicon
data=open('lex//sentiment_lex.csv')
data=data.read()
data=data.split('\n')
del data[-1]
del data[-1]
#assigns the words(keys) to their sentiment score(values) in a dict
lex={}
for x in data:
    x=x.split(',')
    lex[x[0]]=float(x[1])
#loops through series A and B, determines whether the words are in the sentiment lexicon
#then assigns the sentiment score to the word
neg=0
wneg=0
neu=0
wpos=0
pos=0
print('enter the series name')
F=input()
print(F)
if F=='a':
    L0=L1
elif F=='b':
    L0=L2
else:
    print('series not found')
    exit()
for i in L0:
    for j in i:
        if j in lex:
            if lex[j]>=-1.0 and lex[j]<-0.6:
                neg+=1
            elif lex[j]>=-0.6 and lex[j]<-0.2:
                wneg+=1
            elif lex[j]>-.02 and lex[j]<=0.2:
                neu+=1
            elif lex[j]>=0.2 and lex[j]<0.6:
                wpos+=1
            elif lex[j]>0.6 and lex[j]<=1.0:
                pos+=1
                
                
X=['Neg','W.Neg','Neu','W.Pos','Pos']
Y=[neg,wneg,neu,wpos,pos]
Y=np.log10(Y)
mplot.bar(X,Y)
mplot.show()
                        
            
            
        
            
            
    
        
    
                
               




