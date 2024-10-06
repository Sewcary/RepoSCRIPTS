# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 11:29:51 2023

@author: ZT5549
"""

import openpyxl

# Ouvrir le fichier Excel
wb = openpyxl.load_workbook('QuestionsQuora20230217.xlsx')

# Sélectionner la première feuille
sheet = wb.active

# Parcourir toutes les lignes de la feuille
for row in sheet.iter_rows():
    # Vérifier si toutes les cellules de la ligne sont vides
    if all(cell.value is None or cell.value == '' for cell in row):
        # Supprimer la ligne
        sheet.delete_rows(row[0].row)

# Enregistrer le fichier modifié
wb.save('QuestionsQuora20230217.xlsx')