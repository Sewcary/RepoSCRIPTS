import pandas as pd
import os
import csv

# Chemin vers le fichier CSV
csv_file = "dp203_anki.csv"

# Vérifier si le fichier existe et n'est pas vide
if os.path.exists(csv_file) and os.path.getsize(csv_file) > 0:
    try:
        # Essayer de lire le fichier CSV existant
        df = pd.read_csv(csv_file)
    except pd.errors.EmptyDataError:
        # Si le fichier est vide, initialiser un DataFrame vide avec les bonnes colonnes
        print("Le fichier est vide, création d'un nouveau DataFrame.")
        df = pd.DataFrame(columns=["Question", "Options", "Correct Answer", "Explanation"])
else:
    # Si le fichier n'existe pas ou est vide, créer un DataFrame vide
    print("Fichier inexistant ou vide, création d'un nouveau DataFrame.")
    df = pd.DataFrame(columns=["Question", "Options", "Correct Answer", "Explanation"])

# Données pour les nouvelles phrases et définitions
# Création de nouvelles phrases plus spécifiques pour la certification DP-203, en suivant le modèle demandé
data = {
    "Question": ["You use Azure Stream Analytics to receive data from Azure Event Hubs and to output the data to an Azure Blob Storage account. You need to output the count of records received from the last five minutes every minute. Which windowing function should you use?"],
    "Options": ["a) Session, b) Tumbling, c) Sliding, d) Hopping"],
    "Correct Answer": ["c) Sliding"],
    "Explanation": [
        "Les fenêtres glissantes (Sliding windows) vous permettent de définir une période de temps pour agréger des données, comme les 5 dernières minutes, et de produire des sorties à des intervalles spécifiés, dans ce cas, chaque minute."
        " \n\n Définitions des termes :"
        "\n - **Fenêtre glissante (Sliding window)** : Une méthode qui permet de prendre en compte les données d'une période continue en mouvement, comme les 5 dernières minutes, et de produire des résultats périodiquement, ici chaque minute."
        "\n - **Agrégation des données** : Processus consistant à combiner plusieurs valeurs ou éléments de données pour obtenir un résultat unique."
        "\n - **Intervalles spécifiés** : Périodes de temps définies à l'avance durant lesquelles les résultats sont produits. Dans cet exemple, l'intervalle est d'une minute."
    ]
}







# Convertir en DataFrame
new_df = pd.DataFrame(data, columns=["Question", "Options", "Correct Answer", "Explanation"])

# Remplacer les virgules et retours à la ligne dans les nouvelles phrases et définitions
for col in ["Question", "Options", "Correct Answer", "Explanation"]:
   new_df[col] = new_df[col].str.replace(',', ' -').str.replace('\n', ' -')

# Ajouter les nouvelles données à l'ancien DataFrame
df = pd.concat([df, new_df], ignore_index=True)

# Sauvegarde du DataFrame dans un fichier CSV
df.to_csv(csv_file, index=False, quotechar='"', quoting=csv.QUOTE_ALL)

print("Fichier CSV mis à jour avec succès !")
