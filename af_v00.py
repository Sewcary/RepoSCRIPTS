# -*- coding: utf-8 -*-
"""
Created on Sat Nov 11 22:56:02 2023

@author: ZT5549
"""

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
    current_region = ""
    current_record = False
    info_table = []
    commentaires =""
    vol=""
    incident=""
    ville_depart=""
    heure_depart=""
    ville_arrivee=""
    heure_arrivee=""
    rest_of_line =""
    # Parcours du texte ligne par ligne
    lines =text.split("\n")
    for line in lines:
        # print(line)
   # -*- coding: utf-8 -*-
   """
   Created on Sat Nov 11 22:56:02 2023
   @author: ZT5549
   """

   import imaplib
   import email
   import datetime
   import base64
   import quopri
   from bs4 import BeautifulSoup

   def connect_to_mailbox(host, username, password):
       """Connexion au serveur IMAP avec SSL et login."""
       mail = imaplib.IMAP4_SSL(host)
       mail.login(username, password)
       mail.select("inbox")
       return mail

   def search_emails(mail, date_today):
       """Recherche des e-mails selon une date et un sujet spécifique."""
       status, search_data = mail.search(None, '(SINCE "{}" SUBJECT "BULLETIN DU CCO N")'.format(date_today))
       return search_data

   def decode_content(part):
       """Décodage du contenu de l'email selon son encodage."""
       content_transfer_encoding = part.get("Content-Transfer-Encoding")
       payload = part.get_payload(decode=True)

       if content_transfer_encoding == "base64":
           return base64.b64decode(payload).decode('utf-8', 'ignore')
       elif content_transfer_encoding == "quoted-printable":
           return quopri.decodestring(payload).decode('utf-8', 'ignore')
       else:
           return payload.decode('utf-8', 'ignore')

   def get_body(message):
       """Récupération du contenu du corps de l'e-mail."""
       if message.is_multipart():
           for part in message.walk():
               ctype = part.get_content_type()
               cdispo = str(part.get('Content-Disposition'))

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

   def parse_email_body(mail, num):
       """Extraction et décodage du corps de l'e-mail."""
       status, data = mail.fetch(num, '(RFC822)')
       email_msg = data[0][1]
       mail_message = email.message_from_bytes(email_msg)
       body = get_body(mail_message)
       return body

   def parse_text_specific(text):
       """Analyse du texte spécifique et extraction des informations."""
       current_region = ""
       info_table = []
       for line in text.split("\n"):
           line = line.strip()
           if line.startswith("-"):  # Nouvelle région
               current_region = line[1:].strip().replace(":","").strip()
           elif current_region and ") : AF" in line:  # Début d'une entrée de vol
               # Extraction du vol
               vol, rest_of_line = line.split("-", 1)
               vol = vol.strip()
               
               incident, rest_of_line = rest_of_line.split(".", 1)
               incident = incident.strip()
             
               ville_depart = rest_of_line[0:rest_of_line.index(':')-2].strip()
               rest_of_line = rest_of_line[rest_of_line.index(':')-2:].strip()
               
               heure_depart, rest_of_line = rest_of_line.split(" ", 1)
               ville_arrivee = rest_of_line[0:rest_of_line.index(')')+1].strip()
               rest_of_line = rest_of_line[rest_of_line.index(')')+1:].strip()
               heure_arrivee, rest_of_line = rest_of_line.split(".", 1)
               commentaires = rest_of_line.strip()
          
               entry = {
                   "Region": current_region,
                   "Vol": vol,
                   "Incident": incident,
                   "ville_depart": ville_depart,
                   "heure_depart": heure_depart,
                   "ville_arrivee": ville_arrivee,
                   "heure_arrivee": heure_arrivee,
                   "commentaires": commentaires
               }
               info_table.append(entry)
       return info_table

   # Paramètres de connexion pour Outlook
   host = 'outlook.office365.com'
   username = 'afara@hotmail.Fr'
   password = 'Nourou2704'

   # Connexion au serveur IMAP
   mail = connect_to_mailbox(host, username, password)

   # Définition de la date du jour
   # date_today = datetime.date.today().strftime("%d-%b-%Y")
   date_today = (datetime.date.today() - datetime.timedelta(days=1)).strftime("%d-%b-%Y") 
   # Recherche d'e-mails
   search_data = search_emails(mail, date_today)

   # Création d'une liste pour stocker les informations de chaque e-mail
   emails_info = []

   # Récupération et traitement des e-mails
   for num in search_data[0].split():
       body = parse_email_body(mail, num)
       start_index = body.find("Operations")
       end_index = body.find("Events")
       if start_index != -1 and end_index != -1:
           specific_text = body[start_index:end_index]
           email_entries = parse_text_specific(specific_text)
           emails_info.extend(email_entries)

   # Affichage des informations extraites
   for email_info in emails_info:
       print(email_info)

   # Fermeture de la connexion
   mail.close()
   mail.logout()

            print(info_table)
    return info_table


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
        # print (specific_text)
        email_entries = parse_text_specific(specific_text)
        # print(email_entries)
        emails_info.extend(email_entries)

# Affichage des informations de chaque e-mail sous forme de tableau
# print("Région | Vol | Incident | Ville de Départ | Heure de Départ | Ville d'Arrivée | Heure d'Arrivée | Commentaires")

for email_info in emails_info:
    print(email_info)
    #     print("{email_info['Région']} | {email_info['Vol']} | {email_info['Incident']} | {email_info['Ville de Départ']} | {email_info['Heure de Départ']} | {email_info['Ville d'Arrivée']} | {email_info['Heure d'Arrivée']} | {email_info['Commentaires']}")

# Fermeture de la connexion
mail.close()
mail.logout()
