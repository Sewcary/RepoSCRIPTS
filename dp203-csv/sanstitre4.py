import pandas as pd

# Charger le fichier CSV
df = pd.read_csv('dp203_complete_assessment.csv')

# Supprimer la colonne 'relire' si elle existe
if 'relire' in df.columns:
    df = df.drop('relire', axis=1)

# Mettre à jour la colonne 'revoir' si nécessaire
# Par exemple, initialiser tous les éléments à 0
if 'revoir' in df.columns:
    df['revoir'] = 0
else:
    # Si la colonne 'revoir' n'existe pas, la créer et initialiser à 0
    df['revoir'] = 0

# Sauvegarder le fichier modifié sans index
df.to_csv('dp203_complete_assessment.csv', index=False)
