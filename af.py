"""
Created on Sat Nov 11 18:51:39 2023

@author: ZT5549
"""

# Remplacez 'chemin_du_fichier.txt' par le chemin de votre fichier
chemin_du_fichier = 'af.txt'

# Ouvrez le fichier en mode lecture
with open(chemin_du_fichier, 'r') as fichier:
    contenu = fichier.read()

# Exemple de texte spécifique
specific_text = """Votre texte spécifique ici..."""

# Séparation du texte en lignes
lines = contenu.split('\n')

# Variables pour stocker la région actuelle et les informations collectées
current_region = None
current_record = False
info_table = []
commentaires =""
vol=""
incident=""
ville_depart=""
heure_depart=""
ville_arrivee=""
heure_arrivee=""
rest_of_line =""
# Parcours du texte ligne par ligne
for line in lines:
    print(line)
    if line.startswith("-"):  # Nouvelle région
        current_region = line[1:].strip().replace(":","").strip()  # Suppression du "-" et des espaces
    elif current_region is not None and ") : AF" in line:  # Début d'une entrée de vol
        # Extraction du vol
        current_record = True
        vol, rest_of_line = line.split("-", 1)
        vol = vol.strip()
        
        incident, rest_of_line = rest_of_line.split(".", 1)
        incident = incident.strip()
      
        ville_depart = rest_of_line[0:rest_of_line.index(':')-2].strip()
        rest_of_line = rest_of_line[rest_of_line.index(':')-2:].strip()
        
        heure_depart, rest_of_line=  rest_of_line.split(" ", 1)
       
        ville_arrivee = rest_of_line[0:rest_of_line.index(')')+1].strip()
        rest_of_line = rest_of_line[rest_of_line.index(')')+1:].strip()
      
        heure_arrivee, rest_of_line=  rest_of_line.split(".", 1)
       
        commentaires += rest_of_line.strip()
   
    elif  ") : AF"  not in line and current_region is not None and not line.startswith("-") and " Operations" not in line and len(line) != 0 and current_record ==True: 
        commentaires += line
        # print(heure_arrivee)
        # print(rest_of_line)
        # print (rest_of_line)
        # # Création et ajout de l'entrée dans le tableau
    elif  current_region is  not None and len(line) == 0 and current_record ==True: 
        entry = {
            "Région": current_region,
            "Vol": vol,
            "Incident": incident,
             
            "ville_depart": ville_depart,
            "heure_depart": heure_depart,
            "ville_arrivee": ville_arrivee,
            "heure_arrivee": heure_arrivee,
            "commentaires" : commentaires
            # Vous pouvez ajouter des logiques supplémentaires ici pour extraire d'autres informations
        }
        info_table.append(entry)
        commentaires =""
        vol=""
        incident=""
        ville_depart=""
        heure_depart=""
        ville_arrivee=""
        heure_arrivee=""
        rest_of_line =""
        current_record =False
# Affichage des informations extraites
for info in info_table:
    print(info)


