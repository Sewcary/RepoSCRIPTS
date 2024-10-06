# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 16:36:28 2024

@author: ZT5549
"""


# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 16:33:45 2024

@author: ZT5549
"""

n1 = int(input("Entrez le premier nombre : "))

n2 = int(input("Entrez le second nombre : "))

operateur = input("Entrez l'opérateur' : ")

print(n1)

print(n2)

resultat = None

if operateur == '+' : 
    resultat = n1 +n2

if operateur == '-' : 
    resultat = n1  - n2


if operateur == '*' : 
    resultat = n1  * n2


if operateur == '//' : 
    resultat = n1 // n2


if operateur == '/' : 
    resultat = n1 / n2
    
if operateur == '%' : 
    resultat = n1 % n2

if operateur == '**' : 
    resultat = n1 ** n2
if resultat != None : 
    print("resultat  = " , resultat )
else : 
    print("resultat  = " , "none" )