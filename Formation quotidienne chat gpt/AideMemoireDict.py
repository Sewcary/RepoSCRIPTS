# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:29:21 2024

@author: ZT5549
"""


# Création de dictionnaires
mon_dictionnaire = {"nom": "Alice", "âge": 30, "ville": "Paris"}
print("Dictionnaire:", mon_dictionnaire)

# Accès aux valeurs par clé
nom = mon_dictionnaire["nom"]
print("Nom:", nom)

# Modification de valeurs
mon_dictionnaire["âge"] = 31
print("Âge modifié:", mon_dictionnaire)

# Ajout de nouvelles paires clé-valeur
mon_dictionnaire["profession"] = "Développeur"
print("Après ajout:", mon_dictionnaire)

# Suppression de paires clé-valeur
del mon_dictionnaire["ville"]
print("Après suppression:", mon_dictionnaire)

# Utilisation de get pour éviter KeyError
profession = mon_dictionnaire.get("profession", "Pas de profession")
print("Profession:", profession)

# Clés, Valeurs et Items
cles = mon_dictionnaire.keys()
valeurs = mon_dictionnaire.values()
items = mon_dictionnaire.items()
print("Clés:", cles)
print("Valeurs:", valeurs)
print("Items (paires clé-valeur):", items)

# Itération sur les clés et valeurs
for cle, valeur in mon_dictionnaire.items():
    print(f"{cle}: {valeur}")

# Vérification de l'existence d'une clé
existe = "nom" in mon_dictionnaire
print("Clé 'nom' existe:", existe)

# Dictionnaire avec des valeurs par défaut
from collections import defaultdict
dictionnaire_defaut = defaultdict(int)
dictionnaire_defaut["cle"] += 1
print("Valeur par défaut:", dictionnaire_defaut["cle"])

# Combiner des dictionnaires avec update
autre_dict = {"hobby": "peinture", "nom": "Bob"}
mon_dictionnaire.update(autre_dict)
print("Après mise à jour:", mon_dictionnaire)

# Création de dictionnaire avec dict() et zipping
cles_liste = ["x", "y", "z"]
valeurs_liste = [1, 2, 3]
zip_dict = dict(zip(cles_liste, valeurs_liste))
print("Dictionnaire zippé:", zip_dict)

# Utilisation de dictionnaires pour structurer des données complexes
data_dict = {
    "Alice": {"âge": 30, "ville": "Paris"},
    "Bob": {"âge": 25, "ville": "Lyon"}
}
print("Dictionnaire structuré:", data_dict)
