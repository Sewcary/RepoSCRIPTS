import pywhatkit as kit
import requests

# Désactiver la vérification SSL
requests.packages.urllib3.disable_warnings()

# Numéro de téléphone de la personne à qui vous voulez envoyer le message (avec le code pays, sans espaces ni caractères spéciaux)
phone_number = "+33612739103"

# Message que vous voulez envoyer
message = "Bonjour, ceci est un message de test depuis Python."

# Heure à laquelle vous voulez envoyer le message (24 heures format)
heure = 13
minute = 10  # Exemple : 15h30

# Utilisez la fonction `sendwhatmsg` pour envoyer le message
kit.sendwhatmsg(phone_number, message, heure, minute)

# Réactiver la vérification SSL en réinitialisant la session
requests.packages.urllib3.disable_warnings()
session = requests.Session()
session.verify = True  # Réactive la vérification SSL

# Maintenant, utilisez la session pour effectuer des requêtes avec vérification SSL
response = session.get("https://google.com")

# Traitement de la réponse
if response.status_code == 200:
    print("La requête a réussi avec vérification SSL.")
else:
    print("La requête a échoué avec vérification SSL. Code de statut :", response.status_code)
