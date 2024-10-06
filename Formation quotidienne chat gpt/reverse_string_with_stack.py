# -*- coding: utf-8 -*-
"""
Created on Mon May 13 18:30:22 2024

@author: ZT5549
"""



    

ret = []
s = "Bonjour"
ss = list(s)

while len (ss) !=0: 
    ret.append(ss.pop()) 
    
c = "".join(ret)

print(c)