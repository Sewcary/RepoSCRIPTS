# -*- coding: utf-8 -*-
"""
Created on Mon Apr 15 13:42:08 2024

@author: ZT5549
"""

import sqlite3

# Connexion à la base de données SQLite
conn = sqlite3.connect('images_database.db')
c = conn.cursor()


# Récupérer toutes les images de la base de données
c.execute("SELECT image_name, image_data FROM images")
images = c.fetchall()


import os

# Chemin du répertoire de destination pour sauvegarder les images
destination_directory = 'C:/Users/ZT5549/OneDrive - SUEZ/Bureau/images/bkp'
# Vérifiez si le répertoire existe, sinon créez-le
if not os.path.exists(destination_directory):
    os.makedirs(destination_directory)

# Écrire les données de chaque image dans un fichier
for image_name, image_data in images:
    file_path = os.path.join(destination_directory, image_name)
    with open(file_path, 'wb') as file:
        file.write(image_data)

print("Toutes les images ont été récupérées et sauvegardées dans le répertoire spécifié.")
