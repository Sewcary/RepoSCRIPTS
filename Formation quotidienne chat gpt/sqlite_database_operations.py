# -*- coding: utf-8 -*-
"""
Created on Mon May 13 17:18:54 2024

@author: ZT5549
"""


import sqlite3

conn = sqlite3.connect('ex.db')
cur = conn.cursor()

cur.execute ('create table if not exists util(id integer primary key, nom text , age integer)')
conn.commit()

cur.execute ('insert into util (nom,age) values (?,?)' ,('Krako',13))
conn.commit()

cur.execute("Select * from util")
rows= cur.fetchall()
for row in rows : 
    print(row)

conn.close