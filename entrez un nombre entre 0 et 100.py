# -*- coding: utf-8 -*-
"""
Created on Mon Dec 26 19:35:48 2022

# @author: ZT5549
"""
import random

cherche = random.randint(0,100)


number = int (input ("Entrez un nombre entre 0 et 100 : "))

    
while (number != cherche ):
    if number > cherche:
        print('Trop grand')
    else:
        if number < cherche:
            print('Trop petit')
    number = int (input ("Entrez un nombre entre 0 et 100 : "))
         
print ('Bravo!!!')
print ('Le nombre était : ' + str(cherche) )
