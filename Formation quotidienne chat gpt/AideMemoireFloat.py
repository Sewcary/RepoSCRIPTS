# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:16:28 2024

@author: ZT5549
"""


# Opérations de base avec des floats
x = 10.5
y = 3.2

# Addition
addition = x + y
print("Addition:", addition)  # 13.7

# Soustraction
soustraction = x - y
print("Soustraction:", soustraction)  # 7.3

# Multiplication
multiplication = x * y
print("Multiplication:", multiplication)  # 33.6

# Division
division = x / y
print("Division:", division)  # 3.28125

# Division entière
division_entiere = x // y
print("Division entière:", division_entiere)  # 3.0

# Modulo
modulo = x % y
print("Modulo (reste de la division):", modulo)  # 1.1

# Puissance
puissance = x ** y
print("Puissance:", puissance)  # 1643.2415370740423

# Opérations avancées
# Arrondi
arrondi = round(division, 2)
print("Arrondi:", arrondi)  # 3.28

# Maximum et Minimum
max_value = max(x, y, 25.6, 8.7, 15.2)
min_value = min(x, y, 25.6, 8.7, 15.2)
print("Maximum:", max_value)  # 25.6
print("Minimum:", min_value)  # 3.2

# Conversion de type
int_x = int(x)
str_y = str(y)
print("Converti en int:", int_x)  # 10
print("Converti en string:", str_y)  # '3.2'

# Utilisation de fonctions mathématiques (module math)
import math

# Racine carrée
racine_carree = math.sqrt(x)
print("Racine carrée:", racine_carree)  # 3.24037034920393

# Exponentielle
expo = math.exp(1)  # e^1
print("Exponentielle:", expo)  # 2.718281828459045

# Logarithme
logarithme = math.log(100)  # Log naturel de 100
print("Logarithme:", logarithme)  # 4.605170185988092

# Trigonométrie
angle_rad = math.radians(90)  # Convertir en radians
sin_angle = math.sin(angle_rad)
print("Sinus de 90 degrés:", sin_angle)  # 1.0

# Gestion de la précision avec le module decimal
from decimal import Decimal, getcontext

getcontext().prec = 4  # Définir la précision globale à 4 chiffres significatifs
d1 = Decimal('10.123')
d2 = Decimal('3.14159')
print("Opération avec Decimal:", d1 + d2)  # 13.26 (en respectant la précision définie)
