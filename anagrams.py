# -*- coding: utf-8 -*-
"""
Created on Thu Dec  3 18:30:24 2020

@author: ZT5549
"""

from collections import Counter 
str = 'ccddcd' 
print (Counter(str))

def anagram (str1,str2) :
    return Counter(str1) == Counter(str2) 


str2 = 'decddcc' 

print(anagram (str,str2))

l = [1,2,3] 
ll = [1,2,3] 

print (l==ll)
    
    

