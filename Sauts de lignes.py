nom_fichier = r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\Cours\AZ 900 -MAn & gouv -blueprint.txt"



# Ouvre le fichier en mode lecture
with open(nom_fichier, "r") as f:
    # Lit le contenu du fichier dans une liste de chaînes de caractères (une chaîne par ligne)
    lignes = f.readlines()

# Initialise une liste de chaînes de caractères pour stocker les lignes modifiées
lignes_modifiees = []

# Parcourt chaque ligne
for ligne in lignes:
    # Compte le nombre de mots dans la ligne
    mots = ligne.split()
    nombre_mots = len(mots)
    
    if nombre_mots > 28:
        # Si la ligne contient plus de 28 mots, ajoute un saut de ligne après la virgule suivant le 7ème mot
        premiere_virgule = ligne.find(",")
        septieme_mot = ligne.split()[6]
        virgule_suivante = ligne.find(",", premiere_virgule + 1)
        while virgule_suivante < premiere_virgule + 30 and virgule_suivante != -1:
            virgule_suivante = ligne.find(",", virgule_suivante + 1)
        if virgule_suivante != -1:
            ligne_modifiee = ligne[:virgule_suivante+1] + "\n" + ligne[virgule_suivante+1:]
        else:
            ligne_modifiee = ligne
    else:
        # Si la ligne contient 28 mots ou moins, ajoute simplement un saut de ligne après chaque point
        ligne_modifiee = ""
        for lettre in ligne:
            if lettre == ".":
                ligne_modifiee += lettre + "\n"
            else:
                ligne_modifiee += lettre
        
    # Ajoute la ligne modifiée à la liste lignes_modifiees
    lignes_modifiees.append(ligne_modifiee)

# Ouvre le fichier en mode écriture et écrit les lignes modifiées
with open(nom_fichier, "w") as f:
    f.writelines(lignes_modifiees)
