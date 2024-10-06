# -*- coding: utf-8 -*-
"""
Created on Mon Sep 11 16:00:37 2023

@author: ZT5549
"""

# Lire le fichier d'entrée
with open('C:\\Users\\ZT5549\\OneDrive - SUEZ\\Bureau\\MonDeck.txt', 'r', encoding='utf-8') as fichier:
    lines = fichier.readlines()


# Extraire les questions et les réponses
cartes_flash = []
for line in lines:
    if not line.startswith('#'):
        parts = line.split('\t')
        if len(parts) == 2:
            question = parts[0].split(':')[-1].strip()
            reponse = parts[1].split(':')[-1].strip()
            cartes_flash.append((question, reponse))
for question, reponse in cartes_flash:
    print(f'"{question}";"{reponse}"\n')
# Créer le fichier CSV
with open('C:\\Users\\ZT5549\\OneDrive - SUEZ\\Bureau\\output.csv', 'a', encoding='utf-8') as csv_fichier:
    for question, reponse in cartes_flash:
        csv_fichier.write(f'"{question}";"{reponse}"\n')

print("Fichier CSV créé avec succès!")
