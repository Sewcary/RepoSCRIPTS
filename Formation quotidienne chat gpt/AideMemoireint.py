# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 14:14:12 2024

@author: ZT5549
"""


# Opérations de base
a = 10
b = 3

# Addition
addition = a + b
print("Addition:", addition)  # 13

# Soustraction
soustraction = a - b
print("Soustraction:", soustraction)  # 7

# Multiplication
multiplication = a * b
print("Multiplication:", multiplication)  # 30

# Division
division = a / b
print("Division:", division)  # 3.333...

# Division entière
division_entiere = a // b
print("Division entière:", division_entiere)  # 3

# Modulo
modulo = a % b
print("Modulo (reste de la division):", modulo)  # 1

# Puissance
puissance = a ** b
print("Puissance:", puissance)  # 1000

# Opérations avancées
# Valeur absolue
absolue = abs(-a)
print("Valeur absolue:", absolue)  # 10

# Arrondi
arrondi = round(division, 2)
print("Arrondi:", arrondi)  # 3.33

# Maximum et Minimum
max_value = max(a, b, 25, 8, 15)
min_value = min(a, b, 25, 8, 15)
print("Maximum:", max_value)  # 25
print("Minimum:", min_value)  # 3

# Conversion de type
float_a = float(a)
int_division = int(division)
print("Converti en float:", float_a)  # 10.0
print("Converti en int:", int_division)  # 3

# Utilisation de fonctions mathématiques (module math)
import math

# Racine carrée
racine_carree = math.sqrt(a)
print("Racine carrée:", racine_carree)  # 3.1622776601683795

# Exponentielle
expo = math.exp(1)  # e^1
print("Exponentielle:", expo)  # 2.718281828459045

# Logarithme
logarithme = math.log(100, 10)  # Log base 10 de 100
print("Logarithme:", logarithme)  # 2.0

# Trigonométrie
angle_rad = math.radians(90)  # Convertir en radians
sin_angle = math.sin(angle_rad)
print("Sinus de 90 degrés:", sin_angle)  # 1.0
