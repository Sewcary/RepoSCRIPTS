# -*- coding: utf-8 -*-
"""
Created on Mon May 13 18:28:26 2024

@author: ZT5549
"""



def  compter_voyelles (s) : 
    n = 0 
    for ss in s : 
        if ss in 'aeiouyAEIOUY':
            n+=1 
    return(n)
print(compter_voyelles("Bonjour"))  # Devrait afficher 3