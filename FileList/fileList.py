import os
import datetime
import csv

def get_file_type(extension):
    # Dictionnaire pour mapper les extensions aux types de fichiers
    mapping = {
        '.txt': 'Text',
        '.jpg': 'Image',
        '.jpeg': 'Image',
        '.png': 'Image',
        '.gif': 'Image',
        '.pdf': 'Document',
        '.doc': 'Document',
        '.docx': 'Document',
        '.xls': 'Spreadsheet',
        '.xlsx': 'Spreadsheet',
        '.mp4': 'Video',
        '.mp3': 'Audio',
        '.py': 'Script',
        '.zip': 'Archive',
        '.rar': 'Archive'
    }
    return mapping.get(extension.lower(), 'Unknown')  # Retourne 'Unknown' si l'extension n'est pas trouvée

def list_files_sorted_by_date(directory_path):
    files_details = []
    for root, dirs, files in os.walk(directory_path):
        for filename in files:
            file_path = os.path.join(root, filename)
            if os.path.isfile(file_path):
                info = os.stat(file_path)
                extension = os.path.splitext(filename)[1]  # Obtient l'extension du fichier
                file_type = get_file_type(extension)  # Obtenir le type de fichier basé sur l'extension
                file_size = info.st_size
                creation_date = datetime.datetime.fromtimestamp(info.st_ctime).strftime('%Y-%m-%d %H:%M:%S')
                modification_date = datetime.datetime.fromtimestamp(info.st_mtime).strftime('%Y-%m-%d %H:%M:%S')
                files_details.append([extension, file_type, filename, file_path, str(file_size), creation_date, modification_date])

    files_details.sort(key=lambda x: x[6])
    return files_details

def write_files_details_to_csv(files_details, output_file_path):
    with open(output_file_path, mode='w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(['Extension', 'Type', 'Name', 'Path', 'Size (Bytes)', 'Creation Date', 'Modification Date'])
        writer.writerows(files_details)

def main():
    directory_path = 'C:/Users/ZT5549/OneDrive - SUEZ/Bureau/scripts'
    output_file_path = 'details_fichiers.csv'

    files_details = list_files_sorted_by_date(directory_path)
    write_files_details_to_csv(files_details, output_file_path)

    print("Les détails des fichiers ont été écrits dans le fichier CSV :", output_file_path)

if __name__ == "__main__":
    main()
