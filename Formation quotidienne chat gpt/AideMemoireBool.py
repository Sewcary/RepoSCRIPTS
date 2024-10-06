# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:24:25 2024

@author: ZT5549
"""


# Valeurs Booléennes
vrai = True
faux = False

print("Vrai:", vrai)
print("Faux:", faux)

# Opérations logiques
et_logique = vrai and faux  # AND logique
ou_logique = vrai or faux   # OR logique
non_logique = not vrai      # NOT logique

print("ET logique (True and False):", et_logique)
print("OU logique (True or False):", ou_logique)
print("NON logique (not True):", non_logique)

# Comparaisons
a = 10
b = 20
comparaison = a > b  # Plus grand que
print("Comparaison (a > b):", comparaison)

# Utilisation dans des conditions
if vrai:
    print("C'est vrai!")
else:
    print("C'est faux!")

# Conversion de types
nombre = 1  # Python considère 0 comme False et tout autre nombre comme True
bool_nombre = bool(nombre)
print("Conversion d'un nombre en booléen (1):", bool_nombre)

nombre_zero = 0
bool_zero = bool(nombre_zero)
print("Conversion de zéro en booléen (0):", bool_zero)

chaine_vide = ""
bool_chaine = bool(chaine_vide)  # Une chaîne vide est considérée comme False
print("Conversion d'une chaîne vide en booléen:", bool_chaine)

chaine_non_vide = "Python"
bool_chaine_non_vide = bool(chaine_non_vide)  # Toute autre chaîne est True
print("Conversion d'une chaîne non vide en booléen:", bool_chaine_non_vide)

# Utilisation dans des expressions complexes
resultat = (a < b) and (bool_nombre or bool_zero)
print("Résultat de l'expression complexe:", resultat)

# Opérateurs de comparaison
egalite = (a == b)  # Égal à
difference = (a != b)  # Différent de
print("Égalité (a == b):", egalite)
print("Différence (a != b):", difference)
