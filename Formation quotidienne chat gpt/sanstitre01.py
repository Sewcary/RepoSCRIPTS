# -*- coding: utf-8 -*-
"""
Created on Fri Jan  5 19:58:10 2024

@author: ZT5549
"""

import tweepy
from azure.eventhub import EventHubProducerClient, EventData

# Clés d'accès Twitter (à obtenir via le portail développeur Twitter)
consumer_key = ' '
consumer_secret = ' '
access_token = ' '
access_token_secret = ' '

# Configuration de l'API Twitter
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

# Configuration Azure Event Hub
connection_str = 'Endpoint='

producer = EventHubProducerClient.from_connection_string(conn_str=connection_str, eventhub_name=eventhub_name)

# Fonction pour envoyer des tweets à l'Event Hub
def send_to_eventhub(tweet):
    try:
        with producer:
            event_data_batch = producer.create_batch()
            event_data_batch.add(EventData(tweet))
            producer.send_batch(event_data_batch)
            print("Tweet envoyé à l'Event Hub")
    except Exception as e:
        print("Erreur lors de l'envoi :", e)

# Bearer Token pour l'API Twitter
bearer_token = ' '  # Remplacez ceci par votre Bearer Token

# Classe pour gérer le streaming de tweets
class MyStream(tweepy.StreamingClient):
    def on_tweet(self, tweet):
        print(tweet.text)
        send_to_eventhub(tweet.text)

# Création et démarrage du stream
stream = MyStream(bearer_token=bearer_token)

# Ajoutez des règles de filtrage pour les mots-clés
stream.add_rules(tweepy.StreamRule("mot-clé1"))
stream.add_rules(tweepy.StreamRule("mot-clé2"))

# Démarrer le filtrage
stream.filter()
