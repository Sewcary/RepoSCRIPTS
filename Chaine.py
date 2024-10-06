# -*- coding: utf-8 -*-
"""
Created on Fri Mar 24 17:46:25 2023

@author: ZT5549
"""
i = 0 
j=0 
while i <=10 :
    while j<=10: 
        print(str(i)   + " * " + str(j) + " = " + str(i*j )   ) 
        j=j+1
    i=i+1
    j= 0
    print("")
    
    
ch  ="Chaine de caracteres est l'equivalent d'une liste ou d'un tableau"

for element in ch :
    print (element)