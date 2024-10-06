import tkinter as tk
import csv
from collections import deque
from datetime import datetime, timedelta
import pandas as pd
import numpy as np


class FlashcardsApp(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.updated_cards = set()
        
        self.max_cards_entry = None
        self.start_button = None
        self.max_cards = None
        
        self.title("Flashcards Application")
        self.geometry("1500x900")
        self.resizable(False, False)

        self.cards_data = self.load_cards_data()
        print(self.cards_data)
        self.card_queue = deque(self.get_cards_for_today())
        self.current_card_index = None


        self.center_frame = tk.Frame(self)
        self.center_frame.pack(pady=20)

        self.face_label = tk.Label(self.center_frame, text="", wraplength=400, justify="center", font=("Arial", 18))
        self.face_label.grid(row=0, column=0, columnspan=3, pady=20)

        self.back_label = tk.Label(self.center_frame, text="", fg="red", wraplength=400, justify="center", font=("Arial", 18))
        self.back_label.grid(row=1, column=0, columnspan=3, pady=20)

        self.flip_button = tk.Button(self.center_frame, text="Flip", command=self.show_answer)
        self.flip_button.grid(row=0, column=1, pady=10)
        self.flip_button.grid_remove()


        self.good_button = tk.Button(self.center_frame, text="Good", command=lambda: self.mark_card(True))
        self.good_button.grid(row=1, column=0, pady=10)
        self.good_button.grid_remove()

        self.bad_button = tk.Button(self.center_frame, text="Bad", command=lambda: self.mark_card(False))
        self.bad_button.grid(row=1, column=2, pady=10)
        self.bad_button.grid_remove()

        self.end_label = tk.Label(self.center_frame, text="", fg="blue")
        self.end_label.grid(row=3, column=0, columnspan=3, pady=20)
        self.end_label.grid_remove()

        self.create_start_screen()
    def load_cards_data(self):
        df = pd.read_csv("flashcards.csv", header=None, dtype={0: str, 1: str, 2: str, 3: np.int32})
        return df.values.tolist()


    def show_answer(self):
        self.back_label.config(text=self.cards_data[self.current_card_index][1], fg="green")
        self.flip_button.pack_forget()
        self.good_button.grid()
        self.bad_button.grid()

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

    def show_card(self):
        if self.card_queue:
            card_index = self.card_queue.popleft()
            card_data = self.cards_data[card_index]
            self.face_label.config(text=card_data[0])
            self.back_label.config(text="", fg="red")
            self.good_button.grid_remove()
            self.bad_button.grid_remove()
            self.flip_button.grid()
            return card_index
        else:
            self.face_label.grid_remove()
            self.back_label.grid_remove()
            self.flip_button.grid_remove()
            self.good_button.grid_remove()
            self.bad_button.grid_remove()
            self.end_label.config(text="Révision terminée")
            self.end_label.grid()
            self.save_updated_cards()
            
    def get_cards_for_today(self):
        today = datetime.now().date()
        print(today)
        l=[index for index, card_data in enumerate(self.cards_data) if card_data[2] == today]
        print(l)
        return [index for index, card_data in enumerate(self.cards_data) if datetime.strptime(card_data[2], "%Y-%m-%d").date() == today]

    def create_start_screen(self):
        self.max_cards_entry = tk.Entry(self.center_frame)
        self.max_cards_entry.grid(row=4, column=0, columnspan=3, pady=20)

        self.start_button = tk.Button(self.center_frame, text="Démarrer", command=self.start_revision)
        self.start_button.grid(row=5, column=0, columnspan=3, pady=20)
        
    def start_revision(self):
        try:
            self.max_cards = int(self.max_cards_entry.get())
            self.card_queue = deque(self.get_cards_for_today()[:self.max_cards])
            self.max_cards_entry.grid_remove()
            self.start_button.grid_remove()
            self.next_card()
        except ValueError:
            tk.messagebox.showerror("Erreur", "Veuillez entrer un nombre valide.")
            
    def save_updated_cards(self):
        if self.cards_updated():
            df = pd.DataFrame(self.cards_data, columns=None)
            df.to_csv("flashcards.csv", header=False, index=False, quoting=csv.QUOTE_NONNUMERIC)
        
    
        
    def cards_updated(self):
        return bool(self.updated_cards)
         
    def next_card(self):
        self.current_card_index = self.show_card()
    

if __name__ == "__main__":
    app = FlashcardsApp()
    app.mainloop()
