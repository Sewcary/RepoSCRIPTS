import pandas as pd
import csv

# Charger le fichier CSV existant
df = pd.read_csv("dp203_complete_assessment.csv")

import pandas as pd

# DataFrame initial fourni avec les colonnes mises à jour
import pandas as pd

# Exemple des données initiales dans un dataframe
new_data   = {
    "Question": [
        "Goggins parle de la nécessité de créer une réalité alternative pour se motiver, en dépit de sa réalité actuelle.",
        "Huberman raconte comment une seule conversation peut provoquer des changements radicaux chez certaines personnes.",
        "Goggins insiste sur l'idée que tout le monde sait ce qu'il doit faire, mais la difficulté réside dans l'exécution.",
        "Goggins met en évidence l'importance d'agir immédiatement, sans attendre un moment parfait.",
        "Goggins parle de l'importance d'être prêt à affronter la douleur et l'échec pour avancer dans la vie.",
        "Huberman confie ses luttes personnelles avec la discipline et comment il doit changer sa méthode pour démarrer les choses.",
        "Goggins explique que la confiance se construit à travers des efforts constants et une confrontation avec ses démons."
    ],
    "Options": [
        "Créer une fausse réalité pour dépasser ses limitations actuelles.",
        "Un ami a perdu 60 livres et a arrêté de boire après une simple conversation.",
        "Les gens échouent parce qu'ils ne font pas ce qu'ils savent déjà devoir faire.",
        "Il faut commencer maintenant, peu importe les circonstances.",
        "Être prêt à souffrir et à répéter les efforts pour réussir.",
        "L'importance de commencer à n'importe quel moment, même si ce n'est pas l'heure parfaite.",
        "La confiance se gagne par la répétition et le fait de surmonter ses insécurités."
    ],
    "Correct Answer": [
        "Créer une nouvelle réalité pour se motiver à dépasser ses limites.",
        "Certaines personnes peuvent changer radicalement avec une simple conversation.",
        "Tout le monde sait ce qu'il doit faire, mais l'exécution est la clé.",
        "Ne jamais attendre l'heure parfaite pour agir.",
        "Le succès vient avec l'acceptation de la douleur et de l'échec.",
        "Changer ses habitudes de procrastination pour agir immédiatement.",
        "La confiance naît des actions répétées face aux difficultés."
    ],
    "Justification": [
        "Goggins mentionne qu'on doit se créer une fausse réalité pour trouver la motivation de changer.",
        "Huberman parle d'un exemple où un ami a totalement changé sa vie après une seule conversation sur la discipline.",
        "Goggins répète plusieurs fois que tout le monde sait déjà quoi faire, mais que la difficulté réside dans le passage à l'acte.",
        "Goggins met en garde contre l'attente d'un moment parfait et insiste sur l'importance de démarrer maintenant.",
        "Il met en avant la nécessité de répéter les efforts et de s'habituer à l'inconfort pour atteindre la réussite.",
        "Huberman partage une lutte personnelle avec la procrastination et comment il doit changer sa façon de démarrer les choses.",
        "Goggins partage comment il a dû affronter ses insécurités et construire sa confiance à travers la répétition et l'effort."
    ]
}


# Création du DataFrame
df_punchlines = pd.DataFrame(new_data)

# Affichage du DataFrame pour l'utilisateur



# Créer un DataFrame à partir des données


# Convertir en DataFrame et ajouter à l'existant
new_df = pd.DataFrame(new_data)

new_df['Question'] = new_df['Question'].str.replace(',', '-')
new_df['Options'] = new_df['Options'].str.replace(',', ' -')
new_df['Correct Answer'] = new_df['Correct Answer'].str.replace(',', ' -')
new_df['Justification'] = new_df['Justification'].str.replace(',', ' -')

new_df['Question'] = new_df['Question'].str.replace('\n', '-')
new_df['Options'] = new_df['Options'].str.replace('\n', ' -')
new_df['Correct Answer'] = new_df['Correct Answer'].str.replace('\n', ' -')
new_df['Justification'] = new_df['Justification'].str.replace('\n', ' -')

df = pd.concat([df, new_df], ignore_index=True)

# Sauvegarder le fichier mis à jour

df.to_csv("dp203_complete_assessment.csv", index=False, quotechar='"', quoting=csv.QUOTE_ALL)

