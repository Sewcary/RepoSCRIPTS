# -*- coding: utf-8 -*-
"""
Created on Fri Mar 24 17:53:43 2023

@author: ZT5549
"""

# while 1: 
#     lettre = input("Tapez q pour quitter ")
#     if lettre == "q" : 
#         break
i=0
while i<=10:
    print(i,"*",i,"=",i*i)
    i+=1
    
ch = 'Bonjour tout le monde'
chs = ch.split()
for c in chs : 
    print(c)

ch2 = ".".join(chs)
print(ch2)

l =[1,5,4,77,4,4,7,8,5,5,2,1,4,5,5,5,9,9,7,4,1,2,1,7,87,8,8,8,4]

ll = [nb + nb for nb in l  ] 

print(ll)

lll = [nb - 50 for nb in  l if nb >5]

print(lll)

a = 10 
b = 'True'
try :
    a/b
except NameError:
    print('Nombre indéfini')
except TypeError:
    print('Type incompatible')
    
def fn (*params):
    print("jai reçu {}".format(params))
    
l = [22,6,9,63,69,9,777,7,7,8,8,7,7,4,7,7,8,8,7]

fn (1,4,5,45,4,8,74,7,7,77,4,4,4,4,54,55,8,7,4,4,4,4,87,8,8,8,8,7,7,7,7)

l  = input("Enter space-separated numbers to add: ")
ll=l.split()
m = map (int,ll)
print(sum(m))

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


def fn_arrondi (flt) : 
    return (str(flt).replace('.',',')[0:str(flt).index('.')+4])

print(fn_arrondi(45.0222))

chn = "Numérateur ou dénominateur non défini"

print (chn.upper())
print (chn.capitalize())
print (chn.center(25))

prenom="fara"
nom="niang"
age=10

print ("Je m'appelle {0} {1} et  j'ai {2} ans .".format(prenom,nom,age))

l = [0,2,5,41,4,5,9,7,45,5,8,74,5,214,45,87,4,968,54,4,84,6,899,4,5,6,89,55,66,99,474,55]

for i, elt in enumerate(l):
    print("indice : "  , i ," valeur : ",elt ) 

def  div(a,b):
    return a//b,a%b

print(div(8,5))

print (sum([int(a) for a in input('Entrer les nombres a additionner : ').split()]))

f = lambda x,y,z: x*y*z

print(f(5,6,3))

def fff (*parametres):
    print('{}'.format(parametres))
    
    
print(fff(l))

print(fff(1,55,588,8,8,8,8,8,55,5,5,5,4,4,455,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4))

import math 
print(math.sqrt(100))