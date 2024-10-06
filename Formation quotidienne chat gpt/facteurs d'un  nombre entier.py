# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 18:18:01 2024

@author: ZT5549
"""
l = []
n = int(input ("Entrez le nombre dont on doit chercher les facteurs : "))

for i in range (n) : 
    if i != 0 :
        if n%i == 0 : 
            l.append(i)
        
print(l)




