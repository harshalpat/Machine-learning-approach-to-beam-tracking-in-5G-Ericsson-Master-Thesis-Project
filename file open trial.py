# -*- coding: utf-8 -*-
"""
Created on Sat Sep  5 14:24:47 2020

@author: earahtp
"""
# open a file 
with open('Multiple_UE_accuracy.txt') as openfileobject:
    
    #loop through each line in the file
    for line in openfileobject:
        
        #read the lines
        lines = openfileobject.readline()
        
        #write the lines in a new file
        text_file = open("Multiple_UE_accuracy_single_NBs.txt", "a")
        text_file.write(lines)
        lines = openfileobject.readline()
        
        
        #lines = openfileobject.readline()
        #print(lines)


#close the file we are reading from    
openfileobject.close()