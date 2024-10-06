# -*- coding: utf-8 -*-
"""
Created on Tue Oct  1 16:14:26 2024

@author: ZT5549
"""
import pandas as pd
import random
from datetime import datetime, timedelta

# Générer 100 lignes de données fictives
rows = []
start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)
date_range = (end_date - start_date).days

for i in range(1, 100000):
    sale_id = i
    product_id = random.randint(100, 105)  # 5 différents produits
    quantity = random.randint(1, 10)  # Quantité de 1 à 10
    sale_date = start_date + timedelta(days=random.randint(0, date_range))  # Date aléatoire entre 2019 et 2021
    sales_amount = round(random.uniform(10.0, 500.0), 2)  # Montant entre 10 et 500
    dateUpdate = start_date + timedelta(days=random.randint(0, date_range))  

    rows.append([sale_id, product_id, quantity, sale_date.strftime('%Y-%m-%d'), sales_amount, dateUpdate.strftime('%Y-%m-%d')])

    
    # Date aléatoire entre 2019 et 2021    
# Créer un DataFrame avec les données générées
columns = ['SaleID', 'ProductID', 'Quantity', 'SaleDate', 'SalesAmount','dateUpdate']
sales_data_large = pd.DataFrame(rows, columns=columns)

# Sauvegarder le DataFrame dans un fichier CSV
file_path_large = "sales_data_large.csv"
sales_data_large.to_csv(file_path_large, index=False)

file_path_large
