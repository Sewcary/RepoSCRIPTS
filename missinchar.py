# -*- coding: utf-8 -*-
"""
Created on Mon Dec 21 11:15:02 2020

@author: ZT5549
"""
def missingchar (s,  n ) : 
    return s[0:n] + s[n+1::]

print (missingchar('kitten',4))