# -*- coding: utf-8 -*-
"""
Created on Fri Apr 19 09:53:16 2024

@author: ZT5549
"""


chaine = input('entrez la chaine a verifier : ')

chaineInversee = chaine[::-1]


print (chaineInversee)
if chaine ==chaineInversee : 
    print ('c''est un palindrome')
else :
    print ('ce n''est pas un palindrome')
