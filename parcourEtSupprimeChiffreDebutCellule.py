# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 11:18:06 2023

@author: ZT5549
"""

import openpyxl

# Ouvrir le fichier Excel
wb = openpyxl.load_workbook('QuestionsQuora20230217.xlsx')

# Sélectionner la première feuille
sheet = wb.active

# Parcourir les colonnes et les cellules de la feuille
for column in sheet.columns:
    for cell in column:
        # Vérifier si la cellule commence par un nombre
        if isinstance(cell.value, str) and cell.value[0].isdigit():
            # Supprimer le point après le nombre s'il existe
            cell.value = cell.value.lstrip('0123456789').lstrip('.')

# Enregistrer le fichier modifié
wb.save('QuestionsQuora20230217.xlsx')