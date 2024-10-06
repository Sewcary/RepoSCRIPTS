# -*- coding: utf-8 -*-
"""
Created on Mon Apr 15 13:36:40 2024

@author: ZT5549
"""
import sqlite3
import os
from PIL import Image
import io

conn = sqlite3.connect('images_database.db')
c = conn.cursor()


def insert_image_into_db(image_path):
    conn = sqlite3.connect('images_database.db')
    c = conn.cursor()
    with Image.open(image_path) as img:
        # Convertir l'image en données binaires
        img_byte_arr = io.BytesIO()
        img.save(img_byte_arr, format=img.format)
        image_data = img_byte_arr.getvalue()
    
    # Insérer dans la base de données
    c.execute('INSERT INTO images (image_name, image_data) VALUES (?, ?)', 
              (os.path.basename(image_path), image_data))
    conn.commit()

# Chemin du répertoire contenant les images
directory_path = 'C:/Users/ZT5549/OneDrive - SUEZ/Bureau/images'



# Parcourir le répertoire et insérer chaque image
for filename in os.listdir(directory_path):
    if filename.lower().endswith(('.png', '.jpg', '.jpeg')):  # vérifie les extensions d'images communes
        insert_image_into_db(os.path.join(directory_path, filename))

print("Toutes les images ont été copiées dans la base de données SQLite.")
# Fermeture de la connexion à la base de données
conn.close()