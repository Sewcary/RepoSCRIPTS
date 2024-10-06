# -*- coding: utf-8 -*-
"""
Created on Sat Nov 11 23:52:07 2023

@author: ZT5549
"""

import os



from pyairtable import Table

api_key = 'patxuD3gfYiRBPNrP.027930cac0419f73d0ead00f25c121133150feea1948ae817491d6498d12a1f5'
base_id = 'appQGL2cmVyMAsZ0W'
table_name = 'Table 1'

table = Table(api_key, base_id, table_name)

# Pour obtenir tous les enregistrements de la table
records = table.all()

# Afficher les enregistrements
for record in records:
    print(record)