# Création et Affichage
chaine = "hello, world!"
print("Chaîne originale:", chaine)

# Accès aux Caractères
premier = chaine[0]  # H
dernier = chaine[0:-1]  # !
print("Premier caractère:", premier, "Dernier caractère:", dernier)

# Découpage de Chaînes (Slicing)
sous_chaine = chaine[0:5]  # Hello
fin_chaine = chaine[7:]  # World!
print("Sous-chaîne:", sous_chaine, "Fin de chaîne:", fin_chaine)

# Trouver une Sous-chaîne
position = chaine.index("world")  # 7
print("Position de 'world':", position)

# Concaténation
nom_complet = "Jean" + " " + "Dupont"
print("Nom complet:", nom_complet)

# Fonctions Utiles
# Majuscules et Minuscules
maj = chaine.upper()  # HELLO, WORLD!
min = chaine.lower()  # hello, world!
print("En majuscules:", maj, "En minuscules:", min)

# Capitalize
capitalize_chaine = chaine.capitalize()  # Hello, world!
print("Capitalize:", capitalize_chaine)

# Remplacement
nouvelle_chaine = chaine.replace("world", "everyone")  # Hello, everyone!
print("Chaîne remplacée:", nouvelle_chaine)

# Longueur
longueur = len(chaine)  # 13
print("Longueur de la chaîne:", longueur)

# Compter les Occurrences
compter_e = chaine.count('e')  # 1
print("Nombre de 'e' dans la chaîne:", compter_e)

# Tester si Commence/Fin avec
commence_avec = chaine.startswith("Hello")  # False
finit_avec = chaine.endswith("world!")  # True
print("Commence par 'Hello':", commence_avec, "Finit par 'world!':", finit_avec)

# Trouver avec find
trouve_pos = chaine.find("Hello")  # -1
print("Position trouvée avec find pour 'Hello':", trouve_pos)

# Advanced String Operations
# Split
mots = chaine.split()
print("Mots:", mots)

# Splitlines
multi_lignes = "Ligne1\nLigne2\nLigne3"
lignes = multi_lignes.splitlines()
print("Lignes:", lignes)

# Join
phrase = ' '.join(mots)
print("Phrase:", phrase)

# Stripping
sans_espaces = "   espace avant et après   ".strip()
print("Sans espaces:", sans_espaces)

# Format
nom = "Alice"
age = 30
texte = "Nom: {0}, Age: {1}".format(nom, age)
print("Texte formaté:", texte)

# F-Strings
texte_f = f"Nom: {nom}, Age: {age}"
print("Texte F-String:", texte_f)

# Regular Expressions
import re
if re.search("mon", chaine):
    print("Trouvé!")
