# -*- coding: utf-8 -*-
"""
Created on Wed Jan 11 11:54:19 2023

@author: ZT5549
"""

import os
import shutil

# Répertoire source
src_dir = r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau'

# Répertoires de destination pour chaque type de fichier
dst_dirs = {
    'images': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\images',
    'documents': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\documents',
    'videos': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\videos',
    'tableurs': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\tableurs',
    'zips': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\zips',
    'scripts': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\scripts',
    'autres': r'C:\Users\ZT5549\OneDrive - SUEZ\Bureau\autres'
}

# Extensions de fichiers à rechercher
extensions = {
    'images': ('.jpg', '.jpeg', '.png', '.gif'),
    'documents': ('.txt', '.doc', '.docx', '.pdf'),
    'videos': ('.mp4', '.mkv', '.avi'),
    'tableurs': ('.xlsx', '.xls', '.csv'),
    'zips': ('.zip', '.rar', '.tar', '.gz'),
    'scripts': ('.py')
}

# Parcours du répertoire source
for file_name in os.listdir(src_dir):
    src_path = os.path.join(src_dir, file_name)
    # vérifie si c'est un dossier 
    if os.path.isdir(src_path):
        continue
    _, file_ext = os.path.splitext(file_name)
    # Détermination du type de fichier
    for file_type, ext in extensions.items():
        if file_ext.lower() in ext:
            break
    else:
        file_type = 'autres'
    dst_dir = dst_dirs[file_type]
    # Création du répertoire de destination s'il n'existe pas
    os.makedirs(dst_dir, exist_ok=True)
    # Déplacement du fichier
    shutil.move(src_path, os.path.join(dst_dir, file_name))