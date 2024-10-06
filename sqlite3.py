# -*- coding: utf-8 -*-
"""
Created on Tue Oct 27 14:44:36 2020

@author: ZT5549
"""
import sqlite3 
conn = sqlite3.connect('mabase.db') 
# Créer un cursor 
cur = conn.cursor() 
# Création de la requete 
#req = "CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL)" 
# Exécution de la requete 
#cur.execute(req) 
# Envoyer la requete 
nom = 'Fara' 
email = 'Fara@gmail.com' 
age = 22   
cur = conn.cursor()  
cur.execute("Insert into students (name,email) values (?,?)",(nom, email))
#cur.execute ("INSERT INTO students (`nom`,`email`) VALUES ('Albert', 'albert@gmail.com')")
# Commettre ou engager les données
conn.commit ()
conn.commit() 
# Fermer la connexion 
conn.close

