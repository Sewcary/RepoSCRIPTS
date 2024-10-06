# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 18:22:00 2024

@author: ZT5549
"""


n = int(input('Entrez le nombre : '))
l=[]
premier =True
for i in range(n):
    if i !=0 :
        if i!=n :
            if n%i==0 :
                premier = False
if premier : 
    print("Le nombre est premier")
else : 
    print("Le nombre est non premier")