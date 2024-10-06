# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 18:28:06 2024

@author: ZT5549
"""
import random

tentatives = 0
i = random.randint(1, 100)
b = int(input("Entrez un entier : "))

while b != i:
    if i > b:
        print("Le nombre mystère est supérieur.")
    elif i < b:
        print("Le nombre mystère est inférieur.")
    b = int(input("Entrez un entier : "))
    tentatives += 1

print(f'Bravo !! Vous avez trouvé en {tentatives} tentatives.')
