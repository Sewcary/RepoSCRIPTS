import csv
import random
from faker import Faker
from datetime import datetime, timedelta

# Initialisation de Faker
fake = Faker('fr_FR')  # Génère des données en français

# Configuration des colonnes et de leurs types
# colonnes = [
#     {'nom': 'client_id', 'type': 'entier'},
#     {'nom': 'prenom', 'type': 'prenom'},
#     {'nom': 'nom', 'type': 'nom'},
#     {'nom': 'email', 'type': 'email'},
#     {'nom': 'pays', 'type': 'pays'}
# ]


colonnes = [
    {'nom': 'commande_id', 'type': 'entier'},
    {'nom': 'client_id', 'type': 'int_aleatoire'},
    {'nom': 'date_commande', 'type': 'date'},
    {'nom': 'montant', 'type': 'flottant'},
    {'nom': 'statut', 'type': 'statut_commande'}
]

# Nom du fichier CSV en sortie
# nom_fichier_csv = 'Clients.csv'
nom_fichier_csv = 'Commandes.csv'
# Nombre de lignes à générer
nombre_lignes = 10000

# Fonction pour générer une valeur en fonction du type
def generer_valeur(typ, index):
    if typ == 'entier':
        return index  # Ou random.randint(1, 1000)
    elif typ == 'flottant':
        return round(random.uniform(0.0, 1000.0), 2)
    elif typ == 'chaine':
        return fake.text(max_nb_chars=20)
    elif typ == 'date':
        return fake.date_between(start_date='-1y', end_date='today').strftime('%Y-%m-%d')
    elif typ == 'email':
        return fake.email()
    elif typ == 'nom':
        return fake.last_name()
    elif typ == 'prenom':
        return fake.first_name()
    elif typ == 'pays':
        return fake.current_country()
    elif typ == 'statut_commande':
        return random.choice(['Expédiee', 'En attente', 'Livree', 'Annulee'])
    elif typ == 'int_aleatoire':
        return random.randint(1, 1000) 
    
    else:         return None

# Génération des données
donnees = []
for i in range(1, nombre_lignes + 1):
    ligne = {}
    for col in colonnes:
        valeur = generer_valeur(col['type'], i)
        ligne[col['nom']] = valeur
    donnees.append(ligne)

# Écriture dans le fichier CSV
with open(nom_fichier_csv, 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = [col['nom'] for col in colonnes]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(donnees)

print(f"Le fichier {nom_fichier_csv} a été généré avec succès.")
