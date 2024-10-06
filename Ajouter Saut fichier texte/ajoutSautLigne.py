# -*- coding: utf-8 -*-
"""
Created on Tue Oct  1 19:13:30 2024

@author: ZT5549
"""

def add_newlines_from_line_6311(file_path, output_file):
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    # Only process from line 6311
    for i in range(6310, len(lines)):  # Index 6310 car les lignes commencent à 0
        lines[i] = lines[i].replace('. ', '.\n').replace('? ', '?\n').replace('! ', '!\n')

    with open(output_file, 'w', encoding='utf-8') as file:
        file.writelines(lines)

# Exemple d'utilisation :
input_file = 'ChatGPT Full Course .txt'
output_file = 'ChatGPT Full Course2.txt'
add_newlines_from_line_6311(input_file, output_file)
