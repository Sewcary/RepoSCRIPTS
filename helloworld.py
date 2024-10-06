import os
import PyPDF2

def check_file_permissions(file_path):
    """Check if the file has read permissions."""
    return os.access(file_path, os.R_OK)

def check_file_integrity(file_path):
    """Check if the file can be opened and read as a PDF."""
    try:
        with open(file_path, 'rb') as f:
            reader = PyPDF2.PdfFileReader(f)
            if reader.isEncrypted:
                return False, "Le fichier est crypté."
            else:
                # Try reading the first page to check for corruption
                reader.getPage(0)
                return True, "Le fichier est intact."
    except PyPDF2.utils.PdfReadError:
        return False, "Le fichier est corrompu."
    except Exception as e:
        return False, f"Erreur inconnue : {e}"

def fix_file_permissions(file_path):
    """Try to fix file permissions to make it readable."""
    try:
        os.chmod(file_path, 0o644)
        return True, "Les permissions du fichier ont été corrigées."
    except Exception as e:
        return False, f"Impossible de corriger les permissions : {e}"

def check_directory(directory_path):
    """Check all PDF files in the directory and report their status."""
    if not os.path.isdir(directory_path):
        print(f"Le chemin spécifié n'est pas un répertoire : {directory_path}")
        return

    for filename in os.listdir(directory_path):
        if filename.endswith(".pdf"):
            file_path = os.path.join(directory_path, filename)
            print(f"Vérification du fichier : {filename}")
            
            if not check_file_permissions(file_path):
                print("Le fichier n'a pas les permissions de lecture.")
                success, message = fix_file_permissions(file_path)
                print(message)
                if not success:
                    continue
            
            integrity, message = check_file_integrity(file_path)
            print(message)
            if not integrity:
                continue

if __name__ == "__main__":
    directory_path = input("c://Nouveaudossier")
    check_directory(directory_path)
