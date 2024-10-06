import re

def diviser_texte(texte, limite_tokens=4096):
    mots = re.findall(r'\S+|\n', texte)
    parties = []
    part = []

    tokens_actuels = 0
    for mot in mots:
        tokens_mot = len(mot) + 1  # On ajoute 1 pour tenir compte de l'espace qui suit le mot
        if tokens_actuels + tokens_mot > limite_tokens:
            parties.append(" ".join(part))
            part = []
            tokens_actuels = 0

        part.append(mot)
        tokens_actuels += tokens_mot

    if part:
        parties.append(" ".join(part))

    return parties

# Remplacez "chemin_du_fichier.txt" par le chemin de votre fichier texte
chemin_fichier = "chemin_du_fichier3.txt"

with open(chemin_fichier, "r", encoding="utf-8") as fichier:
    texte = fichier.read()

parties = diviser_texte(texte, limite_tokens=4096)

# Supprimer le contenu original du fichier et écrire les parties divisées
with open(chemin_fichier, "w", encoding="utf-8") as fichier:
    for partie in parties:
        fichier.write(partie)
        fichier.write("\n\n")
