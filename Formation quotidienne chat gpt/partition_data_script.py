# -*- coding: utf-8 -*-
"""
Created on Wed May 15 13:11:44 2024

@author: ZT5549
"""


import pandas as pd
import os

# Charger les données
df = pd.read_csv('Superstore.csv')

# Créer le répertoire de sortie
output_dir = 'partitioned_data'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Partitionner les données par année et par région
for year in df['Order Date'].str[:4].unique():
    for region in df['Region'].unique():
        partition_df = df[(df['Order Date'].str[:4] == year) & (df['Region'] == region)]
        if not partition_df.empty:
            partition_path = f'{output_dir}/year={year}/region={region}'
            if not os.path.exists(partition_path):
                os.makedirs(partition_path)
            partition_df.to_csv(f'{partition_path}/Sample-Superstore.csv', index=False)