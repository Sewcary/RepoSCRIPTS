# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 11:10:55 2023

@author: ZT5549
"""

import openpyxl

# Ouvrir le fichier Excel
wb = openpyxl.load_workbook('fichier_excel.xlsx')

# Sélectionner la première feuille
sheet = wb.active

# Lire la valeur d'une cellule
value = sheet['A1'].value

# Modifier la valeur d'une cellule
sheet['A1'] = 'Nouvelle valeur'

# Enregistrer le fichier modifié
wb.save('fichier_excel_modifié.xlsx')