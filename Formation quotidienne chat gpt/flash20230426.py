import tkinter as tk
import csv
from collections import deque
from datetime import datetime, timedelta
import pandas as pd
import numpy as np

class CustomGridApp(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("FLASHY!")
        self.geometry("1500x900")
        self.resizable(False, False)
        self.cards_data = self.load_cards_data()
        self.card_queue = deque(self.get_cards_for_today())
        self.current_card_index = None
        
        self.updated_cards = set()
        
        for i in range(3):
            self.columnconfigure(i, weight=1)

        self.rowconfigure(0, minsize=30)
        for i in range(1, 5):
            self.rowconfigure(i, weight=1)
            
        

        self.max_cards_entry = tk.Entry(self)
        self.max_cards_entry.grid(row=0, column=0, columnspan=2, padx=5, pady=5,sticky="nsew")

        self.btn_valider = tk.Button(self, text="valider", command=self.start_revision)
        self.btn_valider.grid(row=0, column=2, padx=5, pady=5, sticky="nsew")

        self.face_label = tk.Label(self, text="", bg="lightblue", relief="groove", font=("Arial", 18))
        self.face_label.grid(row=1, column=0, columnspan=3, padx=5, pady=5, sticky="nsew")

        self.back_label = tk.Label(self, text="", bg="lightgreen", relief="groove", font=("Arial", 18))
        self.back_label.grid(row=2, column=0, columnspan=3, padx=5, pady=5, sticky="nsew")

        self.flip_button = tk.Button(self, text="Flip", command=self.show_answer, font=("Arial", 18))
        self.flip_button.grid(row=3, column=1, padx=5, pady=5, sticky="nsew")

        self.good_button = tk.Button(self, text="Good", command=lambda: self.mark_card(True), font=("Arial", 18))
        self.good_button.grid(row=3, column=0, padx=5, pady=5, sticky="nsew")

        self.end_label = tk.Label(self, text="", bg="lightgreen", relief="groove", font=("Arial", 18))
        self.end_label.grid(row=4, column=1, padx=5, pady=5, sticky="nsew")


        self.bad_button = tk.Button(self, text="Bad", command=lambda: self.mark_card(False), font=("Arial", 18))
        self.bad_button.grid(row=3, column=2, padx=5, pady=5, sticky="nsew")
        
        self.reinit_button = tk.Button(self, text="Reinitialiser", command=lambda: self.mark_card(False), font=("Arial", 18))
        self.reinit_button.grid(row=4, column=0, padx=5, pady=5, sticky="nsew")

        self.close_button = tk.Button(self, text="Fermer", command=lambda: self.mark_card(False), font=("Arial", 18))
        self.close_button.grid(row=4, column=2, padx=5, pady=5, sticky="nsew")
        
    def load_cards_data(self):
        df = pd.read_csv("flashcards.csv", header=None, dtype={0: str, 1: str, 2: str, 3: np.int32})
        return df.values.tolist()
    
    def get_cards_for_today(self):
        today = datetime.now().date()
        print(today)
        l=[index for index, card_data in enumerate(self.cards_data) if datetime.strptime(card_data[2], "%Y-%m-%d").date() <= today]
        print(l)
        return [index for index, card_data in enumerate(self.cards_data) if datetime.strptime(card_data[2], "%Y-%m-%d").date() <= today]
  
    def create_start_screen(self):
        self.max_cards_entry = tk.Entry()
        self.max_cards_entry.grid(row=4, column=0, columnspan=3, pady=20)

        self.start_button = tk.Button( text="Démarrer", command=self.start_revision)
        self.start_button.grid(row=5, column=0, columnspan=3, pady=20)
        
    def start_revision(self):
        try:
            self.max_cards = int(self.max_cards_entry.get())
            self.card_queue = deque(self.get_cards_for_today()[:self.max_cards])
            # self.max_cards_entry.grid_remove()
            # self.btn_valider.grid_remove()
            self.next_card()
        except ValueError:
            tk.messagebox.showerror("Erreur", "Veuillez entrer un nombre valide.")
    def next_card(self):
        self.current_card_index = self.show_card()  
    
    def show_card(self):
        if self.card_queue:
            card_index = self.card_queue.popleft()
            card_data = self.cards_data[card_index]
            self.face_label.config(text=card_data[0])
            self.back_label.config(text="", fg="red")
            # self.good_button.grid_remove()
            # self.bad_button.grid_remove()
            self.flip_button.grid()
            return card_index
        else:
            # self.face_label.grid_remove()
            # self.back_label.grid_remove()
            # self.flip_button.grid_remove()
            # self.good_button.grid_remove()
            # self.bad_button.grid_remove()
            self.end_label.config(text="Révision terminée")
            self.end_label.grid()
            self.save_updated_cards()
            self.face_label.config(text="")
            self.back_label.config(text="")    
    def mark_card(self, good):
            global card_queue
            if good:
                print(f"Card {self.current_card_index} marked as Good")
                interval = int(self.cards_data[self.current_card_index][3])  # Récupérer l'intervalle actuel
                if interval == 0:
                    next_interval = 1
                elif interval == 1:
                    next_interval = 2
                elif interval == 2:
                    next_interval = 5
                else:
                   next_interval = 22

                next_revision_date = datetime.now().date() + timedelta(days=next_interval)
                self.cards_data[self.current_card_index][2] = next_revision_date
                self.cards_data[self.current_card_index][3] = next_interval

                self.updated_cards.add(self.current_card_index)
            else:
                print(f"Card {self.current_card_index} marked as Bad")
                self.card_queue.append(self.current_card_index)
            self.next_card()        
    def show_answer(self):
            self.back_label.config(text=self.cards_data[self.current_card_index][1], fg="red")
            # self.flip_button.pack_forget()
            # self.good_button.grid()
            # self.bad_button.grid()
    def save_updated_cards(self):
            if self.cards_updated():
                df = pd.DataFrame(self.cards_data, columns=None)
                df.to_csv("flashcards.csv", header=False, index=False, quoting=csv.QUOTE_NONNUMERIC)
    def cards_updated(self):
        return bool(self.updated_cards)
if __name__ == "__main__":
    app = CustomGridApp()
    app.mainloop()
# Le code fourni est une application de révision de cartes flash. Voici une description des différentes parties de ce code :

# Chargement des données des cartes
# La fonction load_cards_data() utilise la bibliothèque pandas pour charger les données de cartes à partir du fichier CSV "flashcards.csv". Les données sont stockées sous forme de listes de listes et renvoyées.

# Sélection des cartes à réviser aujourd'hui
# La fonction get_cards_for_today() filtre les cartes qui doivent être révisées aujourd'hui en fonction de la date de révision stockée dans les données des cartes.

# Création de l'écran de démarrage
# La fonction create_start_screen() crée l'écran de démarrage de l'application. Elle contient un champ d'entrée pour spécifier le nombre maximum de cartes à réviser et un bouton pour démarrer la révision.

# Démarrage de la révision
# La fonction start_revision() récupère le nombre maximum de cartes à réviser à partir du champ d'entrée de l'écran de démarrage et initialise la file d'attente de cartes à réviser. Elle appelle ensuite la fonction next_card() pour afficher la première carte.

# Affichage de la carte
# La fonction show_card() récupère la prochaine carte de la file d'attente et affiche sa face avant sur l'étiquette "face_label". Elle affiche également le bouton "Flip" pour permettre à l'utilisateur de retourner la carte. Si toutes les cartes ont été révisées, elle affiche un message de fin de révision.

# Retournement de la carte
# La fonction show_answer() affiche la réponse de la carte sur l'étiquette "back_label" lorsque l'utilisateur appuie sur le bouton "Flip". Elle affiche également les boutons "Good" et "Bad" pour permettre à l'utilisateur de marquer la carte en fonction de sa réponse.

# Marquage de la carte
# La fonction mark_card() met à jour la date de révision et l'intervalle de révision de la carte en fonction de la réponse de l'utilisateur. Si la réponse est "Good", elle calcule la prochaine date de révision en fonction de l'intervalle de révision actuel et met à jour les données de la carte. Si la réponse est "Bad", elle remet la carte dans la file d'attente pour une révision ultérieure. Elle appelle ensuite la fonction next_card() pour afficher la prochaine carte.

# Enregistrement des cartes mises à jour
# La fonction save_updated_cards() enregistre les cartes mises à jour dans le fichier CSV "flashcards.csv".

# L'application utilise également la bibliothèque tkinter pour créer l'interface graphique de l'application.





# afara@hotmail.fr
# detaille l'interface graphique
# L'interface graphique de l'application comporte plusieurs éléments :

# Un champ d'entrée pour spécifier le nombre maximum de cartes à réviser.
# Un bouton "Valider" pour démarrer la révision.
# Une étiquette "face_label" pour afficher la face avant de la carte à réviser.
# Une étiquette "back_label" pour afficher la réponse de la carte après le retournement.
# Un bouton "Flip" pour retourner la carte et afficher sa réponse.
# Deux boutons "Good" et "Bad" pour marquer la carte en fonction de la réponse de l'utilisateur.
# Une étiquette "end_label" pour afficher un message de fin de révision.
# Les éléments sont disposés en trois rangées et trois colonnes. Les colonnes sont configurées pour avoir une largeur flexible, tandis que les rangées sont configurées pour avoir une hauteur flexible à l'exception de la première rangée qui a une hauteur fixe.

# Le champ d'entrée et le bouton "Valider" sont disposés dans la première rangée, tandis que les étiquettes "face_label" et "back_label" sont disposées dans la deuxième rangée sur deux colonnes. Le bouton "Flip" est disposé dans la troisième rangée et les boutons "Good" et "Bad" sont disposés sur la même rangée, mais sur deux colonnes différentes. L'étiquette "end_label" est également disposée dans la même rangée que les boutons "Good" et "Bad", mais elle est centrée sur la colonne centrale.