# -*- coding: utf-8 -*-
"""
Created on Mon Jan  8 10:05:02 2024

@author: ZT5549
"""

l = [1,2,3,4,5,6]

# print(l)

doubles = [x*2 for x in l]

# print (doubles)

pairs = [x for x in range(0,150) if x%2 == 0]

# print (pairs)

div2 = [x for x in range (100, 151) if x%2 == 0]


print(div2)

matrice = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
aplati = [element for sous_liste in matrice for element in sous_liste]
print(aplati)  # Résultat: [1, 2, 3, 4, 5, 6, 7, 8, 9]
