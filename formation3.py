# -*- coding: utf-8 -*-
"""
Created on Tue Jan  9 12:28:42 2024

@author: ZT5549
"""

matrice = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
applati = []
for sl in matrice : 
    for element in sl:
        applati.append(element)
print(applati)
        
        
        
applati = [element for sl in matrice for element in sl]
print(applati)


nombre23 = [i for i  in range(0,50) if i%2 ==0 if i%3==0]
print(nombre23)


nombrepairimpair = ["pair" if  i%2 ==0 else "impair"  for i  in range(0,50)]
print(nombrepairimpair)


def carre(x) : 
    return(x*x)

print(carre(5))
carrex = [x*x for x in range (0,10)]
print(carrex)


dc = {x:x*x for x in range(10)}

print(dc)

dci ={k:v for v,k in dc.items()}

print(dci)

dct  = {x : x*x*x for x in range(50) if x*x*x%2 ==0 }
dctf  = {x : x*x*x for x in range(50) }
print(dctf)

multiplier = lambda x,y: x*y

print(multiplier(2, 2))

nombres = [i for i in range(6)]
print(nombres)

nombres = [1, 2, 3, 4, 5]
carres = list(map(lambda x: x**2, nombres))
print(carres)  # Output: [1, 4, 9, 16, 25]
nombre = []
carres = list(map(lambda x:x*x, nombres))

print(carres)


l = (i for i in range(50))

pairs = list(filter(lambda x:x%2==0,l))

print(pairs)


mots = ["chat", "voiture", "ciel", "ai"]

longs = list(filter(lambda x:len(x)>3,mots))

print(longs)




