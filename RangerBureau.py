# ...
import os
import shutil

# Définir le répertoire du bureau
bureau = os.path.expanduser(r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau")

# Définir les répertoires de destination en fonction du type de fichier
dossiers_de_destination = {
    "Images": r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\images",
    "Documents": r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\documents",
    "Musique": r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\musique",
    "Vidéos": r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\vidéos",
    "Autres": r"C:\Users\ZT5549\OneDrive - SUEZ\Bureau\autres"
}

# Parcourir les fichiers du bureau
for fichier in os.listdir(bureau):
    chemin_fichier = os.path.join(bureau, fichier)
    if os.path.isfile(chemin_fichier):
        # Exclure les fichiers avec l'extension .lnk (raccourcis)
        if not fichier.lower().endswith(".lnk"):
            # Obtenir l'extension du fichier
            extension = fichier.split(".")[-1]
            
            # Déterminer le type de fichier en fonction de l'extension
            if extension.lower() in ("jpg", "png", "gif"):
                type_fichier = "Images"
            elif extension.lower() in ("pdf", "doc", "txt"):
                type_fichier = "Documents"
            elif extension.lower() in ("mp3", "wav", "flac"):
                type_fichier = "Musique"
            elif extension.lower() in ("mp4", "avi", "mkv"):
                type_fichier = "Vidéos"
            else:
                type_fichier = "Autres"
            
            # Déplacer le fichier vers le répertoire de destination correspondant
            dossier_destination = dossiers_de_destination.get(type_fichier, r"\chemin\vers\dossier\autres")
            shutil.move(chemin_fichier, os.path.join(dossier_destination, fichier))
            print(f"Le fichier {fichier} a été déplacé vers {dossier_destination}")

print("Opération terminée.")
