import os
import pandas as pd

# Script pour créer une liste de tous les fichiers sur le disque C: avec leur type, emplacement et taille
def list_files(startpath):
    file_list = []

    for root, dirs, files in os.walk(startpath):
        for file in files:
            file_path = os.path.join(root, file)
            try:
                file_size = os.path.getsize(file_path)
                file_type = os.path.splitext(file)[1].replace('.', '')  # Extract the file extension without the dot
                file_info = {
                    'File Name': file,
                    'File Type': file_type,
                    'File Path': file_path,
                    'File Size (bytes)': file_size
                }
                file_list.append(file_info)
            except (FileNotFoundError, OSError):
                # Ignorer le fichier et continuer
                pass

    return file_list

def main():
    startpath = 'C:\\'  # La racine du disque C
    file_list = list_files(startpath)
    
    df = pd.DataFrame(file_list)
    df.to_csv('file_list.csv', index=False)
    print("La liste des fichiers a été enregistrée dans file_list.csv")

if __name__ == "__main__":
    main()
