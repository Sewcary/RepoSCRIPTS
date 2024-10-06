import tkinter as tk
import csv

# créer une fenêtre
root = tk.Tk()
root.title("Application de flashcards")

# lire les données des cartes mémoire
cards_data = []
with open("flashcards.csv", newline="\r\n") as csvfile:
    reader = csv.reader(csvfile, delimiter=";")
    for row in reader:
        cards_data.append(row)
        print(row)
    print(cards_data)

# afficher les informations des cartes mémoire
def show_card(card_index):
    card_data = cards_data[card_index]
    face_label.config(text=card_data[0])
    back_label.config(text="", fg="red")

# passer à la carte mémoire suivante
def next_card(card_index):
    if card_index < len(cards_data) - 1:
        card_index += 1
        show_card(card_index)

# afficher la réponse de la carte mémoire
def show_answer():
    back_label.config(text=cards_data[0][1], fg="green")

# ajouter des widgets à la fenêtre
face_label = tk.Label(root, text="")
face_label.pack()
back_label = tk.Label(root, text="", fg="red")
back_label.pack()

flip_button = tk.Button(root, text="Flip", command=show_answer)
flip_button.pack()

show_card(0)
root.mainloop()