# -*- coding: utf-8 -*-
"""
Created on Wed Apr  5 12:57:23 2023

@author: ZT5549
"""
chn = "La vie est belle"

chn_splt = chn.split()

print(chn_splt)

ch ="Bonjour tout le monde"



print ("*".join(chn_splt))

def fn_arrondi (flt) : 
    return (str(flt).replace('.',',')[0:str(flt).index('.')+4])

print(fn_arrondi(45.0222))

print(1/2)
print(1//2)
print(1%2)
a=5
b=32 
a,b=b,a

print (a)
print (b)

x=y=3 

print (x)
print (y)

print(type(x))

print(" a + b = ",a+b," x + y = " ,x+y)





