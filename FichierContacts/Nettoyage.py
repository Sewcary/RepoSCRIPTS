import pandas as pd
import re

# Charger le fichier CSV
file_path = 'contacts_20240911-1.csv'  # Mettez ici le chemin vers votre fichier

# Charger les données dans un dataframe pandas
df = pd.read_csv(file_path)

# Supprimer les caractères chinois et autres caractères spéciaux
def clean_text(text):
    if pd.isna(text):
        return text
    return re.sub(r'[^\w\s]', '', text)  # Supprimer les caractères non alphabétiques sauf les espaces

# Vérifier et corriger le format du numéro de téléphone
def clean_phone(phone):
    phone = str(phone).strip()
    if not phone.startswith('+254'):
        return None
    pattern = r'^\+254(\d{9,})$'
    match = re.match(pattern, phone)
    if match:
        digits = match.group(1)[:9]
        return f'+254{digits}'
    return None

# Nettoyer les colonnes de noms
df['First Name'] = df['First Name'].apply(clean_text)
df['Middle Name'] = df['Middle Name'].apply(clean_text)
df['Last Name'] = df['Last Name'].apply(clean_text)

# Remplacer les noms vides ou manquants par 'bb'
df['First Name'] = df['First Name'].fillna('bb')
df['First Name'] = df['First Name'].replace('', 'bb')

# Supprimer les lignes sans numéro de téléphone
df = df.dropna(subset=['Phone 1 - Value'])
df = df[df['Phone 1 - Value'] != '']

# Nettoyer et formater les numéros de téléphone
df['Phone 1 - Value'] = df['Phone 1 - Value'].apply(clean_phone)

# Supprimer les lignes avec des numéros de téléphone invalides (None)
df = df.dropna(subset=['Phone 1 - Value'])

# Concaténer les noms (First Name, Middle Name, Last Name)
df['Full Name'] = df[['First Name', 'Middle Name', 'Last Name']].fillna('').agg(' '.join, axis=1)

# Nettoyer les espaces en trop dans le nom complet
df['Full Name'] = df['Full Name'].str.strip().replace(r'\s+', ' ', regex=True)

# Garder uniquement les colonnes 'Phone 1 - Value' et 'Full Name'
df = df[['Phone 1 - Value', 'Full Name']]

# Éliminer les doublons basés sur le numéro de téléphone
df = df.drop_duplicates(subset=['Phone 1 - Value', 'Full Name'])

# Enregistrer le résultat dans un nouveau fichier CSV
output_file = 'contacts_20240911-nettoye.csv'
df.to_csv(output_file, index=False)

print(f"Le fichier nettoyé avec uniquement le numéro de téléphone et le nom complet a été enregistré sous {output_file}")
