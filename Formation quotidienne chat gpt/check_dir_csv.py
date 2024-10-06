# -*- coding: utf-8 -*-
"""
Created on Wed May 15 13:15:46 2024

@author: ZT5549
"""


import os 
import pandas as pd

if  os.path.exists('partitioned_data'): 
    print('existe')
    
    
df = pd.read_csv('Superstore.csv')
for year in df['Order Date'].str[:4].unique():
    print(year)

# print (df)