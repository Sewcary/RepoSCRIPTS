# -*- coding: utf-8 -*-
"""
Created on Mon May 13 17:15:43 2024

@author: ZT5549
"""


test = "test.txt"
with open(test,"w") as f : 
    f.write ("Bonjuour fichier test")
    
with open (test,"r") as f  : 
    contenu =f.read()
    
print (contenu)