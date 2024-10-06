# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:27:02 2024

@author: ZT5549
"""


# Création de tuples
mon_tuple = (1, 2, 3, 4, 5)
tuple_mixte = ('a', "Python", 3.14, True)

print("Tuple numérique:", mon_tuple)
print("Tuple mixte:", tuple_mixte)

# Accès aux éléments
premier_element = mon_tuple[0]
dernier_element = mon_tuple[-1]

print("Premier élément:", premier_element)
print("Dernier élément:", dernier_element)

# Slicing de tuple
sous_tuple = mon_tuple[1:4]  # Obtient les éléments de l'indice 1 à 3
print("Sous-tuple:", sous_tuple)

# Longueur du tuple
taille_tuple = len(mon_tuple)
print("Taille du tuple:", taille_tuple)

# Itération sur un tuple
for element in mon_tuple:
    print("Élément:", element)

# Vérification de l'appartenance
est_present = 3 in mon_tuple
print("3 est dans le tuple:", est_present)

# Compter les occurrences d'un élément
comptage = mon_tuple.count(2)
print("Nombre de fois que 2 apparaît:", comptage)

# Trouver l'index d'un élément
index_trois = mon_tuple.index(3)
print("Index de l'élément '3':", index_trois)

# Immutabilité du tuple (essayer de modifier un élément provoque une erreur)
try:
    mon_tuple[0] = 10
except TypeError as e:
    print("Erreur rencontrée:", e)

# Concaténation de tuples
autre_tuple = (6, 7, 8)
nouveau_tuple = mon_tuple + autre_tuple
print("Tuple après concaténation:", nouveau_tuple)

# Tuple avec un seul élément (nécessite une virgule)
singleton = (9,)
print("Tuple singleton:", singleton)

# Déballage de tuple (unpacking)
a, b, c, d, e = mon_tuple
print("Déballage de tuple:", a, b, c, d, e)

# Utilisation de tuple pour échanger des valeurs
x = 10
y = 20
x, y = y, x
print("x:", x, "y:", y)
