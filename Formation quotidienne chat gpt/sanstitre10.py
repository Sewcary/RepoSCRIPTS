# -*- coding: utf-8 -*-
"""
Created on Wed Mar 22 12:35:15 2023

@author: ZT5549
"""
import re
question = []

file_name = "az-900_dump.txt"
with open(file_name, 'r', encoding='utf-8') as file:
        content = file.read()

pattern = r"(NEW QUESTION \d+.*?)(?=Answer)"

# Utilisation de findall pour récupérer toutes les occurrences correspondant au motif
questions = re.findall(pattern, content, flags=re.DOTALL)

# Affichage des questions extraites
for i, question in enumerate(questions):
    print(f"Question {i+1}:")
    print(question)
    print("\n")

