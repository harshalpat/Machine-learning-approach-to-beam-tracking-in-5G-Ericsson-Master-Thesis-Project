# -*- coding: utf-8 -*-
"""
Created on Mon Jul  6 20:27:26 2020

@author: earahtp
"""

#import pandas as pd
#
#cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\random mover, all beam logs\200sec_random_mover.csv',sep=';',encoding='utf8')
##print(cell_df)
#nr_row=4596;
#for i in range(1):
#    print(cell_df.loc[:nr_row])
#    
##for i in range(nr_row):
#        

f=open('Multi UE data.csv','r')
line = f.readline()


def convert(string):
    str1 =string.split(';')
    c=0;
    S="";
    for f in str1:
        if(c<13):
         strings = str(' ')+str(c)+str(':')+f
         c+=1;
         S=S+strings;
         #print(S)
    text_file = open("Multi_UE_data_format.txt", "a")
    #print(S)
    text_file.write(S)
    #text_file.write("\n")

        

    #print(str)

count=0;


while(count<211734):
    #print(line)
    convert(line);
    line=f.readline()
    
    count+=1;
f.close(); 
 


    