import os
import shutil

# Répertoire source
src_dir = r'D:\\autres\\'

# Répertoires de destination pour chaque type de fichier
dst_dirs = {
    'images': r'D:\images',
    'documents': r'd:\documents',
   'videos': r'd:\videos',
    'tableurs': r'd:\tableurs',
    'zips': r'd:\zips',
    'scripts': r'D:\scripts',
    'descriptifs': r'D:\descriptifs',
    'autres': r'd:\autres'
}

# Extensions de fichiers à rechercher
extensions = {
    'images': ('.jpg', '.jpeg', '.png', '.gif','.bmp'),
    'documents': ('.txt', '.doc', '.docx', '.pdf'),
    'videos': ('.mp4', '.mkv', '.avi','.mov'),
    'tableurs': ('.xlsx', '.xls', '.csv'),
    'zips': ('.zip', '.rar', '.tar', '.gz'),
    'scripts': ('.py','.cs'),
    'descriptifs': ('.json')
}

# Chemin complet du fichier récapitulatif
log_file = os.path.join(src_dir, 'd:\\deplacements.log')

# Parcours du répertoire source et de ses sous-répertoires
with open(log_file, 'w') as f:
    for dirpath, dirnames, filenames in os.walk(src_dir):
        for file_name in filenames:
            src_path = os.path.join(dirpath, file_name)
            # vérifie si c'est un dossier
            if os.path.isdir(src_path):
                continue
            _, file_ext = os.path.splitext(file_name)
            # Détermination du type de fichier
            for file_type, ext in extensions.items():
                if file_ext.lower() in ext:
                    break
            else:
                file_type = 'autres'
            dst_dir = dst_dirs[file_type]
            # Création du répertoire de destination s'il n'existe pas
            os.makedirs(dst_dir, exist_ok=True)
            # Déplacement du fichier
            try:
                shutil.move(src_path, os.path.join(dst_dir, file_name))
                # Écriture des informations dans le fichier récapitulatif
                f.write(f"{src_path} -> {os.path.join(dst_dir, file_name)}\n")
            except PermissionError:
                print(f"Skipping {file_name} due to permission error.")

# Ouverture du fichier en mode ajout pour compter les fichiers déplacés
with open(log_file, 'a') as f:
    # Parcours des répertoires de destination
    for file_type, dst_dir in dst_dirs.items():
        # Comptage des fichiers déplacés pour chaque type de fichier
        file_count = len(os.listdir(dst_dir))
        # Écriture des informations dans le fichier récapitulatif
        f.write(f"{file_count} fichiers de type {file_type} ont été déplacés vers {dst_dir}\n")

# Affichage d'un message pour indiquer que le traitement est terminé
print("Traitement terminé. Le fichier récapitulatif des déplacements se trouve dans le dossier source.")
