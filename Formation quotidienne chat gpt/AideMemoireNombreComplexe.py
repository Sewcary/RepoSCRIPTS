# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:22:24 2024

@author: ZT5549
"""


# Création de nombres complexes
z1 = complex(2, 3)  # Créer un nombre complexe avec la partie réelle 2 et imaginaire 3
z2 = 1 + 4j         # Créer un nombre complexe directement

print("Nombre complexe z1:", z1)
print("Nombre complexe z2:", z2)

# Parties réelle et imaginaire
print("Partie réelle de z1:", z1.real)
print("Partie imaginaire de z1:", z1.imag)

# Conjugaison d'un nombre complexe
conjugue_z1 = z1.conjugate()
print("Conjugué de z1:", conjugue_z1)

# Addition de nombres complexes
addition = z1 + z2
print("Addition de z1 et z2:", addition)

# Soustraction de nombres complexes
soustraction = z1 - z2
print("Soustraction de z1 et z2:", soustraction)

# Multiplication de nombres complexes
multiplication = z1 * z2
print("Multiplication de z1 et z2:", multiplication)

# Division de nombres complexes
division = z1 / z2
print("Division de z1 par z2:", division)

# Module d'un nombre complexe
import math
module_z1 = math.sqrt(z1.real ** 2 + z1.imag ** 2)
print("Module de z1:", module_z1)

# Utilisation de fonctions spécifiques aux nombres complexes
import cmath
angle = cmath.phase(z1)
print("Phase (angle) de z1:", angle)

# Conversion en forme polaire
polaire = cmath.polar(z1)
print("Forme polaire de z1 (module, angle):", polaire)

# Conversion de polaire à rectangulaire
rectangulaire = cmath
