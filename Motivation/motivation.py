import tkinter as tk
from tkinter import messagebox

# Liste de messages de motivation axés sur les bénéfices de la certification DP-203
messages = [
    "Obtenir la certification DP-203 t'ouvrira des portes vers de meilleures opportunités de carrière !",
    "La maîtrise des données avec DP-203 te rendra indispensable dans ton domaine !",
    "Chaque effort pour la certification DP-203 t'amène plus près d'une expertise en ingénierie des données !",
    "Avec la certification DP-203, tu amélioreras tes compétences et augmenteras ta valeur sur le marché du travail !",
    "DP-203 te permettra de maîtriser les outils et technologies de pointe pour gérer des pipelines de données complexes !",
    "Cette certification est un tremplin pour devenir un expert dans le cloud et les solutions de données !",
    "En obtenant la DP-203, tu auras un avantage concurrentiel dans le monde de l'ingénierie des données !",
    "Ton travail acharné aujourd'hui sur DP-203 te rapprochera de meilleures opportunités professionnelles demain !"
]

# Fonction pour afficher un message de motivation
def afficher_motivation():
    import random
    message = random.choice(messages)  # Choisir un message aléatoire
    # Créer une petite fenêtre temporaire au-dessus de toutes les autres
    notification = tk.Toplevel()
    notification.withdraw()  # Cache la fenêtre pour préparer la boîte de message
    notification.attributes("-topmost", True)  # Toujours visible au-dessus des autres fenêtres
    
    # Afficher la boîte de message en la forçant à être au premier plan
    messagebox.showinfo("Motivation", message, parent=notification)
    root.after(900000, afficher_motivation)  # Replanifier pour 15 minutes (900000 ms)

# Créer une fenêtre racine
root = tk.Tk()
root.withdraw()  # Cacher la fenêtre principale

# Lancer la première boîte de message
afficher_motivation()

# Démarrer la boucle principale de Tkinter
root.mainloop()
