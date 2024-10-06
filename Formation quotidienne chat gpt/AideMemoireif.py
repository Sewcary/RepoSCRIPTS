# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:36:42 2024

@author: ZT5549
"""


# Exemple de base de l'utilisation de if, elif, et else
x = 20
y = 20

if x < y:
    print("x est inférieur à y")
elif x > y:
    print("x est supérieur à y")
else:
    print("x est égal à y")

# Conditions multiples avec and, or, not
a = 10
b = 25
c = 30

if a < b and b < c:
    print("a est inférieur à b et b est inférieur à c")

if not (a > b):
    print("a n'est pas supérieur à b")

# Conditions combinées
if a < b < c:
    print("a est inférieur à b qui est inférieur à c")

# Utilisation de conditions avec des listes
liste = [1, 2, 3, 4, 5]

if 3 in liste:
    print("3 est dans la liste")

if 6 not in liste:
    print("6 n'est pas dans la liste")

# Conditions avec des chaînes de caractères
chaine = "Bonjour"

if "Bon" in chaine:
    print("La chaîne commence par 'Bon'")

# Structure conditionnelle ternaire
resultat = "x est inférieur" if x < y else "x est supérieur ou égal"
print(resultat)

# Exemple avec elif pour plusieurs conditions
couleur = "rouge"

if couleur == "vert":
    print("La couleur est verte")
elif couleur == "bleu":
    print("La couleur est bleue")
elif couleur == "rouge":
    print("La couleur est rouge")
else:
    print("La couleur n'est pas verte, bleue, ni rouge")

# Exemple utilisant des variables booléennes
utilisateur_authentifie = True

if utilisateur_authentifie:
    print("Accès autorisé")
else:
    print("Accès refusé")

# Instructions conditionnelles imbriquées
age = 20
statut = "étudiant"

if age > 18:
    if statut == "étudiant":
        print("C'est un étudiant adulte")
    else:
        print("C'est un adulte non étudiant")
else:
    print("Moins de 18 ans")

# Compréhension de liste avec condition
nombres = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
pairs = [n for n in nombres if n % 2 == 0]
print("Nombres pairs:", pairs)

# Compréhension de liste avec conditions multiples
impairs_inf_5 = [n for n in nombres if n % 2 != 0 if n < 5]
print("Nombres impairs inférieurs à 5:", impairs_inf_5)

# Conditions complexes avec des fonctions
def est_majeur(age):
    return age >= 18

age = 20
if est_majeur(age):
    print("Vous êtes majeur.")
else:
    print("Vous êtes mineur.")
