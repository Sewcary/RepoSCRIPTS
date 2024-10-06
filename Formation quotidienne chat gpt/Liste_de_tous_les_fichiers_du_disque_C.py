import os
import pandas as pd
import time
import math
def convert_size(size_bytes):
    if size_bytes == 0:
        return "0 B"
    size_name = ("B", "KB", "MB", "GB")
    i = int(math.floor(math.log(size_bytes, 1024)))
    p = math.pow(1024, i)
    s = round(size_bytes / p, 2)
    return f"{s} {size_name[i]}"

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
                    'File Size': convert_size(file_size)
                }
                file_list.append(file_info)
            except (FileNotFoundError, OSError):
                # Ignorer le fichier et continuer
                pass

    return file_list

def main():
    startpath = 'C:\\'  # La racine du disque C
    
    start_time = time.strftime("%Y%m%d-%H%M%S")
    file_list = list_files(startpath)
    end_time = time.strftime("%Y%m%d-%H%M%S")
    
    num_files = len(file_list)
    
    filename = f"file_list_{start_time}_to_{end_time}_{num_files}_files.csv"
    
    df = pd.DataFrame(file_list)
    df.to_csv(filename, index=False)
    print(f"La liste des fichiers a été enregistrée dans {filename}")

if __name__ == "__main__":
    main()
