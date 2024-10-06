import pywhatkit as kit
import time
import pandas as pd
from datetime import datetime, timedelta
import os
import pyautogui

# Charger les numéros de téléphone depuis le fichier CSV
def charger_numeros_de_telephone(fichier_csv):
    if not os.path.exists(fichier_csv):
        raise FileNotFoundError(f"Le fichier {fichier_csv} n'existe pas.")
    
    df = pd.read_csv(fichier_csv)
    numeros = df.iloc[:, 1].astype(str).tolist()  # Supposons que la deuxième colonne contient les numéros
    
    # Ajouter le "+" si nécessaire
    numeros_complets = []
    for numero in numeros:
        if not numero.startswith("+"):
            numero = "+" + numero
        numeros_complets.append(numero)
    
    return numeros_complets

# Fonction pour envoyer des images
def envoyer_images(numeros, chemin_image, message=""):
    for numero in numeros:
        try:
            print(f"Envoi de l'image à {numero}...")
            
            # Ouvrir la discussion et attendre le chargement de WhatsApp Web
            kit.sendwhatmsg_instantly(numero, message)
            time.sleep(15)  # Attendre que la fenêtre de discussion s'ouvre
            
            # Appuyer sur le bouton de pièce jointe (le trombone)
            pyautogui.click(x=1000, y=950)  # Remplacez par les coordonnées correctes du bouton
            time.sleep(2)
            
            # Cliquer sur l'icône de la galerie pour joindre une image
            pyautogui.click(x=950, y=850)  # Remplacez par les coordonnées correctes de l'icône galerie
            time.sleep(2)
            
            # Entrer le chemin de l'image et appuyer sur "Entrée"
            pyautogui.write(chemin_image)
            pyautogui.press('enter')
            time.sleep(2)
            
            # Envoyer l'image (cliquer sur le bouton "Envoyer")
            pyautogui.click(x=1250, y=950)  # Remplacez par les coordonnées correctes du bouton "Envoyer"
            time.sleep(5)
            
            # Fermer l'onglet (Ctrl + W)
            pyautogui.hotkey('ctrl', 'w')
            time.sleep(2)
            pyautogui.press('enter')
            
            # Attendre 2 secondes avant d'envoyer le message suivant
            time.sleep(2)
        except Exception as e:
            print(f"Erreur lors de l'envoi de l'image à {numero}: {e}")

# Chemin vers le fichier CSV
fichier_csv = "contact.csv"
chemin_image = "chemin_vers_votre_image.jpg"  # Spécifiez le chemin de l'image
message = 'Voici l\'image que vous avez demandée.'

# Charger les numéros et envoyer les images
try:
    numeros = charger_numeros_de_telephone(fichier_csv)
    print('Numéros de téléphone chargés avec succès.')
    envoyer_images(numeros, chemin_image, message)
except Exception as e:
    print(f"Erreur: {e}")
