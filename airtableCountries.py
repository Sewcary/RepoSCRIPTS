# -*- coding: utf-8 -*-
"""
Created on Sun Nov 12 11:53:37 2023

@author: ZT5549
"""

import requests

# Nom du pays que vous recherchez
pays = "France"

# URL de base de l'API REST Countries
url = f"https://api.airtable.com/v0/app5wpO1aYYaUaa3c/posts?api_key=keyceLBcIYyRjIRdZ"

# Envoi de la requête GET à l'API
response = requests.get(url, verify=False)

# Vérification du statut de la réponse
if response.status_code == 200:
    # Extraction des données
    # data = response.json()[0]  # Prend la première occurrence de la réponse
    # # Affichage de quelques informations
    # nom_complet = data["name"]["common"]
    # capitale = data["capital"][0]
    # population = data["population"]
    # region = data["region"]
    print(response)
else:
    print("Erreur lors de la récupération des données de l'API")
