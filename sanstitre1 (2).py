# -*- coding: utf-8 -*-
"""
Created on Thu Mar  2 11:54:12 2023

@author: ZT5549
"""


    
from google.oauth2 import service_account
from googleapiclient.discovery import build
import ssl

SCOPES = ['https://www.googleapis.com/auth/calendar']
SERVICE_ACCOUNT_FILE = 'C:\\Users\ZT5549\\Desktop\\seventh-acrobat-379410-4c5f767b83d7.json'
CALENDAR_ID = 'your_calendar_id'

credentials = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)

# Créer un contexte SSL personnalisé avec la vérification de certificat désactivée
ssl_context = ssl.create_default_context()
ssl_context.check_hostname = False
ssl_context.verify_mode = ssl.CERT_NONE

# Utiliser le contexte SSL personnalisé pour créer l'objet de service Google Calendar
service = build('calendar', 'v3', credentials=credentials, ssl=ssl_context)

events_result = service.events().list(calendarId=CALENDAR_ID, timeMin=0,
                                      maxResults=10, singleEvents=True,
                                      orderBy='startTime').execute()
events = events_result.get('items', [])

if not events:
    print('No events found.')
for event in events:
    start = event['start'].get('dateTime', event['start'].get('date'))
    print(start, event['summary'])