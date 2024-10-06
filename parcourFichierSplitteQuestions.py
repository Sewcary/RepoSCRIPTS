# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 11:25:52 2023

@author: ZT5549
"""

import openpyxl

# Ouvrir le fichier Excel
wb = openpyxl.load_workbook('QuestionsQuora20230217.xlsx')

# Sélectionner la première feuille
sheet = wb.active

# Parcourir toutes les cellules de la feuille
for row in sheet.iter_rows():
    for cell in row:
        # Vérifier si la cellule contient une question
        if isinstance(cell.value, str) and '?' in cell.value:
            # Splitter les questions et les mettre dans des lignes suivant la fin du tableau
            questions = cell.value.split('?')
            new_value = questions.pop(0)
            for question in questions:
                new_value += '?\n' + question.strip()
            cell.value = new_value

# Enregistrer le fichier modifié
wb.save('QuestionsQuora20230217.xlsx')
