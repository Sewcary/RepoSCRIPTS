# -*- coding: utf-8 -*-
"""
Created on Fri Apr 14 20:27:05 2023

@author: ZT5549
"""


print(4/2)

print ("Bonj\"our")
print ('Bonj\'our')

l= [1,5,5,4,45,5,8,5,78,44,4,7,7,77,7,7,7,8,85,5,4,7,5]

ll = [nb * nb for nb in l if (nb*nb) % 2 ==0]

print(ll)

for i,elt in enumerate (l) : 
    print(i,elt)
     
def fu (*param) : 
    print ("valeur = {}" .format(param))
    
print(fu(1,2,5,4,5,4,5))
i = 0 
while i <= 10 : 
    print(i, "*" , 2 , "=" , i*2)
    i+=1