import imaplib
import email
import datetime
import base64
import quopri
from bs4 import BeautifulSoup

# Paramètres de connexion pour Outlook
host = 'outlook.office365.com'
username = 'afara@hotmail.Fr'
password = 'Nourou2704'

# Connexion au serveur IMAP
mail = imaplib.IMAP4_SSL(host)
mail.login(username, password)
mail.select("inbox")

# Définition de la date du jour
date_today = datetime.date.today().strftime("%d-%b-%Y")

# Recherche d'e-mails reçus aujourd'hui et dont le sujet contient 'BULLETIN DU CCO N°'
status, search_data = mail.search(None, '(SINCE "{}" SUBJECT "BULLETIN DU CCO N")'.format(date_today))

# Fonction pour décoder le contenu de l'email
def decode_content(part):
    content_transfer_encoding = part.get("Content-Transfer-Encoding")
    payload = part.get_payload(decode=True)

    if content_transfer_encoding == "base64":
        return base64.b64decode(payload).decode('utf-8', 'ignore')
    elif content_transfer_encoding == "quoted-printable":
        return quopri.decodestring(payload).decode('utf-8', 'ignore')
    else:
        return payload.decode('utf-8', 'ignore')

# Fonction pour extraire le contenu du corps de l'email et convertir de HTML à texte
def get_body(message):
    if message.is_multipart():
        for part in message.walk():
            ctype = part.get_content_type()
            cdispo = str(part.get('Content-Disposition'))

            # Si c'est du texte ou du HTML, récupérer le contenu
            if ctype in ['text/plain', 'text/html'] and 'attachment' not in cdispo:
                content = decode_content(part)
                if ctype == 'text/html':
                    soup = BeautifulSoup(content, 'html.parser')
                    return soup.get_text()
                return content
    else:
        content = decode_content(message)
        if message.get_content_type() == 'text/html':
            soup = BeautifulSoup(content, 'html.parser')
            return soup.get_text()
        return content


# Fonction pour analyser le texte spécifique et extraire les informations pour le tableau
def parse_text_specific(text):
    entries = []
    current_region = ""
    for line in text.split('\n'):
        line = line.strip()
        if line.startswith('-'):
            current_region = line.strip(' -:')
        elif ':' in line:
            parts = line.split(':')
            vol_incident = parts[0].split(' - ')
            vol = vol_incident[0].strip()
            incident = vol_incident[1].strip() if len(vol_incident) > 1 else ""
            depart_arrivee_commentaires = parts[1].split('.')
            depart_arrivee = depart_arrivee_commentaires[0].strip()

            # Gestion correcte de l'extraction des villes et heures de départ et d'arrivée
            depart_arrivee_parts = depart_arrivee.split(' ')
            ville_depart = depart_arrivee_parts[0]
            heure_depart = depart_arrivee_parts[1]
            ville_arrivee = depart_arrivee_parts[3]  # Ville d'arrivée après l'heure de départ
            heure_arrivee = depart_arrivee_parts[4]  # Heure d'arrivée après la ville d'arrivée

            commentaires = '. '.join(depart_arrivee_commentaires[1:]).strip()
            entries.append({
                "Région": current_region,
                "Vol": vol,
                "Incident": incident,
                "Ville de Départ": ville_depart,
                "Heure de Départ": heure_depart,
                "Ville d'Arrivée": ville_arrivee,
                "Heure d'Arrivée": heure_arrivee,
                "Commentaires": commentaires
            })
    return entries


# Création d'une liste pour stocker les informations de chaque e-mail
emails_info = []

# Récupération des e-mails
for num in search_data[0].split():
    status, data = mail.fetch(num, '(RFC822)')
    email_msg = data[0][1]
    mail_message = email.message_from_bytes(email_msg)

    # Vérification et traitement de chaque e-mail

    # Extraction du contenu du corps de l'email
    body = get_body(mail_message)

    # Extraction du texte entre "Operations" et "Events"
    start_index = body.find("Operations")
    end_index = body.find("Events")
    if start_index != -1 and end_index != -1:
        specific_text = body[start_index:end_index]
        print (specific_text)
        email_entries = parse_text_specific(specific_text)
        emails_info.extend(email_entries)

# Affichage des informations de chaque e-mail sous forme de tableau
print("Région | Vol | Incident | Ville de Départ | Heure de Départ | Ville d'Arrivée | Heure d'Arrivée | Commentaires")
for email_info in emails_info:
    print("{email_info['Région']} | {email_info['Vol']} | {email_info['Incident']} | {email_info['Ville de Départ']} | {email_info['Heure de Départ']} | {email_info['Ville d'Arrivée']} | {email_info['Heure d'Arrivée']} | {email_info['Commentaires']}")

# Fermeture de la connexion
mail.close()
mail.logout()
