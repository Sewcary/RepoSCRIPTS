import pandas as pd
import os

# Chemin vers le fichier CSV
csv_file = "phrase_definitions_single_example.csv"

# Vérifier si le fichier existe et n'est pas vide
if os.path.exists(csv_file) and os.path.getsize(csv_file) > 0:
    try:
        # Essayer de lire le fichier CSV existant
        df = pd.read_csv(csv_file)
    except pd.errors.EmptyDataError:
        # Si le fichier est vide, initialiser un DataFrame vide avec les bonnes colonnes
        print("Le fichier est vide, création d'un nouveau DataFrame.")
        df = pd.DataFrame(columns=["Phrase", "Definition 1", "Definition 2", "Definition 3"])
else:
    # Si le fichier n'existe pas ou est vide, créer un DataFrame vide
    print("Fichier inexistant ou vide, création d'un nouveau DataFrame.")
    df = pd.DataFrame(columns=["Phrase", "Definition 1", "Definition 2", "Definition 3"])

# Données pour les nouvelles phrases et définitions
# Création de nouvelles phrases plus spécifiques pour la certification DP-203, en suivant le modèle demandé
data = [
    ["Azure Data Lake Storage Gen2 permet de gérer des permissions d'accès granulaires au niveau des dossiers et des fichiers à l'aide d'ACL (Access Control Lists).",
     "Permissions d'accès granulaires: Capacité à contrôler précisément qui peut accéder à quelles parties des données.",
     "ACL (Access Control Lists): Listes définissant les permissions des utilisateurs et des groupes sur des fichiers et dossiers.", ""],

    ["Dans Azure Synapse Analytics, les tables hash-distributed permettent une répartition uniforme des données pour améliorer les performances des requêtes.",
     "Tables hash-distributed: Tables dont les données sont réparties entre différents nœuds de calcul selon une fonction de hachage.",
     "Répartition uniforme: Distribution des données de manière équilibrée entre plusieurs nœuds pour éviter les goulots d'étranglement.", ""],

    ["Delta Lake permet de compacter les petits fichiers en fichiers plus grands afin d'optimiser les performances des requêtes.",
     "Compaction: Processus de regroupement de petits fichiers en un seul fichier plus grand pour réduire la surcharge du système.",
     "Fichiers plus grands: Fichiers consolidés pour améliorer la lecture et l'écriture des données dans un système distribué.", ""],

    ["Azure Stream Analytics permet d'analyser des données en utilisant des fenêtres temporelles spécifiques, telles que des fenêtres tumbling ou hopping.",
     "Fenêtres tumbling: Intervalles de temps fixes et non chevauchants utilisés pour agréger des événements.",
     "Fenêtres hopping: Intervalles de temps qui se chevauchent partiellement pour capturer des événements à des intervalles réguliers.", ""],

    ["Les pipelines dans Azure Data Factory peuvent être paramétrés pour être réutilisables dans différents environnements, tels que développement, test, et production.",
     "Paramétrage des pipelines: Technique permettant de rendre les pipelines flexibles en modifiant leurs paramètres en fonction de l'environnement.",
     "Environnements: Contextes différents dans lesquels une application est déployée (développement, test, production).", ""],

    ["Les snapshots de tables dans Delta Lake permettent de capturer des instantanés des données à des moments spécifiques, facilitant la récupération après un incident.",
     "Snapshots: Copies des données à un moment donné pour permettre une restauration rapide en cas de problème.",
     "Récupération après incident: Processus de restauration des données après un incident ou une panne.", ""],

    ["Dans Azure Synapse Analytics, l'utilisation de partitions sur des tables de grande taille permet de paralléliser les requêtes, réduisant ainsi les temps d'exécution.",
     "Partitions: Division logique des données d'une table en segments plus petits pour améliorer les performances des requêtes.",
     "Parallélisation des requêtes: Exécution simultanée de plusieurs sous-parties d'une requête pour améliorer les temps de réponse.", ""],

    ["Azure Event Hubs permet de partitionner les flux d'événements, garantissant ainsi une ingestion scalable tout en préservant l'ordre des événements dans chaque partition.",
     "Partitionnement des flux: Technique permettant de diviser un flux de données en plusieurs segments pour une meilleure gestion.",
     "Ingestion scalable: Capacité à augmenter ou diminuer les ressources en fonction des besoins pour gérer de grandes quantités d'événements.", ""],

    ["Les activités de transformation des données dans Azure Data Factory peuvent inclure des jointures, des agrégations et des filtres pour préparer les données avant leur analyse.",
     "Jointures: Opérations permettant de combiner des données provenant de plusieurs sources ou tables.",
     "Agrégations: Calculs effectués sur un ensemble de données, tels que les moyennes, sommes ou comptes.", ""],

    ["Delta Lake prend en charge les tables optimisées pour les requêtes en utilisant Z-Ordering, qui permet d'améliorer la vitesse d'accès aux données.",
     "Z-Ordering: Technique qui permet d'optimiser l'organisation des données dans les fichiers pour accélérer l'accès.",
     "Tables optimisées: Tables configurées pour offrir des performances maximales lors des requêtes.", ""]
]








# Convertir en DataFrame
new_df = pd.DataFrame(data, columns=["Phrase", "Definition 1", "Definition 2", "Definition 3"])

# Remplacer les virgules et retours à la ligne dans les nouvelles phrases et définitions
for col in ["Phrase", "Definition 1", "Definition 2", "Definition 3"]:
    new_df[col] = new_df[col].str.replace(',', ' -').str.replace('\n', ' -')

# Ajouter les nouvelles données à l'ancien DataFrame
df = pd.concat([df, new_df], ignore_index=True)

# Sauvegarde du DataFrame dans un fichier CSV
df.to_csv(csv_file, index=False)

print("Fichier CSV mis à jour avec succès !")
