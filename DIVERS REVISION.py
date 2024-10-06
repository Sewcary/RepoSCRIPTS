# -*- coding: utf-8 -*-
"""
Created on Wed Apr  5 13:10:05 2023

@author: ZT5549
"""

a = 0 
while a <= 10:
    print(a)
    a+=1
    
chn= "quel jour est il"

for c in chn: 
    print(c)
i=0
# def table3(max=12) :
#     i=0
#     while i<=max:
#         print("2 * ", i," = " , i*3    )
#         i=i+1
import md as b
b.table3()
    
f = lambda x,y,z: x*y*z

print(f(5,6,3))
a= 7 
b="2"
try :
    print(a/b)
except ZeroDivisionError :
    print ("Division par zéro")
except NameError :
    print ("Numérateur ou dénominateur non défini")
except TypeError :
    print ("Type incompatible")
    

print (chn.upper())
print (chn.capitalize())
print (chn.center(25))

prenom="fara"
nom="niang"
age=10

print ("Je m'appelle {0} {1} et  j'ai {2} ans .".format(prenom,nom,age))

print (chn[5:])
print (chn[-1:len(chn):-1])
print(chn)


l = [0,2,5,41,4,5,9,7,45,5,8,74,5,214,45,87,4,968,54,4,84,6,899,4,5,6,89,55,66,99,474,55]

for i, elt in enumerate(l):
    print("indice : "  , i ," valeur : ",elt ) 
    
def  div(a,b):
    return a//b,a%b

print(div(8,5))