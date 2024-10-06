# -*- coding: utf-8 -*-
"""
Created on Thu May 11 19:03:49 2023

@author: ZT5549
"""


dico = {"nom" : "Niang","prenom" : "Fara","profession" : "Ingenieur", "age" : 45 }

print (dico)

dico["signe"] = "Taureau"

print (dico)

dico["signe"] = "Belier"

print (dico)

del (dico["signe"])
print(dico)

print(dico.keys)

print(dico.values)

print(dico.items)