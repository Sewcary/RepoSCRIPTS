# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:31:20 2024

@author: ZT5549
"""


# Création d'ensembles
mon_ensemble = {1, 2, 3, 4, 5}
print("Ensemble initial:", mon_ensemble)

# Ajout d'éléments
mon_ensemble.add(6)
print("Après ajout:", mon_ensemble)

# Ajout de multiples éléments
mon_ensemble.update([7, 8, 9])
print("Après ajout multiple:", mon_ensemble)

# Suppression d'éléments
mon_ensemble.remove(9)  # Lève KeyError si l'élément n'existe pas
print("Après suppression:", mon_ensemble)

mon_ensemble.discard(8)  # Ne lève pas d'erreur si l'élément n'existe pas
print("Après discard:", mon_ensemble)

# Vérification de l'appartenance
est_present = 1 in mon_ensemble
print("1 est dans l'ensemble:", est_present)

# Opérations entre ensembles
autre_ensemble = {4, 5, 6, 10, 11, 12}

union = mon_ensemble.union(autre_ensemble)
print("Union:", union)

intersection = mon_ensemble.intersection(autre_ensemble)
print("Intersection:", intersection)

difference = mon_ensemble.difference(autre_ensemble)
print("Différence:", difference)

difference_symetrique = mon_ensemble.symmetric_difference(autre_ensemble)
print("Différence symétrique:", difference_symetrique)

# Taille de l'ensemble
taille = len(mon_ensemble)
print("Taille de l'ensemble:", taille)

# Itération sur un ensemble
for element in mon_ensemble:
    print("Élément:", element)

# Ensembles immuables
from collections import frozenset
ensemble_immuable = frozenset([1, 2, 3])
print("Ensemble immuable:", ensemble_immuable)

# Ensembles et sous-ensembles
ensemble_b = {1, 2, 3, 4, 5, 6}
ensemble_c = {1, 2, 3}

est_sous_ensemble = ensemble_c.issubset(ensemble_b)
est_super_ensemble = ensemble_b.issuperset(ensemble_c)

print("C est sous-ensemble de B:", est_sous_ensemble)
print("B est super-ensemble de C:", est_super_ensemble)
