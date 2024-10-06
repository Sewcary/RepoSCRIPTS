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
        df = pd.DataFrame(columns=["Front", "Back"])
else:
    # Si le fichier n'existe pas ou est vide, créer un DataFrame vide
    print("Fichier inexistant ou vide, création d'un nouveau DataFrame.")
    df = pd.DataFrame(columns=["Front", "Back"])

# Données pour la question 19 concernant la création d'une activité de flux de données
# Données pour la question 20 concernant la solution de traitement d'événements
# Données pour la question sur la table Azure Synapse Analytics
# Données pour la question sur la table Azure Synapse Analytics
# Données pour la question sur Azure Synapse Analytics Data Warehouse
# Données pour la question sur Azure Synapse Analytics Data Warehouse
# Données pour la question sur Azure Synapse Analytics Data Warehouse
# Données pour la question sur Azure Synapse Analytics Data Warehouse
# Données pour la question sur la création d'une table partitionnée dans Azure Synapse Analytics SQL Pool
# Données pour la question sur Azure Synapse Analytics - Type 2 SCD
# Données pour la question sur Azure Data Lake Storage Gen2 et SQL Pool dans Azure Synapse
# Données pour la question sur Dynamic Data Masking dans Azure Synapse Analytics
# Données pour la question sur Azure Synapse Analytics avec PolyBase
# Données pour la question sur Azure Data Factory avec stockage Parquet et comportement de copie
# Données pour la question sur Azure Data Factory avec stockage Parquet et comportement de copie
# Données pour la question sur Azure Data Lake Storage Gen2 avec options de redondance
# Données pour la question sur Azure Data Lake Gen2 avec options de réplication
# Données pour la question sur SQL Pool dans Azure Synapse avec la table de staging
# Données pour la question sur FactPurchase dans Azure Synapse Analytics SQL pool
data = {
    "Front": [
        "#examTopics | Question - FactPurchase dans Azure Synapse Analytics SQL pool\n\n"
        "You are designing a fact table named FactPurchase in an Azure Synapse Analytics dedicated SQL pool.\n"
        "The table contains purchases from suppliers for a retail store. FactPurchase will contain the following columns:\n"
        "- PurchaseKey (Bigint, Non-Nullable)\n"
        "- DateKey (Int, Non-Nullable)\n"
        "- SupplierKey (Int, Non-Nullable)\n"
        "- StockItemKey (Int, Non-Nullable)\n"
        "- PurchaseOrderID (Int, Nullable)\n"
        "- OrderedQuantity (Int, Non-Nullable)\n"
        "- ReceivedOuters (Int, Non-Nullable)\n"
        "- OrderedOuters (Int, Non-Nullable)\n"
        "- Package (Nvarchar(50), Nullable)\n"
        "- IsOrderFinalized (Bit, Non-Nullable)\n"
        "- LineageKey (Int, Non-Nullable)\n\n"
        "FactPurchase will have 1 million rows of data added daily and will contain three years of data.\n"
        "Transact-SQL queries similar to the following query will be executed daily:\n"
        "```\n"
        "SELECT SupplierKey, StockItemKey, IsOrderFinalized, COUNT(*)\n"
        "FROM FactPurchase\n"
        "WHERE DateKey >= 20210101 AND DateKey <= 20210131\n"
        "GROUP BY SupplierKey, StockItemKey, IsOrderFinalized;\n"
        "```\n\n"
        "Which table distribution will minimize query times?\n"
        "Options:\n"
        "A) replicated\n"
        "B) hash-distributed on PurchaseKey\n"
        "C) round-robin\n"
        "D) hash-distributed on IsOrderFinalized"
    ],
    "Back": [
        "Réponse correcte :\n"
        "- **B) hash-distributed on PurchaseKey**\n\n"
        "Explication :\n"
        "Les tables distribuées par hachage améliorent les performances des requêtes sur de grandes tables de fait.\n"
        "En répartissant les lignes de la table en fonction de la clé **PurchaseKey**, chaque distribution peut être équilibrée pour réduire le temps de requête. La **PurchaseKey** est une bonne candidate pour la distribution, car elle possède de nombreuses valeurs uniques, ce qui est optimal pour une distribution par hachage.\n\n"
        "Définitions importantes :\n"
        "- **Hash-distributed table** : Les lignes de la table sont réparties dans plusieurs distributions en fonction de la valeur de la colonne sélectionnée, ce qui améliore les performances des grandes tables.\n"
        "- **Replicated table** : La table est répliquée sur tous les nœuds de calcul, ce qui est plus approprié pour de petites tables dimensionnelles.\n"
        "- **Round-robin** : Une méthode de distribution uniforme utilisée pour les tables temporaires ou de staging, mais moins performante pour les grandes tables de faits.\n\n"
        "Justifications des mauvaises réponses :\n"
        "- **Replicated** : Non optimal pour une grande table de faits en raison des coûts de réplication.\n"
        "- **Round-robin** : Réduit les performances lors des jointures avec de grandes tables.\n"
        "- **Hash-distributed sur IsOrderFinalized** : Moins efficace, car **IsOrderFinalized** n'a que peu de valeurs distinctes (oui/non), ce qui entraînerait une répartition inégale des données.\n\n"
        "Tags: #examTopics"
    ]
}










# Convertir en DataFrame
new_df = pd.DataFrame(data, columns=["Front", "Back"])

# Ajouter les nouvelles données à l'ancien DataFrame
df = pd.concat([df, new_df], ignore_index=True)

# Sauvegarde du DataFrame dans un fichier CSV
df.to_csv(csv_file, index=False, quotechar='"', quoting=csv.QUOTE_ALL)

print("Fichier CSV mis à jour avec succès !")
