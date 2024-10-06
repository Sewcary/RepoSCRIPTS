# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 18:15:04 2024

@author: ZT5549
"""

l = []
n  = int(input("Entrez le nombre de nombre dans la suite : "))

for i in range(n) : 
    if i%2 == 0 : 
        l.append(i)

print(l)         