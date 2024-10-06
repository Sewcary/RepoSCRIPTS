# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 22:01:00 2020

@author: ZT5549
"""
def table_par_7():
    i = 0 
    nb=7
    while i < 10 :
        print (i +1 ,"*",nb, (i+1)* nb)
        i=i+1
        
table_par_7()

def table(nb): 
     i = 0 
     while i < 10 :
        print (i +1 ,"*",nb, (i+1)* nb)
        i=i+1
table(5)

def table_max(nb , max=10):
     i = 0 
     while i < max :
        print (i +1 ,"*",nb, (i+1)* nb)
        i=i+1

table_max(4,max=3)

f = lambda x:x*x
print (f(5))

help(math)