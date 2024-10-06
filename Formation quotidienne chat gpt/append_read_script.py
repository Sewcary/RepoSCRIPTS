# -*- coding: utf-8 -*-
"""
Created on Thu May 16 16:10:12 2024

@author: ZT5549
"""


with open('test.fr','a') as f :
    f.write("test\n")
    
    
with open('test.fr', 'r') as f : 
    Str = f.read()
    
print(Str)