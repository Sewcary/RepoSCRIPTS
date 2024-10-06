# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:19:39 2024

@author: ZT5549
"""


# Création de listes
liste = [1, 2, 3, 4, 5]
print("Liste originale:", liste)

# Ajout d'éléments
liste.append(6)  # Ajouter à la fin
print("Après ajout:", liste)

liste.insert(0, 0)  # Insérer à l'index spécifié
print("Après insertion:", liste)

# Accès aux éléments
premier = liste[0]
dernier = liste[-1]
print("Premier élément:", premier, "Dernier élément:", dernier)

# Slicing de liste
sous_liste = liste[1:4]
print("Sous-liste:", sous_liste)

# Modification d'éléments
liste[1] = 10
print("Après modification:", liste)

# Suppression d'éléments
del liste[1]  # Supprimer par index
print("Après suppression par index:", liste)

liste.remove(6)  # Supprimer par valeur
print("Après suppression par valeur:", liste)

# Exploration de méthodes supplémentaires
# Utiliser pop() pour supprimer et retourner un élément
element_pop = liste.pop()  # Supprime le dernier élément par défaut
print("Élément retiré avec pop():", element_pop)
print("Liste après pop():", liste)

element_pop_index = liste.pop(0)  # Supprime l'élément à l'index spécifié
print("Élément retiré à l'index avec pop():", element_pop_index)
print("Liste après pop() par index:", liste)

# Opérations avancées
# Longueur de la liste
longueur = len(liste)
print("Longueur de la liste:", longueur)

# Trier une liste
liste_triée = sorted(liste)  # Retourne une nouvelle liste triée
print("Liste triée:", liste_triée)

liste.sort()  # Trie la liste sur place
print("Liste triée (in-place):", liste)

# Inverser une liste
liste.reverse()
print("Liste inversée:", liste)

# Copie de liste
copie_liste = liste[:]  # Copie profonde de la liste
print("Copie de la liste:", copie_liste)

# Compter les occurrences d'un élément
comptage = liste.count(5)
print("Nombre de '5' dans la liste:", comptage)

# Trouver l'index d'un élément
index_cinq = liste.index(5)
print("Index de '5':", index_cinq)

# Étendre une liste
autre_liste = [7, 8, 9]
liste.extend(autre_liste)
print("Liste étendue:", liste)

# Itération sur les éléments
for element in liste:
    print("Élément:", element)

# Compréhension de liste (pour créer des listes de manière concise)
carres = [x**2 for x in range(10)]
print("Carrés des nombres de 0 à 9:", carres)

# Listes multidimensionnelles (listes de listes)
matrice = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print("Matrice:", matrice)
