# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 22:02:55 2020

@author: ZT5549
"""


chaine = "Bonjour les zeros"
for lettre in chaine: 
    if lettre in "AEIOUYaeiouy" :
        print (lettre)
    else:
        print("*")