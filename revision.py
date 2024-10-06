# -*- coding: utf-8 -*-
"""
Created on Mon Apr 17 18:47:51 2023

@author: ZT5549
"""
i= 0 
while i<10 :
    print(i , "* 2 =  " , i*2 ) 
    i=i+1
chn = "test de chaine de nombreux caracteres"

print(chn.split())

s = chn.split() 

print (s)

ss = "*".join(s) 

print( ss)

print (ss.capitalize())
print (ss.upper())
print(ss.center(100))


a = 15 

b = 25 

try  :
    a/b
# except TypeError : 
#     print('Type non compatible')
# except NameError : 
#     print('variable non définie')
# except ZeroDivisionError :
#     print('Division par zero') 
except TypeError  as exceptionr: 
    print ("exception : " ,exceptionr )
l =[x for x in range (50)]
ll = [x*x*x for x in l]

print (l)
print(ll)    

# while 1 : 
#     n =input('entrez la lettre q pour quitter!')
#     if n == 'q' :
#         break
    
def f (*p):
    print ("{}".format(p))
    
f(1,25,1,45,2,54,4,4,5,9,987,7,7,4)

ff = lambda x : x*x

print(ff(5))

for i, elt in enumerate(ll) :
    print(i,elt)
    
print(a,b)
a,b=b,a 
print(a,b)

c=a=b

print(a,b,c)


import math 
print(math.sqrt(100))
